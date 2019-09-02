//
//  ISparkViewAnimator.h
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FireworkSpark;

@protocol ISparkViewAnimator <NSObject>
- (void)animate:(FireworkSpark *)spark duration:(NSTimeInterval)duration;
@end

NS_ASSUME_NONNULL_END
