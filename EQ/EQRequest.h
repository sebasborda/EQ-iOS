//
//  EQRequest.h
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//


typedef void (^successRequest)(NSArray *);
typedef void (^failRequest)(NSError *);

@interface EQRequest : NSObject

- (id)initWithParameters:(NSMutableDictionary *)params successBlock:(successRequest)success failBlock:(failRequest)fail;

@property(nonatomic,strong) NSURLRequest *urlRequest;
@property (nonatomic,copy) successRequest successBlock;
@property (nonatomic,copy) failRequest failBlock;

@end
