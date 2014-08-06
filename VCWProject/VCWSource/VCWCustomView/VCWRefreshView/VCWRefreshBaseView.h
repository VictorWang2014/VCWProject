//
//  VCWRefreshBaseView.h
//  VCWTableViewRefresh
//
//  Created by 王明权 on 7/29/14.
//  Copyright (c) 2014 com.gw.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VCWRefreshHeadViewPulling = 1,
    VCWRefreshHeadViewRefreshing,
    VCWRefreshHeadViewNomal
}VCWRefreshHeadViewState;

@protocol VCWRefreshHeadViewDelegate <NSObject>

- (void)VCWRefreshHeadViewStartScrolling:(UIScrollView *)scrollView;
- (void)VCWRefreshHeadViewWillRefreshing:(UIScrollView *)scrollView;
- (void)VCWRefreshHeadViewRefreshing:(UIScrollView *)scrollView;

@end

@interface VCWRefreshBaseView : UIView
{
    int p_animationImageViewAnimate;
    int P_loadState;
    int p_state;
    BOOL p_canRefresh;
}
@property (strong, nonatomic) UILabel                   *messageLable;
@property (strong, nonatomic) UIImageView               *animationImageView;
@property (strong, nonatomic) UIActivityIndicatorView   *loadingActivitiIndicatorView;
@property (strong, nonatomic) id<VCWRefreshHeadViewDelegate> delegate;

- (void)p_loadSelfView;
- (void)p_animationImageViewAnimate;

- (void)VCWScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)VCWScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)VCWResetRefreshViewWithScrollView:(UIScrollView *)scrollView;

@end
