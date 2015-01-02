//
//  ProjectContentsController.h
//  My Tickets
//
//  Created by Jeff@Level3 on 12/30/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#define PROJECT_CONTENT_SECTION_COUNT           3
#define PROJECT_CONTENT_SECTION_TICKETS         0
#define PROJECT_CONTENT_SECTION_REPORTS         1
#define PROJECT_CONTENT_SECTION_MEMBERS         2

#define PROJECT_CONTENT_SECTION_TICKETS_HEADER  @"Tickets"
#define PROJECT_CONTENT_SECTION_REPORTS_HEADER  @"Reports"
#define PROJECT_CONTENT_SECTION_MEMBERS_HEADER  @"Members"

@interface ProjectContentsController : UITableViewController

@property (nonatomic, strong) PFObject *project;

@end
