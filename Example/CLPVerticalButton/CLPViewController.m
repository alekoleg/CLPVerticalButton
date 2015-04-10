//
//  CLPViewController.m
//  CLPVerticalButton
//
//  Created by Alekseenko Oleg on 04/10/2015.
//  Copyright (c) 2014 Alekseenko Oleg. All rights reserved.
//

#import "CLPViewController.h"
#import <CLPVerticalButton.h>

@interface CLPViewController ()

@end

@implementation CLPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLPVerticalButton * button = [[CLPVerticalButton alloc] init];
    button.verticalMode = YES;
    button.frame = ({
        CGRect frame = button.frame;
        frame.size = CGSizeMake(100, 200);
        frame.origin.y = (self.view.frame.size.height - frame.size.height) / 2;
        frame.origin.x = (self.view.frame.size.width - frame.size.width) / 2;
        frame;
    });
    
    [button setTitle:@"Upload Image" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"addCircle"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
