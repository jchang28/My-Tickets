//
//  ProjectSettingsController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 2/27/15.
//
//

#import "ProjectSettingsController.h"
#import "ProjectsViewController.h"

@interface ProjectSettingsController ()

@end

@implementation ProjectSettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self _setupUI];
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
- (void)_setupUI {
    NSString *userInfo = [NSString stringWithFormat:@"You are logged in as [%@].", [[PFUser currentUser] username]];
    
    self.userInfoLabel.text = userInfo;
}

#pragma mark -
#pragma mark - IBActions
- (void)ibDone:(id)sender {
    [self.delegate didCompleteSettings];
}

- (void)ibLogOut:(id)sender {
    [PFUser logOut];
    [self.delegate didLogout];
}

@end
