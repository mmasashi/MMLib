//
//  UIView+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "UIView+MM.h"

@interface FIXCATEGORYBUG_UIVIEW_MM @end
@implementation FIXCATEGORYBUG_UIVIEW_MM @end

@implementation UIView (MM)

- (id)viewWithTagFromSubviews:(NSInteger)tag {
  for (UIView *v in self.subviews) {
    if (v.tag == tag) {
      return v;
    }
  }
  return nil;
}


@end
