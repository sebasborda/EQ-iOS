//
//  EQLoginViewModel.h
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

@protocol EQLoginViewModelDelegate;

@interface EQLoginViewModel : NSObject

@property (nonatomic,weak) id<EQLoginViewModelDelegate> delegate;

- (void)validateUser:(NSString *)userName password:(NSString *)password;

@end

@protocol EQLoginViewModelDelegate <NSObject>

- (void)loginCompleted;
- (void)loginFail;

@end