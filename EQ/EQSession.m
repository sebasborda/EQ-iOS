//
//  EQSession.m
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQSession.h"
#import "EQDataManager.h"
#import "AppDelegate.h"

@interface EQSession()

@property (nonatomic,strong) NSTimer* timer;

@end

@implementation EQSession

+ (EQSession *)sharedInstance{
    static EQSession *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EQSession alloc] init];
    });
    
    return sharedInstance;
}

- (void)initializeDataSynchronization{
    self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:600] interval:600 target:self selector:@selector(updateData) userInfo:nil repeats:YES];
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:self.timer forMode: NSDefaultRunLoopMode];
    [self updateData];
}

- (void)updateData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSDate date] forKey:@"lastSynchronization"];
    [userDefaults synchronize];
    
    [((AppDelegate *)[[UIApplication sharedApplication] delegate]) lockUI];
    EQDataManager *dm = [EQDataManager new];
    [dm updateData];
}

- (NSDate *)lastSynchronization{
    return[[NSUserDefaults standardUserDefaults] objectForKey:@"lastSynchronization"];
}

- (void)close{
    self.currentUser = nil;
    self.activeClient = nil;
    [self.timer invalidate];
}

@end
