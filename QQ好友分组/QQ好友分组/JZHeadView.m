//
//  JZHeadView.m
//  QQ好友分组
//
//  Created by peijz on 15/12/27.
//  Copyright © 2015年 peijz. All rights reserved.
//

#define myWidth [UIScreen mainScreen].bounds.size.width
#import "JZHeadView.h"
#import "JZFriendsGroup.h"
@interface JZHeadView()

@property(nonatomic, weak) UILabel * label;
@property(nonatomic, weak) UIButton * button;
@end
@implementation JZHeadView

+(JZHeadView *)headWithTableView:(UITableView *)tableView
{
    static NSString * IQ = @"head";
    JZHeadView * head = [tableView dequeueReusableHeaderFooterViewWithIdentifier:IQ];
    if (head == nil)
    {
        head = [[JZHeadView alloc]initWithReuseIdentifier:IQ];
    }
    return head;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加button
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        
        // 设置左侧的箭头图片
        [button setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       // 设置按钮的内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置button的内边距
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        // 设置按钮内部的imageView的内容模式为居中
        button.imageView.contentMode = UIViewContentModeCenter;
        // 超出边框的内容不需要裁剪
        button.imageView.clipsToBounds = NO;
       
        // 点击事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:button];
        self.button = button;
        
        // 添加label
        UILabel * label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:label];
        self.label = label;
    }
    return self;
}

/**
 *  当一个控件的frame发生改变的时候就会调用
 *
 *  一般在这里布局内部的子控件(设置子控件的frame)
 */
- (void)layoutSubviews
{
    /**
     * 一定不要忘记写这句
     */
    [super layoutSubviews];

    self.button.frame = self.bounds;
    CGFloat padding = 10;
    CGFloat labelY = 0;
    CGFloat labelW = 100;
    CGFloat labelH = self.frame.size.height;
    CGFloat labelX = myWidth - labelW - padding;
    self.label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}
-(void)setFg:(JZFriendsGroup *)fg
{
    _fg = fg;
    
    [self.button setTitle:fg.name forState:UIControlStateNormal];
    self.label.text = [NSString stringWithFormat:@"%d/%ld",fg.online,fg.friends.count];
    
}

-(void)buttonClick:(UIButton *)sender
{
    
    // 1.修改组模型的标记(状态取反)
    self.fg.open = !self.fg.open;
    
    // 2.刷新表格
    
    if ([self.deleget respondsToSelector:@selector(headViewDidClickButtn:)])
    {
        [self.deleget headViewDidClickButtn:self];
    }
}
/**
 * 当第一个控件被添加到父控件时会被调用
 */
-(void)didMoveToSuperview
{
    if (self.fg.open) {
        self.button.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    else
    {
    
        self.button.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}


@end
