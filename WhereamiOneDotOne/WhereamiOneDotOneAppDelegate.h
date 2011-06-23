//
//  WhereamiOneDotOneAppDelegate.h
//  WhereamiOneDotOne
//
//  Created by Kevin Bowe on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiOneDotOneAppDelegate : 
        NSObject <UIApplicationDelegate, CLLocationManagerDelegate,MKMapViewDelegate> 
{
    
    UIWindow *window;
    
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *mapView;
    IBOutlet UITextField *locationTitleField;
    IBOutlet UIActivityIndicatorView *activityIndicator;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void) findLocation;
- (void) foundLocation;


@end
