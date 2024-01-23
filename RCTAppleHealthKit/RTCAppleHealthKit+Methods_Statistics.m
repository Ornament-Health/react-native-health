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

@implementation RCTAppleHealthKit (Statistics)

// MARK: - Public

- (void)statistics_getStatisticBodyMass:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = HKUnit.poundUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierBodyMass
                            unit:unit];
}

- (void)statistics_getStatisticBloodGlucose:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = [[HKUnit moleUnitWithMetricPrefix:HKMetricPrefixMilli molarMass:HKUnitMolarMassBloodGlucose] unitDividedByUnit:[HKUnit literUnit]];
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierBloodGlucose
                            unit:unit];
}

- (void)statistics_getStatisticBloodPressureSystolic:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = HKUnit.millimeterOfMercuryUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierBloodPressureSystolic
                            unit:unit];
}

- (void)statistics_getStatisticBloodPressureDiastolic:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = HKUnit.millimeterOfMercuryUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierBloodPressureDiastolic
                            unit:unit];
}

- (void)statistics_getStatisticBodyMassIndex:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = HKUnit.countUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierBodyMassIndex
                            unit:unit];
}

- (void)statistics_getStatisticHeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = HKUnit.inchUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierHeight
                            unit:unit];
}

- (void)statistics_getStatisticStepCount:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = HKUnit.countUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierStepCount
                            unit:unit];
}

- (void)statistics_getStatisticHeartRate:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = [HKUnit.countUnit unitDividedByUnit:HKUnit.minuteUnit];
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierHeartRate
                            unit:unit];
}

- (void)statistics_getStatisticBodyTemperature:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = HKUnit.degreeCelsiusUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierBodyTemperature
                            unit:unit];
}

- (void)statistics_getStatisticOxygenSaturation:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = HKUnit.percentUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierOxygenSaturation
                            unit:unit];
}

- (void)statistics_getStatisticRestingHeartRate:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    HKUnit *unit = [HKUnit.countUnit unitDividedByUnit:HKUnit.minuteUnit];
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierRestingHeartRate
                            unit:unit];
}

// MARK: - Dietary
// MARK: - Macronutrients

- (void)statistics_getStatisticDietaryEnergyConsumed:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }

    HKUnit *unit = HKUnit.kilocalorieUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryEnergyConsumed
                            unit:unit];
}

- (void)statistics_getStatisticDietaryCarbohydrates:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryCarbohydrates
                            unit:unit];
}

- (void)statistics_getStatisticDietaryFiber:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryFiber
                            unit:unit];
}

- (void)statistics_getStatisticDietarySugar:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietarySugar
                            unit:unit];
}

- (void)statistics_getStatisticDietaryTotalFat:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryFatTotal
                            unit:unit];
}

- (void)statistics_getStatisticDietaryFatMonounsaturated:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryFatMonounsaturated
                            unit:unit];
}

- (void)statistics_getStatisticDietaryFatPolyunsaturated:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryFatPolyunsaturated
                            unit:unit];
}

- (void)statistics_getStatisticDietaryFatSaturated:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryFatSaturated
                            unit:unit];
}

- (void)statistics_getStatisticDietaryCholesterol:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryCholesterol
                            unit:unit];
}

- (void)statistics_getStatisticDietaryProtein:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryProtein
                            unit:unit];
}

// MARK: - Vitamins

- (void)statistics_getStatisticDietaryVitaminA:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryVitaminA
                            unit:unit];
}

- (void)statistics_getStatisticDietaryThiamin:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryThiamin
                            unit:unit];
}

- (void)statistics_getStatisticDietaryRiboflavin:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback; {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryRiboflavin
                            unit:unit];
}

- (void)statistics_getStatisticDietaryNiacin:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryNiacin
                            unit:unit];
}

- (void)statistics_getStatisticDietaryPantothenicAcid:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryPantothenicAcid
                            unit:unit];
}

- (void)statistics_getStatisticDietaryVitaminB6:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryVitaminB6
                            unit:unit];
}

- (void)statistics_getStatisticDietaryBiotin:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryBiotin
                            unit:unit];
}

- (void)statistics_getStatisticDietaryVitaminB12:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryVitaminB12
                            unit:unit];
}

- (void)statistics_getStatisticDietaryVitaminC:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryVitaminC
                            unit:unit];
}

