//
//  NSObject+MM.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MM)

/**
   Wait and run default run loop mode on current run loop.
   Should use this method in the code that has very heavy task
   to avoid crash because of long task. 
 */
- (void)waitAndRunDefault:(NSTimeInterval)seconds;

@end
