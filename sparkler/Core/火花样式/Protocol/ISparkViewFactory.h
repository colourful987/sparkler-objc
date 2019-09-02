//
//  ISparkViewFactory.h
//  sparkler
//
//  Created by pmst on 2019/9/2.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SparkView;
@protocol ISparkViewFactoryData;

@protocol ISparkViewFactory <NSObject>
- (SparkView *)createWithData:(id<ISparkViewFactoryData>)data;
@end

NS_ASSUME_NONNULL_END
