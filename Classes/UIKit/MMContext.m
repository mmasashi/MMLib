//
//  MMContext.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/17.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "MMContext.h"

#pragma mark -

@interface MMContext ()

@property (nonatomic, retain) NSMutableDictionary *coreDataContextDict;

@end

// ----------------------------------------------------------------------

@implementation MMContext

- (id)init
{
    self = [super init];
    if (self) {
      
      // init dictionary for NSManagedObjectContext
      {
        NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
        [self setCoreDataContextDict:tempDict];
      }
    }    
    return self;
}



#pragma mark - core data context management

- (NSManagedObjectContext *)mainCoreDataContext {
  return [self.coreDataContextDict mainCoreDataContext];
}

- (void)setMainCoreDataContext:(NSManagedObjectContext *)context {
  return [self.coreDataContextDict setMainCoreDataContext:context];
}

- (NSManagedObjectContext *)masterCoreDataContext {
  return [self.coreDataContextDict masterCoreDataContext];
}

- (void)setMasterCoreDataContext:(NSManagedObjectContext *)context {
  [self.coreDataContextDict setMasterCoreDataContext:context];
}

- (NSManagedObjectContext *)coreDataContextForKey:(NSString *)key {
  return [self.coreDataContextDict coreDataContextForKey:key];
}

- (void)setCoreDataContext:(NSManagedObjectContext *)context forKey:(NSString *)key {
  [self.coreDataContextDict setCoreDataContext:context forKey:key];
}

#pragma mark -

- (void)dealloc {
  [self setCoreDataContextDict:nil];
  [super dealloc];
}

@synthesize coreDataContextDict=coreDataContextDict_;

@end
