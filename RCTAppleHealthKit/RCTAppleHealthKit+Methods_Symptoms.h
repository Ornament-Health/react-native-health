//
//  RCTAppleHealthKit+Methods_Symptoms.h
//  RCTAppleHealthKit
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.

#import "RCTAppleHealthKit.h"

@interface RCTAppleHealthKit (Methods_Symptoms)

// Symptom category types by the names the symptom methods take, e.g. 'headache'.
+ (NSDictionary<NSString *, HKCategoryTypeIdentifier> *)symptomTypeIdentifiers;

- (void)symptoms_getAnchoredSymptoms:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;
- (void)symptoms_saveSymptom:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;
- (void)symptoms_deleteSymptom:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;
- (void)symptoms_hasSymptom:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;

@end
