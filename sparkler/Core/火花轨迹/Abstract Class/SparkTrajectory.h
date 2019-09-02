//
//  SparkTrajectory.h
//  sparkler
//
//  Created by pmst on 2019/9/2.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISparkTrajectory.h"


NS_ASSUME_NONNULL_BEGIN

@interface SparkTrajectory : NSObject<ISparkTrajectory>
{
    UIBezierPath *_path;
}
@property(nonatomic, strong)NSMutableArray *points;
@property(nonatomic, strong, readonly)UIBezierPath *path;

- (id<ISparkTrajectory>)scale:(CGFloat)value;

- (id<ISparkTrajectory>)flip;

- (id<ISparkTrajectory>)shift:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
