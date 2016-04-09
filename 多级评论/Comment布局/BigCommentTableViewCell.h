//
//  BigCommentTableViewCell.h
//  Comment布局
//
//  Created by Geb on 16/2/20.
//  Copyright © 2016年 OE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@protocol BigCommentTableViewRefreshDelegate <NSObject>

-(void)moreBtnDidClickAndRefreshBigCommentTableView;

@end

@interface BigCommentTableViewCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) CommentModel *bigCommentModel;
@property (nonatomic,strong) UITableView *smallCommentTableView;
@property (nonatomic,assign) BOOL unFold;
@property (nonatomic,strong) NSMutableArray *sectionTagArray;
@property (nonatomic) id<BigCommentTableViewRefreshDelegate> delegate;

@end
