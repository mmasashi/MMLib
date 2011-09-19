//
//  MMConst.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/17.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#pragma mark - MMLogger

static NSString * const kMMLoggerBaseDir = @".log";

static NSString * const kMMLoggerThreadTypeMain = @"M";
static NSString * const kMMLoggerThreadTypeSub = @"S";

#pragma mark - MMDefaults

static NSString * const kMMDefaultsFileName = @"MMDefaults.plist";


#pragma mark - MMUserDefaults

static NSString * const kMMUserDefaultsFileName = @"MMUserDefaults.plist";


#pragma mark - MMFileManager

// under documents
static NSString * const kMMFileManagerAppRootDirName = @".base";

// under app
static NSString * const kMMFileManagerAppResourcesDirName = @"AppResources";
static NSString * const kMMFileManagerInitialResourcesDirName = @"initialResources";
static NSString * const kMMFileManagerContentsDirName = @"contents";
static NSString * const kMMFileManagerSystemImgDirName = @"img";

#pragma mark - MMContext

// contextDictKey 
static NSString * const kMMContextMainCoreDataKey = @"mainContext";
static NSString * const kMMContextMasterCoreDataKey = @"masterContext";


#pragma mark - UIAlertView+MM

static NSString * const kMMAlertViewCloseBtnName = @"Close";

#pragma mark - NSError

static NSString * const kMMErrorDomain = @"MMLibError";

/**
   NSError error code for MMLibError domain.
 */
typedef enum MMErrorCode_ {
  MMErrorCodeDefault = 0,
  
} MMErrorCode;


#pragma mark -

/**
   UIView tag
   0- 100 : MMLib 
   100-   : Application
 */
typedef enum MMUIViewTag_ {
  MMUIViewTagDefault = 0,
  MMUIViewTagIndicator,
  
} MMUIViewTag;

/**
   AlertView tag
   0- 100 : MMLib 
   100-   : Application
 */
typedef enum MMAlertViewTag_ {
  MMAlertViewTagDefault = 0,
  MMAlertViewTagError,
  
} MMAlertViewTag;



