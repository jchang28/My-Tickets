//
//  ProjectAddViewController.m
//  My Tickets
//
//  Created by Jeff Chang on 12/11/14.
//
//

#import "ProjectAddViewController.h"
#import "ProjectsViewController.h"

@interface ProjectAddViewController ()

@end

@implementation ProjectAddViewController

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
- (IBAction)ibAddProject:(id)sender {
    [self.delegate didAddProject:nil];
    
}

- (IBAction)ibCancel:(id)sender {
    [self.delegate didCancelAddProject];
}


@end
