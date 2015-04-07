//
//  ParseModelFactory.m
//  My Tickets
//
//  Created by Jeff@Level3 on 4/2/15.
//
//
#include "ParseModelFactory.h"

@implementation ParseModelFactory

#pragma mark -
#pragma mark Role helpers
+ (NSString *)RoleNameforProject:(PFObject *)project
                        withRole:(NSString *)roleName {
    static NSString *roleNameFormat = @"%@_%@";
    return [NSString stringWithFormat:roleNameFormat, project.objectId, roleName];
}

+ (NSString *)MemberRoleNameForProject:(PFObject *)project {
    return [ParseModelFactory RoleNameforProject:project
                                        withRole:MTParseProjectRoleMemberPostfix];
}

+ (NSString *)MetaRoleNameForProject:(PFObject *)project {
    return [ParseModelFactory RoleNameforProject:project
                                        withRole:MTParseProjectRoleMetaPostfix];
}

+ (NSString *)AdminRoleNameForProject:(PFObject *)project {
    return [ParseModelFactory RoleNameforProject:project
                                        withRole:MTParseProjectRoleAdminPostfix];
}


#pragma mark -
#pragma mark Project related
+ (PFACL *)FactoryProjectACL:(PFObject *)project {
    PFACL *projectACL = [PFACL ACL];
    [projectACL setReadAccess:YES
              forRoleWithName:[ParseModelFactory MemberRoleNameForProject:project]];
    
    [projectACL setWriteAccess:YES
               forRoleWithName:[ParseModelFactory MetaRoleNameForProject:project]];
    
    return projectACL;
}

+ (PFACL *)FactoryProjectACLUsingMemberRole:(PFRole *)memberRole
                             andMetaRoles:(PFRole *)metaRole {
    PFACL *projectACL = [PFACL ACL];
    [projectACL setReadAccess:YES
                      forRole:memberRole];
    [projectACL setWriteAccess:YES
                       forRole:metaRole];
    
    return projectACL;
}

/**
 * Needs
 * 1.  Roles
 * - Member
 * - Meta
 * - Admin
 *
 * 2.  Meta
 * - Meta to Tickets
 * - Meta to Documents <- can do later
 * - Meta to Announcements <- can do later
 * - Meta to Reports
 */
+ (PFObject *)FactoryProject:(NSString *)projectName
 withDescription:(NSString *)projectDescription
     includeMeta:(BOOL)includeMeta {
    
    //1.    Create Project.
    PFObject *project = [PFObject objectWithClassName:MTParseProjectClassName];
    
    [project setObject:projectName
                forKey:MTParseProjectNameKey];
    [project setObject:projectDescription
                forKey:MTParseProjectDescriptionKey];
    
    //2.    Create Meta.
    PFObject *projectMeta = [PFObject objectWithClassName:MTParseProjectMetaClassName];
    
    [project setObject:projectMeta
                forKey:MTParseProjectMetaKey];
    
    //3.    Save synchronously Project along with child meta.
    [project save];
    
    //4.    Create Roles.
    //      May consider splitting this out into its own factory method.
    PFRole *memberRole = [PFRole roleWithName:[ParseModelFactory MemberRoleNameForProject:project]];
    PFRole *metaRole = [PFRole roleWithName:[ParseModelFactory MetaRoleNameForProject:project]];
    PFRole *adminRole = [PFRole roleWithName:[ParseModelFactory AdminRoleNameForProject:project]];
    [memberRole.roles addObject:metaRole];
    [metaRole.roles addObject:adminRole];
    
    [memberRole save];
    [metaRole save];
    [adminRole save];
    
    
    //4a.   Create ACL
    PFACL *projectACL = [ParseModelFactory FactoryProjectACLUsingMemberRole:memberRole
                                                             andMetaRoles:metaRole];
    
    //5.    Assign roles to project and meta's ACL.
    project.ACL = projectACL;
    [project save];
    
    return project;
}

#pragma mark -
#pragma mark Ticket related
+ FactoryTicketForProject:(PFObject *)project
    withTicketDescription:(NSString *)ticketDescription
         andTicketDetails:(NSString *)ticketDetails
              includeMeta:(BOOL)includeMeta {
    return nil;
}

#pragma mark -
#pragma mark Document related
+ FactoryDocumentForProject:(PFObject *)project
          withDocumentTitle:(NSString *)documentTitle
            andDocumentText:(NSString *)documentText
                includeMeta:(BOOL)includeMeta {
    return nil;
}

+ FactoryAnnouncementForProject:(PFObject *)project
          withAnnouncementTitle:(NSString *)announcementTitle
            andAnnouncementText:(NSString *)announcementText
                    includeMeta:(BOOL)includeMeta {
    return nil;
}

+ FactoryReportForProject:(PFObject *)project
          withReportTitle:(NSString *)reportTitle
         withReportFields:(NSArray *)reportFields
       andReportGroupings:(NSArray *)reportGroupings {
    return nil;
}

+ FactoryCommentsForObject:(PFObject *)projectAsset
           withCommentText:(NSString *)commentText
           byCommentAuthor:(PFUser *)commentAuthor
               includeMeta:(BOOL)includeMeta {
    return nil;
}

@end
