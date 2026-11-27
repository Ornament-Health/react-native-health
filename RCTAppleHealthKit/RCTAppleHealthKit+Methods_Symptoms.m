//
//  RCTAppleHealthKit+Methods_Symptoms.m
//  RCTAppleHealthKit
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.

#import "RCTAppleHealthKit+Methods_Symptoms.h"
#import "RCTAppleHealthKit+Utils.h"

@implementation RCTAppleHealthKit (Methods_Symptoms)

// Symptom category types by the names the JS side passes (HealthKit
// identifiers without the `HKCategoryTypeIdentifier` prefix, lower camel case).
+ (NSDictionary<NSString *, HKCategoryTypeIdentifier> *)symptomTypeIdentifiers
{
    static NSDictionary<NSString *, HKCategoryTypeIdentifier> *identifiers;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        identifiers = @{
            @"abdominalCramps": HKCategoryTypeIdentifierAbdominalCramps,
            @"acne": HKCategoryTypeIdentifierAcne,
            @"appetiteChanges": HKCategoryTypeIdentifierAppetiteChanges,
            @"bladderIncontinence": HKCategoryTypeIdentifierBladderIncontinence,
            @"bloating": HKCategoryTypeIdentifierBloating,
            @"breastPain": HKCategoryTypeIdentifierBreastPain,
            @"chestTightnessOrPain": HKCategoryTypeIdentifierChestTightnessOrPain,
            @"chills": HKCategoryTypeIdentifierChills,
            @"constipation": HKCategoryTypeIdentifierConstipation,
            @"coughing": HKCategoryTypeIdentifierCoughing,
            @"diarrhea": HKCategoryTypeIdentifierDiarrhea,
            @"dizziness": HKCategoryTypeIdentifierDizziness,
            @"drySkin": HKCategoryTypeIdentifierDrySkin,
            @"fainting": HKCategoryTypeIdentifierFainting,
            @"fatigue": HKCategoryTypeIdentifierFatigue,
            @"fever": HKCategoryTypeIdentifierFever,
            @"generalizedBodyAche": HKCategoryTypeIdentifierGeneralizedBodyAche,
            @"hairLoss": HKCategoryTypeIdentifierHairLoss,
            @"headache": HKCategoryTypeIdentifierHeadache,
            @"heartburn": HKCategoryTypeIdentifierHeartburn,
            @"hotFlashes": HKCategoryTypeIdentifierHotFlashes,
            @"lossOfSmell": HKCategoryTypeIdentifierLossOfSmell,
            @"lossOfTaste": HKCategoryTypeIdentifierLossOfTaste,
            @"lowerBackPain": HKCategoryTypeIdentifierLowerBackPain,
            @"memoryLapse": HKCategoryTypeIdentifierMemoryLapse,
            @"moodChanges": HKCategoryTypeIdentifierMoodChanges,
            @"nausea": HKCategoryTypeIdentifierNausea,
            @"nightSweats": HKCategoryTypeIdentifierNightSweats,
            @"pelvicPain": HKCategoryTypeIdentifierPelvicPain,
            @"rapidPoundingOrFlutteringHeartbeat": HKCategoryTypeIdentifierRapidPoundingOrFlutteringHeartbeat,
            @"runnyNose": HKCategoryTypeIdentifierRunnyNose,
            @"shortnessOfBreath": HKCategoryTypeIdentifierShortnessOfBreath,
            @"sinusCongestion": HKCategoryTypeIdentifierSinusCongestion,
            @"skippedHeartbeat": HKCategoryTypeIdentifierSkippedHeartbeat,
            @"sleepChanges": HKCategoryTypeIdentifierSleepChanges,
            @"soreThroat": HKCategoryTypeIdentifierSoreThroat,
            @"vaginalDryness": HKCategoryTypeIdentifierVaginalDryness,
            @"vomiting": HKCategoryTypeIdentifierVomiting,
            @"wheezing": HKCategoryTypeIdentifierWheezing,
        };
    });
    return identifiers;
}

