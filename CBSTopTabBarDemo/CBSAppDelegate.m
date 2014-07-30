//
//  CBSAppDelegate.m
//  CBSTopTabBarDemo
//
//  Created by Claude Sutterlin on 6/25/14.
//  Copyright (c) 2014 Coffee Bean Studios LLC. All rights reserved.
//

#import "CBSAppDelegate.h"
#import "CBSTopTabBarController.h"
#import "CBSDemoViewController.h"

@implementation CBSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setCustomAppearance];
    
    CBSDemoViewController *vc1 = [[CBSDemoViewController alloc] initWithNibName:@"CBSDemoViewController" bundle:nil];
    vc1.view.backgroundColor = [UIColor redColor];
    vc1.title = @"Home";
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image: [UIImage imageNamed:@"01-refresh.png"]  selectedImage:[UIImage imageNamed:@"01-refresh.png"]];
    
    CBSDemoViewController *vc2 = [[CBSDemoViewController alloc] initWithNibName:@"CBSDemoViewController" bundle:nil];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.title = @"Profile";
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Profile" image: [UIImage imageNamed:@"02-redo.png"]  selectedImage:[UIImage imageNamed:@"02-redo.png"]];

    CBSDemoViewController *vc3 = [[CBSDemoViewController alloc] initWithNibName:@"CBSDemoViewController" bundle:nil];
    vc3.view.backgroundColor = [UIColor blueColor];
    vc3.title = @"Acumen";
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Acumen" image: [UIImage imageNamed:@"03-loopback.png"]  selectedImage:[UIImage imageNamed:@"03-loopback.png"]];
    
    CBSDemoViewController *vc4 = [[CBSDemoViewController alloc] initWithNibName:@"CBSDemoViewController" bundle:nil];
    vc4.view.backgroundColor = [UIColor yellowColor];
    vc4.title = @"My Rewards";
    vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"My Rewards" image: [UIImage imageNamed:@"04-squiggle.png"]  selectedImage:[UIImage imageNamed:@"04-squiggle.png"]];
    
    CBSDemoViewController *vc5 = [[CBSDemoViewController alloc] initWithNibName:@"CBSDemoViewController" bundle:nil];
    vc5.view.backgroundColor = [UIColor purpleColor];
    vc5.title = @"More";
    vc5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"More" image: [UIImage imageNamed:@"05-shuffle.png"]  selectedImage:[UIImage imageNamed:@"05-shuffle.png"]];
    
    CBSTopTabBarController *topBarController = [[CBSTopTabBarController alloc] initWithViewControllers: @[vc1, vc2, vc3, vc4, vc5]];
    topBarController.title = @"CBS Bar Demo";
    topBarController.tabBarStyle = CBSTopTabBarStyleImage;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController: topBarController];
    navController.navigationBar.translucent = NO;
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) setCustomAppearance{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.19 green:0.19 blue:0.19 alpha:1]];
    [[UINavigationBar appearance] setBackgroundColor: [UIColor colorWithRed:0.19 green:0.19 blue:0.19 alpha:1]];
    [[UINavigationBar appearance] setTintColor: [UIColor whiteColor]];
    NSShadow * shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    
    NSDictionary * navBarTitleTextAttributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor],
                                                  NSShadowAttributeName          : shadow,
                                                  NSFontAttributeName            : [UIFont systemFontOfSize: 17.0]};
    
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleTextAttributes];

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
