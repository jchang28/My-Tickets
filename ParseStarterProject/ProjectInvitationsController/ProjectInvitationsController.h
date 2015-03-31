//
//  ProjectInvitationsController.h
//  My Tickets
//
//  Created by Jeff@Level3 on 3/31/15.
//
//

#import <ParseUI/ParseUI.h>

@protocol ProjectInvitationsControllerDelegate <NSObject>

- (void)didAcceptInvitation;
- (void)didDeclineInvitation;

@end

@interface ProjectInvitationsController : PFQueryTableViewController <ProjectInvitationsControllerDelegate>

@end
