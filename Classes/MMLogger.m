//
//  MMLogger.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "MMLogger.h"
#import "MMConst.h"
#import <unistd.h>
#import <pthread.h>

static id instance_ = nil;

@interface MMLogger ()

+ (void)vprint:(NSString *)format arguments:(va_list)args;

@end

@implementation MMLogger

+ (MMLogger *)instance {
  if (instance_ == nil) {
    instance_ = [[MMLogger alloc] init];
  }
  
  return instance_;
}

#pragma mark - public method

+ (void)printLog:(NSString *)format, ... {
    
  // ---- start print
  va_list argumentList;
  va_start(argumentList, format);
  
  //NSLogv(format, argumentList);
  [self vprint:format arguments:argumentList];
  
  // ---- end print
  va_end(argumentList);
}

+ (void)startWatch:(NSString *)format, ... {
  MMLogger *logger = [self instance];
  
  [logger setStartTime:[NSDate date]];
  NSString *log = [NSString stringWithFormat:@" -- [Start Watch] -- %@",
                   [NSString stringWithFormat:format, nil], nil];
  
  va_list argumentList;
  va_start(argumentList, format);
  [self vprint:log arguments:argumentList];
  va_end(argumentList);
}

+ (void)checkWatch:(NSString *)format, ... {
  MMLogger *logger = [self instance];
  
  if ([logger startTime] == nil) {
    [self printLog:@"Failed to check watch, because startWatch have not been called yet."];
    return;
  }
  
  NSDate *crDate = [NSDate date];
  double elapsed = [crDate timeIntervalSinceDate:logger.startTime];
  NSString *log = [NSString stringWithFormat:@" -- [Check Watch %.2f] -- %@",
                   elapsed,
                   [NSString stringWithFormat:format, nil], nil];
  
  va_list argumentList;
  va_start(argumentList, format);
  [self vprint:log arguments:argumentList];
  va_end(argumentList);
}


#pragma mark -

+ (void)vprint:(NSString *)format arguments:(va_list)args {
    
  if (format) {
    
#ifdef MM_LOG_CONSOLE
    NSLogv(format, args);
#endif

#ifdef MM_LOG_FILE
    
    NSString *logFilePath = [self logFilePath];
    if ([self checkAndCreateIntermediates:logFilePath] == NO) {
      return;
    }
    
    NSString *logBody = [NSString stringWithFormat:format, args];
    NSString *logHead = [self logHeader];
    NSString *logLine = [NSString stringWithFormat:@"%@ %@\n", logHead, logBody];
    NSData *logData = [logLine dataUsingEncoding:NSUTF8StringEncoding];
    
    // update log file
    if ([[NSFileManager defaultManager] fileExistsAtPath:logFilePath]) {
      NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:logFilePath];
      [fh seekToEndOfFile];
      [fh writeData:logData];
      [fh closeFile];
    // write new file
    } else {
      [logData writeToFile:logFilePath options:NSAtomicWrite error:nil];
    }
    
#endif
    
  }
}


#pragma mark - log file access

+ (BOOL)checkAndCreateIntermediates:(NSString *)filePath {
  NSFileManager *fileManager = [NSFileManager defaultManager];
  
  if ([fileManager fileExistsAtPath:filePath]) {
    return YES;
  }
  
  return [fileManager createDirectoryAtPath:[filePath stringByDeletingLastPathComponent]
                withIntermediateDirectories:YES
                                 attributes:nil
                                      error:NULL];
}

+ (NSString *)logFilePath {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  [formatter setCalendar:calender];
  
  [formatter setDateFormat:@"yyyyMMdd"];
  NSString *logDirName = [formatter stringFromDate:[NSDate date]];
  
  [formatter setDateFormat:@"yyyyMMdd_HH"];
  NSString *logFileName = [formatter stringFromDate:[NSDate date]];
  
  [formatter release];
  [calender release];
  
  // make log file path
  return [NSString stringWithFormat:@"%@/%@/%@.log",
          [[NSBundle bundleForClass:self.class] bundlePath], 
           kMMLoggerBaseDir,
           logDirName,
           logFileName
           ];
}

#pragma mark - log string

// Get log header string
+ (NSString *)logHeader {
  return [NSString stringWithFormat:@"%@ %@", [self logCurrentDate], [self logProcInfo]];
}

// Get current date string
+ (NSString *)logCurrentDate {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  [formatter setCalendar:calendar];
  [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
  NSString *currentDateStr = [formatter stringFromDate:[NSDate date]];
  
  [calendar release];
  [formatter release];
  
  return currentDateStr;
}

// Get process information
+ (NSString *)logProcInfo {
  NSProcessInfo *info = [NSProcessInfo processInfo];
  
  NSString *threadType = [[NSThread currentThread] isMainThread] ? 
  kMMLoggerThreadTypeMain : kMMLoggerThreadTypeSub;
  
  mach_port_t tid = pthread_mach_thread_np(pthread_self());
  
  return [NSString stringWithFormat:@"%@[%@][%d:%u]", 
          info.processName, threadType, info.processIdentifier, tid];
}


#pragma mark -

- (void)dealloc {
  [self setStartTime:nil];
  [super dealloc];
}

@synthesize startTime=startTime_;

@end
