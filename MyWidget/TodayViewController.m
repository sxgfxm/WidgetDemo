//
//  TodayViewController.m
//  MyWidget
//
//  Created by 宋晓光 on 19/10/2016.
//  Copyright © 2016 Light. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property(nonatomic, strong) UILabel *label;
@end

@implementation TodayViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.label = [[UILabel alloc]
      initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 30)];
  self.label.text = [NSString stringWithFormat:@"%@", [NSDate date]];
  UITapGestureRecognizer *tap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(tapAction)];
  [self.label addGestureRecognizer:tap];
  self.label.userInteractionEnabled = YES;
  [self.view addSubview:self.label];
  [self.view addGestureRecognizer:tap];
  NSLog(@"%@", NSStringFromCGRect(self.view.bounds));
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:
    (void (^)(NCUpdateResult))completionHandler {
  // Perform any setup necessary in order to update the view.

  // If an error is encountered, use NCUpdateResultFailed
  // If there's no update required, use NCUpdateResultNoData
  // If there's an update, use NCUpdateResultNewData

  NSLog(@"update data");

  self.label.text = [NSString stringWithFormat:@"%@", [NSDate date]];

  completionHandler(NCUpdateResultNewData);
}

- (void)tapAction {
  //  跳转至主应用
  [self.extensionContext openURL:[NSURL URLWithString:@"WidgetDemo://home"]
               completionHandler:nil];
}

@end
