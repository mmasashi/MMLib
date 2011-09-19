//
//  NSDate+MM.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MM)

/**
    MMLib call this method instead of [NSDate date]. (except MMLogger)
    Can control current date by overriding this method.
 */
+ (NSDate *)currentDate;

/**
    Get format string from date.
    (Gregorian calendar, ja-JP local)
 */
+ (NSDate *)dateWithDateFormat:(NSString *)format string:(NSString *)string;

@end
