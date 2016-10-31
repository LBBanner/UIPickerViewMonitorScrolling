//
//  DemoViewController.m
//  ICEPickerViewScrollingMonitor
//
//  Created by 凌斌 on 16/10/31.
//  Copyright © 2016年 ling. All rights reserved.
//

#import "DemoViewController.h"
#import "UIPickerView+ScrollingMonitor.h"

@interface DemoViewController () <UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) UIPickerView *demoPickerView;
@property (nonatomic,strong) NSArray *dataArr;
@end

@implementation DemoViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 2.monitor pickerView whether scrollingt
    [_demoPickerView isScrolling:^(BOOL scrolling) {
        NSLog(@"😝PickerView status:%@",scrolling?@"is scrolling":@"scrolling stop");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.create pickerView
    [self createPickerView];
}

- (void)createPickerView {
    _dataArr = @[@"0",@"1",@"2",@"3",
                 @"4",@"5",@"6",@"7",
                 @"8",@"9",@"10",@"11"];
    _demoPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 150, 300)];
    _demoPickerView.center = self.view.center;
    _demoPickerView.backgroundColor = [UIColor purpleColor];
    _demoPickerView.delegate = self;
    _demoPickerView.dataSource  = self;
    [self.view addSubview:_demoPickerView];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _dataArr.count;
}

#pragma mark - UIPickerViewDelegate
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = _dataArr[row];
    return title;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    NSLog(@"select component:%ld row:%ld",component,row);
}

@end
