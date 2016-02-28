//
//  UIResponder+PMRouter.h
//  28AtributedStringDemo
//
//  Created by majian on 16/2/28.
//  Copyright © 2016年 majian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (PMRouter)

- (void)router:(NSString *)routerName info:(NSDictionary *)userInfo;

@end

extern NSString * PMURLRouterNameKey;