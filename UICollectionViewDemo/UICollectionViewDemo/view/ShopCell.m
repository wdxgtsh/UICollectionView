//
//  ShopCell.m
//  UICollectionViewDemo
//
//  Created by zhaolei on 16/7/14.
//  Copyright © 2016年 zhaolei. All rights reserved.
//

#import "ShopCell.h"
#import "Masonry.h"
#import "ShopModel.h"
#import "UIImageView+WebCache.h"

@interface ShopCell ()

@property (nonatomic, strong) UIImageView * picImageView;


@property (nonatomic, strong) UILabel * desLabel;
@end

@implementation ShopCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self steupUI];
    }
    return self;
}

- (void)steupUI{
    self.picImageView = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(@0);
        }];
        imageView;
    });
    
    self.desLabel = ({
        UILabel * label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.mas_equalTo(@0);
        }];
        label;
    });
}

- (void)setShopModel:(ShopModel *)shopModel{
    _shopModel = shopModel;
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:shopModel.imageUrl] placeholderImage:[UIImage imageNamed:@"loading"]];
    self.desLabel.text = shopModel.imageDesString;
}

@end
