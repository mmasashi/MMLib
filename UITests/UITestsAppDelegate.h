//
//  UITestsAppDelegate.h
//  UITests
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITestsViewController;

@interface UITestsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) UIWindow *window;

@property (nonatomic, retain) UITestsViewController *viewController;

@end
