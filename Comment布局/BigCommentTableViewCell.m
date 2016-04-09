//
//  BigCommentTableViewCell.m
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import "BigCommentTableViewCell.h"
#import "SmallCommentTableViewCell.h"
#import "MJExtension.h"
#import "SmallSectionHeader.h"

#define NAMEFONE 15
#define ADDRESSFONE 17
#define kScreenW [UIScreen mainScreen].bounds.size.width
@implementation BigCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadAllViews];
    }
    return self;
}

- (void)loadAllViews {
    self.sectionTagArray = [NSMutableArray array];
    self.smallCommentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 10) style:UITableViewStylePlain];
    self.smallCommentTableView.delegate = self;
    self.smallCommentTableView.dataSource = self;
    self.smallCommentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.smallCommentTableView.scrollEnabled = NO;
    [self addSubview:self.smallCommentTableView];
}


- (void)setBigCommentModel:(CommentModel *)bigCommentModel {

    _bigCommentModel = bigCommentModel;
    CGFloat height = 0.0;
    
    if (bigCommentModel.Profile.count >= 1) {
        if (bigCommentModel.unFold) {
            for (NSDictionary *dic in bigCommentModel.Profile) {
                CommentModel *model = [CommentModel objectWithKeyValues:dic];
                SmallCommentTableViewCell *cell = [[SmallCommentTableViewCell alloc] init];
                cell.smallCommentModel = model;
                height += [cell getSmallCommentCellHeight] ;
            }
        }else {
            NSDictionary *dic = [bigCommentModel.Profile firstObject];
            CommentModel *model = [CommentModel objectWithKeyValues:dic];
            SmallCommentTableViewCell *cell = [[SmallCommentTableViewCell alloc] init];
            cell.smallCommentModel = model;
            height += [cell getSmallCommentCellHeight] ;
            
        }
    }
    SmallSectionHeader *smallHeader = [[SmallSectionHeader alloc] init];
    smallHeader.smallCommentModel = bigCommentModel;
    height += [smallHeader getSmallSectioHeaderHeight];
    self.smallCommentTableView.frame = CGRectMake(0, 0, kScreenW, height);
    [self.smallCommentTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.bigCommentModel.Profile.count > 1) {
        return (!self.bigCommentModel.unFold)?1:self.bigCommentModel.Profile.count;
    }
    return self.bigCommentModel.Profile.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"SmallCommentTableViewCell";
    SmallCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[SmallCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *dic = self.bigCommentModel.Profile[indexPath.row];
    CommentModel *model = [CommentModel objectWithKeyValues:dic];
    cell.smallCommentModel = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.bigCommentModel.Profile[indexPath.row];
    CommentModel *model = [CommentModel objectWithKeyValues:dic];
    SmallCommentTableViewCell *cell = [[SmallCommentTableViewCell alloc] init];
    cell.smallCommentModel = model;
    return [cell getSmallCommentCellHeight];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    SmallSectionHeader *header = [[SmallSectionHeader alloc] init];
    header.smallCommentModel = self.bigCommentModel;
    [self.sectionTagArray addObject:@(section)];
    header.moreBtn.tag = 100+section;
    [header.moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    SmallSectionHeader *header = [[SmallSectionHeader alloc] init];
    header.smallCommentModel = self.bigCommentModel;
    return [header getSmallSectioHeaderHeight];
}
- (void)moreBtnClick:(UIButton *)button {
    CGFloat height = 0.0;
    self.bigCommentModel.unFold = !self.bigCommentModel.unFold;
    if (self.bigCommentModel.Profile.count >= 1) {
        if (self.bigCommentModel.unFold) {
            for (NSDictionary *dic in self.bigCommentModel.Profile) {
                CommentModel *model = [CommentModel objectWithKeyValues:dic];
                SmallCommentTableViewCell *cell = [[SmallCommentTableViewCell alloc] init];
                cell.smallCommentModel = model;
                height += [cell getSmallCommentCellHeight] ;
            }
        }else {
            NSDictionary *dic = [self.bigCommentModel.Profile firstObject];
            CommentModel *model = [CommentModel objectWithKeyValues:dic];
            SmallCommentTableViewCell *cell = [[SmallCommentTableViewCell alloc] init];
            cell.smallCommentModel = model;
            height += [cell getSmallCommentCellHeight] ;
            
        }
    }
    SmallSectionHeader *smallHeader = [[SmallSectionHeader alloc] init];
    smallHeader.smallCommentModel = self.bigCommentModel;
    height += [smallHeader getSmallSectioHeaderHeight];
    self.smallCommentTableView.frame = CGRectMake(0, 0, kScreenW, height);
    NSIndexSet *section = [NSIndexSet indexSetWithIndex:button.tag - 100];
    [self.smallCommentTableView reloadSections:section withRowAnimation:UITableViewRowAnimationAutomatic];
    if ([self.delegate respondsToSelector:@selector(moreBtnDidClickAndRefreshBigCommentTableView)]) {
        [self.delegate moreBtnDidClickAndRefreshBigCommentTableView];
    }
}
@end
