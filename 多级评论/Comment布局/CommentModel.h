//
//  CommentModel.h
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,strong) NSArray *Profile;
@property (nonatomic,assign) BOOL unFold;

@end
