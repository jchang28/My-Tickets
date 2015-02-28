//
//  ProjectsViewController.m
//  My Tickets
//
//  Created by Jeff Chang on 12/11/14.
//
//

#import "ProjectsViewController.h"
#import "ProjectDetailController.h"
#import "ProjectContentsController.h"
#import "ProjectSettingsController.h"

//Used for setting up log in and log out UI
#import "ParseStarterProjectAppDelegate.h"

@implementation ProjectsViewController

#pragma mark -
#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupUI];
}

#pragma mark Overrides - UITableViewDelegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PFObject *project = [self objectAtIndexPath:indexPath];
    
    [self _debug:project];
    
    ProjectContentsController *projectContentsController = [[ProjectContentsController alloc] initWithNibName:@"ProjectContentsController"
                                                                                            bundle:nil];
    projectContentsController.project = project;
    
    [self.navigationController pushViewController:projectContentsController
                                         animated:YES];

    /*
    ProjectDetailController *projectDetailController = [[ProjectDetailController alloc] initWithNibName:@"ProjectDetailController"
                                                                                                 bundle:nil
                                                                                      parseProjectModel:project];
    
    [self.navigationController pushViewController:projectDetailController
                                         animated:YES];
     */
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
    
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                    target:self
                                                                                    action:@selector(ibShowSettings:)];
    
    
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationItem.leftBarButtonItem = settingsButton;
}

- (void)_debug:(PFObject *)project {
    NSLog(@"Project name[%@].", [project objectForKey:MTParseProjectNameKey]);
    NSLog(@"Project description[%@].", [project objectForKey:MTParseProjectDescriptionKey]);
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

- (IBAction)ibShowSettings:(id)sender {
    ProjectSettingsController *settingsController = [[ProjectSettingsController alloc] initWithNibName:@"ProjectSettingsController"
                                                                                                bundle:nil];
    settingsController.delegate = self;
    
    [self presentViewController:settingsController
                       animated:YES
                     completion:nil];
}


#pragma mark -
#pragma mark ProjectsViewControllerDelegate Obligations
- (void)didAddProject:(PFObject *)project {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    [self loadObjects];
}

- (void)didCancelAddProject {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

#pragma mark -
#pragma mark ProjectSettingsControllerDelegate Obligations
- (void)didCompleteSettings {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 ParseStarterProjectAppDelegate *appDelegate = (ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate];
                                 
                                 [appDelegate setupLoggedOutUI];
                             }];    
}

@end
