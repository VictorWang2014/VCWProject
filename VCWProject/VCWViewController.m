//
//  VCWViewController.m
//  VCWProject
//
//  Created by 王明权 on 8/6/14.
//  Copyright (c) 2014 com.gw.cn.MrsWang. All rights reserved.
//

#import "VCWViewController.h"
#import "VCWTranslateSuperViewController.h"
#import "VCWRefreshViewController.h"
#import "VCWHitEventTransferViewController.h"

@interface VCWViewController ()

@end

@implementation VCWViewController
{
    NSArray *_dataArray;
}

@synthesize mainTableView = _mainTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataArray = @[@"TranslationViewController", @"RefreshTableViewController", @"HitEventTransferViewController", @"SinaWeiboViewController"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customtableviewcell"];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VCWTranslateSuperViewController *translateSuperViewController = [[VCWTranslateSuperViewController alloc] init];
    VCWRefreshViewController *refreshViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"refreshviewcontroller"];
    VCWHitEventTransferViewController *hitEventTransferViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"hiteventtransferviewcontroller"];
    switch (indexPath.row) {
        case 0:
            [self presentViewController:translateSuperViewController animated:YES completion:nil];
            break;
        case 1:
            [self.navigationController pushViewController:refreshViewController animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:hitEventTransferViewController animated:YES];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
