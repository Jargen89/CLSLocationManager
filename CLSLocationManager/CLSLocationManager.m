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
        //locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        
    }
    
    return self;
}

-(void)startUpdatingLocation{
    [locationManager startUpdatingLocation];
    NSLog(@"Started Updating Location");
}
-(void)stopUpdatingLocation{
    [locationManager stopUpdatingLocation];
    NSLog(@"Stopped Updating Location");
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"Lat: %f  Long: %f",manager.location.coordinate.latitude,manager.location.coordinate.longitude);
}
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"location failed to update");
}

@end
