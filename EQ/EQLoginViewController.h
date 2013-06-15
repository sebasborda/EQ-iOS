//
//  EQLoginViewController.h
//  EQ
//
//  Created by Sebastian Borda on 6/12/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQLoginViewModel.h"

@interface EQLoginViewController : UIViewController<EQLoginViewModelDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonAction:(id)sender;

@end
