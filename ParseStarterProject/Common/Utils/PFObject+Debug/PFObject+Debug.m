//
//  PFObject+Debug.m
//  My Tickets
//
//  Created by Jeff@Level3 on 5/12/15.
//
//

#import "PFObject+Debug.h"

@implementation PFObject (Debug)

#pragma mark -
#pragma mark Common debug
- (void)debugID:(NSString *)msg {
    NSLog([NSString stringWithFormat:@"%@[%@]", msg, self.objectId]);
}

#pragma mark -
#pragma mark Project debug
//- (void)debugAsProject;
//- (void)debugAsProjectMeta;
//- (void)debugAsRole;
//- (void)debugAsTicket;
//- (void)debugAsDocument;
//- (void)debugAsAnnouncement;


@end
