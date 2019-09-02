//
//  ISparkViewFactoryData.h
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ISparkViewFactoryData <NSObject>
@property(nonatomic, assign)CGSize size;
@property(nonatomic, assign)int index;

@end

NS_ASSUME_NONNULL_END
