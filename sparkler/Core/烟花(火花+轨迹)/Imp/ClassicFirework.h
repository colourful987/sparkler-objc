//
//  ClassicFirework.h
//  08-21-sparkler
//
//  Created by pmst on 2019/8/21.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "Firework.h"
#import "SparkView.h"
#import "IClassicSparkTrajectoryFactory.h"
#import "ISparkViewFactory.h"
#import "ISparkViewFactoryData.h"

typedef NS_ENUM(NSUInteger, Quarter) {
    QuarterTopRight,
    QuarterBottomRight,
    QuarterBottomLeft,
    QuarterTopLeft
};

typedef NS_OPTIONS(NSUInteger, FlipOptions) {
    FlipOptionsHorizontally = 1 << 0,
    FlipOptionsVertically = 1 << 1
};

/**
      x     |     x
      x     |   x
             |
      ---------------
          x |  x
        x   |
             |     x
**/
@interface ClassicFirework : Firework

@property(nonatomic, assign, readonly)int maxChangeValue;

/// 火花轨迹工厂
@property(nonatomic, strong, readonly)id<ISparkTrajectoryFactory> trajectoryFactory;

/// 火花轨迹工厂
@property(nonatomic, strong, readonly)id<IClassicSparkTrajectoryFactory> classicTrajectoryFactory;

/// 火花样式工厂
@property(nonatomic, strong, readonly)id<ISparkViewFactory> sparkViewFactory;

@property(nonatomic, strong)NSMutableArray *quarters;

- (instancetype)initWithOrigin:(CGPoint)origin sparkSize:(CGSize)sparkSize scale:(CGFloat)scale;
@end






































