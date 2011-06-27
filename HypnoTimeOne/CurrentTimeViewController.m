//
//  CurrentTimeViewController.m
//  HypnoTimeOne
//
//  Created by Kevin Bowe on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrentTimeViewController.h"


@implementation CurrentTimeViewController

- (id) init
{
    // Call the superclass's designated initializer...
    [super initWithNibName:nil bundle:nil];
    
    // Get the tab bar item...
    UITabBarItem *tbi = [self tabBarItem];
    
    // Give it a label...
    [tbi setTitle:@"Time"];
    
    /*
     Add Code to display the Hypnosis Icon 
     */
    
    UIImage *i = [UIImage imageNamed:@"Time.png"];
    [tbi setImage:i];
    
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Disregard parameters - implememtation detail...
    return [self init];
    
    /*  This code was created by xCode...
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    */ // xCode Generated...
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // Set background color of the view so we ca see it...
    [[self view] setBackgroundColor:[UIColor greenColor]];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
