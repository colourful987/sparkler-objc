//
//  ClassicFireworkAnimator.m
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "ClassicFireworkAnimator.h"

@implementation ClassicFireworkAnimator

- (void)animate:(FireworkSpark *)spark duration:(NSTimeInterval)duration {
    spark.sparkView.hidden = false;
    [CATransaction begin];
    
    CAKeyframeAnimation *positionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnim.path = spark.trajectory.path.CGPath;
    positionAnim.calculationMode = kCAAnimationLinear;
    positionAnim.rotationMode = kCAAnimationRotateAuto;
    positionAnim.duration = duration;
    
    CGFloat randomMaxScale = 1.0 + (CGFloat)arc4random_uniform(7) /10.f;
    CGFloat randomMinScale = 0.5 + (CGFloat)arc4random_uniform(3) /10.f;
    
    CATransform3D fromTransform = CATransform3DIdentity;
    CATransform3D byTransform = CATransform3DScale(fromTransform, randomMaxScale, randomMaxScale, randomMaxScale);
    CATransform3D toTransform = CATransform3DScale(CATransform3DIdentity, randomMinScale, randomMinScale, randomMinScale);
    CAKeyframeAnimation *transformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    transformAnim.values = @[@(fromTransform),
                             @(byTransform),
                             @(toTransform)];
    transformAnim.duration = duration;
    transformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    spark.sparkView.layer.transform = toTransform;
    
    CAKeyframeAnimation *opacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.values = @[@1.0, @0.0];
    opacityAnim.keyTimes = @[@0.95, @0.98];
    opacityAnim.duration = duration;
    spark.sparkView.layer.opacity = 1.0;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup new];
    groupAnimation.animations = @[positionAnim, transformAnim, opacityAnim];
    groupAnimation.duration = duration;
    
    [CATransaction setCompletionBlock:^{
        [spark.sparkView removeFromSuperview];
    }];
    
    [spark.sparkView.layer addAnimation:groupAnimation forKey:@"spark-animation"];
    
    [CATransaction commit];
    
}
@end
