//
//  ProjectsViewController.m
//  My Tickets
//
//  Created by Jeff Chang on 12/11/14.
//
//

#import "ProjectsViewController.h"

@implementation ProjectsViewController

#pragma mark -
#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupUI];
}

#pragma mark -
#pragma makr Parse Overrides
/**
 * Not sure if this override will override the class name (can the constructed)
 * for this query table set at instantiated (at the app delegate level..).
 *
 * Not sure if the fetched names will be kepted (set at app delegate level...).
 */
- (PFQuery *)queryForTable {
    PFQuery *queryForProjectMembership = [PFQuery queryWithClassName:MTParseProjectClassName];

    //Find in all Projects, where the member is equal to this current user....(I hope it is not an exclusive...)
    [queryForProjectMembership whereKey:MTParseProjectMembershipKey
                                equalTo:[PFUser currentUser]];
    
    return queryForProjectMembership;
}

#pragma mark -
#pragma mark Privates
#pragma mark Private - Add button
- (void)_setupUI {
    self.title = @"My Projects";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(ibAddProject:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
}


#pragma mark -
#pragma mark IBActions
- (IBAction)ibAddProject:(id)sender {
    NSLog(@"ibAddProject pressed...");
    
    ProjectAddViewController *projectAddViewController = [[ProjectAddViewController alloc] initWithNibName:@"ProjectAddViewController"
                                                                                                    bundle:nil];
    projectAddViewController.delegate = self;
    
    [self presentViewController:projectAddViewController
                       animated:YES
                     completion:nil];
}


#pragma mark -
#pragma mark ProjectsViewControllerDelegate Obligations
- (void)didAddProject:(PFObject *)project {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (void)didCancelAddProject {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end
