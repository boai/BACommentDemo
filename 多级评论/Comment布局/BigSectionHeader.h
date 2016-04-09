//
//  BigSectionHeader.h
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigSectionHeader : UIView

@property (nonatomic,strong) UIView *leftView;
@property (nonatomic,strong) UILabel *titleTipLabel;
@property (nonatomic,copy) NSString *sectionTitle;

@end
