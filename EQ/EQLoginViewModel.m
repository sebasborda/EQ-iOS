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
#import "EQSession.h"
#import "Usuario.h"

@implementation EQLoginViewModel

- (void)validateUser:(NSString *)userName password:(NSString *)password{
    NSString *hashedPassword = [password MD5Hash];
    EQDataLayer *dl = [EQDataLayer sharedInstance];
    Usuario *user = [[dl fetchObjectsForClass:[Usuario class] withPredicate:[NSPredicate predicateWithFormat:@"self.nombreDeUsuario = %@ && self.password = %@",userName,hashedPassword] sortOrder:nil] lastObject];
    if (user) {
        [self.delegate loginCompleted];
    } else {
        successRequest successBlock = ^(NSArray *JSON){
            NSMutableArray *users = [NSMutableArray array];
            for (NSDictionary *dictionary in JSON) {
                NSNumber *sellerId = dictionary[@"vendedor_id"];
                NSNumber *userID = [NSNumber numberWithInt:[sellerId intValue] + 31 ];
                Usuario *user = (Usuario *)[dl createOrFetchObjectForClass:[Usuario class] WithID:userID];
                user.identifier = userID;
                user.nombre = dictionary[@"display_name"];
                user.nombreDeUsuario = dictionary[@"username"];
                user.password = dictionary[@"hashed_password"];
                user.vendedor = (Vendedor *)[dl fetchObjectForClass:[Vendedor class] WithID:sellerId];
                [users addObject:user];
                
                if ([user.password isEqualToString:hashedPassword] && [user.nombreDeUsuario isEqualToString:userName]) {
                    [EQSession sharedInstance].currentUser = user;
                }
            }
            if ([EQSession sharedInstance].currentUser) {
                [dl saveContext];
                [[EQSession sharedInstance] initializeDataSynchronization];
                [self.delegate loginCompleted];
            } else {
                [self.delegate loginFail];
            }
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
