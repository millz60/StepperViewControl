//
//  ViewController.m
//  StepperViewControl
//
//  Created by Matt Milner on 6/22/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "ViewController.h"
#import "StepperView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Create stepperView Object and set its center to the center of the view
    StepperView *stepperView = [[StepperView alloc] init];
    stepperView.frame = CGRectMake(0, 0, 300, 50);
    stepperView.backgroundColor = [UIColor redColor];
    stepperView.center = self.view.center;
    stepperView.layer.cornerRadius = 5;
    stepperView.layer.masksToBounds = YES;

    
    
    // Add stepperView to root view
    [self.view addSubview:stepperView];
    
    
    // Create plusButton view and then "+" button inside of it and add to stepperView
    UIView *plusButton = [[UIView alloc] init];
    plusButton.frame = CGRectMake(250, 0, 50, 50);
    plusButton.backgroundColor = [UIColor blackColor];
    
    UIButton *plus = [[UIButton alloc] init];
    [plus setTitle:@"+" forState:UIControlStateNormal];
    plus.frame = CGRectMake(12.5, 12.5, 25, 25);
    plus.backgroundColor = [UIColor redColor];
    plus.titleLabel.textAlignment = NSTextAlignmentCenter;
    plus.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:22.0];
    plus.layer.cornerRadius = 5;
    plus.layer.masksToBounds = YES;
    plus.layer.shadowColor = [[UIColor blackColor] CGColor];
    plus.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    plus.layer.shadowRadius = 5.0f;
    plus.layer.shadowOpacity = 0.5f;
    [plusButton addSubview:plus];
    
    [stepperView addSubview:plusButton];
    
    // Create minusButton view and then "-" button inside of it and add to stepperView
    UIView *minusButton = [[UIView alloc] init];
    minusButton.frame = CGRectMake(0, 0, 50, 50);
    minusButton.backgroundColor = [UIColor blackColor];
    
    UIButton *minus = [[UIButton alloc] init];
    minus.frame = CGRectMake(12.5, 12.5, 25, 25);
    minus.backgroundColor = [UIColor redColor];
    [minus setTitle:@"-" forState:UIControlStateNormal];
    minus.titleLabel.textAlignment = NSTextAlignmentCenter;
    minus.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:22.0];
    minus.layer.cornerRadius = 5;
    minus.layer.masksToBounds = YES;
    minus.layer.shadowColor = [[UIColor blackColor] CGColor];
    minus.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    minus.layer.shadowRadius = 3.0f;
    minus.layer.shadowOpacity = 1.0f;
    
    
    [minusButton addSubview:minus];

    [minus addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [plus addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

    
    [stepperView addSubview:minusButton];
    
    
    // Add a labelView and label in the center to display current result and add it to stepperView
    UIView *labelView = [[UIView alloc] init];
    labelView.frame = CGRectMake(60, 5, 180, 40);
    labelView.backgroundColor = [UIColor whiteColor];
    
    
    currentNumber = [[UILabel alloc] init];
    currentNumber.frame = CGRectMake(30, 5, 120, 30);
    currentNumber.backgroundColor = [UIColor redColor];
    currentNumber.text = @"0";
    currentNumber.textAlignment = NSTextAlignmentCenter;
    currentNumber.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:22.0];
    [labelView addSubview:currentNumber];
    
    [stepperView addSubview:labelView];
    

    
    int screenWidth = self.view.frame.size.width;
    int screenHeight = self.view.frame.size.height;
    
    
    minRange = [[UITextField alloc] initWithFrame:CGRectMake((screenWidth/4)-33, (screenHeight/4)*2.5-20, 66, 40)];
    minRange.text = @"-10";
    minRange.textColor = [UIColor redColor];
    minRange.backgroundColor = [UIColor lightGrayColor];
    minRange.layer.cornerRadius = 5;
    minRange.layer.masksToBounds = YES;
    minRange.textAlignment = NSTextAlignmentCenter;
    minRange.keyboardType = UIKeyboardTypeNumberPad;
    
    maxRange = [[UITextField alloc] initWithFrame:CGRectMake(((screenWidth/4)*3)-33, (screenHeight/4)*2.5-20, 66, 40)];
    maxRange.text = @"10";
    maxRange.textColor = [UIColor redColor];
    maxRange.backgroundColor = [UIColor lightGrayColor];
    maxRange.layer.cornerRadius = 5;
    maxRange.layer.masksToBounds = YES;
    maxRange.textAlignment = NSTextAlignmentCenter;
    maxRange.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.view addSubview:maxRange];
    [self.view addSubview:minRange];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) buttonPressed: (UIButton *) sender{
    
    NSString *operation = sender.titleLabel.text;
    NSInteger labelValue = currentNumber.text.integerValue;
    
    NSInteger max = maxRange.text.integerValue;
    NSInteger min = minRange.text.integerValue;

    
    if ([operation isEqualToString:@"+"] && labelValue < max){
        currentNumber.text = [NSString stringWithFormat:@"%ld",(labelValue+1)];
        [maxRange resignFirstResponder];
        [minRange resignFirstResponder];
        
    }
    else if ([operation isEqualToString:@"-"] && labelValue > min){
        currentNumber.text = [NSString stringWithFormat:@"%ld",(labelValue-1)];
        [maxRange resignFirstResponder];
        [minRange resignFirstResponder];
    }
    

}


















@end
