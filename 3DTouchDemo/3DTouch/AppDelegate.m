//
//  AppDelegate.m
//  3DTouch
//
//  Created by saikr on 16/8/12.
//  Copyright © 2016年 saikr. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@property(nonatomic,strong)ViewController * rootVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    _rootVC = [[ViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:_rootVC];
    self.window.rootViewController = nav;
    
    
    
   //---------------------------------------------------------------------------//
    
    
    /*3DTouch~图标按压快捷键（最多只能创建4个）。
     有两种方法创建：
     1.写死在plist下.  2.调用系统类创建.
     */
    
    // 1.在plist下，可以看到UIApplicationShortcutItems，里面的item便是自定义的按压快捷键。
    // 2.通过系统方法创建;
    
    
    //-----系统方法创建-----
    [self createShortcutItems];
    
    
    //---------------------------------------------------------------------------//
    
    
    
    return YES;
}

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



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
