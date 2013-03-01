//
//  EndViewController.m
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EndViewController.h"
#import "IntroViewController.h"
#import "Data.h"
#import "AppDelegate.h"

@implementation EndViewController
@synthesize trialTime;
@synthesize button;
@synthesize trialTimeInt;
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Hide back button
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    currentProgressView = [[UIProgressView alloc] init];
    
    if (self.view.frame.size.height > 480.f) {
        [currentProgressView setFrame:CGRectMake(309, 777, 190, 9)];
    }
    else {
        [currentProgressView setFrame:CGRectMake(20, 96, 280, 9)];
    }

    [self.view addSubview:currentProgressView];
    
    
    if (ad.myData.progress > ad.myData.numberOfSessionInASet){
        ad.myData.progress = 0;
    }
    ad.progress = ad.myData.progress++;
    currentProgressView.progress = ( (double) (ad.myData.progress) ) / ( (double) (ad.myData.numberOfSessionInASet) ) ;
    
    NSLog(@"%f",currentProgressView.progress);
    if (currentProgressView.progress >= 1.f) {
        NSLog(@"Done");
        [finishButton setHidden:NO];
        [finishedLabel setHidden:NO];
    }
    else{
        [finishButton setHidden:YES];
        [finishedLabel setHidden:YES];
    }
    if (currentProgressView.progress <= 0.f) {
        currentProgressView.progress = .01;
    }
    
    //Custom Button
    UIImage *buttonImage = [[UIImage imageNamed:@"blackButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"blackButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    [finishButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [finishButton setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    
    trialTime.delegate = self;
    [trialTime setText:[NSString stringWithFormat:@"%d seconds", trialTimeInt]];
    
     self.navigationItem.hidesBackButton = YES;
    
    [graph graphData:[ad.myData getGraphDurationData]];
    [startDateLabel setText:[ad.myData startDate ]];
    [endDateLabel setText:[ad.myData endDate]];
    [graph setNeedsDisplay];
    
    //Play Chime
    NSString *path  = [[NSBundle mainBundle] pathForResource : @"bell4" ofType :@"wav"];
    NSURL *fileURL = [NSURL fileURLWithPath : path];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    [player setDelegate:self];
    [player play];
}


- (void)viewDidUnload
{
    [self setButton:nil];
    [self setTrialTime:nil];
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
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"NewSession"])
    {
        IntroViewController *vc = [segue destinationViewController];
        vc.hasLooped = true;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    return YES;
}

-(IBAction)quit:(id)sender{
    exit(0);
}

@end
