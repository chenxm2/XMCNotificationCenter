//
//  XMCNotificationCenter.h
//  XMCNotificationCenter
//
//  Created by xianmingchen on 16/7/5.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import <Foundation/Foundation.h>

//添加或删除监听
#define AddObserverWithProtocol(observer, observerProtocol) [[XMCNotificationCenter defaultCenter] addObserver:observer withProtocolKey:@protocol(observerProtocol)]
#define RemoveObserverWithProtocol(observer, observerProtocol) [[XMCNotificationCenter defaultCenter] removeObserver:observer withProtocolKey:@protocol(observerProtocol)]
#define RemoveObserver(observer) [[XMCNotificationCenter defaultCenter] removeObserver:observer];

//抛通知
#define PostNotification(observerProtocol, selector, func) \
{ \
    NSArray *__observers__ = [[XMCNotificationCenter defaultCenter] observersWithProtocolKey:@protocol(observerProtocol)];\
    for (id observer in __observers__) \
    { \
        if ([observer respondsToSelector:selector]) \
        { \
            [observer func]; \
        } \
    } \
}

typedef Protocol *ObserverProtocolKey;
@interface XMCNotificationCenter : NSObject

+ (XMCNotificationCenter *)defaultCenter;

- (void)addObserver:(id)observer withProtocolKey:(ObserverProtocolKey)key;
- (void)removeObserver:(id)observer withProtocolKey:(ObserverProtocolKey)key;
- (void)removeObserver:(id)observer;
- (NSArray *)observersWithProtocolKey:(ObserverProtocolKey)key;
@end
