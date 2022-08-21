//
//  RCTAppleHealthKit+Methods_Sleep.m
//  RCTAppleHealthKit
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RCTAppleHealthKit+Methods_Sleep.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+Utils.h"

@implementation RCTAppleHealthKit (Methods_Sleep)


- (void)sleep_getSleepSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }

    NSPredicate *predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    BOOL ascending = [RCTAppleHealthKit boolFromOptions:input key:@"ascending" withDefault:false];

    [self fetchSleepCategorySamplesForPredicate:predicate
                                          limit:limit
                                      ascending:ascending
                                     completion:^(NSArray *results, NSError *error) {
                                         if(results){
                                             callback(@[[NSNull null], results]);
                                             return;
                                         } else {
                                             callback(@[RCTJSErrorFromNSError(error)]);
                                             return;
                                         }
                                     }];

}

- (void)sleep_saveSleepAnalysis:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
	NSString* value = [RCTAppleHealthKit stringFromOptions:input key:@"value" withDefault:nil];
	NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
	NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];

	if(startDate == nil || endDate == nil){
		callback(@[RCTMakeError(@"startDate and endDate are required in options", nil, nil)]);
		return;
	}
	if(!value) {
		callback(@[RCTMakeError(@"value are required in options", nil, nil)]);
		return;
	}
	HKCategoryValueSleepAnalysis categoryValue = 0;
	switch (value) {
		case "inBed":
			categoryValue = HKCategoryValueSleepAnalysisInBed;
			break;
		case "asleep":
			categoryValue = HKCategoryValueSleepAnalysisAsleep;
			break;
		case "awake":
			categoryValue = HKCategoryValueSleepAnalysisAwake;
			break;
		default:
			callback(@[RCTMakeError(@"available values of 'value': inBed, asleep, awake", nil, nil)]);
			return;
	}

	HKCategoryType *type = [HKCategoryType categoryTypeForIdentifier: HKCategoryTypeIdentifierSleepAnalysis];
	HKCategorySample *sample = [HKCategorySample
								categorySampleWithType:type
								value:categoryValue
								startDate:startDate
								endDate:endDate];


	[self.healthStore saveObject:sample withCompletion:^(BOOL success, NSError *error) {
		if (!success) {
			callback(@[RCTJSErrorFromNSError(error)]);
			return;
		}
		callback(@[[NSNull null], @(value)]);
	}];
}

@end
