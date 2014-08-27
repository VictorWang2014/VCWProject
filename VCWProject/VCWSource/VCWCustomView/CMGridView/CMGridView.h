//
//  CMGridView.h
//  test3
//
//  Created by wangmingquan on 26/8/14.
//  Copyright (c) 2014 wangmingquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMGridViewDelegate <NSObject>

- (void)gridViewDeselectCellAtIndex:(NSInteger)index;

@end

@interface CMGridView : UIView

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) id<CMGridViewDelegate>delegate;

- (id)initWithFrame:(CGRect)frame WithDataArray:(NSArray *)array;

- (void)gridViewReloadData;

@end