// Metadata goes over the bridge, which only carries JSON-like values.
+ (NSDictionary *)symptoms_serializableMetadata:(NSDictionary<NSString *, id> *)metadata
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [metadata enumerateKeysAndObjectsUsingBlock:^(NSString *key, id value, BOOL *stop) {
        if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
            result[key] = value;
        } else if ([value isKindOfClass:[NSDate class]]) {
            result[key] = [RCTAppleHealthKit buildISO8601StringFromDate:value];
        } else if (value != nil) {
            result[key] = [value description];
        }
    }];
    return result;
}

+ (NSDictionary *)symptoms_sampleToDictionary:(HKCategorySample *)sample
{
    HKSource *source = [[sample sourceRevision] source];
    NSDictionary *metadata = [sample metadata] ? [self symptoms_serializableMetadata:[sample metadata]] : @{};
    id wasUserEntered = [sample metadata][HKMetadataKeyWasUserEntered];

    return @{
        @"id": [[sample UUID] UUIDString],
        @"value": @([sample value]),
        @"startDate": [RCTAppleHealthKit buildISO8601StringFromDate:[sample startDate]],
        @"endDate": [RCTAppleHealthKit buildISO8601StringFromDate:[sample endDate]],
        @"sourceName": [source name] ?: @"",
        @"sourceId": [source bundleIdentifier] ?: @"",
        @"wasUserEntered": @([wasUserEntered boolValue]),
        @"metadata": metadata,
    };
}

// Input: { types: string[], anchors?: { [type]: string }, startDate: ISO string }.
// Runs one HKAnchoredObjectQuery per type. Without an anchor a type returns
// everything from `startDate`; with one, only what was added or deleted since.
// Output: { [type]: { anchor, samples, deletedIds } | { error } }.
- (void)symptoms_getAnchoredSymptoms:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSArray *types = [input[@"types"] isKindOfClass:[NSArray class]] ? input[@"types"] : @[];
    NSDictionary *anchors = [input[@"anchors"] isKindOfClass:[NSDictionary class]] ? input[@"anchors"] : @{};
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];

    if (startDate == nil) {
        callback(@[RCTMakeError(@"startDate is required", nil, nil)]);
        return;
    }

    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate
                                                               endDate:nil
                                                               options:HKQueryOptionNone];
    NSMutableDictionary *results = [NSMutableDictionary dictionary];
    dispatch_group_t group = dispatch_group_create();

    for (NSString *typeName in types) {
        HKCategoryTypeIdentifier identifier = [RCTAppleHealthKit symptomTypeIdentifiers][typeName];
        if (identifier == nil) {
            @synchronized (results) {
                results[typeName] = @{ @"error": @"unknown symptom type" };
            }
            continue;
        }

        HKCategoryType *type = [HKObjectType categoryTypeForIdentifier:identifier];

        HKQueryAnchor *anchor = nil;
        NSString *anchorString = anchors[typeName];
        if ([anchorString isKindOfClass:[NSString class]] && anchorString.length > 0) {
            NSData *anchorData = [[NSData alloc] initWithBase64EncodedString:anchorString options:0];
            if (anchorData != nil) {
                anchor = [NSKeyedUnarchiver unarchivedObjectOfClass:[HKQueryAnchor class]
                                                           fromData:anchorData
                                                              error:nil];
            }
        }

        dispatch_group_enter(group);

        HKAnchoredObjectQuery *query = [[HKAnchoredObjectQuery alloc]
            initWithType:type
               predicate:predicate
                  anchor:anchor
                   limit:HKObjectQueryNoLimit
          resultsHandler:^(HKAnchoredObjectQuery *query,
                           NSArray<__kindof HKSample *> *sampleObjects,
                           NSArray<HKDeletedObject *> *deletedObjects,
                           HKQueryAnchor *newAnchor,
                           NSError *error) {
            NSDictionary *entry;

            if (error != nil) {
                entry = @{ @"error": [error localizedDescription] ?: @"query failed" };
            } else {
                NSMutableArray *samples = [NSMutableArray arrayWithCapacity:[sampleObjects count]];
                for (HKSample *sample in sampleObjects) {
                    if ([sample isKindOfClass:[HKCategorySample class]]) {
                        [samples addObject:[RCTAppleHealthKit symptoms_sampleToDictionary:(HKCategorySample *)sample]];
                    }
                }

                NSMutableArray *deletedIds = [NSMutableArray arrayWithCapacity:[deletedObjects count]];
                for (HKDeletedObject *deleted in deletedObjects) {
                    [deletedIds addObject:[[deleted UUID] UUIDString]];
                }

                NSData *newAnchorData = newAnchor
                    ? [NSKeyedArchiver archivedDataWithRootObject:newAnchor requiringSecureCoding:YES error:nil]
                    : nil;

                entry = @{
                    @"anchor": newAnchorData ? [newAnchorData base64EncodedStringWithOptions:0] : [NSNull null],
                    @"samples": samples,
                    @"deletedIds": deletedIds,
                };
            }

            @synchronized (results) {
                results[typeName] = entry;
            }
            dispatch_group_leave(group);
        }];

        [self.healthStore executeQuery:query];
    }

    dispatch_group_notify(group, dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        callback(@[[NSNull null], results]);
    });
}

