//
//  NSDictionary+MM.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MMConst.h"

@interface NSDictionary (MM)


#pragma mark - core data

// ---- mainContext is in Documents direcory.

/**
 Get main NSManagedObjectContext that is mutable.
 */
- (NSManagedObjectContext *)mainCoreDataContext;

// ---- masterContext is in application. (killed if save context)

/**
 Get master NSManagedObjectContext that is immutable.(read-only)
 @returns NSManagedObjectContext
 */
- (NSManagedObjectContext *)masterCoreDataContext;

// ---- additional context

/**
 Get NSManagedObjectContext for key
 @param key 
 @returns NSManagedObjectContext
 */
- (NSManagedObjectContext *)coreDataContextForKey:(NSString *)key;

@end
