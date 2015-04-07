//
//  ProjectSettingsController.h
//  My Tickets
//
//  Created by Jeff@Level3 on 2/27/15.
//
//

#import <UIKit/UIKit.h>

@protocol ProjectSettingsControllerDelegate;

@interface ProjectSettingsController : UIViewController

@property (nonatomic, weak) id<ProjectSettingsControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UILabel *userInfoLabel;

- (IBAction)ibDone:(id)sender;
- (IBAction)ibLogOut:(id)sender;

@end
