//
//  SmallCommentTableViewCell.m
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import "SmallCommentTableViewCell.h"
#define NAMEFONE 15
#define ADDRESSFONE 17
@implementation SmallCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadAllViews];
    }
    return self;
}

- (void)loadAllViews {
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:NAMEFONE];
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.font = [UIFont systemFontOfSize:ADDRESSFONE];
    self.nameLabel.textColor = [UIColor blackColor];
    self.addressLabel.textColor = [UIColor cyanColor];
    [self addSubview:self.nameLabel];
    [self addSubview:self.addressLabel];
}

- (void)setSmallCommentModel:(CommentModel *)smallCommentModel {
    
    _smallCommentModel = smallCommentModel;
    self.nameLabel.frame = CGRectMake(50, 5, [self getContentSizeWithContent:smallCommentModel.name sizeFont:NAMEFONE].width, [self getContentSizeWithContent:smallCommentModel.name sizeFont:NAMEFONE].height);
    self.nameLabel.text = smallCommentModel.name;
    
    self.addressLabel.frame = CGRectMake(CGRectGetMinX(self.nameLabel.frame) + 5, CGRectGetMaxY(self.nameLabel.frame) + 5, [self getContentSizeWithContent:smallCommentModel.address sizeFont:ADDRESSFONE].width, [self getContentSizeWithContent:smallCommentModel.address sizeFont:ADDRESSFONE].height);
    self.addressLabel.text = smallCommentModel.address;
    
}

- (CGSize)getContentSizeWithContent:(NSString *)content sizeFont:(CGFloat)font {
    
    return [content boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}

- (CGFloat)getSmallCommentCellHeight {

    return CGRectGetMaxY(self.addressLabel.frame) + 10;
}


@end
