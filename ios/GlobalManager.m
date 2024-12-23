//
//  GlobalManager.m
//  RNHaptik
//
//  Created by Rohit Ninawe on 17/03/22.
//

#import <Foundation/Foundation.h>
#import "GlobalManager.h"
#import <HPWebKit/HPWebKit.h>
#import <UIKit/UIKit.h>

@implementation GlobalManager

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(loadHaptikConversation){
  
  UINavigationController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController as UINavigationController;
  
    @try{
      NSLog(@"---LOG Before HPKIT ---k");

      [HPKit.sharedSDK loadGuestConversationWithLaunchController:rootViewController.presentedViewController customData:nil error:nil];


      NSLog(@"---LOG After HPKIT ---");
//      
//      UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
//                                 message:@"This is an alert."
//                                 preferredStyle:UIAlertControllerStyleAlert];
//
//      UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                     handler:^(UIAlertAction * action) {}];
//
//      [alert addAction:defaultAction];
//      [rootViewController presentViewController:alert animated:YES completion:nil];
      
    }  @catch (NSException *exception) {
      NSLog(@"---LOG exception ---%@", exception);
    }
  
};

RCT_EXPORT_METHOD(logoutHaptik){
  [HPKit.sharedSDK logout];
}

@end
