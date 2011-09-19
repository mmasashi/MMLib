//
//  NSMutableDictionary+MM.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MMConst.h"

@interface NSMutableDictionary (MM)


#pragma mark - core data

// ---- mainContext is in Documents direcory.

/**
 Set main NSManagedObjectContext that is mutable.
 */
- (void)setMainCoreDataContext:(NSManagedObjectContext *)context;


// ---- masterContext is in application. (killed if save context)

/**
 Set master NSManagedObjectContext that is immutable.(read-only)
 @param context context for master type.
 */
- (void)setMasterCoreDataContext:(NSManagedObjectContext *)context;


// ---- additional context

/**
 Set master NSManagedObjectContext that is immutable.(read-only)
 @param context context for master type.
 @param key
 */
- (void)setCoreDataContext:(NSManagedObjectContext *)context forKey:(NSString *)key;

@end
