//
//  endTrialViewController.h
//  MediTrain
//
//  Created by Jacob Balthazor on 12/13/12.
//
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "barGrapher.h"

@interface endTrialViewController : UIViewController{
    AppDelegate *ad;

}

@property int trialTimeInt;
@property (weak, nonatomic) IBOutlet UITextView *trialTime;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end
