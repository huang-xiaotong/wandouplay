//
//  AppDelegate.m
//  WanDou
//
//  Created by xyooyy on 14/11/28.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "JmTVViewController.h"
#import "JmVarietyViewController.h"
#import "JmAnimationViewController.h"
#import "JmMovieViewController.h"
#import "JmFavouritesViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ViewController *viewCtrl = [[ViewController alloc]init];
    JmAnimationViewController *animationCtrl = [[JmAnimationViewController alloc]init];
    JmMovieViewController *movieCtrl = [[JmMovieViewController alloc]init];
    JmTVViewController *TVCtrl = [[JmTVViewController alloc]init];
    JmVarietyViewController *varietyCtrl = [[JmVarietyViewController alloc]init];
    UITabBarController *tabBarCtrl = [[UITabBarController alloc]init];
    tabBarCtrl.viewControllers = [NSArray arrayWithObjects:viewCtrl, TVCtrl, movieCtrl, animationCtrl, varietyCtrl, nil];
    UITabBarItem *viewCtrlItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil selectedImage:nil];
    viewCtrl.tabBarItem = viewCtrlItem;
    UITabBarItem *TVCtrlItem = [[UITabBarItem alloc]initWithTitle:@"电视剧" image:nil selectedImage:nil];
    TVCtrl.tabBarItem = TVCtrlItem;
    UITabBarItem *movieCtrlItem = [[UITabBarItem alloc]initWithTitle:@"电影" image:nil selectedImage:nil];
    movieCtrl.tabBarItem = movieCtrlItem;
    UITabBarItem *animationCtrlItem = [[UITabBarItem alloc]initWithTitle:@"动漫" image:nil selectedImage:nil];
    animationCtrl.tabBarItem = animationCtrlItem;
    UITabBarItem *varietyCtrlItem = [[UITabBarItem alloc]initWithTitle:@"综艺" image:nil selectedImage:nil];
    varietyCtrl.tabBarItem = varietyCtrlItem;
    self.window.rootViewController = tabBarCtrl;
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
