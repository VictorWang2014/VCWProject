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
    [self creatGridViewCellWithGridViewCell];
}

- (void)creatGridViewCellWithGridViewCell
{
    if (_dataArray != nil)
    {
        
    }
}

#pragma mark -- ReloadData
- (void)gridViewReloadData
{
    
}

#pragma mark -- GridViewCellDelegate
- (void)gridViewCellDeSelectedWithData:(GridViewItemData *)data
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
