//
//  ParseStarterProjectAppDelegate.m
//  ParseStarterProject
//
//  Copyright 2014 Parse, Inc. All rights reserved.
//

#import <Parse/Parse.h>
#import "ParseModels.h"

// If you want to use any of the UI components, uncomment this line
// #import <ParseUI/ParseUI.h>

// If you are using Facebook, uncomment this line
// #import <ParseFacebookUtils/PFFacebookUtils.h>

// If you want to use Crash Reporting - uncomment this line
// #import <ParseCrashReporting/ParseCrashReporting.h>

#import "ParseStarterProjectAppDelegate.h"
#import "ParseStarterProjectViewController.h"

#import "ProjectsViewController.h"
#import "ProjectInvitationsController.h"


@implementation ParseStarterProjectAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // ****************************************************************************
    // Uncomment this line if you want to enable Crash Reporting
    // [ParseCrashReporting enable];
    //
    // Uncomment and fill in with your Parse credentials:
    [Parse setApplicationId:@"Ko85wkWVKXSDlWqANxC2ptDiHnrvqqiJnwX8ATYe"
                  clientKey:@"yIkMea2hyJt0RMJs1OLPfsLBw40OlokmAJftvRCd"];
    //
    // If you are using Facebook, uncomment and add your FacebookAppID to your bundle's plist as
    // described here: https://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/
    // [PFFacebookUtils initializeFacebook];
    // ****************************************************************************
    
    //[PFUser enableAutomaticUser];
    
    //0.    Setup ACL.
    [self _setupParseACL];


    // Override point for customization after application launch.

    //Moved within _setupViewControllers...
    //self.window.rootViewController = self.tabBarController;
    if([PFUser currentUser]) {
        [self _setupRootWithTabBarViewController];
    }
    else {
        [self _setupRootWithSignInViewController];
    }

    [self.window makeKeyAndVisible];

    if (application.applicationState != UIApplicationStateBackground) {
        // Track an app open here if we launch with a push, unless
        // "content_available" was used to trigger a background push (introduced in iOS 7).
        // In that case, we skip tracking here to avoid double counting the app-open.
        BOOL preBackgroundPush = ![application respondsToSelector:@selector(backgroundRefreshStatus)];
        BOOL oldPushHandlerOnly = ![self respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)];
        BOOL noPushPayload = ![launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
            [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
        }
    }

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                 categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    } else
#endif
    {
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                         UIRemoteNotificationTypeAlert |
                                                         UIRemoteNotificationTypeSound)];
    }

    return YES;
}

/*

///////////////////////////////////////////////////////////
// Uncomment this method if you are using Facebook
///////////////////////////////////////////////////////////

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}

 */

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    [PFPush storeDeviceToken:newDeviceToken];
    [PFPush subscribeToChannelInBackground:@"" target:self selector:@selector(subscribeFinished:error:)];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    if (error.code == 3010) {
        NSLog(@"Push notifications are not supported in the iOS Simulator.");
    } else {
        // show some alert or otherwise handle the failure to register.
        NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];

    if (application.applicationState == UIApplicationStateInactive) {
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}

///////////////////////////////////////////////////////////
// Uncomment this method if you want to use Push Notifications with Background App Refresh
///////////////////////////////////////////////////////////
/*
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    if (application.applicationState == UIApplicationStateInactive) {
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}
 */

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state.
     This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message)
     or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates.
     Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state
     information to restore your application to its current state in case it is terminated later.
     If your application supports background execution,
     this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark -
#pragma mark PFLogInViewController Obligations
- (void)logInViewController:(PFLogInViewController *)logInController
               didLogInUser:(PFUser *)user {
    [self _setupRootWithTabBarViewController];
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
}
#pragma mark -
#pragma mark PFSignUpViewController Obligations
- (void)signUpViewController:(PFSignUpViewController *)signUpController
               didSignUpUser:(PFUser *)user {
    [self _setupRootWithTabBarViewController];
}

- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
}


#pragma mark - ()

- (void)subscribeFinished:(NSNumber *)result error:(NSError *)error {
    if ([result boolValue]) {
        NSLog(@"ParseStarterProject successfully subscribed to push notifications on the broadcast channel.");
    } else {
        NSLog(@"ParseStarterProject failed to subscribe to push notifications on the broadcast channel.");
    }
}

#pragma mark -
#pragma mark Publics - Setup UI
- (void)setupLoggedOutUI {
    [self _setupRootWithSignInViewController];
}

- (void)setupLoggedInUI {
    [self _setupRootWithTabBarViewController];
}

#pragma mark -
#pragma mark Privates -

#pragma mark Private - Setup ACLs
/**
 * ACLs will need to be setup regardless how Roles are setup.
 */
- (void)_setupPublicReadACL {
    MTLog(@"Setting up public read ACL.");
    PFACL *defaultACL = [PFACL ACL];
    
    [defaultACL setPublicReadAccess:YES];
    
    [PFACL setDefaultACL:defaultACL
withAccessForCurrentUser:YES];
}

- (void)_setupUserPrivateACL {
    MTLog(@"Setting up user private ACL.");
    PFACL *defaultACL = [PFACL ACL];
    
    [PFACL setDefaultACL:defaultACL
withAccessForCurrentUser:YES];
    
}

/**
 * Default ACL is user private
 */
- (void)_setupParseACL {
    [self _setupUserPrivateACL];
}

#pragma mark Private - Setup View Controllers
- (void)_setupRootWithTabBarViewController {
    
    //Tab 0:
    //Not sure if these will be kept if the query is overriden for this
    //ParseQueryTable based view controller...
    ProjectsViewController *projectsViewController = [[ProjectsViewController alloc] initWithClassName:MTParseProjectClassName];
    projectsViewController.textKey = MTParseProjectNameKey;
    self.projectsNaviController = [[UINavigationController alloc] initWithRootViewController:projectsViewController];
    
    //Tab 1:
    ProjectInvitationsController *invitationsController = [[ProjectInvitationsController alloc] initWithClassName:MTParseInvitationClassName];
    invitationsController.textKey = MTParseInvitationMessageKey;
    self.invitationNaviController = [[UINavigationController alloc] initWithRootViewController:invitationsController];
    
    self.tabBarController.viewControllers = @[self.projectsNaviController, self.invitationNaviController];
    
    self.window.rootViewController = self.tabBarController;
}

- (void)_setupRootWithSignInViewController {
    PFLogInViewController *parseLoginViewController = [[PFLogInViewController alloc] init];
    parseLoginViewController.delegate = self;
    parseLoginViewController.signUpController.delegate = self;
    
    self.window.rootViewController = parseLoginViewController;
}

@end
