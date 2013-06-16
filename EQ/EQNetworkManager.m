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
        int errorCode = [JSON[@"error"] intValue];
        if (errorCode > 0) {
            NSError *error = [NSError errorWithDomain:@"EQServer" code:errorCode userInfo:@{@"errorMessage":JSON[@"message"]}];
            request.failBlock(error);
        } else {
            NSArray *jsonData = JSON[@"data"];
            request.successBlock(jsonData);
        }
        
    } failure:^(NSURLRequest *urlRequest, NSHTTPURLResponse *response, NSError *error, id JSON){
        request.failBlock(error);
    }];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithArray:@[@"text/html"]]];
    [operation start];
}

@end
