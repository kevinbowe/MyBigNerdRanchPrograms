//
//  HypnosisterOneAppDelegate.h
//  HypnosisterOne
//
//  Created by Kevin Bowe on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;

@interface HypnosisterOneAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;
    HypnosisView *view;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
