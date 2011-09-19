//
//  UIColor+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "UIColor+MM.h"

@interface FIXCATEGORYBUG_UICOLOR_MM @end
@implementation FIXCATEGORYBUG_UICOLOR_MM @end

@implementation UIColor (MM)

+ (UIColor *)colorWith256Red:(NSUInteger)red
                       green:(NSUInteger)green
                        blue:(NSUInteger)blue 
                       alpha:(CGFloat)alpha {
  
  return [UIColor colorWithRed:(1.0f * red) / 255
                         green:(1.0f * green) / 255
                          blue:(1.0f * blue) / 255
                         alpha:alpha];
}

@end
