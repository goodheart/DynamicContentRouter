//
//  UIResponder+PMRouter.m
//  28AtributedStringDemo
//
//  Created by majian on 16/2/28.
//  Copyright © 2016年 majian. All rights reserved.
//

#import "UIResponder+PMRouter.h"

NSString * PMURLRouterNameKey = @"URLRouterNameKey";

@implementation UIResponder (PMRouter)

- (void)router:(NSString *)routerName info:(NSDictionary *)userInfo {
    [[self nextResponder] router:routerName info:userInfo];
}

@end
