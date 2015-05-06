//
//  ParseObjectDebugger.h
//  My Tickets
//
//  Created by Jeff@Level3 on 4/22/15.
//
//

#import <Foundation/Foundation.h>
#import "ParseModels.h"

/**
 * project name
 * project description
 * project owner
 * project admins (list)
 * project memebers (list)
 */
static NSString * const POProjectDebugTemplate = @"Project name[%@].\n"
    @"Project description[%@].\n"
    @"Project owner[%@],\n"
    @"Project roles\n"
    @"Project admins:\n"
    @"%@\n"
    @"Project members:\n"
    @"%@\n";

static NSString * const PORolesTemplate = @"";
static NSString * const POTicketDebugTemplate = @"";
static NSString * const POUserDebugTemplate = @"";

@interface ParseObjectDebugger : NSObject

+ (NSString *)DebugProject:(PFObject *)project;

@end
