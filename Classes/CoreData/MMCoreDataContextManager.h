//
//  MMCoreDataContextManager.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <CoreData/CoreData.h>

/**
    CoreData management class.
 */
@interface MMCoreDataContextManager : NSObject {
 @protected
  NSDictionary *persistentStoreCoordinatorOptions;
}

/**
    Build core data NSManagedObjectContext.
    PersistentStoreCoorinator Options setting is
      - NSMigratePersistentStoresAutomaticallyOption : YES
      - NSInferMappingModelAutomaticallyOption : YES
 */
+ (NSManagedObjectContext *)buildDefaultCoreDataContext:(NSArray *)momdNames
                                             sqlitePath:(NSString *)sqlitePath;

/**
    Build core data NSManagedObjectContext with specified persistentStoreCoordinatorOptions.
 */
+ (NSManagedObjectContext *)buildCoreDataContext:(NSArray *)momdNames
                                      sqlitePath:(NSString *)sqlitePath
                                         options:(NSDictionary *)persistentStoreCoordinatorOptions;

/**
    Check necessity of migration. 
 */
+ (BOOL)isMigrationNecessary:(NSArray *)momdNames
                  sqlitePath:(NSString *)sqlitePath
                       error:(NSError **)error;

@end
