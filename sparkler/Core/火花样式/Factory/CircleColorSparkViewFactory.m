//
//  CircleColorSparkViewFactory.m
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "CircleColorSparkViewFactory.h"
#import "UIColor+SparkColor.h"
#import "CircleColorSparkView.h"

@implementation CircleColorSparkViewFactory

- (NSArray<UIColor *> *)colors {
    return UIColor.sparkColorSet;
}

- (SparkView *)createWithData:(id<ISparkViewFactoryData>)data {
    UIColor *color = self.colors[data.index % self.colors.count];
    return [[CircleColorSparkView alloc] initWithColor:color size:data.size];
}

@end
