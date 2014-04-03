//
//  CLSLocationManagerDemoView.h
//  CLSLocationManager
//
//  Created by Jason Vieira on 2014-04-03.
//  Copyright (c) 2014 Jason Vieira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLSLocationManager.h"
@interface CLSLocationManagerDemoView : UIViewController
{
    CLSLocationManager* locationManagerObject;
}
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
- (IBAction)updateLocation:(id)sender;
@end
