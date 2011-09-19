//
//  MMCoreDataContextManager.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "MMCoreDataContextManager.h"


@interface MMCoreDataContextManager ()

+ (NSManagedObjectModel *)buildManagedObjectModel:(NSArray *)momdNames;
- (NSPersistentStoreCoordinator *)buildPersistentStoreCoordinator:(NSArray *)momdNames
                                                       sqlitePath:(NSString *)sqlitePath;

@property (nonatomic, retain) NSDictionary *persistentStoreCoordinatorOptions;

@end

// ----------------------------------------------------------------------

@implementation MMCoreDataContextManager

+ (NSManagedObjectContext *)buildDefaultCoreDataContext:(NSArray *)momdNames
                                             sqlitePath:(NSString *)sqlitePath {
  NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                           [NSNumber numberWithBool:YES],
                           NSMigratePersistentStoresAutomaticallyOption,
                           [NSNumber numberWithBool:YES],
                           NSInferMappingModelAutomaticallyOption,
                           nil];

  return [self.class buildCoreDataContext:momdNames
                               sqlitePath:sqlitePath
                                  options:options];
}


+ (NSManagedObjectContext *)buildCoreDataContext:(NSArray *)momdNames
                                      sqlitePath:(NSString *)sqlitePath
                                         options:(NSDictionary *)persistentStoreCoordinatorOptions {
  MMCoreDataContextManager *manager = [[[MMCoreDataContextManager alloc] init] autorelease];
  [manager setPersistentStoreCoordinatorOptions:persistentStoreCoordinatorOptions];
  
  NSPersistentStoreCoordinator *coordinator = 
  [manager buildPersistentStoreCoordinator:momdNames sqlitePath:sqlitePath];
  
  NSManagedObjectContext *context = [[[NSManagedObjectContext alloc] init] autorelease];
  [context setPersistentStoreCoordinator:coordinator];
  
  return context;
}

+ (BOOL)isMigrationNecessary:(NSArray *)momdNames
                  sqlitePath:(NSString *)sqlitePath
                       error:(NSError **)error {
  if ([[NSFileManager defaultManager] fileExistsAtPath:sqlitePath] == NO) {
    return NO;
  }
  
  NSPersistentStoreCoordinator *coordinator = [[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self.class buildManagedObjectModel:momdNames]] autorelease];
  NSURL *url = [NSURL fileURLWithPath:sqlitePath];
  
  NSDictionary *metadata = [NSPersistentStoreCoordinator 
                            metadataForPersistentStoreOfType:NSSQLiteStoreType
                            URL:url
                            error:error];
  
  if (metadata == nil) {
    NSLog(@"Failed to read source metadata:%@ (%@)", sqlitePath, [*error description]);
    return NO;
  }
  
  NSString *config = nil;
  NSManagedObjectModel *dstModel = [coordinator managedObjectModel];
  BOOL compatible = [dstModel isConfiguration:config
                  compatibleWithStoreMetadata:metadata];
  
  if (compatible) {
    return NO;
  } else {
    return YES; // -> It's necessary to migration
  }
  
}



#pragma mark - private core data builder

+ (NSManagedObjectModel *)buildManagedObjectModel:(NSArray *)momdNames  {
  NSMutableArray *models = [NSMutableArray array];
  
  for (NSString *momdName in momdNames) {
    NSURL *url = [[NSBundle mainBundle] URLForResource:momdName withExtension:@"momd"];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
    [models addObject:model];
    [model release];
  }
  
  NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel modelByMergingModels:models];
  
  return managedObjectModel;
}


- (NSPersistentStoreCoordinator *)buildPersistentStoreCoordinator:(NSArray *)momdNames
                                                       sqlitePath:(NSString *)sqlitePath {
  NSURL *url = [NSURL fileURLWithPath:sqlitePath];
  
  NSError *error = nil;
  NSPersistentStoreCoordinator *pc = [[[NSPersistentStoreCoordinator alloc]
                                       initWithManagedObjectModel:[self.class buildManagedObjectModel:momdNames]] autorelease];
  
  if (![pc addPersistentStoreWithType:NSSQLiteStoreType
                        configuration:nil
                                  URL:url
                              options:self.persistentStoreCoordinatorOptions
                                error:&error]) {
    NSLog(@"Unresolved error %@", [error description]);
    abort();
  }
  
  return pc;
}


#pragma mark -

- (void)dealloc {
  [self setPersistentStoreCoordinatorOptions:nil];
  [super dealloc];
}

@synthesize persistentStoreCoordinatorOptions;

@end
