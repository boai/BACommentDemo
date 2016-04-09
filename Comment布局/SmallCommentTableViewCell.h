//
//  SmallCommentTableViewCell.h
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
@interface SmallCommentTableViewCell : UITableViewCell

@property (nonatomic,strong) CommentModel *smallCommentModel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *addressLabel;

- (CGFloat)getSmallCommentCellHeight;

@end
