//
//  CLSLocationManagerDemoView.m
//  CLSLocationManager
//
//  Created by Jason Vieira on 2014-04-03.
//  Copyright (c) 2014 Jason Vieira. All rights reserved.
//

#import "CLSLocationManagerDemoView.h"

@interface CLSLocationManagerDemoView ()

@end

@implementation CLSLocationManagerDemoView

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
    locationManagerObject = [CLSLocationManager sharedInstance];
    [locationManagerObject startUpdatingLocation];
    [locationManagerObject startUpdatingHeading];
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

- (IBAction)updateLocation:(id)sender {
    CLLocation* location = [locationManagerObject currentLocation];
    _locationLabel.text = [NSString stringWithFormat:@"Lat:%f\nLong:%f",location.coordinate.latitude,location.coordinate.longitude,nil];
    [_locationLabel sizeToFit];
}
@end
