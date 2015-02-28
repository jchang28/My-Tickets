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
#pragma mark - IBActions
- (void)ibLogOut:(id)sender {
    [self.delegate didCompleteSettings];
}

@end
