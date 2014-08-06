//
//  VCWRefreshViewController.m
//  VCWProject
//
//  Created by 王明权 on 8/6/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import "VCWRefreshViewController.h"

@interface VCWRefreshViewController ()
{
    NSArray *_dataArray;
}

@end

@implementation VCWRefreshViewController

@synthesize refreshTableView = _refreshTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray = @[@"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111", @"1111111"];
    
    headView = [[VCWRefreshHeadView alloc] initWithFrame:CGRectMake(0, -49, 320, 49)];
    headView.delegate = self;
    [_refreshTableView addSubview:headView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customrefreshcell"];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)VCWRefreshHeadViewStartScrolling:(UIScrollView *)scrollView
{
    
}
- (void)VCWRefreshHeadViewWillRefreshing:(UIScrollView *)scrollView
{
    
}
- (void)VCWRefreshHeadViewRefreshing:(UIScrollView *)scrollView
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [headView VCWResetRefreshViewWithScrollView:scrollView];
    });
}

//
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [headView VCWScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [headView VCWScrollViewDidEndDragging:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
