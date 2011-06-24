//
//  HypnosisView.m
//  HypnosisterOne
//
//  Created by Kevin Bowe on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // What rectangle am I filling?...
    CGRect bounds = [self bounds];
    
    // Where is its center?...
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    // From the center, how far out to the corner?...
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Get the context being drawn upon...
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // All lines will be drawn 10 points wide...
    CGContextSetLineWidth(context, 10);
    
    // Set the stroke color to light gray...
    [[UIColor lightGrayColor] setStroke];
    
    // Draw concentric circles from the outside in...
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
        
    } // END_FOR
}


- (void)dealloc
{
    [super dealloc];
}

@end
