//
//  ProjectInvitationsController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 3/31/15.
//
//

#import "ProjectInvitationsController.h"
#import "ProjectInvitationActionController.h"

@implementation ProjectInvitationsController

#pragma mark -
#pragma mark Parent overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupUI];
}

#pragma mark -
#pragma mark Overrides - UITAbleViewDelegate obligations
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PFObject *invitation = [self objectAtIndexPath:indexPath];
    
    ProjectInvitationActionController *invitationActionController = [[ProjectInvitationActionController alloc] initWithNibName:@"ProjectInvitationActionController"
                                                                                                                        bundle:nil];
    invitationActionController.invitation = invitation;
    
    invitationActionController.delegate = self;
    [self presentViewController:invitationActionController
                       animated:YES
                     completion:nil];
}


#pragma mark -
#pragma mark ProjectInvitationsControllerDelegate obligations
- (void)didAcceptInvitation {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
    //Additional logic for adding the user to part of the project,
    //either as admin or contributor...
}

- (void)didDeclineInvitation {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
    //Additional logic for decline...
    
}

#pragma mark -
#pragma mark Privates
- (void)_setupUI {
    self.title = @"My Invitations";
    
}

@end
