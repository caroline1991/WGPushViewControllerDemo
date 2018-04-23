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

+ (WGControllerId *)WGControllerIdShare;
- (NSString *)getControolerName:(NSString *)pageId;
- (void)pushFromController:(UIViewController *)fromCon toPageId:(NSString *)pageId hasParam:(BOOL)isHas param:(NSDictionary *)param;
@end