- (void)statistics_getStatisticDietaryVitaminD:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryVitaminD
                            unit:unit];
}

- (void)statistics_getStatisticDietaryVitaminE:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryVitaminE
                            unit:unit];
}

- (void)statistics_getStatisticDietaryVitaminK:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryVitaminK
                            unit:unit];
}

- (void)statistics_getStatisticDietaryFolate:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryFolate
                            unit:unit];
}

// MARK: - Minerals

- (void)statistics_getStatisticDietaryCalcium:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryCalcium
                            unit:unit];
}

- (void)statistics_getStatisticDietaryChloride:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryChloride
                            unit:unit];
}

- (void)statistics_getStatisticDietaryIron:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryIron
                            unit:unit];
}

- (void)statistics_getStatisticDietaryMagnesium:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryMagnesium
                            unit:unit];
}

- (void)statistics_getStatisticDietaryPhosphorus:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryPhosphorus
                            unit:unit];
}

- (void)statistics_getStatisticDietaryPotassium:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryPotassium
                            unit:unit];
}

- (void)statistics_getStatisticDietarySodium:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietarySodium
                            unit:unit];
}

- (void)statistics_getStatisticDietaryZinc:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryZinc
                            unit:unit];
}

// MARK: - Hydration

- (void)statistics_getStatisticDietaryWater:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.literUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryWater
                            unit:unit];
}

// MARK: - Caffeination

- (void)statistics_getStatisticDietaryCaffeine:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryCaffeine
                            unit:unit];
}

// MARK: - Ultratrace Minerals

- (void)statistics_getStatisticDietaryChromium:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryChromium
                            unit:unit];
}

- (void)statistics_getStatisticDietaryCopper:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryCopper
                            unit:unit];
}

- (void)statistics_getStatisticDietaryIodine:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryIodine
                            unit:unit];
}

- (void)statistics_getStatisticDietaryManganese:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryManganese
                            unit:unit];
}

- (void)statistics_getStatisticDietaryMolybdenum:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietaryMolybdenum
                            unit:unit];
}

- (void)statistics_getStatisticDietarySelenium:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.gramUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDietarySelenium
                            unit:unit];
}

- (void)statistics_getStatisticInsulinDelivery:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.internationalUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierInsulinDelivery
                            unit:unit];
}

// MARK: - Activity

- (void)statistics_getStatisticDistanceWheelchair:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.meterUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierDistanceWheelchair
                            unit:unit];
}

- (void)statistics_getStatisticAppleExerciseTime:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.minuteUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierAppleExerciseTime
                            unit:unit];
}

// MARK: - Body Measurments

