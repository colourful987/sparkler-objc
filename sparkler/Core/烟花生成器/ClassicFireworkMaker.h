//
//  ClassicFireworkMaker.h
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassicFireworkAnimator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClassicFireworkMaker : NSObject
@property(nonatomic, strong, readonly)id<ISparkViewAnimator> sparkAnimator;

- (void)addFireworks:(int)fireworksCount
         sparksCount:(int)sparksCount
          sourceView:(UIView *)sourceView
           sparkSize:(CGSize)sparkSize
               scale:(CGFloat)scale
     maxVectorChange:(CGFloat)maxVectorChange
   animationDuration:(NSTimeInterval)animationDuration
     canChangeZIndex:(BOOL)canChangeZIndex;
@end

NS_ASSUME_NONNULL_END
