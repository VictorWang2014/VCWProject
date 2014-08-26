//
//  VCWWindowTestViewController.m
//  VCWProject
//
//  Created by 王明权 on 8/18/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import "VCWWindowTestViewController.h"

@interface VCWWindowTestViewController ()

@end

@implementation VCWWindowTestViewController

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
    UIWindow *_window = [[UIWindow alloc] initWithFrame:CGRectMake(40, 40, 0, 200)];
    [_window setBackgroundColor:[UIColor blueColor]];
    _window.windowLevel = UIWindowLevelStatusBar;
    [_window makeKeyAndVisible];

    
    [super viewDidLoad];
    UITextField *_textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 130)];
    _textField.placeholder = @"some words";
    [self.view addSubview:_textField];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
