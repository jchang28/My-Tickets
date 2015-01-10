//
//  ProjectTicketAddController.h
//  My Tickets
//
//  Created by Jeff Chang on 1/9/15.
//
//

#import "MTEditDetailedFieldController.h"

@protocol ProjectTicketsControllerDelegate;

@interface ProjectTicketAddController : MTEditDetailedFieldController

- (instancetype)initWithNewParseTicket:(PFObject *)newTicket;

@property (nonatomic, weak) id<ProjectTicketsControllerDelegate> delegate;

@end
