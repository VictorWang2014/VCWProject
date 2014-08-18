//
//  VCWHitEventTransferViewController.m
//  VCWProject
//
//  Created by wangmingquan on 18/8/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import "VCWHitEventTransferViewController.h"
#import "Utils.h"

@implementation CustomScrollView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    [super pointInside:point withEvent:event];

    if (point.x > 120 && point.x < 200) {
        NSLog(@"scrollview will be response");
        return YES;
    }
    if (CGRectContainsPoint(self.bounds, point)) {
        NSLog(@"scrollview will be response");
        return YES;
    }
    return NO;
}

@end

@interface VCWHitEventTransferViewController ()

@end

@implementation VCWHitEventTransferViewController

@synthesize scrollView;
@synthesize insideButton;
@synthesize outsideButton;

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
    [insideButton bindButtonClickCallBack:^(UIButton *btn) {
        NSLog(@"insideButton has click");
    }];
    [outsideButton bindButtonClickCallBack:^(UIButton *btn) {
        NSLog(@"outsideButton has click");
    }];
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
