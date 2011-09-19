//
//  MMIndicatorView.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    Indicator view.
 */
@interface MMIndicatorView : UIView {
 @private
  UIActivityIndicatorView *indicatorView_;
  
  UILabel *textLabel_;
}

/**
    start indicator animation view and set alpha to 1.0f
 */
- (void)startIndicatorAnimation;

/**
 start indicator animation view and set alpha to 1.0f with text
 */
- (void)startIndicatorAnimation:(NSString *)titleText;

/**
    stop indicator animation view and set alpha to 0.0f
 */
- (void)stopIndicatorAnimation;


@property (nonatomic, retain) UIActivityIndicatorView *indicatorView;

@property (nonatomic, retain) UILabel *textLabel;

@end
