// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0
// 
// Autogenerated from Pigeon (v7.1.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN


/// The codec used by NSUserDefaultsAPI.
NSObject<FlutterMessageCodec> *NSUserDefaultsAPIGetCodec(void);

@protocol NSUserDefaultsAPI
- (void)setBoolKey:(NSString *)key value:(NSNumber *)value completion:(void (^)(FlutterError *_Nullable))completion;
- (void)boolForKey:(NSString *)key completion:(void (^)(NSNumber *_Nullable, FlutterError *_Nullable))completion;
@end

extern void NSUserDefaultsAPISetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<NSUserDefaultsAPI> *_Nullable api);

NS_ASSUME_NONNULL_END