//
//  SmallSectionHeader.m
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import "SmallSectionHeader.h"
#define NAMEFONE 15
#define ADDRESSFONE 17
@implementation SmallSectionHeader
- (instancetype)init {
    if (self = [super init]) {
        [self loadAllViews];
    }
    return self;
}

- (void)loadAllViews {
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:NAMEFONE];
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.font = [UIFont systemFontOfSize:ADDRESSFONE];
    self.nameLabel.textColor = [UIColor redColor];
    self.addressLabel.textColor = [UIColor orangeColor];
    self.moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.moreBtn];
    [self addSubview:self.nameLabel];
    [self addSubview:self.addressLabel];
}

- (void)setSmallCommentModel:(CommentModel *)smallCommentModel {
    
    _smallCommentModel = smallCommentModel;
    self.nameLabel.frame = CGRectMake(10, 5, [self getContentSizeWithContent:smallCommentModel.name sizeFont:NAMEFONE].width, [self getContentSizeWithContent:smallCommentModel.name sizeFont:NAMEFONE].height);
    self.nameLabel.text = smallCommentModel.name;
    
    self.addressLabel.frame = CGRectMake(CGRectGetMinX(self.nameLabel.frame) + 5, CGRectGetMaxY(self.nameLabel.frame) + 5, [self getContentSizeWithContent:smallCommentModel.address sizeFont:ADDRESSFONE].width, [self getContentSizeWithContent:smallCommentModel.address sizeFont:ADDRESSFONE].height);
    self.addressLabel.text = smallCommentModel.address;
    if (smallCommentModel.Profile.count > 1) {
        self.moreBtn.hidden = NO;
        self.moreBtn.frame = CGRectMake(CGRectGetMinX(self.addressLabel.frame) + 10, CGRectGetMaxY(self.addressLabel.frame) + 5, 100, 30);
        [self.moreBtn setTitle:@"显示更多回复内容" forState:UIControlStateNormal];
        [self.moreBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }else {
    
        self.moreBtn.frame = CGRectZero;
        self.moreBtn.hidden = YES;
    }
    
}
- (CGSize)getContentSizeWithContent:(NSString *)content sizeFont:(CGFloat)font {
    
    return [content boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}
- (CGFloat)getSmallSectioHeaderHeight {

    if (self.smallCommentModel.Profile.count > 1) {
        return CGRectGetMaxY(self.moreBtn.frame) + 10;
    }
    return CGRectGetMaxY(self.addressLabel.frame) + 10;
}
@end
