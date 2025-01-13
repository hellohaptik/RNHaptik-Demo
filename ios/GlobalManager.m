//
//  GlobalManager.m
//  RNHaptik
//

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
  NSLog(@"---LOG Before HPKIT ---k");

  UINavigationController *rootViewController = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;

  // Check if the root view controller is a UINavigationController
  if ([rootViewController isKindOfClass:[UINavigationController class]]) {
     
      // Now you have the navigation controller
    [HPKit.sharedSDK loadGuestConversationWithLaunchController:rootViewController.viewControllers.lastObject customData:nil error:nil];
      NSLog(@"Successfully retrieved UINavigationController");
  } else {

      NSLog(@"Root view controller is not a UINavigationController");
  }

};

RCT_EXPORT_METHOD(logoutHaptik){
  [HPKit.sharedSDK logout];
}

@end
