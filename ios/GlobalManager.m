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
  NSLog(@"---LOG Before HPKIT ---k");

  UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
  UINavigationController *navigationController;
  // Check if the root view controller is a UINavigationController
  if ([rootViewController isKindOfClass:[UINavigationController class]]) {
      navigationController = (UINavigationController *)rootViewController;
      // Now you have the navigation controller
    [HPKit.sharedSDK loadGuestConversationWithLaunchController:navigationController customData:nil error:nil];

      NSLog(@"Successfully retrieved UINavigationController");
  } else {

      NSLog(@"Root view controller is not a UINavigationController");
  }

};

RCT_EXPORT_METHOD(logoutHaptik){
  [HPKit.sharedSDK logout];
}

@end
