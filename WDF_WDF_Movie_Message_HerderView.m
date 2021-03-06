//
//  WDF_WDF_Movie_Message_HerderView.m
//  100Movies_2.0
//  电影详情的头视图展示
//  Created by qianfeng on 16/1/9.
//  Copyright © 2016年 WDF. All rights reserved.
//  王长勇

#import "WDF_WDF_Movie_Message_HerderView.h"
#import "WDF_Movie_Message_Model.h"
#import "Baoyu_ratingByStars.h"
#import "UIImageView+WebCache.h"

@interface WDF_WDF_Movie_Message_HerderView ()


/** 头视图 */
@property (nonatomic, strong) UIView *headerView;
/** 海报 */
@property (nonatomic, strong) UIImageView *imageHeader;
/** 电影名 */
@property (nonatomic, strong) UIButton *movieNameButton;
/** 电影评分星星 */
@property (nonatomic, strong) Baoyu_ratingByStars *starsView;
/** 主演 */
//@property (nonatomic, strong) UILabel *stars_ForMovie;
/** 导演 */
@property (nonatomic, strong) UIButton *directorsButton;
/** 评分label */
@property (nonatomic, strong) UILabel *scoreLabelTitle;
@end

@implementation WDF_WDF_Movie_Message_HerderView

- (void)setModel:(WDF_Movie_Message_Model *)model{
    _model = model;
    // 电影海报的加载以及添加
    
    [self.imageHeader sd_setImageWithURL:[NSURL URLWithString:self.model.images.large] placeholderImage:[UIImage imageNamed:@"zhanweitu"]];
    
    [self.movieNameButton setTitle:[NSString stringWithFormat:@"%@",model.title] forState:UIControlStateNormal];
    self.movieNameButton.titleLabel.font = [UIFont systemFontOfSize:SCREEN_WIDTH/17];
    
    self.movieNameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    NSArray *arr = @[@"full",@"half",@"nil"];
    [self.starsView setScores:model.rating.average withImages:arr];
    self.scoreLabelTitle.text = @"评分:";
    
    
//    NSDictionary *dic = model.casts.firstObject;
//    NSMutableString *starName = [NSMutableString stringWithFormat:@"主演:%@",dic[@"name"]];
//    
//    for (int i = 1; i < model.casts.count; i ++) {
//        NSDictionary *dicName = model.casts[i];
//        starName = [NSMutableString stringWithFormat:@"%@\n\t%@%@",starName,@"  ",dicName[@"name"]];
//    }
//    self.stars_ForMovie.text = starName;
//    [self.stars_ForMovie setFont:[UIFont systemFontOfSize:SCREEN_WIDTH/21]];
//    self.stars_ForMovie.alpha = 0.7;
    
    NSDictionary *dirsecorsDic = model.directors.firstObject;
    [self.directorsButton setTitle:[NSString stringWithFormat:@"导演:%@",dirsecorsDic[@"name"]] forState:UIControlStateNormal];
    self.directorsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.directorsButton.titleLabel setFont:[UIFont systemFontOfSize: SCREEN_WIDTH/21]];

    for (int i = 0; i < model.genres.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.45+(SCREEN_WIDTH * 0.1+SCREEN_WIDTH*0.06)*i, SCREEN_WIDTH*0.45, SCREEN_WIDTH*0.1, SCREEN_WIDTH*0.05)];
        [button.titleLabel setFont:[UIFont systemFontOfSize:SCREEN_WIDTH/22]];
        [button setTitleColor:RGB(40, 190, 241, 1) forState:UIControlStateNormal];

        [button setTitle:[NSString stringWithFormat:@"%@",model.genres[i]] forState:UIControlStateNormal];
        [self.headerView addSubview:button];
    }
    
    
}
// 重写init方法, 在外界直接调用的这个方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
        [self addSubview:self.headerView];
        
    }
    return self;
}
#pragma mark ================ 懒加载 =======================
/** 头视图懒加载 */
- (UIView *)headerView{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.66)];
        
        [_headerView addSubview:self.imageHeader];
        [_headerView addSubview:self.movieNameButton];
//        [_headerView addSubview:self.starsView];
//        [_headerView addSubview:self.stars_ForMovie];
        [_headerView addSubview:self.directorsButton];
        [_headerView addSubview:self.scoreLabelTitle];
    }
    return _headerView;
}
/** 电影宣传照的懒加载 */
- (UIImageView *)imageHeader{
    if (_imageHeader == nil) {
        
        _imageHeader = [[UIImageView alloc] initWithFrame:CGRectMake(10, SCREEN_WIDTH*0.05, SCREEN_WIDTH *0.4, SCREEN_WIDTH*0.56)];
        
    }
    return _imageHeader;
}
/** 电影名称懒加载 */
- (UIButton *)movieNameButton{
    if (_movieNameButton == nil) {
        _movieNameButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.45, SCREEN_WIDTH*0.05, SCREEN_WIDTH*0.55, SCREEN_WIDTH*0.1)];
        
    }
    return _movieNameButton;
}
/** 评分View懒加载 */
- (Baoyu_ratingByStars *)starsView{
    if (!_starsView) {
        _starsView = [[Baoyu_ratingByStars alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.55, SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.25, SCREEN_WIDTH*0.03)];
        [self.headerView addSubview:_starsView];
    }
    return _starsView;
}
///** 主演懒加载 */
//- (UILabel *)stars_ForMovie{
//    if (_stars_ForMovie == nil) {
//        _stars_ForMovie = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.5, SCREEN_WIDTH*0.38, SCREEN_WIDTH*0.5, SCREEN_WIDTH*0.26)];
//        _stars_ForMovie.backgroundColor = RGB(125, 187, 25, 1);
//        _stars_ForMovie.numberOfLines = 0;
//
//    }
//    return _stars_ForMovie;
//}
/** 导演懒加载 */
- (UIButton *)directorsButton{
    if (_directorsButton == nil) {
        _directorsButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.45, SCREEN_WIDTH*0.3, SCREEN_WIDTH*0.55, SCREEN_WIDTH*0.08)];
        
    }
    return _directorsButton;
}
/** 评分label 懒加载 */
- (UILabel *)scoreLabelTitle{
    if (_scoreLabelTitle == nil) {
        _scoreLabelTitle = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.45, SCREEN_WIDTH*0.17, SCREEN_WIDTH*0.1, SCREEN_WIDTH*0.05)];
        
        [_scoreLabelTitle setFont:[UIFont systemFontOfSize:SCREEN_WIDTH/26]];
    }
    return _scoreLabelTitle;
}
@end
