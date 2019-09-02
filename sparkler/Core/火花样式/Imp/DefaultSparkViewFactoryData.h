//
//  DefaultSparkViewFactoryData.h
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISparkViewFactoryData.h"
NS_ASSUME_NONNULL_BEGIN

@interface DefaultSparkViewFactoryData : NSObject<ISparkViewFactoryData>
@property(nonatomic, assign)CGSize size;
@property(nonatomic, assign)int index;

- (instancetype)initWithSparkSize:(CGSize)size index:(int)index;
@end

NS_ASSUME_NONNULL_END
