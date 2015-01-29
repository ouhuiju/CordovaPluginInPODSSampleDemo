//
//  CustomPlugin.h
//  PODSDemo
//
//  Created by ouok on 12/25/14.
//  Copyright (c) 2014 ouok. All rights reserved.
//

#import "CDVPlugin.h"

@interface CustomPlugin : CDVPlugin

- (void)JsCallNative:(CDVInvokedUrlCommand *)command;


- (void)presentToTheNativeCallJsView:(CDVInvokedUrlCommand *)command;
- (void)NativeCallJs:(NSString *)javascript;

@end
