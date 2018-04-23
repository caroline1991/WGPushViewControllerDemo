//
//  WGControllerId.m
//  WGPushViewcontroller
//
//  Created by wanggang on 2018/4/23.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGControllerId.h"
#import <objc/message.h>

@implementation WGControllerId

static WGControllerId *instence = nil;
+ (WGControllerId *)WGControllerIdShare{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instence = [[WGControllerId alloc] init];
    });
    return instence;
}

/*
 页面跳转的类统一在这里管理，key唯一，例如@"1-2"中1可代表tabbar中第1个
 */
- (NSString *)getControolerName:(NSString *)pageId{
    NSDictionary *pageDic = @{@"1-1":@"WGOneViewController",
                              @"1-2":@"WGTwoViewController",
                              @"1-3":@"WGThreeViewController"
        
    };
    return [pageDic valueForKey:pageId];
}

- (void)pushFromController:(UIViewController *)fromCon toPageId:(NSString *)pageId hasParam:(BOOL)isHas param:(NSDictionary *)param{
    NSString *className = [self getControolerName:pageId];
    Class classCon = NSClassFromString(className);
    id toCon = [[classCon alloc] init];
    
    if (isHas) {
        NSArray *keyArr = [param allKeys];
        for (int i = 0; i<keyArr.count; i++) {
            NSString *key = [keyArr objectAtIndex:i];
            id value = [param valueForKey:key];
            //把key的首字母大写
            NSString *firstStr = [key substringWithRange:NSMakeRange(0, 1)].uppercaseString;
            NSString *restStr = [key substringFromIndex:1];
            //生成对应属性的set方法
            NSString *selName = [NSString stringWithFormat:@"set%@%@:", firstStr, restStr];
            SEL method = NSSelectorFromString(selName);
            if ([toCon respondsToSelector:method]) {
                //等价于controller.shuxing = value;
                objc_msgSend(toCon, method, value);
            }
        }
    }
    [fromCon.navigationController pushViewController:toCon animated:YES];
}


@end
