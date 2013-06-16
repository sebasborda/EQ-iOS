//
//  EQBlockUI.m
//  EQ
//
//  Created by Sebastian Borda on 6/16/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQBlockUI.h"

@interface EQBlockUI()

@property(nonatomic,strong) UIActivityIndicatorView *spinner;
@property(nonatomic,weak) UIView *ownerView;
@end

@implementation EQBlockUI

- (id)initWithOwnerView:(UIView *)owner
{
    self = [super initWithFrame:owner.frame];
    if (self) {
        self.ownerView = owner;
        self.backgroundColor = [UIColor grayColor];
        self.alpha = .5;
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        self.spinner.center = owner.center;
        self.spinner.hidesWhenStopped = YES;
        [self addSubview:self.spinner];
        
    }
    return self;
}

- (void)block{
    [self.spinner startAnimating];
    [self.ownerView addSubview:self];
}

- (void)unblock{
    [self.spinner stopAnimating];
    [self removeFromSuperview];
}

@end
