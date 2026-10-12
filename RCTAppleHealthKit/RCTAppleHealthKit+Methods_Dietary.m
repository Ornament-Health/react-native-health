//
//  RCTAppleHealthKit+Methods_Dietary.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-06-26.
//  Copyright © 2016 Greg Wilson. All rights reserved.
//

#import "RCTAppleHealthKit+Methods_Dietary.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+TypesAndPermissions.h"
#import "RCTAppleHealthKit+Utils.h"

#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>

// Every sample of a meal carries the app's meal id under this key, so the meal's
// samples are found, replaced and deleted together.
static NSString *const RCTMealUUIDMetadataKey = @"OrnamentMealUUID";

// The values a meal is written as, named as in Permissions.
static NSArray<NSString *> *RCTMealNutritionTypeNames(void)
{
    return @[@"EnergyConsumed", @"Protein", @"FatTotal", @"Carbohydrates", @"Fiber"];
}

@implementation RCTAppleHealthKit (Methods_Dietary)

- (void)dietary_getEnergyConsumedSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKQuantityType *energyConsumedType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed];
    HKUnit *unit = [RCTAppleHealthKit hkUnitFromOptions:input key:@"unit" withDefault:[HKUnit kilocalorieUnit]];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    BOOL ascending = [RCTAppleHealthKit boolFromOptions:input key:@"ascending" withDefault:false];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];

    [self fetchQuantitySamplesOfType:energyConsumedType
                                unit:unit
                           predicate:predicate
                           ascending:ascending
                               limit:limit
                          completion:^(NSArray *results, NSError *error) {
        if(results){
            callback(@[[NSNull null], results]);
            return;
        } else {
            NSLog(@"An error occured while retrieving the energy consumed sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured while retrieving the energy consumed sample", error, nil)]);
            return;
        }
    }];
}

- (void)dietary_getTotalFatSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKQuantityType *fatTotalType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal];
    HKUnit *unit = [RCTAppleHealthKit hkUnitFromOptions:input key:@"unit" withDefault:[HKUnit gramUnit]];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    BOOL ascending = [RCTAppleHealthKit boolFromOptions:input key:@"ascending" withDefault:false];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];

    [self fetchQuantitySamplesOfType:fatTotalType
                                unit:unit
                           predicate:predicate
                           ascending:ascending
                               limit:limit
                          completion:^(NSArray *results, NSError *error) {
        if(results){
            callback(@[[NSNull null], results]);
            return;
        } else {
            NSLog(@"An error occured while retrieving the total fat sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured while retrieving the total fat sample", error, nil)]);
            return;
        }
    }];
}

- (void)dietary_getProteinSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKQuantityType *proteinType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein];
    HKUnit *unit = [RCTAppleHealthKit hkUnitFromOptions:input key:@"unit" withDefault:[HKUnit gramUnit]];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    BOOL ascending = [RCTAppleHealthKit boolFromOptions:input key:@"ascending" withDefault:false];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];

    [self fetchQuantitySamplesOfType:proteinType
                                unit:unit
                           predicate:predicate
                           ascending:ascending
                               limit:limit
                          completion:^(NSArray *results, NSError *error) {
        if(results){
            callback(@[[NSNull null], results]);
            return;
        } else {
            NSLog(@"An error occured while retrieving the protein sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured while retrieving the protein sample", error, nil)]);
            return;
        }
    }];
}

- (void)dietary_getFiberSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKQuantityType *fiberType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber];
    HKUnit *unit = [RCTAppleHealthKit hkUnitFromOptions:input key:@"unit" withDefault:[HKUnit gramUnit]];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    BOOL ascending = [RCTAppleHealthKit boolFromOptions:input key:@"ascending" withDefault:false];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];

    [self fetchQuantitySamplesOfType:fiberType
                                unit:unit
                           predicate:predicate
                           ascending:ascending
                               limit:limit
                          completion:^(NSArray *results, NSError *error) {
        if(results){
            callback(@[[NSNull null], results]);
            return;
        } else {
            NSLog(@"An error occured while retrieving the fiber sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured while retrieving the fiber sample", error, nil)]);
            return;
        }
    }];
}

