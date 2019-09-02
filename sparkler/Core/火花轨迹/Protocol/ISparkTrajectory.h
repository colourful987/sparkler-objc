//
//  ISparkTrajectory.h
//  sparkler
//
//  Created by pmst on 2019/9/2.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ISparkTrajectory <NSObject>
/// 轨迹点
@property(nonatomic, strong)NSMutableArray *points;
/// 通过轨迹点生成的贝塞尔曲线
@property(nonatomic, strong, readonly)UIBezierPath *path;

/// 轨迹操作：缩放
- (id<ISparkTrajectory>)scale:(CGFloat)value;

/// 轨迹操作：翻转
- (id<ISparkTrajectory>)flip;

/// 轨迹操作：平移
- (id<ISparkTrajectory>)shift:(CGPoint)point;
@end

NS_ASSUME_NONNULL_END
