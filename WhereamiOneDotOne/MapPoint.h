//
//  MapPoint.h
//  WhereamiOneDotOne
//
//  Created by Kevin Bowe on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface MapPoint : NSObject <MKAnnotation> 
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

- (id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

@end
