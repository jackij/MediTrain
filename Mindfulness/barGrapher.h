//
//  barGrapher.h
//  MediTrain
//
//  Created by Jacob Balthazor on 12/18/12.
//
//

#import <UIKit/UIKit.h>

@interface barGrapher : UIView{
    NSArray *data;
    NSArray *bars;
    
    UILabel *maxTimeLabel;
    UILabel *minTImeLabel;
    
}

@property (nonatomic,retain) NSString *startDate;
@property (nonatomic,retain) NSString *endDate;

-(void)graphData:(NSArray*)d;
-(int)max;
-(int)min;

@end
