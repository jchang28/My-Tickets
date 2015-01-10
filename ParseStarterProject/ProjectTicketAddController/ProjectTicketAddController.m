//
//  ProjectTicketAddController.m
//  My Tickets
//
//  Created by Jeff Chang on 1/9/15.
//
//

#import "TicketModel.h"

#import "ProjectTicketsController.h"
#import "ProjectTicketAddController.h"

@interface ProjectTicketAddController ()

@end

@implementation ProjectTicketAddController

#pragma mark -
#pragma mark Initializers
- (instancetype)initWithNewParseTicket:(PFObject *)newParseTicket {
    self = [super initWithFieldName:MTParseTicketNameKey
                         fieldValue:@""
                    controllerTitle:@"New Ticket"
                         parseModel:newParseTicket];
    
    if(self) {
        //Additional initializations as needed.
    }
    
    return self;
}

#pragma mark -
#pragma mark Overrides
- (void)didSaveFieldToParse {
    [self.delegate didAddTicket:self.parseModel];
}

- (void)didCancel {
    [self.delegate didCancelAddTicket];
}

@end
