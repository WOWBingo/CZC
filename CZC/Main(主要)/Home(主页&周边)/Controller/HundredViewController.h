//
//  HundredViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"

@interface HundredViewController : PublicViewController<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *tableHeadView;
@property (weak, nonatomic) IBOutlet UIButton *integrateBtn; /**< 时间button */
@property (weak, nonatomic) IBOutlet UIButton *salesBtn; /**< 销量button */
@property (weak, nonatomic) IBOutlet UIButton *commentBtn; /**< 评价button */
@property (weak, nonatomic) IBOutlet UIButton *priceBtn; /**< 价格button */

@property (nonatomic, copy) NSString *productCatagory;/**< 产品类别号 */
@property (nonatomic, strong) NSMutableArray *productArray;/**< 产品数组 */
@property (nonatomic, assign) NSUInteger pageIndex;/**< 页数 */
@property (nonatomic, assign) NSUInteger pageCount;/**< 每页产品数 */
@property (nonatomic, assign) NSUInteger allCount;/**< 产品总数 */
@property (nonatomic, copy) NSString *cityDomainName;/**< 城市名 */
@property (nonatomic, assign) BOOL isLastPage;/**< 是否为最后页 */
@property (nonatomic, strong) NSString *sort;/**< 排序 */
@property (nonatomic, assign) BOOL isASC;/**< 升降序 */
@property (nonatomic, assign) int btntag;/**< tag */

@end
