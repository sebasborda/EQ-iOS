//
//  AppDelegate.h
//  EQ
//
//  Created by yo on 6/5/13.
//  Copyright (c) 2013 Sebastian Borda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALTabBarController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (strong, nonatomic) IBOutlet ALTabBarController *tabBarController;

@end
