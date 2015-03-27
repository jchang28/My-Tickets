//
//  ProjectInviteResultController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 3/26/15.
//
//

#import "ProjectInviteResultController.h"
#import "ProjectInviteController.h"

@interface ProjectInviteResultController ()

@end

@implementation ProjectInviteResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.uiInvitationResultLabel.text = @"abc123";
    
    [self _updateUI];
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
#pragma mark Privates
- (void)_updateInvigationResultLabel {
    self.uiInvitationResultLabel.text = self.invitationResultMessage;
}

- (void)_updateUI {
    [self _updateInvigationResultLabel];
}

#pragma mark -
#pragma mark IBActions
- (IBAction)ibDismiss:(id)sender {
    [self.delegate didDismissInviteResult];
}

@end
