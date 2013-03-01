//
//  InstructionViewController.m
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IntroViewController.h"
#import "Data.h"
#import "AppDelegate.h"

@implementation IntroViewController
@synthesize button;
@synthesize hasLooped;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        hasLooped = false;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Custom Button
    UIImage *buttonImage = [[UIImage imageNamed:@"blackButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"blackButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    
    //Load data
    ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    newData = [ad myData];
    
    if (newData.subjectID.length == 0) {
        //Seque to FirstTimeUser Screen
        [self performSegueWithIdentifier: @"FirstTimeUser" sender: self];
    }
     self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidUnload
{
    [self setButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Portrait and upside down portrait orientations supported
	return (interfaceOrientation == UIInterfaceOrientationPortrait ||
            interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"startMeditate"])
    {
        newData.startTime = CFAbsoluteTimeGetCurrent();
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    if (hasLooped) {
        // Hide back button
        [self.navigationItem setHidesBackButton:YES animated:YES];
    }
    [super viewWillAppear:animated];
}

@end
