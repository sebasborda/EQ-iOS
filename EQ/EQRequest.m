//
//  EQRequest.m
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQRequest.h"
#import "AFHTTPClient.h"

#define BASE_URL @"http://eq.gm2dev.com/wp-admin/admin-ajax.php"

@implementation EQRequest

- (id)initWithParameters:(NSMutableDictionary *)params successBlock:(successRequest)success failBlock:(failRequest)fail{
    self = [super init];
    if (self) {
        [self buildURLRequestWithParams:params];
        if (success) {
            self.successBlock = success;
        } else {
            __weak EQRequest *weakSelf = self;
            self.successBlock = ^(NSArray *json){
                NSLog(@"url:%@  json:%@",weakSelf.urlRequest.URL.absoluteURL,json);
            };
        }
        
        if (fail) {
            self.failBlock = fail;
        } else {
            __weak EQRequest *weakSelf = self;
            self.failBlock = ^(NSError *error){
                NSLog(@"url:%@  error:%@",weakSelf.urlRequest.URL.absoluteURL,[error localizedDescription]);
            };
        }
    }
    
    return self;
}

- (void)buildURLRequestWithParams:(NSMutableDictionary *)params{
    NSMutableString *queryString = [NSMutableString stringWithFormat:@"%@?action=%@&object=%@",BASE_URL,params[@"action"],params[@"object"]];
    BOOL post = [params[@"POST"] boolValue];
    
    [params removeObjectForKey:@"object"];
    [params removeObjectForKey:@"action"];
    
    if (post) {
        [params removeObjectForKey:@"POST"];
        AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:queryString]];
        self.urlRequest = [httpClient requestWithMethod:@"POST" path:@"" parameters:params];
    } else {
        for (NSString *key in params.allKeys) {
            [queryString appendFormat:@"&%@=%@",key,params[key]];
        }
        self.urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:queryString]];
    }
}

@end
