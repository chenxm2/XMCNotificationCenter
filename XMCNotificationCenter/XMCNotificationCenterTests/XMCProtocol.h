//
//  XMCProtocol.h
//  XMCNotificationCenter
//
//  Created by xianmingchen on 16/7/11.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XMCProtocol <NSObject>
@required
@optional
- (void)onUserNameChangedWithOldName:(NSString *)oldName newName:(NSString *)newName;
@end
