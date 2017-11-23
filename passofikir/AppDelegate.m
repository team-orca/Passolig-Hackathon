//
//  AppDelegate.m
//
//  Created by deneyim on 17/12/2016.
//  Copyright © 2016 OrcaTeam. All rights reserved.
//


#import "AppDelegate.h"
#import "WheelOfFortuneViewController.h"
#import "StyleKit.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Test");
}
/*- (void)scheduleNotification
{
    UILocalNotification *locNot = [[UILocalNotification alloc] init];
    locNot.fireDate             = [NSDate dateWithTimeIntervalSinceNow:10 * 1 * 1];
    locNot.alertTitle=@"Test";
    locNot.alertBody=@"Test123";
    [[UIApplication sharedApplication] scheduleLocalNotification: locNot];

}
 */
- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"YES");
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    if (launchOptions != nil) {
        // Launched from push notification
        NSDictionary *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        NSLog(@"ofc");
        
    }

    [StyleKit setupAppearance];

    WheelOfFortuneViewController *controller = [WheelOfFortuneViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc]
        initWithRootViewController:controller];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
