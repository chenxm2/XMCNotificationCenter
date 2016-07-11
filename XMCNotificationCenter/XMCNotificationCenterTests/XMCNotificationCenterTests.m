//
//  XMCNotificationCenterTests.m
//  XMCNotificationCenterTests
//
//  Created by xianmingchen on 16/7/5.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XMCNotificationCenter.h"
#import "XMCClass.h"

@interface XMCNotificationCenterTests : XCTestCase
@property (nonatomic, strong) XMCClass *xmcObject;
@end

@implementation XMCNotificationCenterTests

- (void)setUp {
    [super setUp];
    NSLog(@"%s", __func__);

    // Put setup code here. This method is called before the invocation of each test method in the class.
}


- (void)testXMCNotificationCenter
{
    _xmcObject = [[XMCClass alloc] init];
    NSArray *array = [[XMCNotificationCenter defaultCenter] observersWithProtocolKey:@protocol(XMCProtocol)];
    XCTAssertEqual(1, [array count]);
    id object = [array objectAtIndex:0];
    XCTAssertEqualObjects(object, _xmcObject);
    PostNotification(XMCProtocol, @selector(onUserNameChangedWithOldName:newName:), onUserNameChangedWithOldName:@"oldName" newName:@"newName");
    _xmcObject = nil;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSArray *array = [[XMCNotificationCenter defaultCenter] observersWithProtocolKey:@protocol(XMCProtocol)];
    XCTAssertEqual(0, [array count]);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
