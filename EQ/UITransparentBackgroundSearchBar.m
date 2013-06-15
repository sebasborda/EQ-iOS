//
//  UITransparentBackgroundSearchBar.m
//  EQ
//
//  Created by Sebastian Borda on 6/14/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "UITransparentBackgroundSearchBar.h"

@implementation UITransparentBackgroundSearchBar

-(void)didAddSubview:(UIView *)subview {
    if (![subview isKindOfClass:[UITextField class]]) {
        subview.alpha = 0;
    }
}

@end
