//
//  IFirework.h
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ISparkTrajectoryFactory,ISparkViewFactory,ISparkViewFactoryData,ISparkTrajectory;
@class SparkView;


/// 完整的烟花 包含位置，缩放，每颗烟花大小
@protocol IFirework <NSObject>
@property(nonatomic, assign)CGPoint origin;
@property(nonatomic, assign)CGFloat scale;
@property(nonatomic, assign)CGSize sparkSize;

/// 一颗烟花的轨迹工厂
@property(nonatomic, strong)id<ISparkTrajectoryFactory> trajectoryFactory;
/// 一颗火星的样子(视图)
@property(nonatomic, strong)id<ISparkViewFactory> sparkViewFactory;

/// 火星视图需要的数据源
- (id<ISparkViewFactoryData>)sparkViewFactoryDataAtIndex:(int)index;

/// 火星颗粒
- (SparkView *)sparkView:(int)index;

/// 轨迹
- (id<ISparkTrajectory>)trajectory:(int)index;

/// 火星+轨迹 = 一次爆炸
- (FireworkSpark *)sparkAtIndex:(int)idx;
@end

NS_ASSUME_NONNULL_END
