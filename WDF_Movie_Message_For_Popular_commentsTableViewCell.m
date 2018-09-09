//
//  WDF_Movie_Message_For_Popular_commentsTableViewCell.m
//  100Movies_2.0
//  电影评论的自定义展示
//  Created by qianfeng on 16/1/11.
//  Copyright © 2016年 WDF. All rights reserved.
//  王长勇

#import "WDF_Movie_Message_For_Popular_commentsTableViewCell.h"

#import "UIImageView+WebCache.h"
#import "WDF_Comments_Message_Model.h"

@interface WDF_Movie_Message_For_Popular_commentsTableViewCell ()

// 评论的label
@property (nonatomic, strong) UILabel *commentsLabel;

// 评论者的头像
@property (nonatomic, strong) UIImageView *commentsImage;

// 评论者的昵称
@property (nonatomic, strong) UILabel *nameLabel;

// 评论者给出的评分
@property (nonatomic, strong) UIImageView *ratingImage;

@end

@implementation WDF_Movie_Message_For_Popular_commentsTableViewCell


- (void)setModel:(WDF_Comments_Message_Model *)model {
    _model = model;
    self.commentsLabel.text = model.content;
    
    NSURL *url = [NSURL URLWithString:model.author.avatar];
    [self.commentsImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"zhanweitu"]];
    
    
    self.nameLabel.text = model.author.name;
    
    [self.contentView addSubview:self.commentsImage];
    [self.contentView addSubview:self.commentsLabel];
    [self.contentView addSubview:self.nameLabel];
    
    
}

- (UILabel *)commentsLabel{
    if (_commentsLabel == nil) {
        _commentsLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 39, SCREEN_WIDTH - 86, 96)];
        _commentsLabel.numberOfLines = 0;
    }
    return _commentsLabel;
}

- (UIImageView *)commentsImage{
    if (_commentsImage == nil) {
        _commentsImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 10, 24, 24)];
    }
    return _commentsImage;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 200, 24)];
    }
    return _nameLabel;
}

- (UIImageView *)ratingImage{
    if (_ratingImage == nil) {

    }
    return _ratingImage;
}
@end
