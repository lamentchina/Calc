//
//  CalculaterBrain.m
//  Calc
//
//  Created by Tom Zhang on 13-1-31.
//  Copyright (c) 2013年 Tom Zhang. All rights reserved.
//

#import "CalculaterBrain.h"

@interface CalculaterBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;

@end

@implementation CalculaterBrain

@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack{
    if (_operandStack == nil) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}


-(void)pushOperand:(double)operand{
    [self.operandStack addObject: [NSNumber numberWithDouble:operand]];
}

-(double) popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    NSLog(@"数字=%@",operandObject);
    if (self.operandStack != nil) {
        [self.operandStack removeLastObject];
    }
    
    return [operandObject doubleValue];
    
}

-(double) performOperation:(NSString *)operation{
    double result = 0;
    if ([@"+" isEqualToString:operation]) {
        result = [self popOperand] + [self popOperand];
    } else if ([@"-" isEqualToString:operation]){
        result = [self popOperand]- [self popOperand];
    } else if ([@"*" isEqualToString:operation]){
        result = [self popOperand] * [self popOperand];
    } else if ( [@"/" isEqualToString:operation]){
        result = [self popOperand] / [self popOperand];
    }
    
    [self pushOperand:result];

    return result;
}
@end
