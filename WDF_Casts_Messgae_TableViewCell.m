//
//  WDF_Casts_Messgae_TableViewCell.m
//  100Movies_2.0
//  电影主演的作品展示
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 WDF. All rights reserved.
//  王长勇

#import "WDF_Casts_Messgae_TableViewCell.h"

#import "WDF_Casts_Message_Model.h"
#import "UIImageView+WebCache.h"
#import "Baoyu_ratingByStars.h"

@interface WDF_Casts_Messgae_TableViewCell ()

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) Baoyu_ratingByStars *starsView;
@property (nonatomic, strong) UILabel *labelYears;
@property (nonatomic, strong) UILabel *scroesLabel;

@end

@implementation WDF_Casts_Messgae_TableViewCell

- (void)setModel:(WDF_Casts_Message_Model *)model{
    _model = model;
    NSDictionary *dict = model.works[self.row];

    [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"subject"][@"images"][@"large"]]] placeholderImage:[UIImage imageNamed:@"zhanweitu"]];
    self.labelTitle.text = dict[@"subject"][@"title"];
    
    self.labelYears.text = dict[@"subject"][@"year"];
    [self.labelYears setFont:[UIFont systemFontOfSize:15]];
    
    NSString *ss = dict[@"subject"][@"rating"][@"average"];
    CGFloat scores =ss.floatValue;
    [self.starsView setScores:scores withImages:@[@"full",@"half",@"nil"]];
    self.scroesLabel.text = @"评分:  ";
    
    [self.contentView addSubview:self.image];
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.labelYears];
    [self.contentView addSubview:self.starsView];
    [self.contentView addSubview:self.scroesLabel];
}

- (UIImageView *)image{
    if (!_image) {
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH* 0.21, SCREEN_WIDTH*0.3)];
    }
    return _image;
}

- (UILabel *)labelTitle{
    if (_labelTitle == nil) {
        _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH *0.3, 10, SCREEN_WIDTH*0.7, SCREEN_WIDTH *0.12)];

    }
    return _labelTitle;
}

- (UILabel *)labelYears{
    if (_labelYears == nil) {
        _labelYears = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH *0.3, SCREEN_WIDTH * 0.15, SCREEN_WIDTH *0.7, SCREEN_WIDTH*0.07)];

    }
    return _labelYears;
}

- (Baoyu_ratingByStars *)starsView{
    if (_starsView == nil) {
        _starsView = [[Baoyu_ratingByStars alloc] initWithFrame:CGRectMake(SCREEN_WIDTH *0.45, SCREEN_WIDTH *0.26, SCREEN_WIDTH*0.25, SCREEN_WIDTH*0.04)];

    }
    return _starsView;
}

- (UILabel *)scroesLabel{
    if (_scroesLabel == nil) {
        _scroesLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH *0.3, SCREEN_WIDTH *0.26, SCREEN_WIDTH *0.15, SCREEN_WIDTH *0.04)];
    }
    return _scroesLabel;
}
@end
