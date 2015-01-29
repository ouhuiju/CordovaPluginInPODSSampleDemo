//
//  CustomPlugin.m
//  PODSDemo
//
//  Created by ouok on 12/25/14.
//  Copyright (c) 2014 ouok. All rights reserved.
//

#import "CustomPlugin.h"
#import "JsAndNativeViewController.h"

@interface CustomPlugin ()
{
    NSString *stringObtainedFromJavascript1;
    NSString *stringObtainedFromJavascript2;
    int count;
    
    UIView *nativeView;
}

@end

@implementation CustomPlugin

- (void)JsCallNative:(CDVInvokedUrlCommand *)command
{
    stringObtainedFromJavascript1 = [command.arguments objectAtIndex:0];
    NSLog(@"first json get in Js is %@",stringObtainedFromJavascript1);
    stringObtainedFromJavascript2 = [command.arguments objectAtIndex:1];
    NSLog(@"second json get in Js is %@",stringObtainedFromJavascript2);
    
    [self.commandDelegate runInBackground:^{
        CDVPluginResult *pluginResult = [CDVPluginResult new];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"点击后会接受Js端定义的json数据，然后返回一个数据到Js端，数据类型可以在CDVPluginResult查看，例如这里就返回了这段话并跳转了页面。"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
    
    //popview
    JsAndNativeViewController *JANViewController = [JsAndNativeViewController new];
    [self.viewController presentViewController:JANViewController animated:YES completion:nil];
    
}


- (void)presentToTheNativeCallJsView:(CDVInvokedUrlCommand *)command;
{
//    CDVPluginResult *pluginResult = [CDVPluginResult new];
//    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"此处底部会弹出一个native的View，点击button会让顶部数字增加。"];
//    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    count = 0;
    
    nativeView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-100, [UIScreen mainScreen].bounds.size.width, 100)];
    [nativeView setBackgroundColor:[UIColor blackColor]];
    
    UIButton *callJsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    callJsButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    [callJsButton setFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 20)];
    [callJsButton setTitle:@"callJsButton" forState:UIControlStateNormal];
    [callJsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [callJsButton addTarget:self action:@selector(callJsButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [nativeView addSubview:callJsButton];
    
    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    removeButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    [removeButton setFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 20)];
    [removeButton setTitle:@"remove" forState:UIControlStateNormal];
    [removeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(removeButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [nativeView addSubview:removeButton];
    
    [self.viewController.view addSubview:nativeView];
    
}
- (void)NativeCallJs:(NSString *)javascript
{
    [self.commandDelegate evalJs:javascript];
}

#pragma mark - buttonEvent
- (void)callJsButtonPress:(UIButton *)btn
{
    count++;
    [self NativeCallJs:[NSString stringWithFormat:@"detailCount(%d)",(int)count]];
}
- (void)removeButtonPress:(UIButton *)btn
{
    [nativeView removeFromSuperview];
}

@end
