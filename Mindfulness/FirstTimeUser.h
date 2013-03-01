//
//  FirstTimeUser.h
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DropboxSDK/DropboxSDK.h>
#import "AppDelegate.h"
#import "Data.h"

@interface FirstTimeUser : UIViewController <UIAlertViewDelegate, UITextFieldDelegate> {
    AppDelegate *ad;
    Data *newData;
    IBOutlet UIButton *closeButton;
}


@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *subjectIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *minTrialTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *initalMedTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *sessionTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *yesIncrementTextField;
@property (weak, nonatomic) IBOutlet UITextField *noDecrementTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfYesBeforeIncreasingMedTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfSessionInASetTextField;
@property (weak, nonatomic) IBOutlet UIButton *DropboxButton;
- (IBAction)buttonPressed:(id)sender;
- (IBAction)didPressLink:(id)sender;
-(IBAction)keyboardDown:(id)sender;
- (void) storeData;

@end
