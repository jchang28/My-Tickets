//
//  ProjectsViewController.h
//  My Tickets
//
//  Created by Jeff Chang on 12/11/14.
//
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

#import "ProjectAddViewController.h"

@protocol ProjectsViewControllerDelegate <NSObject>
- (void)didAddProject:(PFObject *)project;
- (void)didCancelAddProject;
@end

@protocol ProjectSettingsControllerDelegate <NSObject>
- (void)didCompleteSettings;
@end;

@interface ProjectsViewController : PFQueryTableViewController <ProjectsViewControllerDelegate, ProjectSettingsControllerDelegate>

@end
