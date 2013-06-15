//
//  ALTabBarView.m
//  ALCommon
//
//  Created by Andrew Little on 10-08-17.
//  Copyright (c) 2010 Little Apps - www.myroles.ca. All rights reserved.
//

#import "ALTabBarView.h"


@implementation ALTabBarView

@synthesize delegate;
@synthesize selectedButton;

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        CGRect frame = self.frame;
        frame.origin.y = 965;
        self.frame = frame;
    }
    return self;
}

//Let the delegate know that a tab has been touched
-(IBAction) touchButton:(id)sender {
    if( delegate != nil && [delegate respondsToSelector:@selector(tabWasSelected:)]) {
        for (UIButton *tab in self.tabButtons) {
            tab.selected = NO;
        }
        selectedButton = sender;
        selectedButton.selected = YES;
        [delegate tabWasSelected:selectedButton.tag];
    }
}

@end
