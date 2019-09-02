//
//  ClassicSparkTrajectoryFactory.m
//  sparkler
//
//  Created by pmst on 2019/9/2.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "ClassicSparkTrajectoryFactory.h"
#import "CubicBezierTrajectory.h"

#define CSTF(a0,b0,a1,b1,a2,b2,a3,b3) [[CubicBezierTrajectory alloc] initWithX0:a0 y0:b0 x1:a1 y1:b1 x2:a2 y2:b2 x3:a3 y3:b3]

@interface ClassicSparkTrajectoryFactory()
{
    NSArray<id<ISparkTrajectory>> *_topRight;
    NSArray<id<ISparkTrajectory>> *_bottomRight;
}
@end

@implementation ClassicSparkTrajectoryFactory

- (NSArray<id<ISparkTrajectory>> *)topRight {
    if (_topRight == nil) {
        _topRight = @[CSTF(0.00, 0.00, 0.31, -0.46, 0.74, -0.29, 0.99, 0.12),
                      CSTF(0.00, 0.00, 0.31, -0.46, 0.62, -0.49, 0.88, -0.19),
                      CSTF(0.00, 0.00, 0.10, -0.54, 0.44, -0.53, 0.66, -0.30),
                      CSTF(0.00, 0.00, 0.19, -0.46, 0.41, -0.53, 0.65, -0.45)];
    }
    return _topRight;
}

- (NSArray<id<ISparkTrajectory>> *)bottomRight {
    if (_bottomRight == nil) {
        _bottomRight = @[CSTF(0.00, 0.00, 0.42, -0.01, 0.68, 0.11, 0.87, 0.44),
                         CSTF(0.00, 0.00, 0.35, 0.00, 0.55, 0.12, 0.62, 0.45),
                         CSTF(0.00, 0.00, 0.21, 0.05, 0.31, 0.19, 0.32, 0.45),
                         CSTF(0.00, 0.00, 0.18, 0.00, 0.31, 0.11, 0.35, 0.25)];
    }
    return _bottomRight;
}

- (id<ISparkTrajectory>)randomTopRight {
    return self.topRight[arc4random_uniform((uint32_t)self.topRight.count)];
}

- (id<ISparkTrajectory>)randomBottomRight {
    return self.bottomRight[arc4random_uniform((uint32_t)self.bottomRight.count)];
}

@end
