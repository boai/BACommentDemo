//
//  JZFriends.m
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import "JZFriends.h"

@implementation JZFriends
+(instancetype)friendsWithDict:(NSDictionary * )dict
{
    return [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
