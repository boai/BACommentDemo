//
//  JZFriendsTableViewCell.m
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import "JZFriendsTableViewCell.h"
#import "JZFriends.h"
@implementation JZFriendsTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"cell";
    JZFriendsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[JZFriendsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
-(void)setJzFri:(JZFriends *)jzFri
{
    _jzFri = jzFri;
    self.imageView.image = [UIImage imageNamed:jzFri.icon];
    self.textLabel.text = jzFri.name;
    self.detailTextLabel.text = jzFri.intro;
    if (jzFri.isVip == YES)
    {
        self.textLabel.textColor = [UIColor redColor];
        self.detailTextLabel.textColor = [UIColor redColor];
    }
}
@end
