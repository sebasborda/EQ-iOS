//
//  EQBaseViewController.m
//  EQ
//
//  Created by Sebastian Borda on 6/12/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQBaseViewController.h"

@interface EQBaseViewController ()

@end

@implementation EQBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (IBAction)pendingOrdersButtonAction:(id)sender {
    //TODO: implement
    [self notImplemented];
}

- (IBAction)logOutButtonAction:(id)sender {
    //TODO: complete method
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)goalsButtonAction:(id)sender {
    //TODO: implement
    [self notImplemented];
}

- (IBAction)notificationsButtonAction:(id)sender {
    //TODO: implement
    [self notImplemented];
}

- (void)notImplemented{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"No implementado" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
