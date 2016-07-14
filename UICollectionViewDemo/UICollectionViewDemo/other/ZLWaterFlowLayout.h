//
//  ZLWaterFlowLayout.h
//  UICollectionViewDemo
//
//  Created by zhaolei on 16/7/14.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLWaterFlowLayout;

@protocol ZLWaterFlowLayoutDelegate <NSObject>
- (CGFloat)waterflowLayout:(ZLWaterFlowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;
@end


@interface ZLWaterFlowLayout : UICollectionViewLayout


@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@property (nonatomic, weak) id<ZLWaterFlowLayoutDelegate> delegate;




@end
