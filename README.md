# XMCNotificationCenter


##中文
在iOS中模块间通知我们用得最多的就是NSNotificationCenter。举个例子，现在我们有一个模块需要抛一个通知出来，我们来看代码大致是怎么写的<br/>
    
    发通知一方
    NSString *const kUserNameChangedNotification = @"UserNameChangedNotification";
    NSString *const kUserOldNameKey = @"UserOldNameKey";
    NSString *const kUserNewNameKey = @"UserNewNameKey";
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:UserNameChangedNotification object:nil userInfo:@{kUserOldNameKey:@"oldName",UserNewNameKey:"newName"}];
    
    接收通知的一方可以是
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UserNameChanged:) name:kUserNameChangedNotification object:nil];
    也可以是
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UserNameChangedNotification:) name:kUserNameChangedNotification object:nil];

从例子中可以看到有的缺点:<br/>
1.对于接收同一个事件的通知，不同的人可能会用不同的方法名，无法统一。<br/>
2.对于多参数的通知写列多代码，如要定义取信息的Key。<br/>
出于以上两点，写了这个XMCNotificationCenter，对应上面情况会变成以下<br/>

    发通知一方
    @protocol UserObserver <NSObject>
    - (void)userNameChangedWithOldName:(NSString *)oldName newName:(NSString *)newName;
    @end
    PostNotification(UserObserver, @selector(userNameChangedWithOldName:newName:), userNameChangedWithOldName:@"oldName", newName:@"newName");
    
    接收通知的一方是
    AddObserverWithProtocol(self, UserObserver);并实现UserObserver协议的userNameChangedWithOldName:newName:方法即可
    RemoveObserver(self);


XMCNotificationCenter里面方法不多，使用简单，先定义协议如UserObserver,并添加里面需要实现的方法，方法为required或optional都可以<br/>
接下来就是通知者，只要使用PostNotification宏，参数分别是协议、方法的SEL、方法调用（这里还会有XCode的提示输入）。<br/>
最后就是观察者，使用AddObserverWithProtocol添加自己需要观察的协议，并实现协议相关方法，如果是optional的方法，不实现也就不会接收到通知。
    
