//
//  EQLoginViewModel.m
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQLoginViewModel.h"
#import "EQDataLayer.h"
#import "EQNetworkManager.h"
#import "NSString+EQUtils.h"
#import "Usuario.h"

@implementation EQLoginViewModel

- (void)validateUser:(NSString *)userName password:(NSString *)password{
    NSString *hashedPassword = [password MD5Hash];
    Usuario *user = [[[EQDataLayer sharedInstance] fetchObjectsForClass:[Usuario class] withPredicate:[NSPredicate predicateWithFormat:@"self.nombreDeUsuario = %@ && self.password = %@",userName,hashedPassword] sortOrder:nil] lastObject];
    if (user) {
        [self.delegate loginCompleted];
    } else {
        successRequest successBlock = ^(NSArray *JSON){
            [self.delegate loginCompleted];
        };
        
        failRequest failBlock = ^(NSError *error){
            [self.delegate loginFail];
        };
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"listar",@"object":@"login",@"usuario":userName,@"password":hashedPassword}];
        EQRequest *request = [[EQRequest alloc] initWithParameters:params successBlock:successBlock failBlock:failBlock];
        [EQNetworkManager executeRequest:request];
    }
}

@end
