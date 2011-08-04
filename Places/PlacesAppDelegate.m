//
//  PlacesAppDelegate.m
//  Places
//
//  Created by NICHOLAS GEH on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlacesAppDelegate.h"
#import "TopPlacesTableViewController.h"
#import "RecentPhotosTableViewController.h"
#import "PlacesTabBarController.h"

@implementation PlacesAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    tbc = [[PlacesTabBarController alloc] init];
    
    UINavigationController *topPlacesNav = [[UINavigationController alloc] init];
    TopPlacesTableViewController *tptvc = [[TopPlacesTableViewController alloc] init];
    [topPlacesNav pushViewController:tptvc animated:NO];
    topPlacesNav.tabBarItem = [[[UITabBarItem alloc] 
                                initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:0] autorelease];
    [tptvc release];

    UINavigationController *recentPhotosNav = [[UINavigationController alloc] init];
    RecentPhotosTableViewController *rptvc = [[RecentPhotosTableViewController alloc] init];
    [recentPhotosNav pushViewController:rptvc animated:NO];
    recentPhotosNav.tabBarItem = [[[UITabBarItem alloc] 
                                initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:0] autorelease];
    [rptvc release];

    
    NSArray* controllers = [NSArray arrayWithObjects:topPlacesNav, recentPhotosNav, nil];
    tbc.viewControllers = controllers;
    
    [topPlacesNav release];
    [recentPhotosNav release];
    
    [self.window addSubview:tbc.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [tbc release];
    [_window release];
    [super dealloc];
}

@end
