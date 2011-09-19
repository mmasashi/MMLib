//
//  UIAlertView+MM.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMConst.h"

@interface UIAlertView (MM)

/**
    Show alert view with error parameter.
 */
+ (void)showAlertWithError:(NSError *)error
                  delegate:(id)delegate 
                       tag:(NSInteger)tag;

@end
