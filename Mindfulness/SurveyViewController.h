//
//  SurveyViewController.h
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Data.h"

@interface SurveyViewController : UIViewController {
    AppDelegate *ad;
    Data *newData;
    int trialTime;
}
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UIButton *noButton;

- (BOOL) timeHasElapsed;
- (IBAction)pressedNo:(id)sender;
- (IBAction)pressedYes:(id)sender;
@end
