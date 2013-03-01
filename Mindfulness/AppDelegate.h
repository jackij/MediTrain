//
//  AppDelegate.h
//  Mindfulness
//
//  Created by Shashank Bharadwaj on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
}

@property BOOL previousResponse;
@property float progress;
@property (strong, nonatomic)Data *myData;
@property (strong, nonatomic) UIWindow *window;
@property CFAbsoluteTime lastDropboxConnectionTry;
@property NSInteger time;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
