//
//  MMContext.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/17.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "MMConst.h"
#import "NSDictionary+MM.h"
#import "NSMutableDictionary+MM.h"

/**
    MMContext is a common context for MMLib framework.
    Every view controller has MMContext that has coredata NSManagedObjectContext,
    and it enable to access core data easily. 
 */
@interface MMContext : NSObject {
 @protected
  /**
      CoreData NSManagedContext dictionary
      {"Context key name":NSManagedObjectContext, ...}
   */
  NSMutableDictionary *coreDataContextDict_;
}


#pragma mark - core data context management

// ---- mainContext is in Documents direcory.

/**
    Get main NSManagedObjectContext that is mutable.
 */
- (NSManagedObjectContext *)mainCoreDataContext;

/**
    Set main NSManagedObjectContext that is mutable.
 */
- (void)setMainCoreDataContext:(NSManagedObjectContext *)context;


// ---- masterContext is in application. (killed if save context)

/**
    Get master NSManagedObjectContext that is immutable.(read-only)
    @returns NSManagedObjectContext
 */
- (NSManagedObjectContext *)masterCoreDataContext;

/**
    Set master NSManagedObjectContext that is immutable.(read-only)
    @param context context for master type.
 */
- (void)setMasterCoreDataContext:(NSManagedObjectContext *)context;


// ---- additional context

/**
    Get NSManagedObjectContext for key
    @param key 
    @returns NSManagedObjectContext
 */
- (NSManagedObjectContext *)coreDataContextForKey:(NSString *)key;

/**
    Set master NSManagedObjectContext that is immutable.(read-only)
    @param context context for master type.
    @param key
 */
- (void)setCoreDataContext:(NSManagedObjectContext *)context forKey:(NSString *)key;


@end
