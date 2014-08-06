//
//  VCWTranslateSuperViewController.m
//  VCWProject
//
//  Created by 王明权 on 8/6/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import "VCWTranslateSuperViewController.h"
#import "VCWTranslationViewController.h"
#import "Utils.h"

@interface VCWTranslateSuperViewController ()

@end

@implementation VCWTranslateSuperViewController

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
    self.view.backgroundColor = [UIColor blueColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [Utils createDefaultButtonWithView:self.view AndSelectorBlock:^(UIButton *btn) {
        [self showTranslationViewController];
    }];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showTranslationViewController
{
    VCWTranslationViewController *translationViewController = [[VCWTranslationViewController alloc] init];
    translationViewController.view.backgroundColor = [UIColor redColor];
    translationViewController.modalPresentationStyle = UIModalPresentationNone;
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self presentViewController:translationViewController animated:NO completion:^{}];
//    [self.navigationController pushViewController:translationViewController animated:NO];
    [UIView animateWithDuration:0.3 animations:^{
        [self showTranslationPosition:translationViewController];
    }];
}

- (void)showTranslationPosition:(VCWTranslationViewController *)translationViewController
{
    translationViewController.view.frame = CGRectMake(0, -self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    translationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.view.transform = [self getTransform:translationViewController.view.frame.size.height];
}

- (CGAffineTransform)getTransform:(float)translatePosition
{
    //    float percentage = translatePosition / self.view.frame.size.height;
    //    float finalScale = 1 - (1 - percentage)*0.4;
    
    CGAffineTransform transformScale = CGAffineTransformMakeScale(0.6, 0.6);
    CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0, 100);
    CGAffineTransform transform = CGAffineTransformConcat(transformScale, transformTranslate);
    return transform;
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
