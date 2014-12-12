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

@interface ProjectsViewController : PFQueryTableViewController <ProjectsViewControllerDelegate>

@end
