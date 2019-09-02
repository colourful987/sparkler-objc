//
//  CircleColorSparkViewFactory.h
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISparkViewFactory.h"
#import "ISparkViewFactoryData.h"

NS_ASSUME_NONNULL_BEGIN

@interface CircleColorSparkViewFactory : NSObject<ISparkViewFactory>
@property(nonatomic, strong, readonly)NSArray<UIColor *> *colors;
@end

NS_ASSUME_NONNULL_END
