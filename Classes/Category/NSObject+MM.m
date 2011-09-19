//
//  NSObject+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "NSObject+MM.h"

@interface FIXCATEGORYBUG_NSOBJECT_MM @end
@implementation FIXCATEGORYBUG_NSOBJECT_MM @end

@implementation NSObject (MM)

- (void)waitAndRunDefault:(NSTimeInterval)seconds {
  NSDate *start = [NSDate date];
  NSRunLoop *theRL = [NSRunLoop currentRunLoop];
  while ([theRL runMode:NSDefaultRunLoopMode
             beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.01f]]) {
    NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:start];
    if (time > seconds) {
      break;
    }
  }
}

@end
