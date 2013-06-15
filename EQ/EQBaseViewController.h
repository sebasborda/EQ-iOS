//
//  EQBaseViewController.h
//  EQ
//
//  Created by Sebastian Borda on 6/12/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EQBaseViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *sellerLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *syncDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *activeClientLabel;
@property (strong, nonatomic) IBOutlet UIButton *pendingOrdersButton;
@property (strong, nonatomic) IBOutlet UIButton *notificationsButton;
@property (strong, nonatomic) IBOutlet UIButton *goalsButton;

- (IBAction)goalsButtonAction:(id)sender;
- (IBAction)notificationsButtonAction:(id)sender;
- (IBAction)pendingOrdersButtonAction:(id)sender;
- (IBAction)logOutButtonAction:(id)sender;
- (void)notImplemented;
@end
