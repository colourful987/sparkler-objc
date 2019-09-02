//
//  ClassicFirework.m
//  08-21-sparkler
//
//  Created by pmst on 2019/8/21.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "ClassicFirework.h"
#import "DefaultSparkViewFactoryData.h"
#import "ClassicSparkTrajectoryFactory.h"
#import "CircleColorSparkViewFactory.h"

@implementation ClassicFirework

- (instancetype)initWithOrigin:(CGPoint)origin sparkSize:(CGSize)sparkSize scale:(CGFloat)scale {
    self = [super init];
    
    if (self) {
        self.origin = origin;
        self.scale = scale;
        self.sparkSize = sparkSize;
        self.quarters = [self shuffledQuarters].mutableCopy;
    }
    
    return self;
}

- (id<ISparkViewFactoryData>)sparkViewFactoryDataAtIndex:(int)index {
    return [[DefaultSparkViewFactoryData alloc] initWithSparkSize:self.sparkSize index:index];
}

- (SparkView *)sparkView:(int)index {
    SparkView *view = [self.sparkViewFactory createWithData:[self sparkViewFactoryDataAtIndex:index]];
    CGRect rect = view.frame;
    rect.origin = self.origin;
    view.frame = rect;
    return view;
}

- (id<ISparkTrajectory>)trajectory:(int)index {
    /// 左上角 右上角 左下角 右下角 各2条轨迹，然后通过随机打乱方式
    /// quarter 代表4个区域中一个
    Quarter quarter = [self.quarters[index] intValue];
    ///
    FlipOptions flipOptions = [self flipOptions:quarter];
    CGVector changeVector = [self randomChangeVector:flipOptions maxValue:self.maxChangeValue];
    CGPoint sparkOrigin = CGPointMake(self.origin.x + changeVector.dx, self.origin.y + changeVector.dy);
    return [[[self randomTrajectory:flipOptions] scale:self.scale] shift:sparkOrigin];
    
}

- (id<ISparkTrajectory>)randomTrajectory:(FlipOptions)flipOptions {
    id<ISparkTrajectory> trajectory = nil;
    
    if (flipOptions & FlipOptionsVertically) {
        trajectory = [self classicTrajectoryFactory].randomBottomRight;
    } else {
        trajectory = [self classicTrajectoryFactory].randomTopRight;
    }
    
    if (flipOptions & FlipOptionsHorizontally) {
        return [trajectory flip];
    } else {
        return trajectory;
    }
}

- (FlipOptions)flipOptions:(Quarter)quarter {
    FlipOptions options = 0;
    if (quarter == QuarterBottomLeft || quarter == QuarterTopLeft ) {
        options |= FlipOptionsHorizontally;
    }
    if (quarter == QuarterBottomLeft || quarter == QuarterBottomRight ) {
        options |= FlipOptionsVertically;
    }
    return options;
}

- (NSArray *)shuffledQuarters {
    NSMutableArray *quarters = @[@(QuarterTopRight),@(QuarterTopRight),
                                 @(QuarterBottomRight),@(QuarterBottomRight),
                                 @(QuarterBottomLeft),@(QuarterBottomLeft),
                                 @(QuarterTopLeft),@(QuarterTopLeft)].mutableCopy;
    
    NSMutableArray *shuffled = [NSMutableArray array];
    
    for (int i = 0; i < quarters.count; ) {
        int idx = arc4random_uniform(quarters.count);
        [shuffled addObject:quarters[idx]];
        [quarters removeObjectAtIndex:idx];
    }
    
    return shuffled;
}

- (CGVector)randomChangeVector:(FlipOptions)flipOptions maxValue:(int)maxValue {
    CGFloat value0 = [self randomChange:maxValue];
    CGFloat value1 = [self randomChange:maxValue];
    
    CGFloat changeX = flipOptions | FlipOptionsHorizontally ? -value0 : value0;
    CGFloat changeY = flipOptions | FlipOptionsVertically ? value1 : -value0;
    return CGVectorMake(changeX, changeY);
}

- (CGFloat)randomChange:(int)maxValue {
    return (CGFloat)arc4random_uniform(maxValue);
}

- (int)maxChangeValue {
    return 10;
}

- (id<ISparkTrajectoryFactory>)trajectoryFactory {
    return [ClassicSparkTrajectoryFactory new];
}

- (id<IClassicSparkTrajectoryFactory>)classicTrajectoryFactory {
    return (id<IClassicSparkTrajectoryFactory>)self.trajectoryFactory;
}

- (id<ISparkViewFactory>)sparkViewFactory {
    return [CircleColorSparkViewFactory new];
}
@end
