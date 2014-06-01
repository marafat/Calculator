//
//  CalcViewController.m
//  Calculator
//
//  Created by Muhammad Arafat on 5/28/14.
//  Copyright (c) 2014 Muhammad Arafat. All rights reserved.
//

#import "CalcViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface CalcViewController ()
// Class extention section
{
    UILabel *display;
    UIButton *addition;
    UIButton *subtraction;
    UIButton *multiplication;
    UIButton *division;
    
    GMSMapView *mapView;
    UIView *basicView;
}

// Private properties and actions
@property (strong, nonatomic) NSString *operation;

- (IBAction)updateDisplay:(id)sender;
- (IBAction)displayMapView:(id)sender;
- (IBAction)closeMapView:(id)sender;
- (void)clearDisplay;
- (void)clearOperationButton;

@end

@implementation CalcViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Adding the display as a label
    display = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 75.0, 750.0, 100.0)];
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
    
    
    // Designing "Location visualization" section
    
    UILabel* latitudeLabel = [[UILabel alloc] init];
    [self customizeLabel:latitudeLabel withText:@"Latitude:" withFrame:CGRectMake(50.0, 280.0, 100.0, 50.0)];
    [self.view addSubview:latitudeLabel];
    
    UILabel* longitudeLabel = [[UILabel alloc] init];
    [self customizeLabel:longitudeLabel withText:@"Longitude:" withFrame:CGRectMake(335.0, 280.0, 100.0, 50.0)];
    [self.view addSubview:longitudeLabel];

    UITextField* latitudeTextField = [[UITextField alloc] init];
    [latitudeTextField setFrame:CGRectMake(160.0, 280.0, 150.0, 50.0)];
    [latitudeTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [latitudeTextField setPlaceholder:@"enter latitude"];
    [latitudeTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    [latitudeTextField setTag:1];
    [latitudeTextField setReturnKeyType:UIReturnKeyNext];
    [latitudeTextField setDelegate:self];
    [self.view addSubview:latitudeTextField];
    
    UITextField* longitudeTextField = [[UITextField alloc] init];
    [longitudeTextField setFrame:CGRectMake(445.0, 280.0, 150.0, 50.0)];
    [longitudeTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [longitudeTextField setPlaceholder:@"enter longitude"];
    [longitudeTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    [longitudeTextField setTag:2];
    [longitudeTextField setReturnKeyType:UIReturnKeyGo];
    [longitudeTextField setDelegate:self];
    [self.view addSubview:longitudeTextField];
    
    UIButton* goButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self customizeButton:goButton withTitle:@"Go" withFrame:CGRectMake(645.0, 280.0, 70.0, 50.0) inUIView:self.view];
    [goButton addTarget:self action:@selector(displayMapView:) forControlEvents:UIControlEventTouchUpInside];
    
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

- (void)customizeLabel:(UILabel*)label withText:(NSString*)text withFrame:(CGRect)frame
{
    [label setText:text];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFrame:frame];
}

// Delegate Methods Section
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
}

//- (BOOL)textFieldShouldClear:(UITextField *)textField{
//    NSLog(@"textFieldShouldClear:");
//    return YES;
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    if (textField.tag == 1) {
        UITextField *longitudeTextField = (UITextField *)[self.view viewWithTag:2];
        [longitudeTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
        // TODO: press the button "Go" and view the map
    }
    return YES;
}

- (IBAction)displayMapView:(id)sender
{
//    UIView* mapModalView = [[UIView alloc] initWithFrame:self.view.frame];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:6];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    [mapView setMyLocationEnabled:NO];
    
    
    // add a back button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self customizeButton:backButton withTitle:@"Back" withFrame:CGRectMake(20, 20, 50, 30) inUIView:mapView];
    [backButton addTarget:self action:@selector(closeMapView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    basicView = [[UIView alloc] init];
    basicView = self.view;
    self.view = mapView;
//    self.view = basicView;
//    [self.view addSubview:mapView];
//    [self.view bringSubviewToFront:mapView];
//    [mapView setHidden:NO];
    
//    [UIView beginAnimations:Nil context:NULL];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:mapView cache:YES];
//    [UIView commitAnimations];
    
    
    
}

- (IBAction)closeMapView:(id)sender
{
    self.view = basicView;
}
// Control and Logic Section

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
