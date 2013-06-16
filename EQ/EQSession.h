//
//  EQSession.h
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "Usuario.h"
#import "Vendedor.h"
#import "Usuario.h"

@interface EQSession : NSObject

+ (EQSession *)sharedInstance;

@property (nonatomic, strong) Cliente *activeClient;
@property (nonatomic, strong) Usuario *currentUser;

- (NSDate *)lastSynchronization;
- (void)initializeDataSynchronization;

@end