// The category type for a name from `symptomTypeIdentifiers`, or nil.
+ (HKCategoryType *)symptoms_typeFromOptions:(NSDictionary *)input
{
    NSString *typeName = [RCTAppleHealthKit stringFromOptions:input key:@"type" withDefault:nil];
    HKCategoryTypeIdentifier identifier = typeName ? [RCTAppleHealthKit symptomTypeIdentifiers][typeName] : nil;
    return identifier ? [HKObjectType categoryTypeForIdentifier:identifier] : nil;
}

// A symptom is found by its app id, stored as the sample's sync identifier.
+ (NSPredicate *)symptoms_predicateForSyncIdentifier:(NSString *)syncIdentifier
{
    return [HKQuery predicateForObjectsWithMetadataKey:HKMetadataKeySyncIdentifier
                                         allowedValues:@[syncIdentifier]];
}

static BOOL RCTIsSymptomSyncIdentifier(id value)
{
    return [value isKindOfClass:[NSString class]] && [(NSString *)value length] > 0;
}

// A whole number from 0 to 2^53 - 1, the largest integer JS sends exactly.
static BOOL RCTIsSymptomVersion(id value)
{
    if (![value isKindOfClass:[NSNumber class]]) {
        return NO;
    }
    double version = [value doubleValue];
    return isfinite(version) && version >= 0 && version == floor(version) && version <= 9007199254740991.0;
}

// HKCategoryValue codes are small whole numbers; NaN or a fraction would be truncated silently.
static BOOL RCTIsSymptomValue(id value)
{
    if (![value isKindOfClass:[NSNumber class]]) {
        return NO;
    }
    double number = [value doubleValue];
    return isfinite(number) && number >= 0 && number == floor(number) && number <= NSIntegerMax;
}

// Input: { type, syncIdentifier, version, value, startDate, endDate, metadata? }.
// Saves one sample. A sample with the same sync identifier and a lower version is
// replaced: Health deletes it, and the anchored query reports its UUID as deleted.
// `metadata` takes string and number values only; the sync keys always win.
// Output: { status: 'saved', id } | { status: 'denied' }.
- (void)symptoms_saveSymptom:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKCategoryType *type = [RCTAppleHealthKit symptoms_typeFromOptions:input];
    NSString *syncIdentifier = input[@"syncIdentifier"];
    id version = input[@"version"];
    id value = input[@"value"];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:nil];
    id extraMetadata = input[@"metadata"];

    if (type == nil) {
        callback(@[RCTMakeError(@"type must be a symptom type", nil, nil)]);
        return;
    }
    if (!RCTIsSymptomSyncIdentifier(syncIdentifier)) {
        callback(@[RCTMakeError(@"syncIdentifier must be a non-empty string", nil, nil)]);
        return;
    }
    if (!RCTIsSymptomVersion(version)) {
        callback(@[RCTMakeError(@"version must be a whole number from 0 to 2^53 - 1", nil, nil)]);
        return;
    }
    if (!RCTIsSymptomValue(value)) {
        callback(@[RCTMakeError(@"value must be a whole number of 0 or more", nil, nil)]);
        return;
    }
    if (startDate == nil || endDate == nil || [endDate compare:startDate] == NSOrderedAscending) {
        callback(@[RCTMakeError(@"startDate and endDate are required, endDate not before startDate", nil, nil)]);
        return;
    }
    if ([self.healthStore authorizationStatusForType:type] != HKAuthorizationStatusSharingAuthorized) {
        callback(@[[NSNull null], @{ @"status": @"denied" }]);
        return;
    }

    NSMutableDictionary *metadata = [NSMutableDictionary dictionary];
    if ([extraMetadata isKindOfClass:[NSDictionary class]]) {
        [(NSDictionary *)extraMetadata enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            // Keys with the HK prefix are HealthKit's own: a value of the wrong type
            // there makes the sample init throw, so the caller cannot set them.
            if ([key isKindOfClass:[NSString class]] && ![(NSString *)key hasPrefix:@"HK"]
                && ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]])) {
                metadata[key] = obj;
            }
        }];
    }
    metadata[HKMetadataKeySyncIdentifier] = syncIdentifier;
    metadata[HKMetadataKeySyncVersion] = @([version longLongValue]);

    HKCategorySample *sample = [HKCategorySample categorySampleWithType:type
                                                                  value:[value integerValue]
                                                              startDate:startDate
                                                                endDate:endDate
                                                               metadata:metadata];

    [self.healthStore saveObject:sample withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            callback(@[RCTMakeError(@"An error occurred while saving the symptom", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @{ @"status": @"saved", @"id": [[sample UUID] UUIDString] }]);
    }];
}

