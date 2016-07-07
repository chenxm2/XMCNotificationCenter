//
//  TestViewController.h
//  XMCNotificationCenter
//
//  Created by xianmingchen on 16/7/5.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TestViewController;
@protocol TestViewControllerObserver <NSObject>
- (void)testViewController:(TestViewController *)controller buttonClicked:(UIButton *)button;
@end

@interface TestViewController : UIViewController
@end
