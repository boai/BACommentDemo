//
//  ViewController.m
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import "ViewController.h"
#import "JZFriends.h"
#import "JZFriendsGroup.h"
#import "JZFriendsTableViewCell.h"
#import "JZHeadView.h"
@interface ViewController ()<JZHeadViewDeleget>
@property(nonatomic, strong) NSArray * friendsArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 * 懒加载
 */
-(NSArray *)friendsArr
{
    if (_friendsArr == nil)
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray * dicArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * friArr = [NSMutableArray array];
        for (NSDictionary * dic in dicArr)
        {
            JZFriendsGroup * friendGroup = [JZFriendsGroup friendsGroupWith:dic];
            [friArr addObject:friendGroup];
        }
        _friendsArr = friArr;
        
    }
    return _friendsArr;
}
/**
 * 隐藏状态啦
 */
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - tableview 方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  
    return self.friendsArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    JZFriendsGroup * friGroup = self.friendsArr[section];
    if (friGroup.isOpen == NO) {
        return 0;
    }
    else
    {
        return friGroup.friends.count;
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   
    JZHeadView * view = [JZHeadView headWithTableView:tableView];
    view.deleget = self;
    view.fg = self.friendsArr[section];
    return view;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        JZFriendsTableViewCell * cell = [JZFriendsTableViewCell cellWithTableView:tableView];
        JZFriendsGroup * fregroup = self.friendsArr[indexPath.section];
        cell.jzFri = fregroup.friends[indexPath.row];
        return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}


// 刷新表格的代理方法
-(void)headViewDidClickButtn:(JZHeadView *)head
{
    [self.tableView reloadData];
}

@end
