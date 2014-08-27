//
//  CMGridView.m
//  test3
//
//  Created by wangmingquan on 26/8/14.
//  Copyright (c) 2014 wangmingquan. All rights reserved.
//

#import "CMGridView.h"
#import "CMGridViewCell.h"

@interface CMGridView ()<GridViewCellDelegate>

@end

@implementation CMGridView

@synthesize dataArray = _dataArray;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must use initWithFrame: WithDataArray: instead" userInfo:nil];
}

- (id)initWithFrame:(CGRect)frame WithDataArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (array != nil || array.count != 0)
            _dataArray = [NSMutableArray arrayWithArray:array];
        [self _initUIData];
    }
    return self;
}

- (void)_initUIData
{
    [self _creatGridViewCells];
}

- (void)_creatGridViewCells
{
    if (_dataArray != nil || _dataArray.count > 0)
    {
        for (int i = 0; i < _dataArray.count && i < 3; i++)
        {
            CMGridViewCell *gridViewCell = [[CMGridViewCell alloc] initWithFrame:CGRectMake(10 + i*180, 10, 180, 140) WithData:_dataArray[i]];
            gridViewCell.delegate = self;
            gridViewCell.tag = i;
            [self addSubview:gridViewCell];
        }
        CMGridViewDefaultCell *gridViewDefaultCell;
        if (_dataArray.count >= 3)
        {
            gridViewDefaultCell = [[CMGridViewDefaultCell alloc] initWithFrame:CGRectMake(10, 160, 180, 140)];
        }else
        {
            gridViewDefaultCell = [[CMGridViewDefaultCell alloc] initWithFrame:CGRectMake(10+(_dataArray.count)*180, 10, 180, 140)];
        }
        gridViewDefaultCell.tag = _dataArray.count;
        gridViewDefaultCell.delegate = self;
        [self addSubview:gridViewDefaultCell];
    }
}

#pragma mark -- ReloadData
- (void)gridViewReloadData
{
    NSArray *array = self.subviews;
    for (int i = 0; i < array.count; i++)
    {
        UIView *view = array[i];
        [view removeFromSuperview];
        //        if ([view isKindOfClass:[CMGridViewDefaultCell class]])
        //        {
        //            break;
        //        }
        //        CMGridViewCell *gridViewCell = (CMGridViewCell *)view;
        //        [gridViewCell gridViewCellReloadData];
    }
    [self _creatGridViewCells];
}

#pragma mark -- GridViewCellDelegate
- (void)gridViewCellDeSelected:(CMGridViewCell *)gridViewCell
{
    if ([_delegate respondsToSelector:@selector(gridViewDeselectCellAtIndex:)])
    {
        [_delegate gridViewDeselectCellAtIndex:gridViewCell.tag];
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
