//
//  ProjectInviteController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 3/26/15.
//
//

#import "ProjectInviteController.h"

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


@end
