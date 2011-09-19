//
//  UIAlertView+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "UIAlertView+MM.h"

@interface FIXCATEGORYBUG_UIALERTVIEW_MM @end
@implementation FIXCATEGORYBUG_UIALERTVIEW_MM @end

@implementation UIAlertView (MM)

+ (void)showAlertWithError:(NSError *)error
                  delegate:(id)delegate 
                       tag:(NSInteger)tag {
  NSString *title = nil;
  NSString *message = nil;
  
  if ([[error localizedFailureReason] isEqualToString:@""] ||
      [error localizedFailureReason] == nil) {
    title = [NSString stringWithFormat:@"%@(%d)", [error domain], [error code]];
    message = [error localizedDescription];
  } else {
    title = [error localizedDescription];
    message = [error localizedFailureReason];
  }
  
  UIAlertView *alertView = [[UIAlertView alloc]
                            initWithTitle:title
                            message:message
                            delegate:delegate
                            cancelButtonTitle:nil
                            otherButtonTitles:
                            NSLocalizedString(kMMAlertViewCloseBtnName, @""), nil];
  [alertView setTag:tag];
  [alertView show];
  [alertView release];
}

@end
