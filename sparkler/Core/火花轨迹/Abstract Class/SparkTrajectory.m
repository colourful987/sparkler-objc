//
//  SparkTrajectory.m
//  sparkler
//
//  Created by pmst on 2019/9/2.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "SparkTrajectory.h"

@implementation SparkTrajectory

- (id<ISparkTrajectory>)scale:(CGFloat)value {
    NSMutableArray *points = [NSMutableArray array];
    
    for (NSValue *point in self.points) {
        CGPoint old = point.CGPointValue;
        old.x = old.x * value;
        old.y = old.y * value;
        [points addObject:[NSValue valueWithCGPoint:old]];
    }
    self.points = points;
    return self;
}

- (id<ISparkTrajectory>)flip {
    NSMutableArray *points = [NSMutableArray array];
    
    for (NSValue *point in self.points) {
        CGPoint old = point.CGPointValue;
        old.x = old.x * -1;
        [points addObject:[NSValue valueWithCGPoint:old]];
    }
    self.points = points;
    return self;
}

- (id<ISparkTrajectory>)shift:(CGPoint)point {
    NSMutableArray *points = [NSMutableArray array];
    
    for (NSValue *objectPoint in self.points) {
        CGPoint old = objectPoint.CGPointValue;
        old.x = old.x + point.x;
        old.y = old.y + point.y;
        [points addObject:[NSValue valueWithCGPoint:old]];
    }
    self.points = points;
    return self;
}
@end
