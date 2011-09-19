//
//  NSData+Encode.m
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/19.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import "NSData+Encode.h"

@interface FIXCATEGORYBUG_NSDATA_ENCODE @end
@implementation FIXCATEGORYBUG_NSDATA_ENCODE @end

@implementation NSData (Encode)

- (NSString *)MD5DigestString {
  unsigned char digest[CC_MD5_DIGEST_LENGTH];
  CC_MD5([self bytes], [self length], digest);
  char md5cstring[CC_MD5_DIGEST_LENGTH*2];
  
  for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
    sprintf(md5cstring+i*2, "%02x", digest[i]);
  }
  
  return [NSString stringWithCString:md5cstring encoding:NSASCIIStringEncoding];
}

//http://www.iphonedevsdk.com/forum/iphone-sdk-development/60926-aes-encryption-objective-c-php.html
- (NSData *)AES256EncryptWithKey:(NSString *)key {
  char keyPtr[kCCKeySizeAES256+1];
  bzero(keyPtr, sizeof(keyPtr));
  
  [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
  
  NSUInteger dataLength = [self length];
  
  size_t bufferSize = dataLength + kCCBlockSizeAES128;
  void *buffer = malloc(bufferSize);
  
  size_t numBytesEncrypted = 0;
  CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,       
                                        kCCOptionPKCS7Padding | kCCOptionECBMode,
                                        keyPtr, kCCBlockSizeAES128,
                                        NULL,
                                        [self bytes], dataLength,
                                        buffer, bufferSize,
                                        &numBytesEncrypted);
  if (cryptStatus == kCCSuccess) {
    return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
  }
  free(buffer);
  return nil;
}

//http://www.iphonedevsdk.com/forum/iphone-sdk-development/60926-aes-encryption-objective-c-php.html
- (NSData *)AES256DecryptWithKey:(NSString *)key {
  char keyPtr[kCCKeySizeAES256+1];
  bzero(keyPtr, sizeof(keyPtr));
  
  [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
  
  NSUInteger dataLength = [self length];
  
  size_t bufferSize = dataLength + kCCBlockSizeAES128;
  void *buffer = malloc(bufferSize);
  
  size_t numBytesDecrypted = 0;
  CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, 
                                        kCCOptionPKCS7Padding | kCCOptionECBMode,
                                        keyPtr, kCCBlockSizeAES128,
                                        NULL,
                                        [self bytes], dataLength,
                                        buffer, bufferSize,
                                        &numBytesDecrypted);
  
  if (cryptStatus == kCCSuccess) {
    return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
  }
  free(buffer);
  return nil;
}


@end
