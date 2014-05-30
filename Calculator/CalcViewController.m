//
//  CalcViewController.m
//  Calculator
//
//  Created by Muhammad Arafat on 5/28/14.
//  Copyright (c) 2014 Muhammad Arafat. All rights reserved.
//

#import "CalcViewController.h"

@interface CalcViewController ()
// Class extention section
{
    UILabel *display;
    UIButton *addition;
    UIButton *subtraction;
    UIButton *multiplication;
    UIButton *division;
}

// Private properties and actions
@property (strong, nonatomic) NSString *operation;

- (IBAction)updateDisplay:(id)sender;
- (void)clearDisplay;
- (void)clearOperationButton;

@end

@implementation CalcViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Adding the display as a label
    display = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 200.0, 750.0, 100.0)];
    display.backgroundColor = [UIColor blackColor];
    display.textColor = [UIColor whiteColor];
    display.font = [UIFont systemFontOfSize:50];
    [display setText:@"0"];
    NSLog(@"Display Text Original: %@",[display text]);
    [display setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:display];
    
    // Adding evaluate button
    UIButton* evaluateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [evaluateButton addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:evaluateButton withTitle:@"Evaluate" withFrame:CGRectMake(300.0, 810.0, 160.0, 40.0) inUIView:self.view];
    
    // adding buttons for numbers
    UIButton* numberZero = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberZero addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberZero withTitle:@"0" withFrame:CGRectMake(100.0, 730.0, 170.0, 70.0) inUIView:self.view];

    
    UIButton* numberOne = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberOne addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberOne withTitle:@"1" withFrame:CGRectMake(100.0, 650.0, 70.0, 70.0) inUIView:self.view];

    
    UIButton* numberTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberTwo addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberTwo withTitle:@"2" withFrame:CGRectMake(200.0, 650.0, 70.0, 70.0) inUIView:self.view];
    
    
    UIButton* numberThree = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberThree addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberThree withTitle:@"3" withFrame:CGRectMake(300.0, 650.0, 70.0, 70.0) inUIView:self.view];

    
    UIButton* numberFour = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberFour addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberFour withTitle:@"4" withFrame:CGRectMake(100.0, 550.0, 70.0, 70.0) inUIView:self.view];

    
    UIButton* numberFive = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberFive addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberFive withTitle:@"5" withFrame:CGRectMake(200.0, 550.0, 70.0, 70.0) inUIView:self.view];

    
    UIButton* numberSix = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberSix addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberSix withTitle:@"6" withFrame:CGRectMake(300.0, 550.0, 70.0, 70.0) inUIView:self.view];

    
    UIButton* numberSeven = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberSeven addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberSeven withTitle:@"7" withFrame:CGRectMake(100.0, 450.0, 70.0, 70.0) inUIView:self.view];

    
    UIButton* numberEight = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberEight addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberEight withTitle:@"8" withFrame:CGRectMake(200.0, 450.0, 70.0, 70.0) inUIView:self.view];
    
    UIButton* numberNine = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [numberNine addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:numberNine withTitle:@"9" withFrame:CGRectMake(300.0, 450.0, 70.0, 70.0) inUIView:self.view];

    
    addition = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addition addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:addition withTitle:@"+" withFrame:CGRectMake(400.0, 730.0, 70.0, 70.0) inUIView:self.view];

    
    subtraction = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [subtraction addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:subtraction withTitle:@"-" withFrame:CGRectMake(400.0, 650.0, 70.0, 70.0) inUIView:self.view];

    
    multiplication = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [multiplication addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:multiplication withTitle:@"x" withFrame:CGRectMake(400.0, 550.0, 70.0, 70.0) inUIView:self.view];

    
    division = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [division addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:division withTitle:@"/" withFrame:CGRectMake(400.0, 450.0, 70.0, 70.0) inUIView:self.view];

    
    UIButton* clear = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clear addTarget:self action:@selector(updateDisplay:) forControlEvents:UIControlEventTouchUpInside];
    [self customizeButton:clear withTitle:@"CLR" withFrame:CGRectMake(300.0, 730.0, 70.0, 70.0) inUIView:self.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customizeButton:(UIButton*)button withTitle:(NSString*)title withFrame:(CGRect)frame inUIView:(UIView*)view
{
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = frame;
    [view addSubview:button];
}

- (IBAction)updateDisplay:(id)sender {
    NSLog(@"updateDisplay Called");
    
    /*
     This is a message sent to self (viewController) from a button to update the value on display with the value retrived from the sender bottun. The View controller responds by changing the value of the "Model" which is the string onDisplayValue, and then update the label to reflect the change.
     */
    
    UIButton *sourceButton = (UIButton*)sender;
    
    BOOL sourceButtonIsADigit = ![sourceButton.titleLabel.text isEqualToString:@"+"] && ![sourceButton.titleLabel.text isEqualToString:@"-"] && ![sourceButton.titleLabel.text isEqualToString:@"x"] && ![sourceButton.titleLabel.text isEqualToString:@"/"] && ![sourceButton.titleLabel.text isEqualToString:@"Evaluate"] && ![sourceButton.titleLabel.text isEqualToString:@"CLR"];
    
    if ([self.onDisplayValue isEqualToString:@"0"] && [sourceButton.titleLabel.text isEqualToString:@"0"]) {
        [self clearDisplay];
    }
    
    if (sourceButtonIsADigit) {
        if (self.evaluateWasPressed) {
            self.evaluateWasPressed = NO;
            [self clearDisplay];
        }
        // update the model
        if (self.onDisplayValue == NULL) {
            self.onDisplayValue = [[NSMutableString alloc] initWithFormat:@"0"];
        }
        NSMutableString *tempAccumulator = [[NSMutableString alloc] initWithFormat:@"%@%@",(NSString *)self.onDisplayValue, sourceButton.titleLabel.text];
        
        // eliminating leading Zero
        if ([tempAccumulator characterAtIndex:0] == '0') {
            tempAccumulator = (NSMutableString*)[tempAccumulator substringFromIndex:1];
        }
        self.onDisplayValue = [tempAccumulator copy];
        
        // update the accumulator content
        if (self.isOperationSelected == NO) {
            self.accumulatorOne = [NSNumber numberWithDouble:[self.onDisplayValue doubleValue]];
            NSLog(@"the acc1 is = %@",self.accumulatorOne);
        }
        else {
            self.accumulatorTwo = [NSNumber numberWithDouble:[self.onDisplayValue doubleValue]];
            NSLog(@"the acc2 is = %@",self.accumulatorTwo);
        }
        
      
        // This approach works: using messages. (maybe accessor methods)
        [display setText:(NSString *)self.onDisplayValue];
    }
    
    else if ([sourceButton.titleLabel.text isEqualToString:@"+"] || [sourceButton.titleLabel.text isEqualToString:@"-"] || [sourceButton.titleLabel.text isEqualToString:@"x"] || [sourceButton.titleLabel.text isEqualToString:@"/"]) {
        if (self.isOperationSelected) {
            [self evaluateAndDisplay];
            
        }
        else {
            self.isOperationSelected = YES;
        }
        [sender setSelected:YES];
        self.evaluateWasPressed = NO;
        self.operation = sourceButton.titleLabel.text;
        [self clearDisplayWithoutAccumulator];
    }
    
    // clear functionality
    if ([sourceButton.titleLabel.text isEqualToString:@"CLR"]) {
        [self clearDisplay];
    }
    
    if ([sourceButton.titleLabel.text isEqualToString:@"Evaluate"]) {
        self.evaluateWasPressed = YES;
        self.isOperationSelected = NO;
        
        [self evaluateAndDisplay];
        
    }
    
    NSLog(@"Display Text: %@",[display text]);
    
}

-(void)evaluateAndDisplay {
    
    [self clearOperationButton];
    
    double result = 0.0;
    if ([self.operation isEqualToString:@"+"]) {
        double accu1 = [self.accumulatorOne doubleValue];
        double accu2 = [self.accumulatorTwo doubleValue];
        
        result = accu1 + accu2;
    }
    else if ([self.operation isEqualToString:@"-"]){
        double accu1 = [self.accumulatorOne doubleValue];
        double accu2 = [self.accumulatorTwo doubleValue];
        
        result = accu1 - accu2;
    }
    
    else if ([self.operation isEqualToString:@"x"]){
        double accu1 = [self.accumulatorOne doubleValue];
        double accu2 = [self.accumulatorTwo doubleValue];
        
        result = accu1 * accu2;
    }
    
    else if ([self.operation isEqualToString:@"/"]){
        double accu1 = [self.accumulatorOne doubleValue];
        double accu2 = [self.accumulatorTwo doubleValue];
        
        result = accu1 / accu2;
    }
    // show the result and put its value in accumulatorOne
    NSMutableString *ResultedOnDisplayValue = [[NSMutableString alloc] initWithFormat:@"%g", result];
    self.onDisplayValue = [ResultedOnDisplayValue copy];
    [display setText:self.onDisplayValue];
    self.accumulatorOne = [NSNumber numberWithDouble:result];
    self.accumulatorTwo = [NSNumber numberWithDouble:0.0];
}

- (void)clearDisplay {
    NSMutableString *newOnDisplayValue = [[NSMutableString alloc] initWithFormat:@""];
    self.onDisplayValue = [newOnDisplayValue copy];
    [display setText:@"0"];
    self.accumulatorOne = [NSNumber numberWithDouble:0.0];
    self.accumulatorTwo = [NSNumber numberWithDouble:0.0];
    self.isOperationSelected = NO;
}

- (void)clearDisplayWithoutAccumulator {
    NSMutableString *newOnDisplayValue = [[NSMutableString alloc] initWithFormat:@""];
    self.onDisplayValue = [newOnDisplayValue copy];
}

- (void)clearOperationButton {
    if ([self.operation isEqualToString:@"+"]) {
        [addition setSelected:NO];
    } else if ([self.operation isEqualToString:@"-"]) {
        [subtraction setSelected:NO];
    } else if ([self.operation isEqualToString:@"x"]) {
        [multiplication setSelected:NO];
    } else if ([self.operation isEqualToString:@"/"]) {
        [division setSelected:NO];
    }
}

@end
