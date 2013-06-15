//
//  EQMainScreenViewController.m
//  EQ
//
//  Created by Sebastian Borda on 6/12/13.
//  Copyright (c) 2013 EQ. All rights reserved.
//

#import "EQMainScreenViewController.h"
#import "AppDelegate.h"

@interface EQMainScreenViewController ()

@end

@implementation EQMainScreenViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clientsList:(id)sender {
    
}

- (IBAction)clientListButtonAction:(id)sender {
    
}

- (IBAction)createClientButtonAction:(id)sender {
    
}

- (IBAction)sectionButtonAction:(id)sender {
    UIButton *button = (UIButton *)sender;
    [((AppDelegate *)[[UIApplication sharedApplication] delegate]) goToTabAtIndex:[button tag]];
}

@end