- (void)saveFood:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSString *foodNameValue = [RCTAppleHealthKit stringFromOptions:input key:@"foodName" withDefault:nil];
    NSString *mealNameValue = [RCTAppleHealthKit stringFromOptions:input key:@"mealType" withDefault:nil];
    NSDate *timeFoodWasConsumed = [RCTAppleHealthKit dateFromOptions:input key:@"date" withDefault:[NSDate date]];
    double biotinValue = [RCTAppleHealthKit doubleFromOptions:input key:@"biotin" withDefault:(double)0];
    double caffeineValue = [RCTAppleHealthKit doubleFromOptions:input key:@"caffeine" withDefault:(double)0];
    double calciumValue = [RCTAppleHealthKit doubleFromOptions:input key:@"calcium" withDefault:(double)0];
    double carbohydratesValue = [RCTAppleHealthKit doubleFromOptions:input key:@"carbohydrates" withDefault:(double)0];
    double chlorideValue = [RCTAppleHealthKit doubleFromOptions:input key:@"chloride" withDefault:(double)0];
    double cholesterolValue = [RCTAppleHealthKit doubleFromOptions:input key:@"cholesterol" withDefault:(double)0];
    double copperValue = [RCTAppleHealthKit doubleFromOptions:input key:@"copper" withDefault:(double)0];
    double energyConsumedValue = [RCTAppleHealthKit doubleFromOptions:input key:@"energy" withDefault:(double)0];
    double fatMonounsaturatedValue = [RCTAppleHealthKit doubleFromOptions:input key:@"fatMonounsaturated" withDefault:(double)0];
    double fatPolyunsaturatedValue = [RCTAppleHealthKit doubleFromOptions:input key:@"fatPolyunsaturated" withDefault:(double)0];
    double fatSaturatedValue = [RCTAppleHealthKit doubleFromOptions:input key:@"fatSaturated" withDefault:(double)0];
    double fatTotalValue = [RCTAppleHealthKit doubleFromOptions:input key:@"fatTotal" withDefault:(double)0];
    double fiberValue = [RCTAppleHealthKit doubleFromOptions:input key:@"fiber" withDefault:(double)0];
    double folateValue = [RCTAppleHealthKit doubleFromOptions:input key:@"folate" withDefault:(double)0];
    double iodineValue = [RCTAppleHealthKit doubleFromOptions:input key:@"iodine" withDefault:(double)0];
    double ironValue = [RCTAppleHealthKit doubleFromOptions:input key:@"iron" withDefault:(double)0];
    double magnesiumValue = [RCTAppleHealthKit doubleFromOptions:input key:@"magnesium" withDefault:(double)0];
    double manganeseValue = [RCTAppleHealthKit doubleFromOptions:input key:@"manganese" withDefault:(double)0];
    double molybdenumValue = [RCTAppleHealthKit doubleFromOptions:input key:@"molybdenum" withDefault:(double)0];
    double niacinValue = [RCTAppleHealthKit doubleFromOptions:input key:@"niacin" withDefault:(double)0];
    double pantothenicAcidValue = [RCTAppleHealthKit doubleFromOptions:input key:@"pantothenicAcid" withDefault:(double)0];
    double phosphorusValue = [RCTAppleHealthKit doubleFromOptions:input key:@"phosphorus" withDefault:(double)0];
    double potassiumValue = [RCTAppleHealthKit doubleFromOptions:input key:@"potassium" withDefault:(double)0];
    double proteinValue = [RCTAppleHealthKit doubleFromOptions:input key:@"protein" withDefault:(double)0];
    double riboflavinValue = [RCTAppleHealthKit doubleFromOptions:input key:@"riboflavin" withDefault:(double)0];
    double seleniumValue = [RCTAppleHealthKit doubleFromOptions:input key:@"selenium" withDefault:(double)0];
    double sodiumValue = [RCTAppleHealthKit doubleFromOptions:input key:@"sodium" withDefault:(double)0];
    double sugarValue = [RCTAppleHealthKit doubleFromOptions:input key:@"sugar" withDefault:(double)0];
    double thiaminValue = [RCTAppleHealthKit doubleFromOptions:input key:@"thiamin" withDefault:(double)0];
    double vitaminAValue = [RCTAppleHealthKit doubleFromOptions:input key:@"vitaminA" withDefault:(double)0];
    double vitaminB12Value = [RCTAppleHealthKit doubleFromOptions:input key:@"vitaminB12" withDefault:(double)0];
    double vitaminB6Value = [RCTAppleHealthKit doubleFromOptions:input key:@"vitaminB6" withDefault:(double)0];
    double vitaminCValue = [RCTAppleHealthKit doubleFromOptions:input key:@"vitaminC" withDefault:(double)0];
    double vitaminDValue = [RCTAppleHealthKit doubleFromOptions:input key:@"vitaminD" withDefault:(double)0];
    double vitaminEValue = [RCTAppleHealthKit doubleFromOptions:input key:@"vitaminE" withDefault:(double)0];
    double vitaminKValue = [RCTAppleHealthKit doubleFromOptions:input key:@"vitaminK" withDefault:(double)0];
    double zincValue = [RCTAppleHealthKit doubleFromOptions:input key:@"zinc" withDefault:(double)0];

    // Metadata including some new food-related keys //
    NSDictionary *metadata = @{
            HKMetadataKeyFoodType:foodNameValue,
            //@"HKFoodBrandName":@"FoodBrandName", // Restaurant name or packaged food brand name
            //@"HKFoodTypeUUID":@"FoodTypeUUID", // Identifier for this food
            @"HKFoodMeal":mealNameValue//, // Breakfast, Lunch, Dinner, or Snacks
            //@"HKFoodImageName":@"FoodImageName" // Food icon name
    };

    // Create nutrtional data for food //
    NSMutableSet *mySet = [[NSMutableSet alloc] init];
    if (biotinValue > 0){
        HKQuantitySample* biotin = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryBiotin]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:biotinValue]
                                                                    startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:biotin];
    }
    if (caffeineValue > 0){
        HKQuantitySample* caffeine = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCaffeine]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:caffeineValue]
                                                                    startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                    metadata:metadata];

        [mySet addObject:caffeine];
    }
    if (calciumValue > 0){
        HKQuantitySample* calcium = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCalcium]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:calciumValue]
                                                                    startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:calcium];
    }
    if (carbohydratesValue > 0){
        HKQuantitySample* carbohydrates = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:carbohydratesValue]
                                                                    startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:carbohydrates];
    }
    if (chlorideValue > 0){
        HKQuantitySample* chloride = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryChloride]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:chlorideValue]
                                                                startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                metadata:metadata];
        [mySet addObject:chloride];
    }
    if (cholesterolValue > 0){
        HKQuantitySample* cholesterol = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCholesterol]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:cholesterolValue]
                                                                startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                metadata:metadata];
        [mySet addObject:cholesterol];
    }
    if (copperValue > 0){
        HKQuantitySample* copper = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCopper]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:copperValue]
                                                                startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                metadata:metadata];
        [mySet addObject:copper];
    }
    if (energyConsumedValue > 0){
        HKQuantitySample* energyConsumed = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit kilocalorieUnit] doubleValue:energyConsumedValue]
                                                                startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                            metadata:metadata];
        [mySet addObject:energyConsumed];
    }
    if (fatMonounsaturatedValue > 0){
        HKQuantitySample* fatMonounsaturated = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatMonounsaturated]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:fatMonounsaturatedValue]
                                                                startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                metadata:metadata];
        [mySet addObject:fatMonounsaturated];
    }
    if (fatPolyunsaturatedValue > 0){
        HKQuantitySample* fatPolyunsaturated = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatPolyunsaturated]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:fatPolyunsaturatedValue]
                                                                startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                metadata:metadata];
        [mySet addObject:fatPolyunsaturated];
    }
    if (fatSaturatedValue > 0){
        HKQuantitySample* fatSaturated = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:fatSaturatedValue]
                                                                startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                metadata:metadata];
        [mySet addObject:fatSaturated];
    }
    if (fatTotalValue > 0){
        HKQuantitySample* fatTotal = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:fatTotalValue]
                                                                startDate:timeFoodWasConsumed
                                                                    endDate:timeFoodWasConsumed
                                                                metadata:metadata];
        [mySet addObject:fatTotal];
    }
    if (fiberValue > 0){
        HKQuantitySample* fiber = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:fiberValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:fiber];
    }
    if (folateValue > 0){
        HKQuantitySample* folate = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFolate]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:folateValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:folate];
    }
    if (iodineValue > 0){
        HKQuantitySample* iodine = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIodine]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:iodineValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:iodine];
    }
    if (ironValue > 0){
        HKQuantitySample* iron = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:ironValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:iron];
    }
    if (magnesiumValue > 0){
        HKQuantitySample* magnesium = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMagnesium]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:magnesiumValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:magnesium];
    }
    if (manganeseValue > 0){
        HKQuantitySample* manganese = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryManganese]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:manganeseValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:manganese];
    }
    if (molybdenumValue > 0){
        HKQuantitySample* molybdenum = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMolybdenum]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:molybdenumValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:molybdenum];
    }
    if (niacinValue > 0){
        HKQuantitySample* niacin = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryNiacin]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:niacinValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:niacin];
    }
    if (pantothenicAcidValue > 0){
        HKQuantitySample* pantothenicAcid = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPantothenicAcid]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:pantothenicAcidValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:pantothenicAcid];
    }
    if (phosphorusValue > 0){
        HKQuantitySample* phosphorus = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPhosphorus]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:phosphorusValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:phosphorus];
    }
    if (potassiumValue > 0){
        HKQuantitySample* potassium = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPotassium]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:potassiumValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:potassium];
    }
    if (proteinValue > 0){
        HKQuantitySample* protein = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:proteinValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:protein];
    }
    if (riboflavinValue > 0){
        HKQuantitySample* riboflavin = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryRiboflavin]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:riboflavinValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:riboflavin];
    }
    if (seleniumValue > 0){
        HKQuantitySample* selenium = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySelenium]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:seleniumValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:selenium];
    }
    if (sodiumValue > 0){
        HKQuantitySample* sodium = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:sodiumValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:sodium];
    }
    if (sugarValue > 0){
        HKQuantitySample* sugar = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:sugarValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:sugar];
    }
    if (thiaminValue > 0){
        HKQuantitySample* thiamin = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryThiamin]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:thiaminValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:thiamin];
    }
    if (vitaminAValue > 0){
        HKQuantitySample* vitaminA = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminA]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:vitaminAValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:vitaminA];
    }
    if (vitaminB12Value > 0){
        HKQuantitySample* vitaminB12 = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB12]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:vitaminB12Value]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:vitaminB12];
    }
    if (vitaminB6Value > 0){
        HKQuantitySample* vitaminB6 = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB6]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:vitaminB6Value]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:vitaminB6];
    }
    if (vitaminCValue > 0){
        HKQuantitySample* vitaminC = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminC]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:vitaminCValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:vitaminC];
    }
    if (vitaminDValue > 0){
        HKQuantitySample* vitaminD = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminD]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:vitaminDValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:vitaminD];
    }
    if (vitaminEValue > 0){
        HKQuantitySample* vitaminE = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminE]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:vitaminEValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];

        [mySet addObject:vitaminE];
    }
    if (vitaminKValue > 0){
        HKQuantitySample* vitaminK = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminK]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:vitaminKValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:vitaminK];
    }
    if (zincValue > 0){
        HKQuantitySample* zinc = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryZinc]
                                                                    quantity:[HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:zincValue]
                                                                    startDate:timeFoodWasConsumed
                                                                        endDate:timeFoodWasConsumed
                                                                    metadata:metadata];
        [mySet addObject:zinc];
    }
    // Combine nutritional data into a food correlation //
    HKCorrelation* food = [HKCorrelation correlationWithType:[HKCorrelationType correlationTypeForIdentifier:HKCorrelationTypeIdentifierFood]
                                                            startDate:timeFoodWasConsumed
                                                            endDate:timeFoodWasConsumed
                                                            objects:mySet
                                                            metadata:metadata];
    // Save the food correlation to HealthKit //
    [self.healthStore saveObject:food withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"An error occured saving the food sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured saving the food sample", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @true]);
    }];
}

