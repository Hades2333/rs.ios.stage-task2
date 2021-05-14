#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {

    int counter = 0;
    NSEnumerator *enumerator = [array reverseObjectEnumerator];

    for (NSNumber *myNumber in enumerator) {

        int j = [array indexOfObject:myNumber];
        while (j >= 0) {

            if ((myNumber.intValue - array[j].intValue) == number.intValue) {
                counter += 1;
            }

            if (j == 0) {
                break;
            }
            
            j--;
        }
    }
    return counter;
}

@end
