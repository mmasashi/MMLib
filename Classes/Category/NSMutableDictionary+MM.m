//
//  NSMutableDictionary+MM.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "NSMutableDictionary+MM.h"

@interface FIXCATEGORYBUG_NSMUTABLEDICTIONARY_MM @end
@implementation FIXCATEGORYBUG_NSMUTABLEDICTIONARY_MM @end

@implementation NSMutableDictionary (MM)

#pragma mark - core data

- (void)setMainCoreDataContext:(NSManagedObjectContext *)context {
  [self setObject:context forKey:kMMContextMainCoreDataKey];
}

- (void)setMasterCoreDataContext:(NSManagedObjectContext *)context {
  [self setObject:context forKey:kMMContextMasterCoreDataKey];
}

- (void)setCoreDataContext:(NSManagedObjectContext *)context forKey:(NSString *)key {
  [self setObject:context forKey:key];
}

@end
