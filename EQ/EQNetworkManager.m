//
//  EQNetworkManager.m
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQNetworkManager.h"
#import "AFNetworking/AFNetworking.h"

@implementation EQNetworkManager

+ (void)executeRequest:(EQRequest *)request{
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request.urlRequest success:^(NSURLRequest *urlRequest, NSHTTPURLResponse *response, id JSON) {
        request.successBlock(JSON);
    } failure:^(NSURLRequest *urlRequest, NSHTTPURLResponse *response, NSError *error, id JSON){
        request.failBlock(error);
    }];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithArray:@[@"text/html"]]];
    [operation start];
}

@end
