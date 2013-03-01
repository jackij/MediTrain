//
//  FirstTimeUser.m
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstTimeUser.h"
#import "IntroViewController.h"

@interface FirstTimeUser ()

@end

@implementation FirstTimeUser
@synthesize button;
@synthesize subjectIDTextField, minTrialTimeTextField, initalMedTimeTextField, yesIncrementTextField, noDecrementTextField, numberOfYesBeforeIncreasingMedTimeTextField, numberOfSessionInASetTextField, sessionTimeTextField;
@synthesize DropboxButton;

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [closeButton setHidden:NO];
}


-(IBAction)keyboardDown:(id)sender{
    [noDecrementTextField resignFirstResponder];
    [yesIncrementTextField resignFirstResponder];
    [subjectIDTextField resignFirstResponder];
    [sessionTimeTextField resignFirstResponder];
    [numberOfSessionInASetTextField resignFirstResponder];
    [numberOfYesBeforeIncreasingMedTimeTextField resignFirstResponder];
    [initalMedTimeTextField resignFirstResponder];
    [minTrialTimeTextField resignFirstResponder];
    [closeButton setHidden:YES];
}

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
    [self.navigationController setNavigationBarHidden:YES];
    //Custom Button
    UIImage *buttonImage = [[UIImage imageNamed:@"blackButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"blackButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    
    //Dropbox Button
    UIImage *DropboxButtonImage = [[UIImage imageNamed:@"blueButton.png"]
                                   resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    UIImage *DropboxButtonImageHighlight = [[UIImage imageNamed:@"blueButtonHighlight.png"]
                                            resizableImageWithCapInsets:UIEdgeInsetsMake(4, 18, 32, 18)];
    [DropboxButton setBackgroundImage:DropboxButtonImage forState:UIControlStateNormal];
    [DropboxButton setBackgroundImage:DropboxButtonImageHighlight forState:UIControlStateHighlighted];
    
    //Load data
    ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    newData = [ad myData];
    }


- (void)viewDidUnload
{
    [self setSubjectIDTextField:nil];
    [self setButton:nil];
    [super viewDidUnload];
    [self setDropboxButton:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Portrait and upside down portrait orientations supported
	return (interfaceOrientation == UIInterfaceOrientationPortrait ||
            interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonPressed:(id)sender {
    
    NSString *message = @"Please enter your ";
    
    //if dropbox is connected
    if ([[DBSession sharedSession] isLinked]) {
    
        //If user's name is left empty
        if ([subjectIDTextField.text length] == 0 ) {
            message = [message stringByAppendingString:@"first and last name"];
        }
        if (message.length > 18) {
            message = [message stringByAppendingString:@" in the space provided"];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: @"SubjectID left blank"
                                  message: message
                                  delegate: nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
            return;
        }
    } else {
        
        //If user's name is left empty
        if ([subjectIDTextField.text length] == 0) {
            message = [message stringByAppendingString:@"first and last name"];
        } 
        if (message.length > 18) {
            message = [message stringByAppendingString:@" in the space provided and sign in to Dropbox"];
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: @"SubjectID and Dropbox Error"
                                  message: message
                                  delegate: nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];
            return;
        }
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Dropbox connection required"
                              message: @"Dropbox connection is needed to send results to the lab. Your results will be stored on the iPad until you connect. Do you want to continue without connecting?"
                              delegate: self
                              cancelButtonTitle:@"Yes"
                              otherButtonTitles:@"Try Again", nil];
        [alert show];
        return;
    }

    [self storeData];
    
    //Seque back to instruction Screen
    [self performSegueWithIdentifier: @"FinishedFirstTimeSetup" sender: self];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		//user pressed Yes
        [self storeData];
        //Seque back to instruction Screen
        [self performSegueWithIdentifier: @"FinishedFirstTimeSetup" sender: self];
	}
	else {
		//user pressed Try Again
        [self didPressLink:NULL];
	}
}

- (void) storeData {
    //Check inputs
    /* if (r1.location != NSNotFound || r2.location != NSNotFound) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Required Field Error"
                              message: @"Please input values for all of the fields."
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
     */
     
    //Set name in data
    ad.myData.subjectID = subjectIDTextField.text;
    ad.myData.minTrialTime = [[minTrialTimeTextField text] intValue];
    ad.myData.yesIncrement = [[yesIncrementTextField text] intValue];
    ad.myData.noDecrement = [[noDecrementTextField text] intValue];
    ad.myData.sessionTime = [[sessionTimeTextField text] intValue];
    ad.myData.numberOfSessionInASet = [[numberOfSessionInASetTextField text] intValue];
    ad.myData.numberOfYesBeforeIncreasingMedTime = [[numberOfYesBeforeIncreasingMedTimeTextField text] intValue];
    ad.myData.timer = [[initalMedTimeTextField text] intValue];
    
    ad.myData.progress = 0;
    ad.myData.sessionCount = 0;
    ad.myData.trialCount = 0;

    NSLog(@"%@",ad.myData.subjectID);
    NSLog(@"%d",ad.myData.yesIncrement);
    NSLog(@"%d",ad.myData.noDecrement);
    NSLog(@"%d",ad.myData.sessionTime);
    NSLog(@"%d",ad.myData.numberOfSessionInASet);
    NSLog(@"%d",ad.myData.numberOfYesBeforeIncreasingMedTime);
}

- (IBAction)didPressLink:(id)sender {
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
        ad.lastDropboxConnectionTry = CFAbsoluteTimeGetCurrent();
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Dropbox Sync"
                              message: @"You are already connected to Dropbox"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    // Hide back button
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [super viewWillAppear:animated];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"FinishedFirstTimeSetup"])
    {
        IntroViewController *vc = [segue destinationViewController];
        //Hide back button of the main window
        [vc.navigationItem setHidesBackButton:YES animated:YES];
    }
}

@end
