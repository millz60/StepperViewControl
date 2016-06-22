//
//  ViewController.m
//  StepperViewControl
//
//  Created by Matt Milner on 6/22/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "ViewController.h"
#import "StepperView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
    
    // Create stepperView Object and set its center to the center of the view
    StepperView *stepperView = [[StepperView alloc] init];
    stepperView.frame = CGRectMake(0, 0, 300, 50);
    stepperView.backgroundColor = [UIColor redColor];
    stepperView.center = self.view.center;
    
    // Add stepperView to root view
    [self.view addSubview:stepperView];
    
    
    // Create plusButton view and then "+" label inside of it and add to stepperView
    UIView *plusButton = [[UIView alloc] init];
    plusButton.frame = CGRectMake(0, 0, 50, 50);
    plusButton.backgroundColor = [UIColor blueColor];
    
    UILabel *plus = [[UILabel alloc] init];
    plus.text = @"+";
    plus.frame = CGRectMake(12.5, 12.5, 25, 25);
    plus.backgroundColor = [UIColor redColor];
    plus.textAlignment = NSTextAlignmentCenter;
    plus.font = [UIFont fontWithName:@"HelveticaNeue" size:22.0];
    [plusButton addSubview:plus];
    
    [stepperView addSubview:plusButton];
    
    // Create minusButton view and then "-" label inside of it and add to stepperView
    UIView *minusButton = [[UIView alloc] init];
    minusButton.frame = CGRectMake(250, 0, 50, 50);
    minusButton.backgroundColor = [UIColor blueColor];
    
    UILabel *minus = [[UILabel alloc] init];
    minus.text = @"-";
    minus.frame = CGRectMake(12.5, 12.5, 25, 25);
    minus.backgroundColor = [UIColor redColor];
    minus.textAlignment = NSTextAlignmentCenter;
    minus.font = [UIFont fontWithName:@"HelveticaNeue" size:22.0];
    [minusButton addSubview:minus];
    
    [stepperView addSubview:minusButton];
    
    
    // Add a labelView and label in the center to display current result and add it to stepperView
    UIView *labelView = [[UIView alloc] init];
    labelView.frame = CGRectMake(60, 5, 180, 40);
    labelView.backgroundColor = [UIColor yellowColor];
    
    
    UILabel *currentNumber = [[UILabel alloc] init];
    currentNumber.frame = CGRectMake(30, 5, 120, 30);
    currentNumber.backgroundColor = [UIColor redColor];
    currentNumber.text = @"0";
    currentNumber.textAlignment = NSTextAlignmentCenter;
    currentNumber.font = [UIFont fontWithName:@"HelveticaNeue" size:22.0];
    [labelView addSubview:currentNumber];
    
    [stepperView addSubview:labelView];
    

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
