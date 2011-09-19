//
//  MMDefine.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/17.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

// ------------- debug switch macro

#define MM_DEBUG

#ifdef MM_DEBUG

#define MM_DEBUG_CONSOLE_LOG // output console log
#define MM_DEBUG_FILE_LOG    // output file log

#endif


// ------------- Log methods

// Log debug
#if !defined(LOG_DEBUG)
#define LOG_DEBUG(args...) [MMLogger print:[[NSString stringWithFormat:@"%s[D]", __func__] \
stringByAppendingFormat:args], nil];
#endif

// Log info
#if !defined(LOG_INFO)
#define LOG_INFO(args...) [MMLogger print:[[NSString stringWithFormat:@"%s[I]", __func__] \
stringByAppendingFormat:args], nil];
#endif

// Log warning
#if !defined(LOG_WARN)
#define LOG_WARN(args...) [MMLogger print:[[NSString stringWithFormat:@"%s[W]", __func__] \
stringByAppendingFormat:args], nil];
#endif

// Log error
#if !defined(LOG_ERROR)
#define LOG_ERROR(error, message) [MMLogger print:[NSString stringWithFormat:\
@"%s[E] %@\nDomain:%@ Code:%d File:%@(%d)\nUserInfo:%@",\
__func__, message, [error domain], [error code], __FILE__, __LINE__, [error userInfo]]];
#endif

// Log stop watch -> start time
#if !defined(LOG_START_WATCH)
#define LOG_START_WATCH(args...) [MMLogger startWatch:[[NSString \
stringWithFormat:@"%s[SW]", __func__] \
stringByAppendingFormat:args], nil];
#endif

#if !defined(LOG_CHECK_WATCH)

// Log stop watch -> check time
#define LOG_CHECK_WATCH(args...) [MMLogger checkWatch:[[NSString \
stringWithFormat:@"%s[CW]", __func__] \
stringByAppendingFormat:args], nil];
#endif