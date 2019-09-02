//
//  CubicBezierTrajectory.h
//  08-21-sparkler
//
//  Created by pmst on 2019/8/22.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "SparkTrajectory.h"
#import "ISparkTrajectory.h"

/// 立方贝塞尔轨迹
@interface CubicBezierTrajectory : SparkTrajectory<ISparkTrajectory>


- (instancetype)initWithX0:(CGFloat)x0 y0:(CGFloat)y0
                        x1:(CGFloat)x1 y1:(CGFloat)y1
                        x2:(CGFloat)x2 y2:(CGFloat)y2
                        x3:(CGFloat)x3 y3:(CGFloat)y3;
@end
