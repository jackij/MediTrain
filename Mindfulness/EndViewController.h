//
//  EndViewController.h
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "barGrapher.h"
#import <AVFoundation/AVFoundation.h>


@interface EndViewController : UIViewController <UITextViewDelegate,AVAudioPlayerDelegate>{
    AppDelegate *ad;
    IBOutlet UIButton *finishButton;
    IBOutlet UILabel *finishedLabel;
    IBOutlet UIProgressView *currentProgressView;
    IBOutlet barGrapher *graph;
    
    IBOutlet UILabel *startDateLabel;
    IBOutlet UILabel *endDateLabel;
    
}
@property int trialTimeInt;
@property (weak, nonatomic) IBOutlet UITextView *trialTime;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, retain) AVAudioPlayer *player;
-(IBAction)quit:(id)sender;

@end
