//
//  TestViewController.m
//  XMCNotificationCenter
//
//  Created by xianmingchen on 16/7/5.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import "TestViewController.h"
#import "XMCNotificationCenter.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClicked:(id)sender {
    PostNotification(TestViewControllerObserver, @selector(testViewController:buttonClicked:), testViewController:self buttonClicked:sender);
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
