#import "RCTAppleHealthKit+Methods_ReproductiveStatistics.h"
#import "RCTAppleHealthKit+TypesForReproductiveStatistics.h"
#import "RCTAppleHealthKit+TypesForMedianStatistic.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+Utils.h"

#import <React/RCTLog.h>

@implementation RCTAppleHealthKit (Methods_ReproductiveStatistics)

// MARK: - Public

- (void)statistics_getReproductiveStatistic: (RCTResponseSenderBlock)callback {

    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:0];
    NSDate *endDate = [NSDate date];

    NSMutableArray *output = [NSMutableArray new];

    // prepare object for all of reproductive categories identifiers
    NSArray<__kindof NSString *> *reproductiveTypes = [self getReproductiveTypes];
    NSArray<__kindof NSString *> *symptomTypes = [self getSymptomTypes];

    NSMutableArray<__kindof NSString *> *types = [NSMutableArray new];
    [types addObjectsFromArray: reproductiveTypes];
    [types addObjectsFromArray: symptomTypes];

    NSMutableDictionary *validSamples = [NSMutableDictionary new];
    for(NSString *sampleName in types) {
        HKSampleType *sampleValue =(HKSampleType *)[self getObjectFromText:sampleName];

        if ([sampleValue isKindOfClass:[HKCharacteristicType class]]) {
            NSLog(@"RNHealth: Could not load data for HKCharacteristicType: %@", sampleName);
            continue;
        }

        if (sampleValue != nil) {
            validSamples[sampleName] = sampleValue;
        } else {
            NSLog(@"RNHealth: Could not load data for type: %@", sampleName);
            continue;
        }
    }

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 10;

    NSOperation *doneOperation = [[NSOperation alloc] init];
    [doneOperation setCompletionBlock:^{
        // NSLog(@"RNHealth getReproductiveStatistic output: %@", output);
        callback(@[[NSNull null], output]);
        return;
    }];

    for(NSString *sampleName in [validSamples allKeys]) {

        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{

            HKSampleType *sample = validSamples[sampleName];

            int limit = 5000;
            __block HKQueryAnchor *anchor = nil;
            __block NSMutableArray<__kindof HKSample *> *resultArray = [NSMutableArray new];
            __block BOOL hasResults = YES;
            __block NSString *anchorString = nil;

            while (hasResults) {
                if (anchorString != nil) {
                    NSData* anchorData = [[NSData alloc] initWithBase64EncodedString:anchorString options:0];
                    anchor = [NSKeyedUnarchiver unarchiveObjectWithData:anchorData];
                }

                NSPredicate *predicate = [RCTAppleHealthKit predicateForAnchoredQueries:anchor startDate:startDate endDate:endDate];

                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

                [self fetchBatchOfSamples:sample
                                predicate:predicate
                                   anchor:anchor
                                    limit:limit
                               completion:^(NSDictionary *results, NSError *error) {

                    if (results) {
                        @try {

                            NSMutableArray<__kindof HKSample *> *data = results[@"data"];

                            if (data == nil) {
                                hasResults = NO;
                                NSLog(@"RNHealth getReproductiveStatistic: An error occured");
                                dispatch_semaphore_signal(semaphore);
                            }

                            if (data.count > 0) {
                                [resultArray addObjectsFromArray:data];

                                //re-assign anchor
                                anchorString = results[@"anchor"];

                            } else {
                                hasResults = NO;
                            }
                            dispatch_semaphore_signal(semaphore);
                        } @catch (NSException *exception) {
                            hasResults = NO;
                            NSLog(@"RNHealth getReproductiveStatistic: An error occured");
                            dispatch_semaphore_signal(semaphore);
                        }
                    } else {
                        hasResults = NO;
                        NSLog(@"RNHealthgetReproductiveStatistic: An error occured");
                        dispatch_semaphore_signal(semaphore);
                    }
                }];

                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            };

            NSMutableDictionary *response = [NSMutableDictionary dictionary];
            response[@"parameterName"] = sampleName ? sampleName : @"";

            NSMutableArray *parameterData = [NSMutableArray new];

            // first cast element as HKSamole as parent class
            for (HKSample *sample in resultArray) {
                NSMutableDictionary *sampleData = [NSMutableDictionary dictionary];

                NSString *startDateString = [RCTAppleHealthKit buildISO8601StringFromDate:sample.startDate ];
                NSString *endDateString = [RCTAppleHealthKit buildISO8601StringFromDate:sample.endDate];

                sampleData[@"id"] = [[sample UUID] UUIDString];
                sampleData[@"startDate"] = startDateString;
                sampleData[@"endDate"] = endDateString;
                sampleData[@"metadata"] = endDateString;

                // then check if element is category or quantity
                NSInteger index = [resultArray indexOfObject:sample];

                if ([[resultArray objectAtIndex:index] isKindOfClass:[HKCategorySample class]]) {
                    __kindof HKCategorySample *categorySample = [resultArray objectAtIndex:index];
                    sampleData[@"categoryType"] = [[categorySample valueForKey:@"categoryType"] description];
                    if ([categorySample value]) {
                        sampleData[@"value"] = @([categorySample value]);
                    }
                }

                if ([[resultArray objectAtIndex:index] isKindOfClass:[HKQuantitySample class]]) {
                    __kindof HKQuantitySample *quantitySample = [resultArray objectAtIndex:index];

                    //HKQuantity - should input unit for correct output
                    // in our case only BasalTemp has quantity type with F unit
                    HKQuantity *quantity = quantitySample.quantity;
                    double value = [quantity doubleValueForUnit:[HKUnit degreeFahrenheitUnit]];
                    sampleData[@"quantityValue"] = @(value);
                    sampleData[@"unitValue"] = @"degF";
                }
                [parameterData addObject: sampleData];
            }
            response[@"parameterData"] = parameterData.count != 0 ? parameterData : [NSArray new];

            [output addObject:response];

        }];
        [queue addOperation:operation];
        [doneOperation addDependency:operation];
    }

    [queue addOperation:doneOperation];

}

