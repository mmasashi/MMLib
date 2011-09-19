//
//  MMAbstractAppDelegate.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    Common app delegate for MMLib.
 */
@interface MMAbstractAppDelegate : NSObject
<UIApplicationDelegate> {
 @private
  UIWindow *window_;
  UIViewController *rootViewController_;
}

/**
    Create a main window and set it visibile.
    Can get window property access, after call this method.
 */
- (void)createAndSetMainWindow;

/**
    Get visible view controller.
 */
- (UIViewController *)visibleViewController;

/**
   set main window
 */
@property (nonatomic, retain) UIWindow *window;

/**
   set root view controller.
 */
@property (nonatomic, retain) UIViewController *rootViewController;

@end


/**
    Application lifecycle delegate for view controller
 */
@protocol MMAppDelegate <NSObject>
 @optional

- (void)willResignActive:(id)sender;
- (void)didEnterBackground:(id)sender;
- (void)willEnterForeground:(id)sender;
- (void)didBecomeActive:(id)sender;
- (void)willTerminate:(id)sender;

@end
