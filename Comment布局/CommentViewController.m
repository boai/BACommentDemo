//
//  CommentViewController.m
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import "CommentViewController.h"
#import "MJExtension.h"
#import "CommentModel.h"
#import "BigCommentTableViewCell.h"
#import "BigSectionHeader.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@interface CommentViewController ()<UITableViewDataSource,UITableViewDelegate,BigCommentTableViewRefreshDelegate>

@property (nonatomic,strong) UITableView *bigCommentTableView;
@property (nonatomic,strong) NSMutableArray *hotCommentArray;
@property (nonatomic,strong) NSMutableArray *lastCommentArray;
@property (nonatomic,strong) NSMutableArray *sectionNameArray;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation CommentViewController

- (NSMutableArray *)hotCommentArray {

    if (_hotCommentArray == nil) {
        _hotCommentArray = [NSMutableArray array];
    }
    return _hotCommentArray;
}
- (NSMutableArray *)lastCommentArray {
    if (_lastCommentArray == nil) {
        _lastCommentArray = [NSMutableArray array];
    }
    return _lastCommentArray;
}
- (NSMutableArray *)sectionNameArray {
    if (_sectionNameArray == nil) {
        _sectionNameArray = [NSMutableArray array];
    }
    return _sectionNameArray;
}
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getCommentData];
}

- (void)getCommentData {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"CommentData" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    for (NSDictionary *subDic in dic[@"最热"]) {
        CommentModel *model = [CommentModel objectWithKeyValues:subDic];
        [self.hotCommentArray addObject:model];
    }
    for (NSDictionary *subDic in dic[@"最新"]) {
        CommentModel *model = [CommentModel objectWithKeyValues:subDic];
        [self.lastCommentArray addObject:model];
    }
    
    if (self.hotCommentArray.count > 0) {
        [self.sectionNameArray addObject:@"最热"];
        [self.dataSource addObject:self.hotCommentArray];
    }
    if (self.lastCommentArray.count > 0) {
        [self.sectionNameArray addObject:@"最新"];
        [self.dataSource addObject:self.lastCommentArray];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    
    
    [self createBigCommentTableView];
}

- (void)createBigCommentTableView {

    self.bigCommentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64) style:UITableViewStylePlain];
    self.bigCommentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.bigCommentTableView.dataSource = self;
    self.bigCommentTableView.delegate = self;
    [self.view addSubview:self.bigCommentTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataSource.count;//self.dataSource的元素是数组，在这里应该会有两个元素，也即两个数组
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *dataArray = self.dataSource[section];//self.dataSource的每个元素（数组）的元素个数是每个区cell的个数
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //每一个cell中间都是一个tableview，往cell中传递的是self.dataSource中数组元素中的元素
    static NSString *identifier = @"BigCommentTableViewCell";
    BigCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BigCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *dataArray = self.dataSource[indexPath.section];
    CommentModel *commentModel = dataArray[indexPath.row];
    cell.bigCommentModel = commentModel;
    cell.tag = 100+indexPath.row;
    cell.delegate = self;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    BigSectionHeader *header = [[BigSectionHeader alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
    header.sectionTitle = self.sectionNameArray[section];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BigCommentTableViewCell *cell = [[BigCommentTableViewCell alloc] init];
    NSArray *dataArray = self.dataSource[indexPath.section];
    CommentModel *commentModel = dataArray[indexPath.row];
    cell.bigCommentModel = commentModel;
    CGFloat height = cell.smallCommentTableView.frame.size.height;
  return   height;
}
- (void)moreBtnDidClickAndRefreshBigCommentTableView {

    [self.bigCommentTableView reloadData];
}
@end
