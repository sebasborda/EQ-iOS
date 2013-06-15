//
//  EQLoginViewController.m
//  EQ
//
//  Created by Sebastian Borda on 6/12/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQLoginViewController.h"
#import "EQMainScreenViewController.h"

@interface EQLoginViewController ()

@property (nonatomic,strong) EQLoginViewModel *viewModel;

@end

@implementation EQLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.viewModel = [EQLoginViewModel new];
        self.viewModel.delegate = self;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.viewModel = [EQLoginViewModel new];
        self.viewModel.delegate = self;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonAction:(id)sender {
    [self.viewModel validateUser:self.userNameTextField.text password:self.passwordTextField.text];
}

- (void)loginCompleted{
    [self.navigationController pushViewController:[EQMainScreenViewController new] animated:YES];
}

- (void)loginFail{
    
}

@end
