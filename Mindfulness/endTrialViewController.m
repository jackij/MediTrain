//
//  endTrialViewController.m
//  MediTrain
//
//  Created by Jacob Balthazor on 12/13/12.
//
//

#import "endTrialViewController.h"

@interface endTrialViewController ()

@end

@implementation endTrialViewController

@synthesize button,trialTime,trialTimeInt;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    
    //Custom Button
    UIImage *buttonImage = [[UIImage imageNamed:@"blackButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"blackButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    
    [trialTime setText:[NSString stringWithFormat:@"%d seconds", trialTimeInt]];
    
    self.navigationItem.hidesBackButton = YES;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