- (void)statistics_getStatisticAppleSleepingWristTemperature:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType == 3) {
        callback(@[RCTMakeError(@"aggregator shouldn't be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.degreeCelsiusUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierAppleSleepingWristTemperature
                            unit:unit];
}

// MARK: - Vital Signs

- (void)statistics_getStatisticHeartRateRecoveryOneMinute:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType == 3) {
        callback(@[RCTMakeError(@"aggregator shouldn't be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *count = [HKUnit countUnit];
    HKUnit *minute = [HKUnit minuteUnit];

    HKUnit *unit = [RCTAppleHealthKit hkUnitFromOptions:input key:@"unit" withDefault:[count unitDividedByUnit:minute]];
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierHeartRateRecoveryOneMinute
                            unit:unit];
}

- (void)statistics_getStatisticAtrialFibrillationBurden:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType == 3) {
        callback(@[RCTMakeError(@"aggregator shouldn't be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.percentUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierAtrialFibrillationBurden
                            unit:unit];
}

// MARK: - Lab And Test Results

- (void)statistics_getStatisticNumberOfTimesFallen:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType != 3) {
        callback(@[RCTMakeError(@"aggregator should be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.countUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierNumberOfTimesFallen
                            unit:unit];
}

- (void)statistics_getStatisticPeakExpiratoryFlowRate:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType == 3) {
        callback(@[RCTMakeError(@"aggregator shouldn't be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = [RCTAppleHealthKit hkUnitFromOptions:input key:@"unit" withDefault:[[HKUnit literUnit] unitDividedByUnit:[HKUnit minuteUnit]]];
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierPeakExpiratoryFlowRate
                            unit:unit];
}

- (void)statistics_getStatisticPeripheralPerfusionIndex:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType == 3) {
        callback(@[RCTMakeError(@"aggregator shouldn't be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.percentUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierPeripheralPerfusionIndex
                            unit:unit];
}

// MARK: - UV Exposure

- (void)statistics_getStatisticUvExposure:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSUInteger aggregatorType = [RCTAppleHealthKit uintFromOptions:input key:@"aggregator" withDefault:-1];
    if (aggregatorType == 3) {
        callback(@[RCTMakeError(@"aggregator shouldn't be CUMULATIVE_SUM = 3", nil, nil)]);
        return;
    }
    HKUnit *unit = HKUnit.countUnit;
    [self basicStatisticsRequest:input
                        callback:callback
                        quantity:HKQuantityTypeIdentifierUVExposure
                            unit:unit];
}

// MARK: - Private

- (void)basicStatisticsRequest:(NSDictionary *)input
                      callback:(RCTResponseSenderBlock)callback
                      quantity:(HKQuantityTypeIdentifier)quantity
                          unit:(HKUnit *)unit {
    RCTStatisticRequest *request = [RCTAppleHealthKit statisticRequestFromOptions:input quantity:quantity defaultUnit:unit];
    if (request.aggregatorType == -1) {
        callback(@[RCTMakeError(@"aggregator is required in options", nil, nil)]);
        return;
    }
    if (request.startDate == nil) {
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    if (request.endDate == nil) {
        callback(@[RCTMakeError(@"endDate is required in options", nil, nil)]);
        return;
    }

    [self selectAggregatorType:request callback:[self makeCallbackFrom:callback]];
}

- (void (^)(NSArray *, NSError *))makeCallbackFrom:(RCTResponseSenderBlock)callback {
    return ^(NSArray *result, NSError *error) {
        if (error != nil) {
            callback(@[RCTJSErrorFromNSError(error)]);
            return;
        } else {
            callback(@[[NSNull null], result]);
        }
    };
}

- (void)selectAggregatorType:(RCTStatisticRequest *)request
                    callback:(void (^)(NSArray *, NSError *))callback {
    switch (request.aggregatorType) {
        case RCTAggregatorTypeFirst: {
            [self makeIntervalsForStatisticsCollection:request.quantityType
                                             startDate:request.startDate
                                               endDate:request.endDate
                                              interval:request.interval
                                            completion:^(NSArray *intervals, NSError *error) {
                                                [self handleStatisticsQuantity:request.quantityType
                                                                          unit:request.unit
                                                                     intervals:intervals
                                                                     ascending:true
                                                                         error:error
                                                                      callback:callback];
                                            }];
            break;
        }
        case RCTAggregatorTypeLast: {
            [self makeIntervalsForStatisticsCollection:request.quantityType
                                             startDate:request.startDate
                                               endDate:request.endDate
                                              interval:request.interval
                                            completion:^(NSArray *intervals, NSError *error) {
                                                [self handleStatisticsQuantity:request.quantityType
                                                                          unit:request.unit
                                                                     intervals:intervals
                                                                     ascending:false
                                                                         error:error
                                                                      callback:callback];
                                            }];
            break;
        }
        default: {
            [self fetchStatisticsCollection:request completion:callback];
            break;
        }
    }
}

- (void)handleStatisticsQuantity:(HKQuantityType *)quantityType
                            unit:(HKUnit *)unit
                       intervals:(NSArray *)intervals
                       ascending:(BOOL)ascending
                           error:(NSError *)error
                        callback:(void (^)(NSArray *, NSError *))callback {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *result = [[NSMutableArray alloc] init];
        for (NSDateInterval *interval in intervals) {
            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSPredicate *predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:interval.startDate endDate:interval.endDate];

                [self fetchStatisticsSamplesOfType:quantityType
                                              unit:unit
										  interval:interval
                                         predicate:predicate
                                         ascending:ascending
                                             limit:1
                                        completion:^(NSArray *results, NSError *error) {
                                            if (results.count > 0) {
                                                [result addObject:results.firstObject];
                                            }
                                            dispatch_semaphore_signal(semaphore);
                                        }];
            });

            // if the wait times-out we will receive a non-zero result and can assume no connection to SF
            //When using: DISPATCH_TIME_FOREVER the app hangs forever!!
            dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.5 * NSEC_PER_SEC));
            int waitResult = (int) dispatch_semaphore_wait(semaphore, timeout);
            NSLog(@"waitResult: %d", waitResult);
        }
        callback(result, error);
    });
}

@end
