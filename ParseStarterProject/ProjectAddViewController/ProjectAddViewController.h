//
//  ProjectAddViewController.h
//  My Tickets
//
//  Created by Jeff Chang on 12/11/14.
//
//

#import <UIKit/UIKit.h>

@protocol ProjectsViewControllerDelegate;

@interface ProjectAddViewController : UIViewController


@property (nonatomic, weak) id<ProjectsViewControllerDelegate> delegate;

- (IBAction)ibAddProject:(id)sender;
- (IBAction)ibCancel:(id)sender;

@end
