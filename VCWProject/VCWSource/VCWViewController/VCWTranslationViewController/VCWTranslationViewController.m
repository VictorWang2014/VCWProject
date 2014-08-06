//
//  VCWTranslationViewController.m
//  ViewControllerTranslation
//
//  Created by 王明权 on 8/4/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import "VCWTranslationViewController.h"
#import "VCWViewController.h"
#import "Utils.h"

@interface VCWTranslationViewController ()

@end

@implementation VCWTranslationViewController

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
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panTransitionView:)];
    [self.view addGestureRecognizer:pan];
}

- (void)panTransitionView:(UIPanGestureRecognizer *)gesture
{
    CGPoint translate = [gesture translationInView:self.view];
    CGPoint velocity = [gesture velocityInView:self.view];
    [Utils logCGPointValue:velocity];
    if (gesture.state == UIGestureRecognizerStateChanged)
    {
//        [self translateSelfView:translate];
        [self translateSelfView:translate WithTranslateState:VCWTranslateStateTranslating];
//        [self translateSuperView:translate];
        [self translateSuperView:translate WithTranslateState:VCWTranslateStateTranslating];
    }
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        if (-velocity.y > 100)
        {
            NSLog(@"back");
            [self dismissSelfView];
        }else
        {
            NSLog(@"reverse");
            [self cancelAnimation];
        }
    }
}

- (void)dismissSelfView
{
    [UIView animateWithDuration:0.3 animations:^{
        // superview
//        CGAffineTransform transformScale = CGAffineTransformMakeScale(1, 1);
//        CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0, 0);
//        self.presentingViewController.view.transform = CGAffineTransformConcat(transformTranslate, transformScale);
        [self translateSuperView:CGPointZero WithTranslateState:VCWTranslateStateTranslateToSuccess];
        // self.view
//        self.view.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height);
        [self translateSelfView:CGPointZero WithTranslateState:VCWTranslateStateTranslateToSuccess];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)cancelAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        // superview
//        CGAffineTransform transformScale = CGAffineTransformMakeScale(0.6, 0.6);
//        CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0, -100);
//        self.presentingViewController.view.transform = CGAffineTransformConcat(transformTranslate, transformScale);
        [self translateSuperView:CGPointZero WithTranslateState:VCWTranslateStateTranslateTofailure];
        // self.view
//        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
        [self translateSelfView:CGPointZero WithTranslateState:VCWTranslateStateTranslateTofailure];
    }];
}

- (void)translateSelfView:(CGPoint)translate WithTranslateState:(VCWTranslateState)translateState
{
    if (translateState == VCWTranslateStateTranslating)
    {
        CGAffineTransform transform = CGAffineTransformMakeTranslation(0, translate.y);
        if (translate.y >=0) {
            transform = CGAffineTransformIdentity;
        }
        self.view.transform = transform;
    }
    if (translateState == VCWTranslateStateTranslateTofailure)
    {
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    }
    if (translateState == VCWTranslateStateTranslateToSuccess)
    {
        self.view.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.size.height);
    }
}

- (void)translateSuperView:(CGPoint)translate WithTranslateState:(VCWTranslateState)translateState
{
    if (translateState == VCWTranslateStateTranslating)
    {
        float scale = 0.4*(-translate.y/self.view.frame.size.height) +0.6;
        CGAffineTransform transformScale = CGAffineTransformMakeScale(scale, scale);
        CGAffineTransform transformTanslate = CGAffineTransformMakeTranslation(0, 100*((self.view.frame.size.height+translate.y)/self.view.frame.size.height));
        CGAffineTransform transform = CGAffineTransformConcat(transformScale, transformTanslate);
        self.presentingViewController.view.transform = transform;
    }
    if (translateState == VCWTranslateStateTranslateTofailure)
    {
        CGAffineTransform transformScale = CGAffineTransformMakeScale(0.6, 0.6);
        CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0, -100);
        self.presentingViewController.view.transform = CGAffineTransformConcat(transformTranslate, transformScale);
    }
    if (translateState == VCWTranslateStateTranslateToSuccess)
    {
        CGAffineTransform transformScale = CGAffineTransformMakeScale(1, 1);
        CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0, 0);
        self.presentingViewController.view.transform = CGAffineTransformConcat(transformTranslate, transformScale);
    }
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
