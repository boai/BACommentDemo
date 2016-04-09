//
//  JZFriendsTableViewCell.h
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JZFriends;
@interface JZFriendsTableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong) JZFriends *jzFri;

@end
