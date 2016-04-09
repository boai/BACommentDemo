//
//  JZFriendsGroup.h
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface JZFriendsGroup : NSObject
@property(nonatomic, strong) NSArray * friends;
@property (nonatomic,copy) NSString *name;
@property(nonatomic, assign) int online;
@property(nonatomic, getter=isOpen) BOOL open;
+(instancetype)friendsGroupWith:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
