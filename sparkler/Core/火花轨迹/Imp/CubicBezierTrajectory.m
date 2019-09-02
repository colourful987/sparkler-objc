//
//  CubicBezierTrajectory.m
//  08-21-sparkler
//
//  Created by pmst on 2019/8/22.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "CubicBezierTrajectory.h"

@implementation CubicBezierTrajectory

- (instancetype)initWithX0:(CGFloat)x0 y0:(CGFloat)y0
                        x1:(CGFloat)x1 y1:(CGFloat)y1
                        x2:(CGFloat)x2 y2:(CGFloat)y2
                        x3:(CGFloat)x3 y3:(CGFloat)y3 {
    self = [super init];
    
    if (self) {
        self.points = [NSMutableArray array];
        [self.points addObject:[NSValue valueWithCGPoint:CGPointMake(x0, y0)]];
        [self.points addObject:[NSValue valueWithCGPoint:CGPointMake(x1, y1)]];
        [self.points addObject:[NSValue valueWithCGPoint:CGPointMake(x2, y2)]];
        [self.points addObject:[NSValue valueWithCGPoint:CGPointMake(x3, y3)]];
    }
    
    return self;
}

- (UIBezierPath *)path {
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
        [_path moveToPoint:[self.points[0] CGPointValue]];
        [_path addCurveToPoint:[self.points[3] CGPointValue] controlPoint1:[self.points[1] CGPointValue] controlPoint2:[self.points[2] CGPointValue]];
    }
    return _path;
}


@end
