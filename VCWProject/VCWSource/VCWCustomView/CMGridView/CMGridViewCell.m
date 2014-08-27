
//
//  CMGridViewCell.m
//  test3
//
//  Created by wangmingquan on 26/8/14.
//  Copyright (c) 2014 wangmingquan. All rights reserved.
//

#import "CMGridViewCell.h"

@implementation GridViewItemData

@synthesize titleString;
@synthesize subTitleString;
@synthesize highDataString;
@synthesize lowdDataString;
@synthesize exchangeRateString;

- (id)init
{
    self = [super init];
    if (self) {
        titleString = nil;
        subTitleString = nil;
        highDataString = nil;
        lowdDataString = nil;
        exchangeRateString = nil;
    }
    return self;
}

@end

@interface CMGridViewCell ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIButton *tapButton;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) UILabel *highDataLabel;
@property (nonatomic, strong) UILabel *lowDataLabel;
@property (nonatomic, strong) UILabel *exchangeRateLabel;

@end

@implementation CMGridViewCell

@synthesize gridViewItemData = _gridViewItemData;

@synthesize bgImageView = _bgImageView;
@synthesize tapButton = _tapButton;

@synthesize titleLabel = _titleLabel;
@synthesize subTitleLabel = _subTitleLabel;

@synthesize highDataLabel = _highDataLabel;
@synthesize lowDataLabel = _lowDataLabel;
@synthesize exchangeRateLabel = _exchangeRateLabel;


- (id)initWithFrame:(CGRect)frame
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must use initWithFrame: WithData instead" userInfo:nil];
    //    self = [super initWithFrame:frame];
    //    if (self) {
    //        // Initialization code
    //
    //    }
    //    return self;
}

- (id)initWithFrame:(CGRect)frame WithData:(GridViewItemData *)data
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _gridViewItemData = data;
        [self _initUIData];
    }
    return self;
}

- (void)_initUIData
{
    //    CGRect frame = self.frame;
    // add bgimageview
    _bgImageView = [[UIImageView alloc] initWithFrame:UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, 0, 0, 0))];
    [_bgImageView setImage:[UIImage imageNamed:@"noNewsTip"]];
    [self addSubview:_bgImageView];
    
    // add the info labels
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 30)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setText:_gridViewItemData.titleString];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentLeft];
    [_titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [self addSubview:_titleLabel];
    
    _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 35, 150, 30)];
    [_subTitleLabel setBackgroundColor:[UIColor clearColor]];
    [_subTitleLabel setText:_gridViewItemData.subTitleString];
    [_subTitleLabel setTextColor:[UIColor darkGrayColor]];
    [_subTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [_subTitleLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [self addSubview:_subTitleLabel];
    
    _highDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 65, 100, 25)];
    [_highDataLabel setBackgroundColor:[UIColor clearColor]];
    [_highDataLabel setText:_gridViewItemData.highDataString];
    [_highDataLabel setTextColor:[UIColor darkGrayColor]];
    [_highDataLabel setTextAlignment:NSTextAlignmentLeft];
    [_highDataLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [self addSubview:_highDataLabel];
    
    _lowDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 65, 150, 25)];
    [_lowDataLabel setBackgroundColor:[UIColor clearColor]];
    [_lowDataLabel setText:_gridViewItemData.lowdDataString];
    [_lowDataLabel setTextColor:[UIColor darkGrayColor]];
    [_lowDataLabel setTextAlignment:NSTextAlignmentLeft];
    [_lowDataLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [self addSubview:_lowDataLabel];
    
    _exchangeRateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 95, 150, 25)];
    [_exchangeRateLabel setBackgroundColor:[UIColor clearColor]];
    [_exchangeRateLabel setText:_gridViewItemData.exchangeRateString];
    [_exchangeRateLabel setTextColor:[UIColor darkGrayColor]];
    [_exchangeRateLabel setTextAlignment:NSTextAlignmentLeft];
    [_exchangeRateLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [self addSubview:_exchangeRateLabel];
    
    // add tapbutton
    _tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tapButton setFrame:UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, 0, 0, 0))];
    [_tapButton setBackgroundColor:[UIColor clearColor]];
    [_tapButton addTarget:self action:@selector(tapButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_tapButton];
}

//- (void)gridViewCellReloadData
//{
//    [_titleLabel setText:_gridViewItemData.titleString];
//    [_subTitleLabel setText:_gridViewItemData.subTitleString];
//    [_highDataLabel setText:_gridViewItemData.highDataString];
//    [_lowDataLabel setText:_gridViewItemData.lowdDataString];
//    [_exchangeRateLabel setText:_gridViewItemData.exchangeRateString];
//}

- (void)tapButtonClick:(UIButton *)button
{
    if (_delegate)
        if ([_delegate respondsToSelector:@selector(gridViewCellDeSelected:)])
        {
            [_delegate gridViewCellDeSelected:self];
        }
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

@implementation CMGridViewDefaultCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame WithData:nil];
    if (self) {
        // Initialization code
        [self _initUIData];
    }
    return self;
}

- (void)_initUIData
{
    self.bgImageView = [[UIImageView alloc] initWithFrame:UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, 0, 0, 0))];
    [self.bgImageView setImage:[UIImage imageNamed:@"noNewsTip"]];
    [self addSubview:self.bgImageView];
    
    self.tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.tapButton setFrame:UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, 0, 0, 0))];
    [self.tapButton setBackgroundColor:[UIColor clearColor]];
    [self.tapButton addTarget:self action:@selector(tapButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.tapButton];
}

@end























