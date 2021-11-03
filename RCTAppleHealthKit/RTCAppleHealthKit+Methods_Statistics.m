//
//  RTCAppleHealthKit+Methods_Statistics.m
//  RCTAppleHealthKit
//
//  Created by Alex.M on 29.10.2021.
//  Copyright © 2021 Greg Wilson. All rights reserved.
//

#import "RTCAppleHealthKit+Methods_Statistics.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+Utils.h"
#import <React/RCTLog.h>

typedef enum : NSUInteger {
	RCTAppleHealthKitStatisticsIntervalMonth,
	RCTAppleHealthKitStatisticsIntervalDay
} RCTAppleHealthKitStatisticsInterval;

typedef enum : NSUInteger {
	RCTAppleHealthKitStatisticsAggregatorMin,
	RCTAppleHealthKitStatisticsAggregatorMax,
	RCTAppleHealthKitStatisticsAggregatorAverage,
	RCTAppleHealthKitStatisticsAggregatorFirst,
	RCTAppleHealthKitStatisticsAggregatorLast
} RCTAppleHealthKitStatisticsAggregatorType;

@implementation RCTAppleHealthKit (Statistics)

// MARK: - Private

- (NSDateComponents*) makeDateComponentsFromInterval:(RCTAppleHealthKitStatisticsInterval)interval {
	NSDateComponents *result = [[NSDateComponents alloc] init];
	switch (interval) {
		case RCTAppleHealthKitStatisticsIntervalMonth: {
			result.month = 1;
			break;
		}
		case RCTAppleHealthKitStatisticsIntervalDay: {
			result.day = 1;
			break;
		}
	}
	return result;
}

// MARK: - Public

- (void)statistics_getStatisticBodyMass:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
	HKQuantityType *bodyMassType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];

	HKUnit *unit = [RCTAppleHealthKit hkUnitFromOptions:input key:@"unit" withDefault:[HKUnit poundUnit]];
	NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
	NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
	RCTAppleHealthKitStatisticsInterval intervalType = (RCTAppleHealthKitStatisticsInterval) [RCTAppleHealthKit uintFromOptions:input key:@"interval" withDefault:RCTAppleHealthKitStatisticsIntervalMonth];
	RCTAppleHealthKitStatisticsAggregatorType aggregatorType = (RCTAppleHealthKitStatisticsAggregatorType) [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];

	NSDateComponents *interval = [self makeDateComponentsFromInterval:intervalType];

	// TODO: Switch query by aggregator type
	switch (aggregatorType) {
		case RCTAppleHealthKitStatisticsAggregatorMin: {
			[self fetchMinStatisticsCollection:bodyMassType
									  unit:unit
								 startDate:startDate
								   endDate:endDate
								  interval:interval
								completion:^(NSArray *result, NSError *error) {
			if (error != nil) {
				callback(@[RCTJSErrorFromNSError(error)]);
				return;
			}
			callback(@[[NSNull null], result]);
			}];
			break;
		}
		case RCTAppleHealthKitStatisticsAggregatorMax: {
			[self fetchMaxStatisticsCollection:bodyMassType
									  unit:unit
								 startDate:startDate
								   endDate:endDate
								  interval:interval
								completion:^(NSArray *result, NSError *error) {
			if (error != nil) {
				callback(@[RCTJSErrorFromNSError(error)]);
				return;
			}
			callback(@[[NSNull null], result]);
			}];
			break;
		}
		case RCTAppleHealthKitStatisticsAggregatorAverage: {
			[self fetchDiscreteAverageStatisticsCollection:bodyMassType
												  unit:unit
											 startDate:startDate
											   endDate:endDate
											  interval:interval
											completion:^(NSArray *result, NSError *error) {
			if (error != nil) {
				callback(@[RCTJSErrorFromNSError(error)]);
				return;
			}
			callback(@[[NSNull null], result]);
			}];
			break;
		}
		case RCTAppleHealthKitStatisticsAggregatorFirst: {
			break;
		}
		case RCTAppleHealthKitStatisticsAggregatorLast: {
			break;
		}
	}
}

//- (void)statistics_getStepCount:(NSDictionary *)input callback:(id)callback {
//    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
//    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
//}

@end
