//
//  NSString+MM.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MM)

+ (NSString *)stringWithDateFormat:(NSString *)format date:(NSDate *)date;

@end
