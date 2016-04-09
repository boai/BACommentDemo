//
//  BigSectionHeader.m
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import "BigSectionHeader.h"

@implementation BigSectionHeader

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self loadAllViews];
    }
    return self;
}
- (void)loadAllViews {
    self.leftView = [[UIView alloc] init];
    self.leftView.frame = CGRectMake(10, 5, 2, self.frame.size.height - 10);
    self.leftView.backgroundColor = [UIColor purpleColor];
    self.titleTipLabel = [[UILabel alloc] init];
    self.titleTipLabel.frame = CGRectMake(CGRectGetMaxX(self.leftView.frame) + 10, 0, 80, self.frame.size.height);
    self.titleTipLabel.textColor = [UIColor purpleColor];
    self.titleTipLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.leftView];
    [self addSubview:self.titleTipLabel];
    
}

- (void)setSectionTitle:(NSString *)sectionTitle {

    self.titleTipLabel.text = sectionTitle;
}

@end
