//
//  JZFriendsGroup.m
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import "JZFriendsGroup.h"
#import "JZFriends.h"
@implementation JZFriendsGroup
+(instancetype)friendsGroupWith:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        // 数据注入
        [self setValuesForKeysWithDictionary:dict];
        
        // 好友数据特殊处理
        NSMutableArray * myArr = [NSMutableArray array];
        for (NSDictionary * dic in self.friends)
        {
            JZFriends * fri = [JZFriends friendsWithDict:dic];
            [myArr addObject:fri];
        }
        self.friends = myArr;
    }
    return self;
}
@end
