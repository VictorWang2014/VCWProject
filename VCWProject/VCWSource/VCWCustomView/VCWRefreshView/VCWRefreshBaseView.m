//
//  VCWRefreshBaseView.m
//  VCWTableViewRefresh
//
//  Created by 123456 on 14-7-30.
//  Copyright (c) 2014年 com.gw.cn. All rights reserved.
//

#import "VCWRefreshBaseView.h"
#import "CommonDefine.h"

@implementation VCWRefreshBaseView

@synthesize messageLable = _messageLable;
@synthesize animationImageView = _animationImageView;
@synthesize loadingActivitiIndicatorView = _loadingActivitiIndicatorView;
@synthesize delegate = _delegate;

- (id)init
{
    return [self initWithFrame:CGRectMake(0, 0, 320, -kHeaderHeight)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initData];
        [self p_loadSelfView];
    }
    return self;
}

- (void)initData
{
    p_animationImageViewAnimate = -1;
    p_state = VCWRefreshHeadViewNomal;
    p_canRefresh = NO;
}

- (void)p_loadSelfView
{
    self.messageLable = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, kMessageLabelWidth, kMessageLabelHeight)];
    self.messageLable.text = VCWRefreshViewPullDownPullingLabelString;
    self.messageLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.messageLable];
    
    self.animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, kAnimationImageViewWidth, kAnimationImageViewHeight)];
    self.animationImageView.image = [UIImage imageNamed:@"arrow"];
    [self addSubview:self.animationImageView];
    
    self.loadingActivitiIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(10, 0, kLoadingActivitiIndicatorViewWidth, kLoadingActivitiIndicatorViewHeight)];
    self.loadingActivitiIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self addSubview:self.loadingActivitiIndicatorView];
    
    [self VCWSetRefreshViewState:VCWRefreshHeadViewNomal];
}

- (void)VCWScrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > kHeaderHeight) {
        if (p_state == VCWRefreshHeadViewRefreshing && p_canRefresh) {
            [scrollView setContentInset:UIEdgeInsetsMake(-kHeaderHeight, 0, 0, 0)];
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
//            [scrollView setContentInset:UIEdgeInsetsMake(-kHeaderHeight, 0, 0, 0)];
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
    
}

- (void)VCWResetRefreshViewWithScrollView:(UIScrollView *)scrollView
{
    
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
