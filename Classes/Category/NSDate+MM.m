//
//  NSDate+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "NSDate+MM.h"
#import "NSDateFormatter+MM.h"

@interface FIXCATEGORYBUG_NSDATE_MM @end
@implementation FIXCATEGORYBUG_NSDATE_MM @end

@implementation NSDate (MM)

+ (NSDate *)currentDate {
  return [self date];
}

+ (NSDate *)dateWithDateFormat:(NSString *)format 
                        string:(NSString *)string {
  if (format == nil || string == nil) {
    return nil;
  }
  
  NSInteger formatLength = [format length];
  if ([string length] < formatLength) {
    return nil;
  }
  
  // Cut tail if target string is longer than formt string.
  NSString *targetString = [string substringToIndex:formatLength];
  
  NSDateFormatter *formatter = [[NSDateFormatter alloc] initWithGregorianCalendar];
  [formatter setTimeStyle:NSDateFormatterFullStyle];
  [formatter setDateFormat:format];
  
  // convert
  NSDate *date = [formatter dateFromString:targetString];
  [formatter release];
  
  return date;
}

- (NSDate *)firstDateOfThisMonth {
  NSCalendar *calendar = [[[NSCalendar alloc] 
                           initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
  
  unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |
  NSDayCalendarUnit | NSHourCalendarUnit |
  NSMinuteCalendarUnit | NSSecondCalendarUnit;
  NSDateComponents *compsFirstDate = [calendar components:unitFlags fromDate:self];
  [compsFirstDate setDay:1];
  return  [calendar dateFromComponents:compsFirstDate];
}

- (NSDate *)firstDateOfNextMonth {
  NSCalendar *calendar = [[[NSCalendar alloc] 
                           initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
  
  // add one month
  NSDateComponents *compsNextMonth = [[NSDateComponents alloc] init];
  compsNextMonth.month = 1;
  NSDate *nextMonth = [calendar dateByAddingComponents:compsNextMonth
                                                toDate:self
                                               options:0];
  [compsNextMonth release];
  
  unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |
  NSDayCalendarUnit | NSHourCalendarUnit |
  NSMinuteCalendarUnit | NSSecondCalendarUnit;
  NSDateComponents *compsFirstDate = [calendar components:unitFlags
                                                 fromDate:nextMonth];

  [compsFirstDate setDay:1];
  
  return  [calendar dateFromComponents:compsFirstDate];
}


@end
