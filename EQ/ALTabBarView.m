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

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

//Let the delegate know that a tab has been touched
-(IBAction) touchButton:(id)sender {

    if( delegate != nil && [delegate respondsToSelector:@selector(tabWasSelected:)]) {
        
        if (selectedButton) {
            [selectedButton setBackgroundImage:[UIImage imageNamed:@"Button.png"] forState:UIControlStateNormal];
        }
        
        selectedButton = ((UIButton *)sender);
        [selectedButton setBackgroundImage:[UIImage imageNamed:@"Button_crystal.png"] forState:UIControlStateNormal];
        [delegate tabWasSelected:selectedButton.tag];
    }
}

@end
