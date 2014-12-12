//
//  ParseStarterProjectAppDelegate.h
//  ParseStarterProject
//
//  Copyright 2014 Parse, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ParseUI/ParseUI.h>
#import "ProjectsViewController.h"

@class ParseStarterProjectViewController;

@interface ParseStarterProjectAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;

//Tab 0
@property (nonatomic, strong) UINavigationController *projectsNaviController;

//Tab 1
//Tab 2
//Tab 3...

@property (nonatomic, strong) IBOutlet UITabBarController *tabBarController;

@end
