#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {

    if (array == nil) {
        return @[];
    }

    for (id object in array) {
        if (![object isKindOfClass:[NSArray class]]) {
            return @[];
        }
    }

    NSMutableArray *arrayOfNumbers = [[NSMutableArray alloc] init];
    NSMutableArray *arrayOfStrings = [[NSMutableArray alloc] init];

    for (id object in array) {

        for (id innerObject in object) {
            [innerObject isKindOfClass:[NSNumber class]] ?
            [arrayOfNumbers addObject:innerObject] :
            [arrayOfStrings addObject:innerObject];
        }
    }

    for (int i = 1; i < arrayOfNumbers.count; i++) {

        for (int j = i; j > 0; j--) {

            int firstNumber = [arrayOfNumbers[j-1] intValue];
            int secondNumber = [arrayOfNumbers[j] intValue];

            if (firstNumber > secondNumber) {
                [arrayOfNumbers exchangeObjectAtIndex:(j-1) withObjectAtIndex:j];
            }
        }
    }

    for (int i = 0; i < arrayOfStrings.count; i++) {

        NSString *minString = arrayOfStrings[i];

        for (int j = i; j < arrayOfStrings.count; j++) {
            NSComparisonResult result = [arrayOfStrings[j] compare:minString];

            if (result == NSOrderedAscending) {
                minString = arrayOfStrings[j];
                [arrayOfStrings exchangeObjectAtIndex:j withObjectAtIndex:i];
            }
        }
    }

    bool allNumbers = (!(!arrayOfNumbers || !arrayOfNumbers.count) ? true : false);
    bool allStrings = (!(!arrayOfStrings || !arrayOfStrings.count) ? true : false);;
    bool stringsAndNumbers = (allNumbers && allStrings);

    if (stringsAndNumbers) {
        NSArray *answer = [[NSArray alloc] initWithObjects:arrayOfNumbers, arrayOfStrings, nil];
        return answer;
    } else if (allNumbers) {
        return [arrayOfNumbers copy];
    } else {
        return [arrayOfStrings copy];
    }
}

@end
