//
//  CalcViewController.h
//  Calculator
//
//  Created by Muhammad Arafat on 5/28/14.
//  Copyright (c) 2014 Muhammad Arafat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcViewController : UIViewController <UITextFieldDelegate>

@property (copy, nonatomic) NSMutableString *onDisplayValue;
@property (copy, nonatomic) NSNumber *accumulatorOne;
@property (copy, nonatomic) NSNumber *accumulatorTwo;
@property (copy, nonatomic) NSNumber *userLatitude;
@property (copy, nonatomic) NSNumber *userLongitude;
@property (nonatomic) BOOL isOperationSelected;
@property (nonatomic) BOOL evaluateWasPressed;

@end
