//
//  SmallSectionHeader.h
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
@interface SmallSectionHeader : UIView
@property (nonatomic,strong) CommentModel *smallCommentModel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UIButton *moreBtn;
- (CGFloat)getSmallSectioHeaderHeight;
@end
