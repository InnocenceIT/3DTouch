![3DTouch图标快捷](http://7xsyr8.com1.z0.glb.clouddn.com/60B3E499-D9F1-4EE1-B994-BDEDDB153528.png?imageView2/1/w/200/h/355)
![3DTouchPeek](http://7xsyr8.com1.z0.glb.clouddn.com/60B0BF21F344DADB4A44565A71740495.png?imageView2/1/w/200/h/355)
![PeekAction](http://7xsyr8.com1.z0.glb.clouddn.com/F3A22AFC8E62DACC1898B52ED81773FF.png?imageView2/1/w/200/h/355)
![popVC](http://7xsyr8.com1.z0.glb.clouddn.com/1966FEDC55C592605A4E769B754D2130.png?imageView2/1/w/200/h/355)
3DTouch(shortcut/peek/peekAction/pop)
------- 
* 一个看起来不费劲的Demo.

方法
-------
3DTouch~shortcut图标按压快捷键（最多只能创建4个）<br/>
* 有两种方法创建： 1.写在项目plist下.  2.调用系统类创建.
<br/>
	* 1.在plist下UIApplicationShortcutItems数组里写死item，item便是自定义的按压快捷（看demo）。<br />
	* 2.通过系统方法创建(代码如下⬇️);
```objectivec
#pragma mark - 创建ShortcutItem快捷选项
- (void)createShortcutItems
{
    //创建item的icon图标(可以调用系统的 也可以自定义)
    //自定义;
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"cursoure_pic"];
    //系统图标;
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeBookmark];
    
    //创建ShortcutItem
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"3dtouch.test2" localizedTitle:@"Title2" localizedSubtitle:nil icon:icon1 userInfo:nil];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"3dtouch.test3" localizedTitle:@"Title3" localizedSubtitle:nil icon:icon2 userInfo:nil];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"3dtouch.test4" localizedTitle:@"Title4" localizedSubtitle:@"这是title4副标题" icon:icon3 userInfo:@{@"key":@"test3333"}];
    
    [UIApplication sharedApplication].shortcutItems = @[item1, item2, item3];
}

#pragma mark - ShortcutItem代理方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    //根据type判断是哪个shortcut点进来的;
    if([shortcutItem.type isEqualToString:@"3dtouch.test1"]){
        [_rootVC shortcutItemClick:@"1"];
    } else if ([shortcutItem.type isEqualToString:@"3dtouch.test2"]) {
        [_rootVC shortcutItemClick:@"2"];
    } else if ([shortcutItem.type isEqualToString:@"3dtouch.test3"]) {
        [_rootVC shortcutItemClick:@"3"];
    }
    else if ([shortcutItem.type isEqualToString:@"3dtouch.test4"]){
        [_rootVC shortcutItemClick:@"4"];
    }
    if (completionHandler) {
        completionHandler(YES);
    }
}
```
3DTouch~Peek、Action、Pop,请看Demo~ 一个看起来不费劲的Demo.

有啥错误请指出😳，谢谢~
`微博`:[TMDBug](http://weibo.com/fly12358 "TMDBug")
