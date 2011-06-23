//
//  WhereamiOneDotOneAppDelegate.m
//  WhereamiOneDotOne
//
//  Created by Kevin Bowe on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WhereamiOneDotOneAppDelegate.h"
#import "MapPoint.h"

@implementation WhereamiOneDotOneAppDelegate


@synthesize window=_window;


- (void) findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void) foundLocation
{
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

- (BOOL) textFieldShouldReturn:(UITextField *)tf
{
    [self findLocation];
    [tf resignFirstResponder];
    return YES;
}

- (void)mapView:(MKMapView *)/*mapView*/worldView 
didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

- (void) mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 250, 250 );
    [mv setRegion:region animated:YES];
}

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    
    // How many seconds ago was this new location created?
    NSTimeInterval t= [[newLocation timestamp] timeIntervalSinceNow];
    
    // CLLocationManagers will return the last found location of the 
    // device first, you don't want that data in this case.
    // If this location was made more than 3 minutes ago, ignore it...
    if (t < -180 /*-15*/) {
        return;
    }
    
    MapPoint *mp = [[MapPoint alloc]
                    initWithCoordinate:[newLocation coordinate]
                    title:[locationTitleField text]];
    [mapView addAnnotation:mp];
    [mp release];
    
    [self foundLocation];
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find a location: %@", error);          
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Create location manager obj...
    locationManager = [[CLLocationManager alloc] init];
    
    // Make this instance of WhereamiAppDelegate the delegate...
    [locationManager setDelegate:self];
    
    // We want all results from the location manager...
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    
    // And we wnat it to be as accurate as possible
    // regardless of how much time/power it takes...
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    // Tell out manager to start looking for its location immediately...
    [locationManager startUpdatingLocation];
    [mapView setShowsUserLocation:YES];
    [mapView setDelegate:self];
    
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [locationManager setDelegate:nil];
    [_window release];
    [mapView release];
    [locationTitleField release];
    [activityIndicator release];
    [super dealloc];
}

@end
