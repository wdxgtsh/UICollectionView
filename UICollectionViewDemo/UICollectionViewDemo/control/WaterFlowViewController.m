//
//  WaterFlowViewController.m
//  UICollectionViewDemo
//
//  Created by zhaolei on 16/7/14.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "WaterFlowViewController.h"
#import "MJExtension.h"
#import "ZLWaterFlowLayout.h"
#import "ShopCell.h"
#import "ShopModel.h"
#import "MJRefresh.h"


@interface WaterFlowViewController()<UICollectionViewDelegate, UICollectionViewDataSource, ZLWaterFlowLayoutDelegate>

@property (nonatomic, weak) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation WaterFlowViewController


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[NSMutableArray array];
    }
    return _dataSource;
}

static NSString * const ID = @"shopCellID";

- (void)viewDidLoad{
    [super viewDidLoad];

    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"plist"];
    NSArray * arr = [NSArray arrayWithContentsOfFile:plistPath];
    
    for (NSDictionary * dict in arr) {
        ShopModel * model = [[ShopModel alloc] init];
        model.width = [[dict objectForKey:@"w"] floatValue];
        model.height = [[dict objectForKey:@"h"] floatValue];
        model.imageDesString = [dict objectForKey:@"price"] ;
        model.imageUrl = [dict objectForKey:@"img"];
        [self.dataSource addObject:model];
    }
    
    ZLWaterFlowLayout *layout = [[ZLWaterFlowLayout alloc] init];
    layout.delegate = self;
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 40, 30);

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[ShopCell class] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

#pragma mark - <HMWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(ZLWaterFlowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    ShopModel *shopModel = self.dataSource[indexPath.item];
    return shopModel.height / shopModel.width * width;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.shopModel = self.dataSource[indexPath.item];
    return cell;
}


@end
