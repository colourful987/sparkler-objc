//
//  Firework.m
//  sparkler
//
//  Created by pmst on 2019/9/3.
//  Copyright © 2019 pmst. All rights reserved.
//

#import "Firework.h"

@implementation Firework
- (FireworkSpark *)sparkAtIndex:(int)idx {
    FireworkSpark *spark = [FireworkSpark new];
    spark.sparkView = [self sparkView:idx];
    spark.trajectory = [self trajectory:idx];
    return spark;
}

@end
