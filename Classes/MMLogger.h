//
//  MMLogger.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    Common logger class.
    This class has following functions.
    - output log to console (MM_LOG_CONSOLE)
    - output log to file (MM_LOG_FILE)
    - stop watch
 
    Do not call these methods of this class, 
    instead use macro like LOG_DEBUG.
 */
@interface MMLogger : NSObject {
 @private
  NSDate *startTime_;
}

/**
    Print log to file and console. 
 */
+ (void)printLog:(NSString *)format, ...;

/**
    Start watch.
    Save start time and print log that includes start time. 
 */
+ (void)startWatch:(NSString *)format, ...;

/**
    Check watch.
    Print elapsed time from startTime.
    Print error if startWatch was'nt called.
 */
+ (void)checkWatch:(NSString *)format, ...;

/**
    Create directory with intermediates.
    Return YES if directory exists already or it succeeded to create directory.
 */
+ (BOOL)checkAndCreateIntermediates:(NSString *)filePath;

/**
    Get logFilePath.
 */
+ (NSString *)logFilePath;


#pragma mark - utility 

/**
    [Date-info] [Proc-info]
 */
+ (NSString *)logHeader;

/**
    [Date-info]
    yyyy-MM-dd HH:mm:ss.SSS
 */
+ (NSString *)logCurrentDate;

/**
    [Proc-info]
    ProcName[ProcType][ProcId:ThreadId]
 */
+ (NSString *)logProcInfo;

/**
    The start time for watch.
    Is set when called startWatch.
 */
@property (nonatomic, retain) NSDate *startTime;

@end
