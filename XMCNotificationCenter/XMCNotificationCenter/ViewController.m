//
//  ViewController.m
//  XMCNotificationCenter
//
//  Created by xianmingchen on 16/7/5.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "XMCNotificationCenter.h"
@interface ViewController () <TestViewControllerObserver>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AddObserverWithProtocol(self, TestViewControllerObserver);
    
//    RemoveObserverWithProtocol(self, TestViewControllerObserver);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
- (IBAction)buttonClicked:(id)sender {
    TestViewController *controller = [[TestViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - TestViewControllerObserver

- (void)testViewController:(TestViewController *)controller buttonClicked:(UIButton *)button
{
    NSLog(@"%s", __func__);
}


@end
