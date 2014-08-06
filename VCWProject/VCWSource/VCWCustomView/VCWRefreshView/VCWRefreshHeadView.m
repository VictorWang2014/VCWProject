//
//  VCWRefreshHeadView.m
//  VCWTableViewRefresh
//
//  Created by 123456 on 14-7-29.
//  Copyright (c) 2014年 com.gw.cn. All rights reserved.
//

#import "VCWRefreshHeadView.h"
#import "CommonDefine.h"

@interface VCWRefreshHeadView ()

@end

@implementation VCWRefreshHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)p_animationImageViewAnimate
{
    p_animationImageViewAnimate = p_animationImageViewAnimate*-1;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.autoreverses = NO;
    animation.duration = 0.4;
    animation.toValue = [NSNumber numberWithFloat:p_animationImageViewAnimate*M_PI];
    [self.animationImageView.layer addAnimation:animation forKey:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (p_canRefresh) {
            [self.animationImageView.layer setTransform:CATransform3DMakeRotation(p_animationImageViewAnimate*M_PI, 0, 0, 1)];
        }
    });
}

- (void)VCWScrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > kHeaderHeight) {
        if (p_state == VCWRefreshHeadViewRefreshing) {
            return;
        }
//        if (p_state != VCWRefreshHeadViewNomal) {
            if ([self.delegate respondsToSelector:@selector(VCWRefreshHeadViewStartScrolling:)]) {
                [self.delegate VCWRefreshHeadViewStartScrolling:scrollView];
            }
            [self VCWSetRefreshViewState:VCWRefreshHeadViewNomal];
//        }
    }else if (scrollView.contentOffset.y < kHeaderHeight)
    {
        if (p_state != VCWRefreshHeadViewPulling && p_state != VCWRefreshHeadViewRefreshing) {
            if ([self.delegate respondsToSelector:@selector(VCWRefreshHeadViewWillRefreshing:)]) {
                [self.delegate VCWRefreshHeadViewWillRefreshing:scrollView];
            }
            [self VCWSetRefreshViewState:VCWRefreshHeadViewPulling];
        }
    }else if (scrollView.contentOffset.y == kHeaderHeight)
    {
        if (p_state == VCWRefreshHeadViewRefreshing && p_canRefresh) {
            [scrollView setContentInset:UIEdgeInsetsMake(-kHeaderHeight, 0, 0, 0)];
        }
    }
}

- (void)VCWScrollViewDidEndDragging:(UIScrollView *)scrollView
{
    CGPoint endDragPoint = scrollView.contentOffset;
    if (endDragPoint.y < kHeaderHeight) {
        p_canRefresh = YES;
        if (p_state != VCWRefreshHeadViewRefreshing && p_canRefresh) {
            if ([self.delegate respondsToSelector:@selector(VCWRefreshHeadViewRefreshing:)]) {
                [self.delegate VCWRefreshHeadViewRefreshing:scrollView];
            }
            [self VCWSetRefreshViewState:VCWRefreshHeadViewRefreshing];
            [self.loadingActivitiIndicatorView startAnimating];
            [UIView animateWithDuration:0.2 animations:^{
                [scrollView setContentInset:UIEdgeInsetsMake(-kHeaderHeight, 0, 0, 0)];
            }];
        }
    }else
    {
        p_canRefresh = NO;
    }
}

- (void)VCWSetRefreshViewState:(VCWRefreshHeadViewState)state
{
    switch (state) {
        case VCWRefreshHeadViewNomal:
        {
            self.messageLable.text = VCWRefreshViewPullDownPullingLabelString;
            [UIView animateWithDuration:0.25 animations:^{
                self.animationImageView.transform = CGAffineTransformIdentity;
            }];
            self.animationImageView.hidden = NO;
            self.loadingActivitiIndicatorView.hidden = YES;
            [self.loadingActivitiIndicatorView stopAnimating];
            p_state = VCWRefreshHeadViewNomal;
            break;
        }
        case VCWRefreshHeadViewPulling:
        {
            self.messageLable.text = VCWRefreshViewPullDownWillRefreshingLabelString;
            [UIView animateWithDuration:0.25 animations:^{
                self.animationImageView.transform = CGAffineTransformMakeRotation(M_PI);
            }];
            self.animationImageView.hidden = NO;
            self.loadingActivitiIndicatorView.hidden = YES;
            p_state = VCWRefreshHeadViewPulling;
            break;
        }
        case VCWRefreshHeadViewRefreshing:
        {
            self.messageLable.text = VCWRefreshViewPullDownRefreshingLableString;
            self.animationImageView.hidden = YES;
            self.loadingActivitiIndicatorView.hidden = NO;
            p_state = VCWRefreshHeadViewRefreshing;
            break;
        }
        default:
            break;
    }
}

- (void)VCWResetRefreshViewWithScrollView:(UIScrollView *)scrollView
{
    p_canRefresh = NO;
    [self VCWSetRefreshViewState:VCWRefreshHeadViewNomal];
    [UIView animateWithDuration:0.4 animations:^{
        [scrollView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
