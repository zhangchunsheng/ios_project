//
//  RootViewController.m
//  SlideSwitchDemo
//
//  Created by liulian on 13-4-23.
//  Copyright (c) 2013年 liulian. All rights reserved.
//

#import "RootViewController.h"
#import "TopScrollView.h"
#import "RootScrollView.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
	// Do any additional setup after loading the view.
    UIImageView *setButtonShadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(258, 0, 22, 44)];
    setButtonShadowImageView.image = [UIImage imageNamed:@"top_channelbutton_shadow.png"];
    setButtonShadowImageView.userInteractionEnabled = YES;
    [self.view addSubview:setButtonShadowImageView];
    [setButtonShadowImageView release];
    
    UIImageView *topShadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44, 320, 5)];
    [topShadowImageView setImage:[UIImage imageNamed:@"top_background_shadow.png"]];
    [self.view addSubview:topShadowImageView];
    [topShadowImageView release];
    
    [self.view addSubview:[TopScrollView shareInstance]];
    [self.view addSubview:[RootScrollView shareInstance]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
