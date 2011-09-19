//
//  MMAbstractAppDelegate.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "MMAbstractAppDelegate.h"

@interface MMAbstractAppDelegate ()

@end

// ----------------------------------------------------------------------

@implementation MMAbstractAppDelegate

#pragma mark - application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//  UITestsViewController *rvc = [[[UITestsViewController alloc] init] autorelease];
//  [self setViewController:rvc];
//  self.window.rootViewController = self.viewController;
//  [self.window makeKeyAndVisible];
//  
//  [self.window addSubview:self.viewController.view];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  UIViewController *vc = [self visibleViewController];
  
  if ([vc respondsToSelector:@selector(willResignActive:)]) {
    [vc performSelector:@selector(willResignActive:) withObject:self];
  }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  UIViewController *vc = [self visibleViewController];
  
  if ([vc respondsToSelector:@selector(didEnterBackground:)]) {
    [vc performSelector:@selector(didEnterBackground:) withObject:self];
  }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  UIViewController *vc = [self visibleViewController];
  
  if ([vc respondsToSelector:@selector(willEnterForeground:)]) {
    [vc performSelector:@selector(willEnterForeground:) withObject:self];
  }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  UIViewController *vc = [self visibleViewController];
  
  if ([vc respondsToSelector:@selector(didBecomeActive:)]) {
    [vc performSelector:@selector(didBecomeActive:) withObject:self];
  }
}

- (void)applicationWillTerminate:(UIApplication *)application {
  UIViewController *vc = [self visibleViewController];
  
  if ([vc respondsToSelector:@selector(willTerminate:)]) {
    [vc performSelector:@selector(willTerminate:) withObject:self];
  }
}


#pragma mark -

- (void)createAndSetMainWindow {
  if (self.window == nil) {
    UIWindow *w = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease]; 
    [self setWindow:w];
    [w makeKeyAndVisible];
  }
}

- (UIViewController *)visibleViewController {
  
  // ---- case : UITabBarController
  if ([self.rootViewController isKindOfClass:[UITabBarController class]]) {
    UITabBarController *tbc = (UITabBarController *)self.rootViewController;
    
    // ---- case : UINavigationController
    if ([[tbc selectedViewController] isKindOfClass:[UITabBarController class]]) {
      return [(UINavigationController *)[tbc selectedViewController] visibleViewController];
      
    // ---- case : UIViewController
    } else {
      return [tbc selectedViewController];
    }
    
  // ---- case : UINavigationController
  } else if ([self.rootViewController isKindOfClass:[UINavigationController class]]) {
    return [(UINavigationController *)self.rootViewController visibleViewController];
  
  // ---- case : other view controller (Simple UIViewController)
  } else {
    return self.rootViewController;
  }
  
}

#pragma mark -

- (void)dealloc {
  [self setWindow:nil];
  [self setRootViewController:nil];
  [super dealloc];
}

@synthesize window=window_;
@synthesize rootViewController=rootViewController_;

@end
