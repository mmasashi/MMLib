//
//  MMAbstractCoreDataAccess.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "NSDictionary+MM.h"

/**
    CoreData Access common abstract class.
    CoreAccess class can override this class that
    will make them to acess coredata easily.
 */
@interface MMAbstractCoreDataAccess : NSObject {
 @private
  // core data NSManagedObjectContext
  NSDictionary *coreDataContextDict_;
  
  // cache of entity information
  NSDictionary *entitiesForMainContext_;
  NSDictionary *entitiesForMasterContext_;
}

/**
    init with NSManagedObjectContext dictionary that MMContext has.
 */
- (id)initWithCoreDataContextDict:(NSDictionary *)contextDict;

/**
    Count objects with specified parameters.
 */
- (NSUInteger)countObjectsFor:(NSString *)entityName
                    predicate:(NSPredicate *)predicate
              sortDescriptors:(NSArray *)sortDescriptors
                        error:(NSError **)error;

/**
    fetch objects with specified parameters.
 */
- (NSArray *)executeFetchFor:(NSString *)entityName
                   predicate:(NSPredicate *)predicate
             sortDescriptors:(NSArray *)sortDescriptors
                       error:(NSError **)error;

/**
    get an objects with specified parameters.
 */
- (id)objectFor:(NSString *)entityName
      predicate:(NSPredicate *)predicate
sortDescriptors:(NSArray *)sortDescriptors
          error:(NSError **)error;

/**
    check object with specified parameters.
    return YES if an object exists.
 */
- (BOOL)existsObjectFor:(NSString *)entityName
              predicate:(NSPredicate *)predicate
        sortDescriptors:(NSArray *)sortDescriptors
                  error:(NSError **)error;

/**
    Get NSManagedObjectContext that has the specified entityName definition.
 */
- (NSManagedObjectContext *)contextForEntityName:(NSString *)entityName;


@property (nonatomic, retain) NSDictionary *coreDataContextDict;

@end
