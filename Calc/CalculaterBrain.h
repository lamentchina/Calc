//
//  CalculaterBrain.h
//  Calc
//
//  Created by Tom Zhang on 13-1-31.
//  Copyright (c) 2013年 Tom Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculaterBrain : NSObject
-(void)pushOperand:(double)operand;
-(double) performOperation:(NSString *)operation;
@end
