//
//  MMDefaultsTest.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "MMDefaultsTest.h"

@implementation MMDefaultsTest

- (void)testSingleton {
  MMDefaults *defaults1 = [MMDefaults defaultSet];
  MMDefaults *defaults2 = [MMDefaults defaultSet];
  STAssertEquals(defaults1 , defaults2, nil);
}

- (void)testValueForKey {
  
  MMDefaults *defaults = [MMDefaults defaultSet];
  STAssertNotNil(defaults, nil);
  
  {
    NSString *obj = (NSString *)[defaults valueForKey:@"TestKey1"];
    STAssertEqualObjects(obj, @"TestValue1", nil);
  }
  
  {
    NSString *obj = (NSString *)[defaults valueForKey:@"TestKey2"];
    STAssertEqualObjects(obj, @"TestValue2", nil);
  }
}


@end
