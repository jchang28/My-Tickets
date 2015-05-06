//
//  ParseObjectDebugger.m
//  My Tickets
//
//  Created by Jeff@Level3 on 4/22/15.
//
//

#import "ParseObjectDebugger.h"

@implementation ParseObjectDebugger

+ (NSString *)DebugProject:(PFObject *)project {
    [project fetchIfNeeded];
    
    PFUser *projectOwner = [project objectForKey:MTParseProjectOwnerKey];
    [projectOwner fetchIfNeeded];
    
    NSString *projectDebugString = [NSString stringWithFormat:POProjectDebugTemplate,
                                    [project objectForKey:MTParseProjectNameKey],
                                    [project objectForKey:MTParseProjectDescriptionKey],
                                    [projectOwner objectForKey:MTParseUserUserNameKey],
                                    @"List of admins...",
                                    @"List of members..."];
    
    return projectDebugString;
}

@end
