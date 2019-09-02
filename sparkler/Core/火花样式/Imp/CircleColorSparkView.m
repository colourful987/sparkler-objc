//
//  CircleColorSparkView.m
//  sparkler
//
//  Created by pmst on 2019/9/2.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "CircleColorSparkView.h"

@implementation CircleColorSparkView

- (instancetype)initWithColor:(UIColor *)color size:(CGSize)size {
    self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    if (self) {
        self.backgroundColor = color;
        self.layer.cornerRadius = CGRectGetWidth(self.frame) /2.f;
    }
    
    return self;
}

@end
