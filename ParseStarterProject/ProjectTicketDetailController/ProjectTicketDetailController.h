//
//  ProjectTicketDetailController.h
//  My Tickets
//
//  Created by Jeff Chang on 1/7/15.
//
//

#import "MTGenericTableViewController.h"

@interface ProjectTicketDetailController : MTGenericTableViewController

- (instancetype)initWithTicketModel:(PFObject *)parseTicket;

@end