// Input: { type, syncIdentifier }. Deletes the app's samples with that sync identifier.
// Output: { status: 'deleted', count } | { status: 'denied' }; count 0 means there was none.
- (void)symptoms_deleteSymptom:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKCategoryType *type = [RCTAppleHealthKit symptoms_typeFromOptions:input];
    NSString *syncIdentifier = input[@"syncIdentifier"];

    if (type == nil) {
        callback(@[RCTMakeError(@"type must be a symptom type", nil, nil)]);
        return;
    }
    if (!RCTIsSymptomSyncIdentifier(syncIdentifier)) {
        callback(@[RCTMakeError(@"syncIdentifier must be a non-empty string", nil, nil)]);
        return;
    }
    if ([self.healthStore authorizationStatusForType:type] != HKAuthorizationStatusSharingAuthorized) {
        callback(@[[NSNull null], @{ @"status": @"denied" }]);
        return;
    }

    [self.healthStore deleteObjectsOfType:type
                                predicate:[RCTAppleHealthKit symptoms_predicateForSyncIdentifier:syncIdentifier]
                           withCompletion:^(BOOL success, NSUInteger deletedObjectCount, NSError *error) {
        if (!success) {
            callback(@[RCTMakeError(@"An error occurred while deleting the symptom", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @{ @"status": @"deleted", @"count": @(deletedObjectCount) }]);
    }];
}

// Input: { type, syncIdentifier }. Output: whether Health has a sample with that sync identifier.
// Once a type was asked for, Health shows an app the samples it saved even without read access.
// A type never asked for fails with "authorization not determined"; the app cannot have saved it.
- (void)symptoms_hasSymptom:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKCategoryType *type = [RCTAppleHealthKit symptoms_typeFromOptions:input];
    NSString *syncIdentifier = input[@"syncIdentifier"];

    if (type == nil) {
        callback(@[RCTMakeError(@"type must be a symptom type", nil, nil)]);
        return;
    }
    if (!RCTIsSymptomSyncIdentifier(syncIdentifier)) {
        callback(@[RCTMakeError(@"syncIdentifier must be a non-empty string", nil, nil)]);
        return;
    }

    HKSampleQuery *query = [[HKSampleQuery alloc]
        initWithSampleType:type
                 predicate:[RCTAppleHealthKit symptoms_predicateForSyncIdentifier:syncIdentifier]
                     limit:1
           sortDescriptors:nil
            resultsHandler:^(HKSampleQuery *query, NSArray<__kindof HKSample *> *results, NSError *error) {
        BOOL isNotDetermined = [error.domain isEqualToString:HKErrorDomain] && error.code == HKErrorAuthorizationNotDetermined;
        if (error != nil && !isNotDetermined) {
            callback(@[RCTMakeError(@"An error occurred while looking up the symptom", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @([results count] > 0)]);
    }];

    [self.healthStore executeQuery:query];
}

@end
