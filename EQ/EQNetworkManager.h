//
//  EQNetworkManager.h
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQRequest.h"

@interface EQNetworkManager : NSObject

+ (void)executeRequest:(EQRequest *)request;

@end
