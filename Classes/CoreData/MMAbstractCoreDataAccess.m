//
//  MMAbstractCoreDataAccess.m
//  MMLib
//
//  Created by Miyazaki * on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "MMAbstractCoreDataAccess.h"

@interface MMAbstractCoreDataAccess ()

@property (nonatomic, retain) NSDictionary *entitiesForMainContext;
@property (nonatomic, retain) NSDictionary *entitiesForMasterContext;

@end

@implementation MMAbstractCoreDataAccess

- (id)initWithCoreDataContextDict:(NSDictionary *)contextDict {
  self = [super init];
  
  if (self) {
    [self setCoreDataContextDict:contextDict];
  }
  
  return self;
}

- (NSUInteger)countObjectsFor:(NSString *)entityName
                    predicate:(NSPredicate *)predicate
              sortDescriptors:(NSArray *)sortDescriptors
                        error:(NSError **)error {
  NSManagedObjectContext *context = [self contextForEntityName:entityName];
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                            inManagedObjectContext:context];
  [fetchRequest setEntity:entity];
  [fetchRequest setPredicate:predicate];
  [fetchRequest setSortDescriptors:sortDescriptors];
  
  NSUInteger fetchCount = [context countForFetchRequest:fetchRequest error:error];
  [fetchRequest release];
  
  return fetchCount;
}

- (NSArray *)executeFetchFor:(NSString *)entityName 
                   predicate:(NSPredicate *)predicate 
             sortDescriptors:(NSArray *)sortDescriptors
                       error:(NSError **)error {
  NSManagedObjectContext *context = [self contextForEntityName:entityName];
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                            inManagedObjectContext:context];
  [fetchRequest setEntity:entity];
  [fetchRequest setPredicate:predicate];
  [fetchRequest setSortDescriptors:sortDescriptors];
  
  NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:error];
  [fetchRequest release];
  
  return fetchedObjects;
}

- (id)objectFor:(NSString *)entityName
      predicate:(NSPredicate *)predicate
sortDescriptors:(NSArray *)sortDescriptors
          error:(NSError **)error {
  NSManagedObjectContext *context = [self contextForEntityName:entityName];
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                            inManagedObjectContext:context];
  [fetchRequest setEntity:entity];
  [fetchRequest setPredicate:predicate];
  [fetchRequest setSortDescriptors:sortDescriptors];
  [fetchRequest setFetchLimit:1u];
  
  NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:error];
  [fetchRequest release];
  
  if ([fetchedObjects count] > 0) {
    return [fetchedObjects objectAtIndex:0];
  }
  
  return nil;
}

- (BOOL)existsObjectFor:(NSString *)entityName
              predicate:(NSPredicate *)predicate
        sortDescriptors:(NSArray *)sortDescriptors
                  error:(NSError **)error {
  NSManagedObjectContext *context = [self contextForEntityName:entityName];
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                            inManagedObjectContext:context];
  [fetchRequest setEntity:entity];
  [fetchRequest setPredicate:predicate];
  [fetchRequest setSortDescriptors:sortDescriptors];
  [fetchRequest setFetchLimit:1u];
  
  NSUInteger fetchCount = [context countForFetchRequest:fetchRequest error:error];
  [fetchRequest release];
  
  return (fetchCount > 0);
}

- (NSManagedObjectContext *)contextForEntityName:(NSString *)entityName {
  NSManagedObjectContext *mainContext = [self.coreDataContextDict mainCoreDataContext];
  NSManagedObjectContext *masterContext = [self.coreDataContextDict masterCoreDataContext];
  
  if (self.entitiesForMainContext == nil) {
    NSDictionary *dict = [[[mainContext persistentStoreCoordinator]
                           managedObjectModel] entitiesByName];
    [self setEntitiesForMainContext:dict];
  }
  
  if (self.entitiesForMasterContext == nil) {
    NSDictionary *dict = [[[masterContext persistentStoreCoordinator]
                           managedObjectModel] entitiesByName];
    [self setEntitiesForMasterContext:dict];
  }
  
  if ([self.entitiesForMainContext objectForKey:entityName]) {
    return mainContext;
  }
  
  return masterContext;
}


#pragma mark -

- (void)dealloc {
  [self setCoreDataContextDict:nil];
  [self setEntitiesForMainContext:nil];
  [self setEntitiesForMasterContext:nil];
  [super dealloc];
}

@synthesize coreDataContextDict=coreDataContextDict_;
@synthesize entitiesForMainContext=entitiesForMainContext_;
@synthesize entitiesForMasterContext=entitiesForMasterContext_;

@end
