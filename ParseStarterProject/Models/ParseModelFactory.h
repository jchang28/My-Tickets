//
//  ParseModelFactory.h
//  My Tickets
//
//  Created by Jeff@Level3 on 4/2/15.
//
//
#import <Foundation/Foundation.h>
#import "Utils.h"
#import "ParseModels.h"

@interface ParseModelFactory : NSObject

#pragma mark -
#pragma mark Singleton factory
+ (id)sharedFactory;

#pragma mark -
#pragma mark Roles helpers
- (NSString *)memberRoleNameForProject:(PFObject *)project;
- (NSString *)metaRoleNameForProjectMeta:(PFObject *)projectMeta;
- (NSString *)adminRoleNameForProject:(PFObject *)project;

#pragma mark -
#pragma mark Project Meta related
- (void)configureProjectMetaACL:(PFACL *)metaACL
             forMetaRole:(PFRole *)metaRole;

- (PFObject *)factoryProjectMeta:(PFObject *)project;


#pragma mark -
#pragma mark Project related
/**
 * 4/22/15 - No error checking for now.
 * 4/22/15 - Finally 'got' how to use the ACP right, you use
 * an a SPECIFIC object's (such as a project) ACL and grant/assign read+write
 * to specific user/role objects.
 */
- (void)configureProjectACL:(PFACL *)projectACL
             forMemeberRole:(PFRole *)memberRole
               forAdminRole:(PFRole *)adminRole;


- (PFObject *)factoryProject:(NSString *)projectName
 withDescription:(NSString *)projectDescription
     includeMeta:(BOOL)includeMeta;

#pragma mark -
#pragma mark Ticket factories
- (PFObject *)FactoryTicketForProject:(PFObject *)project
    withTicketDescription:(NSString *)ticketDescription
         andTicketDetails:(NSString *)ticketDetails
              includeMeta:(BOOL)includeMeta;

//- (void)ConfigureTicketACL:...

#pragma mark -
#pragma mark Document factories
- (PFObject *)FactoryDocumentForProject:(PFObject *)project
          withDocumentTitle:(NSString *)documentTitle
            andDocumentText:(NSString *)documentText
                includeMeta:(BOOL)includeMeta;
// - (void)ConfigureDocumentACL:...

- (PFObject *)FactoryAnnouncementForProject:(PFObject *)project
          withAnnouncementTitle:(NSString *)announcementTitle
            andAnnouncementText:(NSString *)announcementText
                    includeMeta:(BOOL)includeMeta;

- (PFObject *)FactoryReportForProject:(PFObject *)project
          withReportTitle:(NSString *)reportTitle
         withReportFields:(NSArray *)reportFields
       andReportGroupings:(NSArray *)reportGroupings;

- (PFObject *)FactoryCommentsForObject:(PFObject *)projectAsset
           withCommentText:(NSString *)commentText
           byCommentAuthor:(PFUser *)commentAuthor
               includeMeta:(BOOL)includeMeta;
@end