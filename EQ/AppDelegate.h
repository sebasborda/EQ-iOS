//
//  AppDelegate.h
//  EQ
//
//  Created by Sebastian Borda on 6/12/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALTabBarController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet ALTabBarController *tabBarController;


- (void)goToTabAtIndex:(int)index;

@end
