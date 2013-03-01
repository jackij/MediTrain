//
//  InstructionViewController.h
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <DropboxSDK/DropboxSDK.h>
#import "AppDelegate.h"
#import "Data.h"

@interface IntroViewController : UIViewController {
    AppDelegate *ad;
    Data *newData;
}

@property BOOL hasLooped;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end
