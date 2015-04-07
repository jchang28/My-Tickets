//
//  ParseStarterProjectAppDelegate.h
//  ParseStarterProject
//
//  Copyright 2014 Parse, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import <ParseUI/ParseUI.h>

@class ParseStarterProjectViewController;

@interface ParseStarterProjectAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;

//Tab 0
@property (nonatomic, strong) UINavigationController *projectsNaviController;

//Tab 1
@property (nonatomic, strong) UINavigationController *invitationNaviController;

//Tab 2
//Tab 3...

@property (nonatomic, strong) IBOutlet UITabBarController *tabBarController;

- (void)setupLoggedOutUI;
- (void)setupLoggedInUI;

@end
