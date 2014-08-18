//
//  VCWHitEventTransferViewController.h
//  VCWProject
//
//  Created by wangmingquan on 18/8/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomScrollView : UIScrollView

@end

@interface VCWHitEventTransferViewController : UIViewController

@property (strong, nonatomic) IBOutlet CustomScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *outsideButton;
@property (strong, nonatomic) IBOutlet UIButton *insideButton;
@end
