//
//  EQBlockUI.h
//  EQ
//
//  Created by Sebastian Borda on 6/16/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EQBlockUI : UIView

- (id)initWithOwnerView:(UIView *)owner;
- (void)block;
- (void)unblock;

@end
