//
//  MMAbstractViewController.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMConst.h"
#import "MMIndicatorView.h"
#import "MMContext.h"
#import "MMDefine.h"
#import "UIView+MM.h"
#import "UIAlertView+MM.h"

/**
    Common abstract view controller.
    This class is supported to be used for UINavigationController.
 */
@interface MMAbstractViewController : UIViewController {
 @private
  MMContext *mmContext_;
}


#pragma mark - transition

/**
    Push next view controller to navigation controller and transform to it.
 */
- (void)performTransitionToNextViewController:(UIViewController *)nextViewController
                                     animated:(BOOL)animated;

/**
    Pop current view controller and transform to previous view controller.
 */
- (void)performTransitionToPreviousViewControllerWithAnimated:(BOOL)animated;

/**
    Pop current view controller and transform to specified view controller.
 */
- (void)performTransitionToPreviousViewController:(UIViewController *)previousViewController
                                         animated:(BOOL)animated;

/**
    Pop current view controller and transform to root view controller.
 */
- (void)performTransitionToRootViewControllerWithAnimated:(BOOL)animated;


#pragma mark - handle error

/**
    Show alert view with error.
    UIAlertViewDelegate is self.
 */
- (void)handleError:(NSError *)error withTag:(NSInteger)tag;

/**
    Show alert view with error.
    UIAlertViewDelegate is self.
 */
- (void)handleError:(NSError *)error;

#pragma mark - indicator

/**
    Show indicator view on window.
    Cannot touch any view while the indicator is animating.
    Call hideIndicator to hide indicator view.
 */
- (void)showIndicator;

/**
    Show indicator view on window with text.
 */
- (void)showIndicator:(NSString *)text;

/**
    hide indicator view
 */
- (void)hideIndicator;

#pragma mark -

/**
    set MMContext
 */
@property (nonatomic, retain) MMContext *mmContext;

@end
