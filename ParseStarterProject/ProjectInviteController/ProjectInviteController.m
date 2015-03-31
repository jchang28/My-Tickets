//
//  ProjectInviteController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 3/26/15.
//
//
#import "ProjectInviteController.h"
#import "ProjectInviteResultController.h"
#import "Utils.h"
#import "ParseModels.h"


@interface ProjectInviteController ()

@property (nonatomic, assign) BOOL inviteViaEmail;

@end

@implementation ProjectInviteController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark IBActions
- (IBAction)ibSelectorUpdated:(id)sender {
    [self _updateUIs];
}

- (IBAction)ibInvite:(id)sender {
    NSString *invitationResultMessage;
    
    MTLog(@"Invited [%@] as [%ld].", self.inviteeInfo.text, self.inviteeInfoSelector.selectedSegmentIndex);
    
    //0.    Invite logic with parse code, cloud or local.
    PFUser *invitee = [self _locateInvitee:self.inviteeInfo.text
                             usingUserName:self.inviteeInfoSelector.selectedSegmentIndex == INVITE_SEGEMENT_VIA_EMAIL ? NO : YES];
    
    //1.    Do user invitation logic...
    if(invitee) {
        PFUser *currentUser = [PFUser currentUser];
        
        if([invitee.objectId isEqualToString:currentUser.objectId]) {
            
            invitationResultMessage = @"You can't invite yourself, silly.";
            
        }
        else {
            NSString *invitationMessage = [self _invitationMessage];
            
            PFObject *invitation = [PFObject objectWithClassName:MTParseInvitationClassName
                                                      dictionary:@{
                                                                   MTParseInvitationProjectKey : self.project,
                                                                   MTParseInvitationInviterKey : currentUser,
                                                                   MTParseInvitationInviteeKey : invitee,
                                                                   MTParseInvitationMessageKey : invitationMessage
                                                                   }];
            
            [invitation saveEventually];
        
            invitationResultMessage = [NSString stringWithFormat:@"User[%@] is found.  An invitation request will be sent.  Help is on the way!!!", self.inviteeInfo.text];
        }
    }
    else {
        invitationResultMessage = @"User is not using My Tickets yet, ask him to register!";
    }

    //2.    Present invitation result via ProjectInviteResultController.
    ProjectInviteResultController *projectInviteResultController = [[ProjectInviteResultController alloc] initWithNibName:@"ProjectInviteResultController"
                                                                                                             bundle:nil];
    projectInviteResultController.delegate = self;
    projectInviteResultController.invitationResultMessage = invitationResultMessage;
    
    UINavigationController *inviteResultNavigationController = [[UINavigationController alloc] initWithRootViewController:projectInviteResultController];
    
    [self presentViewController:inviteResultNavigationController
                       animated:YES
                     completion:nil];
}

#pragma mark -
#pragma mark Privates
#pragma mark Private - UI Update
- (void)_updateUIs {
    [self _updateInviteeInfo];
}

- (void)_updateInviteeInfo {
    switch (self.inviteeInfoSelector.selectedSegmentIndex ) {
        case INVITE_SEGEMENT_VIA_EMAIL:
            self.inviteeInfo.placeholder = @"E-Mail";
            break;
            
        case INVITE_SEGEMENT_VIA_USERNAME:
        default:
            self.inviteeInfo.placeholder = @"User Name";
            break;
    }
}

#pragma mark Private - Invite user logic
- (PFUser *)_locateInvitee:(NSString *)userInfo
             usingUserName:(BOOL)isUserName {
    NSString *queryKey = isUserName ? MTParseUserUserNameKey : MTParseUserEmailKey;
    
    
    PFQuery *inviteQuery = [PFQuery queryWithClassName:@"_User"];
    [inviteQuery whereKey:queryKey
                  equalTo:userInfo];
    
    //1.    Synchronously, without error checking.
    PFUser *invitee = (PFUser *)[inviteQuery getFirstObject];
    
    return invitee;
}

#pragma mark Private - Create invitation message
- (NSString *)_invitationMessage {
    NSString *invitationMessage;
    NSString *invitationTemplate = @"%@ - %@ has invited you to help with this project!";
    
    invitationMessage = [NSString stringWithFormat:invitationTemplate, self.project[MTParseProjectNameKey], [PFUser currentUser].username];
    
    return invitationMessage;
}

#pragma mark -
#pragma mark ProjectInviteControllerDelegate obligations
- (void)didDismissInviteResult {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}


@end