- (void)saveWater:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDate *timeWaterWasConsumed = [RCTAppleHealthKit dateFromOptions:input key:@"date" withDefault:[NSDate date]];
    double waterValue = [RCTAppleHealthKit doubleFromOptions:input key:@"value" withDefault:(double)0];

    HKQuantitySample* water = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater]
                                                                quantity:[HKQuantity quantityWithUnit:[HKUnit literUnit] doubleValue:waterValue]
                                                                startDate:timeWaterWasConsumed
                                                                endDate:timeWaterWasConsumed
                                                                metadata:nil];

    // Save the water Sample to HealthKit //
    [self.healthStore saveObject:water withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"An error occured saving the water sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured saving the water sample", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @true]);
    }];
}

- (void)getWater:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDate *date = [RCTAppleHealthKit dateFromOptions:input key:@"date" withDefault:[NSDate date]];
    BOOL includeManuallyAdded = [RCTAppleHealthKit boolFromOptions:input key:@"includeManuallyAdded" withDefault:true];


    if(date == nil) {
        callback(@[RCTMakeError(@"could not parse date from options.date", nil, nil)]);
        return;
    }

    HKQuantityType *dietaryWaterType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater];
    HKUnit *literUnit = [HKUnit literUnit];

    [self fetchSumOfSamplesOnDayForType:dietaryWaterType
                                    unit:literUnit
                                    includeManuallyAdded:includeManuallyAdded
                                    day:date
                             completion:^(double value, NSDate *startDate, NSDate *endDate, NSError *error) {
        if (!value && value != 0) {
            callback(@[RCTJSErrorFromNSError(error)]);
            return;
        }

         NSDictionary *response = @{
                 @"value" : @(value),
                 @"startDate" : [RCTAppleHealthKit buildISO8601StringFromDate:startDate],
                 @"endDate" : [RCTAppleHealthKit buildISO8601StringFromDate:endDate],
         };

        callback(@[[NSNull null], response]);
    }];
}

