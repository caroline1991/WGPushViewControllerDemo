//
//  WGThreeViewController.m
//  WGPushViewcontroller
//
//  Created by wanggang on 2018/4/23.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGThreeViewController.h"

@interface WGThreeViewController ()

@end

@implementation WGThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.name;
    self.view.backgroundColor = [UIColor greenColor];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showInfo];
    });
}

- (void)showInfo{
    NSString *str = [NSString stringWithFormat:@"%@今年%@了",self.name,self.age];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"remind" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
