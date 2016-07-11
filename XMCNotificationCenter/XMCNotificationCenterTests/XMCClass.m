//
//  XMCClass.m
//  XMCNotificationCenter
//
//  Created by xianmingchen on 16/7/11.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import "XMCClass.h"
#import "XMCNotificationCenter.h"

@implementation XMCClass

- (id)init
{
    self = [super init];
    {
        AddObserverWithProtocol(self, XMCProtocol);
    }
    
    return self;
}

- (void)dealloc
{
    RemoveObserver(self);
}

- (void)onUserNameChangedWithOldName:(NSString *)oldName newName:(NSString *)newName
{
    NSLog(@"%s", __func__);
}
@end
