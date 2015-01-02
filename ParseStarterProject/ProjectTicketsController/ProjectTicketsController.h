//
//  ProjectTicketsController.h
//  My Tickets
//
//  Created by Jeff Chang on 1/2/15.
//
//

#import <ParseUI/ParseUI.h>

@protocol ProjectTicketsControllerDelegate <NSObject>
- (void)didAddTicket:(PFObject *)ticket;
- (void)didCancelAddTicket;
@end

@interface ProjectTicketsController : PFQueryTableViewController <ProjectTicketsControllerDelegate>

@end
