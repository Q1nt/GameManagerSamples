// Copyright 2015 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

  // Hook up the logger.
  [GCKLogger sharedInstance].delegate = self;

  // Set up game data.
  self.gameInfo = [[SPCGameInfo alloc] init];

  // Initialize the chromecast device controller.
  self.chromecastDeviceController = [[ChromecastDeviceController alloc] init];

  // Scan for devices.
  [self.chromecastDeviceController toggleScan:YES];

  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state.
  // This can occur for certain types of temporary interruptions
  // (such as an incoming phone call or SMS message) or when the user quits the application and it
  // begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame
  // rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data,
  // invalidate timers, and store enough application state information to restore your
  // application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of
  // applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state;
  // here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive.
  // If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate.
  // Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - GCKLoggerDelegate implementation

- (void)logFromFunction:(const char *)function message:(NSString *)message {
  // Send SDK’s log messages directly to the console, as an example.
  NSLog(@"%s  %@", function, message);
}

# pragma mark - Utilities

- (UIImage *)getAvatarImage {
  switch (self.gameInfo.avatarIndex) {
    case 1:
      return [UIImage imageNamed:@"wizard2"];
    case 2:
      return [UIImage imageNamed:@"wizard3"];
    case 3:
      return [UIImage imageNamed:@"wizard4"];
    default:
      return [UIImage imageNamed:@"wizard1"];
  }
}

@end