- (void)getWaterSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKQuantityType *dietaryWaterType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater];
    HKUnit *literUnit = [HKUnit literUnit];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    BOOL ascending = [RCTAppleHealthKit boolFromOptions:input key:@"ascending" withDefault:false];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    BOOL includeManuallyAdded = [RCTAppleHealthKit boolFromOptions:input key:@"includeManuallyAdded" withDefault:true];


    if(startDate == nil) {
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }

    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];

    [self fetchQuantitySamplesOfType:dietaryWaterType
                                unit:literUnit
                           predicate:predicate
                           ascending:ascending
                               limit:limit
                          completion:^(NSArray *results, NSError *error) {
        if(results){
            callback(@[[NSNull null], results]);
            return;
        } else {
            NSLog(@"An error occured while retrieving the water sample %@. The error was: ", error);
            callback(@[RCTMakeError(@"An error occured while retrieving the water sample", error, nil)]);
            return;
        }
    }];
}

- (void)dietary_saveMealNutrition:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSString *mealUUID = [RCTAppleHealthKit stringFromOptions:input key:@"mealUUID" withDefault:nil];
    NSDate *date = [RCTAppleHealthKit dateFromOptions:input key:@"date" withDefault:nil];
    id version = input[@"version"];
    id values = input[@"values"];
    if (mealUUID == nil || date == nil || ![version isKindOfClass:[NSNumber class]] || ![values isKindOfClass:[NSDictionary class]]) {
        callback(@[RCTMakeError(@"mealUUID, date, version and values are required", nil, nil)]);
        return;
    }

    NSMutableArray<HKQuantitySample *> *samples = [NSMutableArray array];
    NSMutableArray<NSString *> *written = [NSMutableArray array];
    NSMutableArray<NSString *> *zeroed = [NSMutableArray array];
    NSMutableArray<NSString *> *denied = [NSMutableArray array];

    for (NSString *name in RCTMealNutritionTypeNames()) {
        HKQuantityType *type = (HKQuantityType *)[self getWritePermFromText:name];
        if ([self.healthStore authorizationStatusForType:type] != HKAuthorizationStatusSharingAuthorized) {
            [denied addObject:name];
            continue;
        }

        id amount = values[name];
        double value = [amount isKindOfClass:[NSNumber class]] ? [amount doubleValue] : 0;
        if (value <= 0) {
            [zeroed addObject:name];
            continue;
        }

        HKUnit *unit = [name isEqualToString:@"EnergyConsumed"] ? [HKUnit kilocalorieUnit] : [HKUnit gramUnit];
        // The same sync identifier with a higher version replaces the sample instead of adding one.
        NSDictionary *metadata = @{
            HKMetadataKeySyncIdentifier: [NSString stringWithFormat:@"%@:%@", mealUUID, name],
            HKMetadataKeySyncVersion: @([version longLongValue]),
            RCTMealUUIDMetadataKey: mealUUID,
        };
        [samples addObject:[HKQuantitySample quantitySampleWithType:type
                                                           quantity:[HKQuantity quantityWithUnit:unit doubleValue:value]
                                                          startDate:date
                                                            endDate:date
                                                           metadata:metadata]];
        [written addObject:name];
    }

    NSDictionary *result = @{@"written": written, @"denied": denied};

    // A value edited down to zero must not leave the previous one in Health.
    [self dietary_deleteMealSamples:mealUUID ofTypes:zeroed completion:^(NSArray<NSString *> *deleted, NSError *deleteError) {
        if (deleteError) {
            callback(@[RCTMakeError(@"An error occurred while clearing the meal nutrition", deleteError, nil)]);
            return;
        }
        if (samples.count == 0) {
            callback(@[[NSNull null], result]);
            return;
        }
        [self.healthStore saveObjects:samples withCompletion:^(BOOL success, NSError *error) {
            if (!success) {
                callback(@[RCTMakeError(@"An error occurred while saving the meal nutrition", error, nil)]);
                return;
            }
            callback(@[[NSNull null], result]);
        }];
    }];
}