- (void)statistics_getReproductiveStatisticWithParameters:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSLog(@"input: %@", input);
    NSArray<__kindof NSString *> *types = [RCTAppleHealthKit typesFromOptions:input];
    NSLog(@"types: %@", types);
    if (types.count == 0) {
        callback(@[RCTMakeError(@"RNHealth: No data types provided", nil, nil)]);
        return;
    }

    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:0];
    NSDate *endDate = [NSDate date];

    NSMutableArray *output = [NSMutableArray new];

    // prepare object for all of reproductive categories identifiers

    NSMutableDictionary *validSamples = [NSMutableDictionary new];
    for(NSString *sampleName in types) {
        HKSampleType *sampleValue =(HKSampleType *)[self getObjectFromText:sampleName];

        if ([sampleValue isKindOfClass:[HKCharacteristicType class]]) {
            NSLog(@"RNHealth: Could not load data for HKCharacteristicType: %@", sampleName);
            continue;
        }

        if (sampleValue != nil) {
            validSamples[sampleName] = sampleValue;
        } else {
            NSLog(@"RNHealth: Could not load data for type: %@", sampleName);
            continue;
        }
    }

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 10;

    NSOperation *doneOperation = [[NSOperation alloc] init];
    [doneOperation setCompletionBlock:^{
        // NSLog(@"RNHealth getReproductiveStatistic output: %@", output);
        callback(@[[NSNull null], output]);
        return;
    }];

    for(NSString *sampleName in [validSamples allKeys]) {

        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{

            HKSampleType *sample = validSamples[sampleName];

            int limit = 5000;
            __block HKQueryAnchor *anchor = nil;
            __block NSMutableArray<__kindof HKSample *> *resultArray = [NSMutableArray new];
            __block BOOL hasResults = YES;
            __block NSString *anchorString = nil;

            while (hasResults) {
                if (anchorString != nil) {
                    NSData* anchorData = [[NSData alloc] initWithBase64EncodedString:anchorString options:0];
                    anchor = [NSKeyedUnarchiver unarchiveObjectWithData:anchorData];
                }

                NSPredicate *predicate = [RCTAppleHealthKit predicateForAnchoredQueries:anchor startDate:startDate endDate:endDate];

                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

                [self fetchBatchOfSamples:sample
                                predicate:predicate
                                   anchor:anchor
                                    limit:limit
                               completion:^(NSDictionary *results, NSError *error) {

                    if (results) {
                        @try {

                            NSMutableArray<__kindof HKSample *> *data = results[@"data"];

                            if (data == nil) {
                                hasResults = NO;
                                NSLog(@"RNHealth getReproductiveStatistic: An error occured");
                                dispatch_semaphore_signal(semaphore);
                            }

                            if (data.count > 0) {
                                [resultArray addObjectsFromArray:data];

                                //re-assign anchor
                                anchorString = results[@"anchor"];

                            } else {
                                hasResults = NO;
                            }
                            dispatch_semaphore_signal(semaphore);
                        } @catch (NSException *exception) {
                            hasResults = NO;
                            NSLog(@"RNHealth getReproductiveStatistic: An error occured");
                            dispatch_semaphore_signal(semaphore);
                        }
                    } else {
                        hasResults = NO;
                        NSLog(@"RNHealthgetReproductiveStatistic: An error occured");
                        dispatch_semaphore_signal(semaphore);
                    }
                }];

                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            };

            NSMutableDictionary *response = [NSMutableDictionary dictionary];
            response[@"parameterName"] = sampleName ? sampleName : @"";

            NSMutableArray *parameterData = [NSMutableArray new];

            // first cast element as HKSamole as parent class
            for (HKSample *sample in resultArray) {
                NSMutableDictionary *sampleData = [NSMutableDictionary dictionary];

                NSString *startDateString = [RCTAppleHealthKit buildISO8601StringFromDate:sample.startDate ];
                NSString *endDateString = [RCTAppleHealthKit buildISO8601StringFromDate:sample.endDate];

                sampleData[@"id"] = [[sample UUID] UUIDString];
                sampleData[@"startDate"] = startDateString;
                sampleData[@"endDate"] = endDateString;
                sampleData[@"metadata"] = [sample metadata];

                // then check if element is category or quantity
                NSInteger index = [resultArray indexOfObject:sample];

                if ([[resultArray objectAtIndex:index] isKindOfClass:[HKCategorySample class]]) {
                    __kindof HKCategorySample *categorySample = [resultArray objectAtIndex:index];
                    sampleData[@"categoryType"] = [[categorySample valueForKey:@"categoryType"] description];
                    if ([categorySample value]) {
                        sampleData[@"value"] = @([categorySample value]);
                    }
                }

                if ([[resultArray objectAtIndex:index] isKindOfClass:[HKQuantitySample class]]) {
                    __kindof HKQuantitySample *quantitySample = [resultArray objectAtIndex:index];

                    //HKQuantity - should input unit for correct output
                    // in our case only BasalTemp has quantity type with F unit
                    HKQuantity *quantity = quantitySample.quantity;
                    double value = [quantity doubleValueForUnit:[HKUnit degreeFahrenheitUnit]];
                    sampleData[@"quantityValue"] = @(value);
                    sampleData[@"unitValue"] = @"degF";
                }
                [parameterData addObject: sampleData];
            }
            response[@"parameterData"] = parameterData.count != 0 ? parameterData : [NSArray new];

            [output addObject:response];

        }];
        [queue addOperation:operation];
        [doneOperation addDependency:operation];
    }

    [queue addOperation:doneOperation];


}

@end
