//
//  NSString+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "NSString+MM.h"
#import "NSDateFormatter+MM.h"

@interface FIXCATEGORYBUG_NSSTRING_MM @end
@implementation FIXCATEGORYBUG_NSSTRING_MM @end

@implementation NSString (MM)

+ (NSString *)stringWithDateFormat:(NSString *)format date:(NSDate *)date {
//  NSLocale *tmpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"jp-JP"];
//  NSCalendar *gregCalendar = [[NSCalendar alloc] 
//                              initWithCalendarIdentifier:NSGregorianCalendar];
//  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//
//  [formatter setCalendar:gregCalendar];
//  [formatter setLocale:tmpLocale];
//  [formatter setDateFormat:format];
//  
//  [tmpLocale release];
//  [gregCalendar release];
  
  NSDateFormatter *formatter = [[NSDateFormatter alloc] initWithGregorianCalendar];
  NSString *dateStr = [formatter stringFromDate:date];
  [formatter release];
  
  return dateStr;
}

@end
