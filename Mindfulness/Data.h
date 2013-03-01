//
//  Data.h
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DropboxSDK/DropboxSDK.h>

@interface Data : NSObject {
    DBRestClient *restClient;
    NSMutableArray *trials;
}

@property (strong, nonatomic) NSDictionary *appData;
@property CFAbsoluteTime startTime;
@property NSInteger timer,initialTrialTime, trialCount, sessionCount, yesIncrement, noDecrement, sessionTime, minTrialTime, numberOfYesBeforeIncreasingMedTime, progress, numberOfSessionInASet, numberOfYes;
@property (strong, nonatomic) NSString *subjectID;

- (NSDictionary*) getPlistData:(NSString*)plist;
- (void) saveDataWithTrialTime:(CFAbsoluteTime)time response:(BOOL)response andLength:(int)length;

-(NSArray*)getGraphDurationData;


-(NSString*)startDate;
-(NSString*)endDate;
@end