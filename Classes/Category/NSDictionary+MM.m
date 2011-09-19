//
//  NSDictionary+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "NSDictionary+MM.h"

@interface FIXCATEGORYBUG_NSDICTIONARY_MM @end
@implementation FIXCATEGORYBUG_NSDICTIONARY_MM @end

@implementation NSDictionary (MM)

#pragma mark - core data

- (NSManagedObjectContext *)mainCoreDataContext {
  return [self objectForKey:kMMContextMainCoreDataKey];
}

- (NSManagedObjectContext *)masterCoreDataContext {
  return [self objectForKey:kMMContextMasterCoreDataKey];
}

- (NSManagedObjectContext *)coreDataContextForKey:(NSString *)key {
  return [self objectForKey:key];
}

@end
