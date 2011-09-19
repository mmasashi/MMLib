//
//  NSData+Encode.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSData (Encode)

/**
   Get MD5 string from binary.
 */
- (NSString *)MD5DigestString;

/**
   Encode with key.
   This code from http://www.iphonedevsdk.com/forum/iphone-sdk-development/60926-aes-encryption-objective-c-php.html
   @param key key for encoding.
 */
- (NSData *)AES256EncryptWithKey:(NSString *)key;

/**
   Decode with key.
   This code from http://www.iphonedevsdk.com/forum/iphone-sdk-development/60926-aes-encryption-objective-c-php.html
   @param key key for decoding.
 */
- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end
