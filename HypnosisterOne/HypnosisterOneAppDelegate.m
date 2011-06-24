//
//  HypnosisterOneAppDelegate.m
//  HypnosisterOne
//
//  Created by Kevin Bowe on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HypnosisterOneAppDelegate.h"
#import "HypnosisView.h"

@implementation HypnosisterOneAppDelegate


//...@synthesize window=_window;
@synthesize window;


- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return view;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    CGRect wholeWindow = [window bounds];
    
    
    // view = [[HypnosisView alloc] initWithFrame:wholeWindow];
    // [view setBackgroundColor:[UIColor clearColor]];
    
    // // Add the new view as a subview of the governing window...
    // [window addSubview:view];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:wholeWindow];
    [window addSubview:scrollView];
    [scrollView release];
    
    // Make your view twice as large as the window...
    CGRect reallyBigRect;
    reallyBigRect.origin = CGPointZero;
    reallyBigRect.size.width = wholeWindow.size.width * 2.0;
    reallyBigRect.size.height = wholeWindow.size.height * 2.0;
    [scrollView setContentSize:reallyBigRect.size];
    
    // Center it in the scroll view...
    CGPoint offset;
    offset.x = wholeWindow.size.width * 0.5;
    offset.y = wholeWindow.size.height * 0.5;
    [scrollView setContentOffset:offset];
    
    // Enable zooming...
    [scrollView setMinimumZoomScale:0.5];
    [scrollView setMaximumZoomScale:5];
    [scrollView setDelegate:self];
    
    // Create the view...
    view = [[HypnosisView alloc] initWithFrame:reallyBigRect];
    [view setBackgroundColor:[UIColor clearColor]];
    [scrollView addSubview:view];
    
    // Hide StatusBar.  This will cause the StatusBar to initiall be displayed and then 'fade'...
    [[UIApplication sharedApplication] setStatusBarHidden:YES 
                                                    withAnimation:UIStatusBarAnimationFade];
    
    /* An alternative to the command above woudl be to modify the HypnosisterOne-Info.plist file.
     * - Open the file which displays a nice 'form' to add or modify options.
     * - rt:btn in the open space
     * - SELECT: Add Row
     *     A dropdown list will open.  Scroll to the "Status bar is initiall hidden" choice.
     * - SELECT the choice
     * - Set the Boolean value to 'YES'
     *
     *============================================================
     * You can also open the file as source-code and add this tag:
     *    <key>UIStatusBarHidden</key>
     */

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


// A dealloc method that will never get called because
// HypnosisterAppDelegate will exist for the life of the application...
- (void)dealloc
{
    [view release];
    //[_window release];
    [window release];
    [super dealloc];
}

@end
