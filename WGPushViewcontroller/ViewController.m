//
//  ViewController.m
//  WGPushViewcontroller
//
//  Created by wanggang on 2018/4/23.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#define WGWidth [UIScreen mainScreen].bounds.size.width
#define WGHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "WGControllerId.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = nil;
    NSInteger row = indexPath.row;
    if (row < self.dataArr.count) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.text = _dataArr[row];
        return cell;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSInteger count = self.dataArr.count;
    if (row < count) {
        switch (row) {
            case 0:{
                [[WGControllerId WGControllerIdShare] pushFromController:self toPageId:self.dataArr[row] hasParam:NO param:nil];
                break;
            }
            case 1:{
                [[WGControllerId WGControllerIdShare] pushFromController:self toPageId:self.dataArr[row] hasParam:YES param:@{@"titleStr":@"标题是传过来的"}];
                break;
            }
            case 2:{
                [[WGControllerId WGControllerIdShare] pushFromController:self toPageId:self.dataArr[row] hasParam:YES param:@{@"name":@"名字叫wg", @"age":@18}];
                break;
            }
            default:
                break;
        }
    }
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"1-1", @"1-2", @"1-3"];
    }
    return _dataArr;
}

//这里我不做适配了
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WGWidth, WGHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
