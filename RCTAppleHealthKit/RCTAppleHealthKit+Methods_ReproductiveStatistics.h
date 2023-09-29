#import "RCTAppleHealthKit.h"

@interface RCTAppleHealthKit (Methods_ReproductiveStatistics)

- (void)statistics_getReproductiveStatistic: (RCTResponseSenderBlock)callback;

- (void)statistics_getReproductiveStatisticWithParameters:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;

@end
