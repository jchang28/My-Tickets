//
//  ProjectInviteResultController.h
//  My Tickets
//
//  Created by Jeff@Level3 on 3/26/15.
//
//

#import <UIKit/UIKit.h>

@protocol ProjectInviteControllerDelegate;

@interface ProjectInviteResultController : UIViewController

@property (nonatomic, copy) NSString *invitationResultMessage;
@property (nonatomic, weak) id<ProjectInviteControllerDelegate> delegate;

@property (nonatomic, strong) IBOutlet UILabel *uiInvitationResultLabel;
@property (nonatomic, strong) IBOutlet UIButton *uiDismissButton;

- (IBAction)ibDismiss:(id)sender;

@end