- (void)dietary_deleteMealNutrition:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSString *mealUUID = [RCTAppleHealthKit stringFromOptions:input key:@"mealUUID" withDefault:nil];
    if (mealUUID == nil) {
        callback(@[RCTMakeError(@"mealUUID is required", nil, nil)]);
        return;
    }

    NSMutableArray<NSString *> *authorized = [NSMutableArray array];
    NSMutableArray<NSString *> *denied = [NSMutableArray array];
    for (NSString *name in RCTMealNutritionTypeNames()) {
        HKObjectType *type = [self getWritePermFromText:name];
        if ([self.healthStore authorizationStatusForType:type] == HKAuthorizationStatusSharingAuthorized) {
            [authorized addObject:name];
        } else {
            [denied addObject:name];
        }
    }

    [self dietary_deleteMealSamples:mealUUID ofTypes:authorized completion:^(NSArray<NSString *> *deleted, NSError *error) {
        if (error) {
            callback(@[RCTMakeError(@"An error occurred while deleting the meal nutrition", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @{@"deleted": deleted, @"denied": denied}]);
    }];
}

- (void)dietary_hasMealNutrition:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSString *mealUUID = [RCTAppleHealthKit stringFromOptions:input key:@"mealUUID" withDefault:nil];
    if (mealUUID == nil) {
        callback(@[RCTMakeError(@"mealUUID is required", nil, nil)]);
        return;
    }

    NSPredicate *predicate = [HKQuery predicateForObjectsWithMetadataKey:RCTMealUUIDMetadataKey allowedValues:@[mealUUID]];
    NSObject *lock = [NSObject new];
    __block BOOL found = NO;
    __block NSError *firstError = nil;
    dispatch_group_t group = dispatch_group_create();

    // HealthKit always returns the app its own samples, even without read permission.
    for (NSString *name in RCTMealNutritionTypeNames()) {
        dispatch_group_enter(group);
        HKSampleQuery *query = [[HKSampleQuery alloc] initWithSampleType:(HKSampleType *)[self getWritePermFromText:name]
                                                               predicate:predicate
                                                                   limit:1
                                                         sortDescriptors:nil
                                                          resultsHandler:^(HKSampleQuery *query, NSArray<__kindof HKSample *> *results, NSError *error) {
            @synchronized (lock) {
                if (results.count > 0) {
                    found = YES;
                } else if (error != nil && firstError == nil) {
                    firstError = error;
                }
            }
            dispatch_group_leave(group);
        }];
        [self.healthStore executeQuery:query];
    }

    dispatch_group_notify(group, dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        if (!found && firstError != nil) {
            callback(@[RCTMakeError(@"An error occurred while looking up the meal nutrition", firstError, nil)]);
            return;
        }
        callback(@[[NSNull null], @(found)]);
    });
}

