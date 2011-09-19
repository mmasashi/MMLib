//
//  NSDateFormatter+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "NSDateFormatter+MM.h"

@interface FIXCATEGORYBUG_NSDATEFORMATTER_MM @end
@implementation FIXCATEGORYBUG_NSDATEFORMATTER_MM @end

@implementation NSDateFormatter (MM)

- (id)initWithGregorianCalendar {
  self = [super init];
  
  if (self) {
    NSLocale *tmpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"jp-JP"];
    NSCalendar *gregCalendar = [[NSCalendar alloc] 
                                initWithCalendarIdentifier:NSGregorianCalendar];
    [self setLocale:tmpLocale];
    [self setCalendar:gregCalendar];
    
    [tmpLocale release];
    [gregCalendar release];
  }
  
  return self;
}


@end
