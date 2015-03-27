//
//  ProjectInviteController.h
//  My Tickets
//
//  Created by Jeff@Level3 on 3/26/15.
//
//

#import <UIKit/UIKit.h>

#define INVITE_SEGEMENT_VIA_EMAIL               0
#define INVITE_SEGEMENT_VIA_USERNAME            1

@protocol ProjectInviteControllerDelegate <NSObject>
- (void)didDismissInviteResult;
@end

@interface ProjectInviteController : UIViewController <ProjectInviteControllerDelegate>

@property (nonatomic, strong) IBOutlet UISegmentedControl *inviteeInfoSelector;
@property (nonatomic, strong) IBOutlet UITextField *inviteeInfo;
@property (nonatomic, strong) IBOutlet UIButton *inviteButton;

@end
