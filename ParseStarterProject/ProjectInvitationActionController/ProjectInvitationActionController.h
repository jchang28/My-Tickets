//
//  ProjectInvitationActionController.h
//  My Tickets
//
//  Created by Jeff@Level3 on 3/31/15.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@protocol ProjectInvitationsControllerDelegate;

@interface ProjectInvitationActionController : UIViewController

@property (nonatomic, strong) PFObject *invitation;
@property (nonatomic, weak) id<ProjectInvitationsControllerDelegate> delegate;

- (IBAction)ibAcceptInvitation:(id)sender;
- (IBAction)ibDeclineInvitation:(id)sender;

@end
