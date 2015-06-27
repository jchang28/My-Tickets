//
//  ProjectInvitationActionController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 3/31/15.
//
//

#import "ProjectInvitationActionController.h"
#import "ProjectInvitationsController.h"
#import "Utils.h"

@interface ProjectInvitationActionController ()

@end

@implementation ProjectInvitationActionController

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
- (IBAction)ibAcceptInvitation:(id)sender {
    MTLog(@"Calling Parse Cloud function membershipAcceptInvitation...");
    
    NSDictionary *jasonResponse = [PFCloud callFunction:@"membershipAcceptInvitation"
                                         withParameters: @{@"invitationId" : self.invitation.objectId}];
    
    
    [self.delegate didAcceptInvitation];
}

- (IBAction)ibDeclineInvitation:(id)sender {
    [self.delegate didDeclineInvitation];
}

@end
