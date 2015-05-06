//
//  ProjectContentsController.h
//  My Tickets
//
//  Created by Jeff@Level3 on 12/30/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#define PROJECT_CONTENT_SECTION_COUNT           6
#define PROJECT_CONTENT_SECTION_TICKETS         0
#define PROJECT_CONTENT_SECTION_REPORTS         1
#define PROJECT_CONTENT_SECTION_MEMBERS         2
#define PROJECT_CONTENT_SECTION_INVITE          3
#define PROJECT_CONTENT_SECTION_INVITATIONS     4
#define PROJECT_CONTENT_SECTION_INFO            5

#define PROJECT_CONTENT_SECTION_TICKETS_HEADER  @"Tickets"
#define PROJECT_CONTENT_SECTION_REPORTS_HEADER  @"Reports"
#define PROJECT_CONTENT_SECTION_MEMBERS_HEADER  @"Members"
#define PROJECT_CONTENT_SECTION_INVITE_HEADER   @"Invite"
#define PROJECT_CONTENT_SECTION_INVITATIONS_HEADER @"Invitations"

#define PROJECT_CONTENT_SECTION_INFO_HEADER     @"Info"

/**
 * Provides access to Tickets, Reports, Memebers, and Invitations.
 *
 */
@interface ProjectContentsController : UITableViewController

@property (nonatomic, strong) PFObject *project;

@end
