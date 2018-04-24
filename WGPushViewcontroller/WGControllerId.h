//
//  WGControllerId.h
//  WGPushViewcontroller
//
//  Created by wanggang on 2018/4/23.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WGControllerId : NSObject

//单例
+ (WGControllerId *)WGControllerIdShare;
//根据页面id获取类名
- (NSString *)getControolerName:(NSString *)pageId;
//进行页面跳转的接口，fromCon是从哪个页面开始跳，toPageId是将要跳转到的页面id，isHas代表是否需要传值 ，param是需要传的值
- (void)pushFromController:(UIViewController *)fromCon toPageId:(NSString *)pageId hasParam:(BOOL)isHas param:(NSDictionary *)param;
@end
