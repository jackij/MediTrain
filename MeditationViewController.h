//
//  MeditationViewController.h
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Data.h"
#import "AppDelegate.h"

@interface MeditationViewController : UIViewController{
    AppDelegate *ad;
    Data *newData;
}

@property (nonatomic, retain) AVAudioPlayer *player;

- (void)segue;

@end
