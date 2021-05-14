#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray == nil || numbersArray.count == 0) {
        NSString *myString = [[NSString alloc] initWithString:@""];
        return myString;
    }

    NSNumber *firstNumber = @0, *secondNumber = @0, *thirdNumber = @0, *fourthNumber = @0;
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:firstNumber, secondNumber, thirdNumber, fourthNumber, nil];
    NSEnumerator *enumerator = [numbersArray objectEnumerator];
    int counter = 0;

    for (NSNumber *number in enumerator) {
        if (number.intValue < 0) {

            NSString *answer = [[NSString alloc] initWithString:@"Negative numbers are not valid for input."];
            return answer;
        } else if (number.intValue > 255) {
            NSString *answer = [[NSString alloc] initWithString:@"The numbers in the input array can be in the range from 0 to 255."];
            return answer;
        }

        array[counter] = number;
        counter += 1;
    }

    NSString *myString = [[NSString alloc] initWithFormat:@"%i.%i.%i.%i", [array[0] intValue], [array[1] intValue], [array[2] intValue], [array[3] intValue]];

    return myString;
}

@end
