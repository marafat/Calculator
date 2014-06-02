//
//  googleMapViewController.m
//  Calculator
//
//  Created by Muhammad Arafat on 6/2/14.
//  Copyright (c) 2014 Muhammad Arafat. All rights reserved.
//

#import "googleMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>


@interface googleMapViewController ()
{
    GMSMapView *mapView;
}
@end

@implementation googleMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Setup the map view
    GMSCameraPosition *targetCamera = [GMSCameraPosition cameraWithTarget:self.target zoom:0];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:targetCamera];
    [mapView setMyLocationEnabled:NO];
    
    // add a back button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(20, 20, 50, 30)];
    [backButton.layer setCornerRadius:5.0];
    [backButton setBackgroundColor:[UIColor colorWithRed:0.0f/255.0f green:122.0f/255.0f blue:255.0f/255.0f alpha:0.9f]];
    [backButton setTintColor:[UIColor whiteColor]];
    [backButton addTarget:self action:@selector(closeMapView:) forControlEvents:UIControlEventTouchUpInside];
    [mapView addSubview:backButton];
    
    self.view = mapView;
    
    // Add marker
    GMSMarker *targetMarker = [GMSMarker markerWithPosition:self.target];
    targetMarker.title = @"Desired Location";
    targetMarker.snippet = [[NSString alloc] initWithFormat:@"%f, %f", (double)self.target.latitude, (double)self.target.longitude];
    targetMarker.map = mapView;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    // update zoom level
    GMSCameraUpdate *zoomOnTarget = [GMSCameraUpdate zoomBy:4];
    [mapView animateWithCameraUpdate:zoomOnTarget];
}

- (IBAction)closeMapView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
