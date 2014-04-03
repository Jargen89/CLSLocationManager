//
//  CLSLocationManager.h
//  CLSLocationManager
//
//  Created by Jason Vieira on 2014-04-03.
//  Copyright (c) 2014 Jason Vieira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CLSLocationManager : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager* locationManager;
}
//@property (strong, atomic) CLLocationManager* locationManager;

+ (CLSLocationManager*)sharedInstance;

-(CLLocation*)currentLocation;
-(void)startUpdatingLocation;
-(void)stopUpdatingLocation;

@end
