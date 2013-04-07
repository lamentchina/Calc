//
//  chachaViewController.m
//  Calc
//
//  Created by Tom Zhang on 13-1-30.
//  Copyright (c) 2013年 Tom Zhang. All rights reserved.
//

#import "chachaViewController.h"
#import "CalculaterBrain.h"

@interface chachaViewController ()
@property (nonatomic) BOOL userInTheMiddleOfEnteringANumber;
@property (nonatomic, strong)CalculaterBrain *brain;
@end

@implementation chachaViewController
@synthesize display = _display;
@synthesize userInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculaterBrain *)brain{
    if (!_brain) {
        _brain = [[CalculaterBrain alloc]init];
    }
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    
    
    NSLog(@"digit pressed=%@", digit);
    
    
    if (self.userInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userInTheMiddleOfEnteringANumber = YES;
    }
    

    
}
- (IBAction)operationPressed:(UIButton *)sender {
    
    if (self.userInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }

    NSLog(@"result == %@", sender.currentTitle);
    double result = [self.brain performOperation:sender.currentTitle];
    
    self.display.text = [NSString stringWithFormat:@"%g", result];
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userInTheMiddleOfEnteringANumber = NO;
}


@end
