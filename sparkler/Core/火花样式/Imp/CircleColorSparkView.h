//
//  CircleColorSparkView.h
//  sparkler
//
//  Created by pmst on 2019/9/2.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "SparkView.h"

NS_ASSUME_NONNULL_BEGIN

/// 圆形带色火花
@interface CircleColorSparkView : SparkView
- (instancetype)initWithColor:(UIColor *)color size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
