//
//  UIColor+MM.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MM)

/**
    Get UIColor instance with specified RGBA by 256 scale.
 */
+ (UIColor *)colorWith256Red:(NSUInteger)red 
                       green:(NSUInteger)green 
                        blue:(NSUInteger)blue 
                       alpha:(CGFloat)alpha;

@end
