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

/**
 * This MOST DEFINTELY will need filtering by project id as a user's ACL/Role
 * for tickets can span across multipel projects.
 *
 * Will do later.
 */
@interface ProjectTicketsController : PFQueryTableViewController <ProjectTicketsControllerDelegate>

//Current project we are working with.
@property (nonatomic, strong) PFObject *project;

@end
