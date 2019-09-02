//
//  DefaultSparkViewFactoryData.m
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "DefaultSparkViewFactoryData.h"

@implementation DefaultSparkViewFactoryData
- (instancetype)initWithSparkSize:(CGSize)size index:(int)index {
    self = [super init];
    
    if (self) {
        self.size = size;
        self.index = index;
    }
    
    return self;
}
@end
