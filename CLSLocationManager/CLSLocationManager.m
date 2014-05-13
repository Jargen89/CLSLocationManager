//
//  CLSLocationManager.m
//  CLSLocationManager
//
//  Created by Jason Vieira on 2014-04-03.
//  Copyright (c) 2014 Jason Vieira. All rights reserved.
//

#import "CLSLocationManager.h"

@implementation CLSLocationManager
@synthesize locationManager;
+ (CLSLocationManager*)sharedInstance
{
    static CLSLocationManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[CLSLocationManager alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.headingFilter = 15;
        locationManager.headingOrientation = CLDeviceOrientationPortrait;
    }
    
    return self;
}

-(CLLocation*)currentLocation{
    return [locationManager location];
}
-(void)startUpdatingLocation{
    [locationManager startUpdatingLocation];
    NSLog(@"Started Updating Location");
}
-(void)stopUpdatingLocation{
    [locationManager stopUpdatingLocation];
    NSLog(@"Stopped Updating Location");
}
-(void)startUpdatingHeading{
    [locationManager startUpdatingHeading];
    NSLog(@"Started Updating Heading");
}
-(void)stopUpdatingHeading{
    [locationManager stopUpdatingHeading];
    NSLog(@"Stopped Updating Heading");
}

-(void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    NSLog(@"Changed Heading, it is now %f to True North",newHeading.trueHeading);
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //CLLocationCoordinate2D currentLoc = [[locations lastObject] coordinate];
    //[gpsObject setLocation:[NSString stringWithFormat:@"Latitude = %f longitude = %f", currentLoc.latitude, currentLoc.longitude]];
    NSLog(@"Updated Location");
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"location failed to update");
}

@end
