//
//  IClassicSparkTrajectoryFactory.h
//  sparkler
//
//  Created by pmst on 2019/9/2.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISparkTrajectoryFactory.h"
#import "ISparkTrajectory.h"

NS_ASSUME_NONNULL_BEGIN

/// 经典火花轨迹工厂协议，经典只是某种样式，但该样式下也有其他变换
@protocol IClassicSparkTrajectoryFactory <ISparkTrajectoryFactory>
- (id<ISparkTrajectory>)randomTopRight;
- (id<ISparkTrajectory>)randomBottomRight;
@end

NS_ASSUME_NONNULL_END
