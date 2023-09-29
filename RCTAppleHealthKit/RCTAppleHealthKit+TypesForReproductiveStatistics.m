#import "RCTAppleHealthKit+TypesForReproductiveStatistics.h"
#import "RCTAppleHealthKit+TypesAndPermissions.h"

@implementation RCTAppleHealthKit (TypesForReproductiveStatistics)

- (NSArray *)getReproductiveTypes {

    return @[@"menstrualFlow",
             @"intermenstrualBleeding",
             @"basalBodyTemperature",
             @"cervicalMucusQuality",
             @"ovulationTestResult",
             @"sexualActivity",
             @"contraceptive",
             @"pregnancy",
             @"lactation",
             @"progesteroneTestResult",
             @"pregnancyTestResult",
             @"infrequentMenstrualCycles",
             @"irregularMenstrualCycles",
             @"persistentIntermenstrualBleeding",
             @"prolongedMenstrualPeriods"];
}

- (NSArray *)getSymptomTypes {

    return @[@"abdominalCramps",
             @"bloating",
             @"constipation",
             @"diarrhea",
             @"heartburn",
             @"nausea",
             @"vomiting",
             @"appetiteChanges",
             @"chills",
             @"dizziness",
             @"fainting",
             @"fatigue",
             @"fever",
             @"generalizedBodyAche",
             @"hotFlashes",
             @"chestTightnessOrPain",
             @"coughing",
             @"rapidPoundingOrFlutteringHeartbeat",
             @"shortnessOfBreath",
             @"skippedHeartbeat",
             @"wheezing",
             @"lowerBackPain",
             @"headache",
             @"moodChanges",
             @"lossOfSmell",
             @"lossOfTaste",
             @"runnyNose",
             @"soreThroat",
             @"sinusCongestion",
             @"breastPain",
             @"pelvicPain",
             @"acne",
             @"sleepChanges",
             @"memoryLapse",
             @"vaginalDryness",
             @"drySkin",
             @"hairLoss",
             @"nightSweats",
             @"bladderIncontinence"];
}

@end