// Deletes the meal's samples of the given types; `deleted` names the types that had any.
- (void)dietary_deleteMealSamples:(NSString *)mealUUID
                          ofTypes:(NSArray<NSString *> *)typeNames
                       completion:(void (^)(NSArray<NSString *> *deleted, NSError *error))completion
{
    NSPredicate *predicate = [HKQuery predicateForObjectsWithMetadataKey:RCTMealUUIDMetadataKey allowedValues:@[mealUUID]];
    NSMutableArray<NSString *> *deleted = [NSMutableArray array];
    __block NSError *firstError = nil;
    dispatch_group_t group = dispatch_group_create();

    for (NSString *name in typeNames) {
        dispatch_group_enter(group);
        [self.healthStore deleteObjectsOfType:[self getWritePermFromText:name]
                                    predicate:predicate
                               withCompletion:^(BOOL success, NSUInteger deletedObjectCount, NSError *error) {
            // HealthKit reports "no data" when nothing matches the predicate; that is not a failure here.
            BOOL isNoData = [error.domain isEqualToString:HKErrorDomain] && error.code == HKErrorNoData;
            @synchronized (deleted) {
                if (success && deletedObjectCount > 0) {
                    [deleted addObject:name];
                } else if (!success && !isNoData && firstError == nil) {
                    firstError = error;
                }
            }
            dispatch_group_leave(group);
        }];
    }

    dispatch_group_notify(group, dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        completion(deleted, firstError);
    });
}

@end
