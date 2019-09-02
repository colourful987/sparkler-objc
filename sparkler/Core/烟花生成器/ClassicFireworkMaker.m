//
//  ClassicFireworkMaker.m
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "ClassicFireworkMaker.h"
#import "ClassicFirework.h"

@implementation ClassicFireworkMaker

- (id<ISparkViewAnimator>)sparkAnimator {
    return [ClassicFireworkAnimator new];
}

- (id<IFirework>)createFirework:(CGPoint)origin sparkSize:(CGSize)sparkSize scale:(CGFloat)scale {
    ClassicFirework *firework = [[ClassicFirework alloc] initWithOrigin:origin sparkSize:sparkSize scale:scale];
    return firework;
}

- (CGVector)randomChangeVector:(CGFloat)max {
    return CGVectorMake([self randomChange:max], [self randomChange:max]);
}

- (CGFloat)randomChange:(CGFloat)max {
    return (CGFloat)arc4random_uniform(max) - max/2.f;
}

- (void)addFireworks:(int)fireworksCount
         sparksCount:(int)sparksCount
          sourceView:(UIView *)sourceView
           sparkSize:(CGSize)sparkSize
               scale:(CGFloat)scale
     maxVectorChange:(CGFloat)maxVectorChange
   animationDuration:(NSTimeInterval)animationDuration
     canChangeZIndex:(BOOL)canChangeZIndex {
    
    NSAssert(sourceView.superview != nil, @"必须加载到某个视图去");
    
    CGPoint point1 = CGPointMake(CGRectGetMinX(sourceView.frame), CGRectGetMinY(sourceView.frame));
    CGPoint point2 = CGPointMake(CGRectGetMaxX(sourceView.frame), CGRectGetMinY(sourceView.frame));
    CGPoint point3 = CGPointMake(CGRectGetMinX(sourceView.frame), CGRectGetMaxY(sourceView.frame));
    CGPoint point4 = CGPointMake(CGRectGetMaxX(sourceView.frame), CGRectGetMaxY(sourceView.frame));
    
    NSArray *origins = @[@(point1),@(point2),@(point3),@(point4)];
    
    /// 默认放2颗烟花
    for (int i = 0; i < fireworksCount; i++) {
        int idx = arc4random_uniform(origins.count);
        CGPoint origin = [origins[idx] CGPointValue];
        CGVector vector = [self randomChangeVector:maxVectorChange];
        CGPoint newOrigin = CGPointMake(origin.x + vector.dx, origin.y + vector.dy);
        /// 烟火颗粒的数据源：位置、火花大小、缩放程度
        id<IFirework> firework = [self createFirework:newOrigin sparkSize:sparkSize scale:scale];
        
        for (int sparkIndex = 0; sparkIndex < sparksCount; sparkIndex++) {
            /// 火花+轨迹 = fireworkspark
            FireworkSpark *spark = [firework sparkAtIndex:sparkIndex];
            spark.sparkView.hidden = true;
            [sourceView.superview addSubview:spark.sparkView];
            
            if (canChangeZIndex) {
                CGFloat zIndexChange = arc4random_uniform(2) == 0 ? -1 : 1;
                spark.sparkView.layer.zPosition = sourceView.layer.zPosition + zIndexChange;
            } else {
                spark.sparkView.layer.zPosition = sourceView.layer.zPosition;
            }
            [self.sparkAnimator animate:spark duration:animationDuration];
        }
    }
    
}

@end
