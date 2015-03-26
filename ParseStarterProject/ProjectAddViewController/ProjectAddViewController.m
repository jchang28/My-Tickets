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
    NSLog(@"Project Name [%@].", self.projectNameTextField.text);
    NSLog(@"Project Description [%@].", self.projectDescriptionTextField.text);
    
    //0.    Logic to create project on parse.
    PFObject *project = [self _createProjectAndSave];
    
    [self.delegate didAddProject:project];
    
}

- (IBAction)ibCancel:(id)sender {
    [self.delegate didCancelAddProject];
}

#pragma mark -
#pragma mark Privates
- (PFObject *)_createProjectAndSave {
    PFObject *project = [PFObject objectWithClassName:MTParseProjectClassName];
    
    
    //0.    Project name.
    [project setObject:self.projectNameTextField.text
                forKey:MTParseProjectNameKey];
    
    //1.    Project description.
    [project setObject:self.projectDescriptionTextField.text
                forKey:MTParseProjectDescriptionKey];
    
    //3.    Project owner.
    [project setObject:[PFUser currentUser]
                forKey:MTParseProjectOwnerKey];
    
    //4.    Construct a relationship between project and the creator.
    //      ...
    //      Seems like relations are created implicitly when you request for one...
    //PFRelation *projectMemberRelation = [project relationForKey:MTParseProjectMembershipKey];
    //[projectMemberRelation addObject:[PFUser currentUser]];

    
    //5.    Saves in background synchronously as Cloud role functions depend on
    //      it
    MTLog(@"Saving project...");
    [project save];

    
    //6.    Creating associated roles, Admin and Member role for this project
    //      for the purposes of sharing with other users.
    MTLog(@"Calling create role, no idea if this call is good or not...");
    NSDictionary *jasonResponse = [PFCloud callFunction:@"createProjectRoles"
                                         withParameters: @{@"projectId" : project.objectId}];
    
    return project;
}


@end
