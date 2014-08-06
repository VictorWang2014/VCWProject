//
//  VCWRefreshViewController.h
//  VCWProject
//
//  Created by 王明权 on 8/6/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCWRefreshHeadView.h"

@interface VCWRefreshViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, VCWRefreshHeadViewDelegate>
{
    VCWRefreshHeadView *headView;
}

@property (strong, nonatomic) IBOutlet UITableView *refreshTableView;

@end
