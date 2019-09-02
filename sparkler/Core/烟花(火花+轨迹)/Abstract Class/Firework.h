//
//  Firework.h
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FireworkSpark.h"
#import "IFirework.h"

NS_ASSUME_NONNULL_BEGIN

/// 抽象基类 提供了默认的 `- (FireworkSpark *)sparkAtIndex:(int)idx` 实现 来组合生成
@interface Firework : NSObject<IFirework>
@property(nonatomic, assign)CGPoint origin;
@property(nonatomic, assign)CGFloat scale;
@property(nonatomic, assign)CGSize sparkSize;
@end

NS_ASSUME_NONNULL_END
