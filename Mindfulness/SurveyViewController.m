//
//  SurveyViewController.m
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SurveyViewController.h"
#import "EndViewController.h"

@implementation SurveyViewController
@synthesize yesButton;
@synthesize noButton;


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

//Consolidate into one method
- (IBAction)pressedNo:(id)sender {
    //Load data
    ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    newData = [ad myData];
    int initialTime = newData.timer;
    
    newData.numberOfYes = 0;
    //Reduce meditation time
    if (initialTime - newData.noDecrement > newData.minTrialTime)
        newData.timer = initialTime - newData.noDecrement;
    else
        newData.timer = newData.minTrialTime;
    
    //Increment trial count
    newData.trialCount++;
    
    //Save data
    [newData saveDataWithTrialTime: CFAbsoluteTimeGetCurrent() response:NO andLength: initialTime];
    //End session if session time has elapsed
    if ([self timeHasElapsed]) {
        [self performSegueWithIdentifier: @"End" sender: self];
    } else {
        [self performSegueWithIdentifier: @"endSurveyWithNo" sender: self];
    }
}

- (IBAction)pressedYes:(id)sender {
    
    int initialTime = newData.timer;
    
    if (newData.numberOfYes >= newData.numberOfYesBeforeIncreasingMedTime){
        //Increase meditation time
        newData.timer = initialTime + newData.yesIncrement;
        newData.numberOfYes = 0;
    } else{
        newData.numberOfYes++;
    }

    //Increment trial count
    newData.trialCount++;
           
    //Save data
    [newData saveDataWithTrialTime: CFAbsoluteTimeGetCurrent() response:YES andLength: initialTime];
    
    if ([self timeHasElapsed]) {
        [self performSegueWithIdentifier: @"End" sender: self];
    } else {
        [self performSegueWithIdentifier: @"endSurveyWithYes" sender: self];
    }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //Load data
    ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    newData = [ad myData];
    trialTime = newData.timer;
    //Hide back button
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    //Custom Button
    UIImage *yesButtonImage = [[UIImage imageNamed:@"blackButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    UIImage *yesButtonImageHighlight = [[UIImage imageNamed:@"blackButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    UIImage *noButtonImage = [[UIImage imageNamed:@"blackButton.png"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    UIImage *noButtonImageHighlight = [[UIImage imageNamed:@"blackButtonHighlight.png"]
                                        resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    [yesButton setBackgroundImage:yesButtonImage forState:UIControlStateNormal];
    [yesButton setBackgroundImage:yesButtonImageHighlight forState:UIControlStateHighlighted];
    [noButton setBackgroundImage:noButtonImage forState:UIControlStateNormal];
    [noButton setBackgroundImage:noButtonImageHighlight forState:UIControlStateHighlighted];
    
    [super viewDidLoad];
     self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidUnload
{
    [self setYesButton:nil];
    [self setNoButton:nil];
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
    
        EndViewController *vc = [segue destinationViewController];
        vc.trialTimeInt = trialTime;
}

- (BOOL) timeHasElapsed 
{
    CFAbsoluteTime startTime = newData.startTime;
    CFAbsoluteTime currentTime = CFAbsoluteTimeGetCurrent();
    double elapsedTime = currentTime - startTime;
    if (elapsedTime > newData.sessionTime) {
        ad.myData.sessionCount++;
        return true;   
    }
    return false;
}

@end
