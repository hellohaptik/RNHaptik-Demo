//
//  GlobalManager.m
//  RNHaptik
//
//  Created by Rohit Ninawe on 17/03/22.
//

#import <Foundation/Foundation.h>
#import "GlobalManager.h"
//#import <HPWebKit/HPWebKit.h>
#import <HPWebKit/HPWebKit-Swift.h>

#import <UIKit/UIKit.h>

@implementation GlobalManager

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(loadHaptikConversation){
  
  UINavigationController *rootVC = [UIApplication sharedApplication].delegate.window.rootViewController;
  if ([rootVC isKindOfClass:[UINavigationController class]]) {
      UINavigationController *navigationController = (UINavigationController *)rootVC;
    NSLog(@"---LOG Before HPKIT ---k");

    [HPKit.sharedSDK loadGuestConversationWithLaunchController:rootVC.viewControllers.lastObject customData:nil error:nil];
    NSLog(@"---LOG After HPKIT ---");


      // Now you can work with navigationController
  }
  
};

RCT_EXPORT_METHOD(logoutHaptik){
  [HPKit.sharedSDK logout];
}

@end
