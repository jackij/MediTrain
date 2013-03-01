//
//  MeditationViewController.m
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MeditationViewController.h"

@implementation MeditationViewController

@synthesize player;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    // Setting up data
    ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    newData = [ad myData];
    // Transition after "timer" seconds 
    [self performSelector:@selector(segue) withObject:nil afterDelay:newData.timer];
     self.navigationItem.hidesBackButton = YES;
}

- (void)segue
{
    //Play Chime
    NSString *path  = [[NSBundle mainBundle] pathForResource : @"Chime" ofType :@"wav"];
    NSURL *fileURL = [NSURL fileURLWithPath : path];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    [player play];
    
    //Seque to next scene
    [self performSegueWithIdentifier: @"finishMeditate" sender: self];
}

- (void)viewDidUnload
{
    //AudioServicesDisposeSystemSoundID(audioEffect);
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

- (void) viewWillAppear:(BOOL)animated
{
    // Hide top navigation bar
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    // Un-hide top navigation bar
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

@end
