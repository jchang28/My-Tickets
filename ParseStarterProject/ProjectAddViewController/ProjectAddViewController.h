//
//  ProjectAddViewController.h
//  My Tickets
//
//  Created by Jeff Chang on 12/11/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ProjectModel.h"

@protocol ProjectsViewControllerDelegate;

@interface ProjectAddViewController : UIViewController


@property (nonatomic, weak) id<ProjectsViewControllerDelegate> delegate;

@property (nonatomic, strong) IBOutlet UITextField *projectNameTextField;
@property (nonatomic, strong) IBOutlet UITextField *projectDescriptionTextField;

- (IBAction)ibAddProject:(id)sender;
- (IBAction)ibCancel:(id)sender;

@end
