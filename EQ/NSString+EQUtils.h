//
//  NSString+EQUtils.h
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EQUtils)

+ (NSString *)MD5Hash:(NSString *)input;
- (NSString *)MD5Hash;

@end
