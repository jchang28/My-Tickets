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
#pragma mark Setup
/**
 * Shared instance via singleton pattern.
 * referenced from http://www.galloway.me.uk/tutorials/singleton-classes/.
 *
 * 1.  Setup default ACL.
 * 2.  Setup foo
 * 3.  Set bar
 *
 * 5/6 - After thinking through, no good use for it now, as roles
 * and ACL different project from project, so it would not be
 * suitable for templating.  Defualt user permissions on the ACL should
 * still be set.
 */
+ (id)sharedFactory {
    static ParseModelFactory *sharedFactory = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        MTLog(@"Creating singleton instance of model factory...");
        //0.    Create singleton instance of the factory.
        sharedFactory = [[ParseModelFactory alloc] init];
        
        //1.    Setup default ACL, with access for current user only.
        MTLog(@"Setting up default ACL with access for current user...");
        [PFACL setDefaultACL:[PFACL ACL]
    withAccessForCurrentUser:YES];
        
        //2.    Setup foo
        //3.    Setup bar
    });
    
    return sharedFactory;
}

#pragma mark -
#pragma mark Initializer
- (id)init {
    if(self = [super init]) {
        
    }
    
    return self;
}


#pragma mark -
#pragma mark Role helpers
- (NSString *)RoleNameforProject:(PFObject *)project
                        withRole:(NSString *)roleName {
    static NSString *roleNameFormat = @"%@_%@";
    return [NSString stringWithFormat:roleNameFormat, project.objectId, roleName];
}

- (NSString *)MemberRoleNameForProject:(PFObject *)project {
    return [self RoleNameforProject:project
                                        withRole:MTParseProjectRoleMemberPostfix];
}

- (NSString *)MetaRoleNameForProject:(PFObject *)project {
    return [self RoleNameforProject:project
                                        withRole:MTParseProjectRoleMetaPostfix];
}

- (NSString *)AdminRoleNameForProject:(PFObject *)project {
    return [self RoleNameforProject:project
                                        withRole:MTParseProjectRoleAdminPostfix];
}


#pragma mark -
#pragma mark Project related
- (PFACL *)FactoryProjectACL:(PFObject *)project {
    PFACL *projectACL = [PFACL ACL];
    [projectACL setReadAccess:YES
              forRoleWithName:[self MemberRoleNameForProject:project]];
    
    [projectACL setWriteAccess:YES
               forRoleWithName:[self MetaRoleNameForProject:project]];
    
    return projectACL;
}

- (PFACL *)FactoryProjectACLUsingMemberRole:(PFRole *)memberRole
                             andMetaRoles:(PFRole *)metaRole {
    PFACL *projectACL = [PFACL ACL];
    [projectACL setReadAccess:YES
                      forRole:memberRole];
    [projectACL setWriteAccess:YES
                       forRole:metaRole];
    
    return projectACL;
}

//Note that this is SPECIFIC for the Project's ACL, differnt objects in
//this app will have different read/write access assigned to the roles.
//admin role for one project may have read/write access, while for another
//object may only have read access.
- (void)ConfigureProjectACL:(PFObject *)project
             forMemeberRole:(PFRole *)memberRole
                forMetaRole:(PFRole *)metaRole
               forAdminRole:(PFRole *)adminRole {
    


    
    
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
- (PFObject *)FactoryProject:(NSString *)projectName
 withDescription:(NSString *)projectDescription
     includeMeta:(BOOL)includeMeta {
    
    //1.    Create Project.
    PFObject *project = [PFObject objectWithClassName:MTParseProjectClassName];
    
    [project setObject:projectName
                forKey:MTParseProjectNameKey];
    [project setObject:projectDescription
                forKey:MTParseProjectDescriptionKey];
    [project setObject:[PFUser currentUser]
                forKey:MTParseProjectOwnerKey];
    
    //2.    Create Meta.
    PFObject *projectMeta = [PFObject objectWithClassName:MTParseProjectMetaClassName];
    [projectMeta setObject:project
                    forKey:MTParseProjectMetaProjectKey];
    
    
    [project setObject:projectMeta
                forKey:MTParseProjectMetaKey];
    
    //3.    Save synchronously Project along with child meta.
    //      Note this is after reading on the web that saving the parent
    //      will also save the child object.
    //      Refer to evernote's My Parse Book.
    [project save];
    
    //4.    Create Roles.
    //      May consider splitting this out into its own factory method.
    PFRole *memberRole = [PFRole roleWithName:[self MemberRoleNameForProject:project]];
    PFRole *metaRole = [PFRole roleWithName:[self MetaRoleNameForProject:project]];
    PFRole *adminRole = [PFRole roleWithName:[self AdminRoleNameForProject:project]];

    [memberRole save];
    [metaRole save];
    [adminRole save];
    
    
    //4a.   Create ACL
    PFACL *projectACL = [self FactoryProjectACLUsingMemberRole:memberRole
                                                             andMetaRoles:metaRole];
    
    //5.    Assign roles to project and meta's ACL.
    project.ACL = projectACL;
    [project save];
    
    return project;
}

#pragma mark -
#pragma mark Ticket related
- (PFObject *)FactoryTicketForProject:(PFObject *)project
    withTicketDescription:(NSString *)ticketDescription
         andTicketDetails:(NSString *)ticketDetails
              includeMeta:(BOOL)includeMeta {
    return nil;
}

#pragma mark -
#pragma mark Document related
- (PFObject *)FactoryDocumentForProject:(PFObject *)project
          withDocumentTitle:(NSString *)documentTitle
            andDocumentText:(NSString *)documentText
                includeMeta:(BOOL)includeMeta {
    return nil;
}

- (PFObject *)FactoryAnnouncementForProject:(PFObject *)project
          withAnnouncementTitle:(NSString *)announcementTitle
            andAnnouncementText:(NSString *)announcementText
                    includeMeta:(BOOL)includeMeta {
    return nil;
}

- (PFObject *)FactoryReportForProject:(PFObject *)project
          withReportTitle:(NSString *)reportTitle
         withReportFields:(NSArray *)reportFields
       andReportGroupings:(NSArray *)reportGroupings {
    return nil;
}

- (PFObject *)FactoryCommentsForObject:(PFObject *)projectAsset
           withCommentText:(NSString *)commentText
           byCommentAuthor:(PFUser *)commentAuthor
               includeMeta:(BOOL)includeMeta {
    return nil;
}

@end
