//
//  CMGridViewCell.h
//  test3
//
//  Created by wangmingquan on 26/8/14.
//  Copyright (c) 2014 wangmingquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GridViewItemData;

@protocol GridViewCellDelegate <NSObject>

- (void)gridViewCellDeSelectedWithData:(GridViewItemData *)data;

@end

@interface GridViewItemData : NSObject

@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *subTitleString;
@property (nonatomic, strong) NSString *highDataString;
@property (nonatomic, strong) NSString *lowdDataString;
@property (nonatomic, strong) NSString *exchangeRateString;

@end

@interface CMGridViewCell : UIView

@property (nonatomic, assign) GridViewItemData *gridViewItemData;
@property (nonatomic, strong) id<GridViewCellDelegate>delegate;

- (id)initWithFrame:(CGRect)frame WithData:(GridViewItemData *)data;
- (void)gridViewCellReloadData;

@end

@interface CMGridViewDefaultCell : CMGridViewCell

@end
