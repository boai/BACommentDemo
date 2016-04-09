//
//  JZFriends.h
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZFriends : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,copy) NSString *name;
@property(nonatomic, assign,getter=isVip) BOOL vip;
+(instancetype)friendsWithDict:(NSDictionary * )dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
