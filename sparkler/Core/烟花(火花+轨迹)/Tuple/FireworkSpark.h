//
//  FireworkSpark.h
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SparkView.h"
#import "ISparkTrajectory.h"

NS_ASSUME_NONNULL_BEGIN

/// 烟花的爆炸 一朵烟花+一个轨迹
@interface FireworkSpark : NSObject
@property(nonatomic, strong)SparkView *sparkView;
@property(nonatomic, strong)id<ISparkTrajectory> trajectory;
@end

NS_ASSUME_NONNULL_END
