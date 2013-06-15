//
//  EQSession.h
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "Vendedor.h"
#import "Usuario.h"

@interface EQSession : NSObject

@property (nonatomic, strong) Vendedor *currentSeller;
@property (nonatomic, strong) Cliente *activeClient;

@end
