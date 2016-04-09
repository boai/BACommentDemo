//
//  JZHeadView.h
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JZFriendsGroup,JZHeadView;
@protocol JZHeadViewDeleget <NSObject>

@optional

-(void)headViewDidClickButtn:(JZHeadView *)head;

@end

@interface JZHeadView : UITableViewHeaderFooterView

@property(nonatomic, strong) JZFriendsGroup * fg;

+(JZHeadView *)headWithTableView:(UITableView *)tableView;

@property(nonatomic, weak) id<JZHeadViewDeleget> deleget;

@end
