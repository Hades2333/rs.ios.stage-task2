#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {

    if (array.count < 2) {
        return 0;
    }

    int counter = 0;

    for (NSUInteger i = 0; i < array.count; i++) {
        for (NSUInteger j = i+1; j< array.count; j++) {
            if ([array objectAtIndex:j].intValue - [array objectAtIndex:i].intValue == number.intValue) {
                counter++;
            }
        }
    }
    return counter;
}

@end
