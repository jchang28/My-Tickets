//
//  ParseModelFactory.h
//  My Tickets
//
//  Created by Jeff@Level3 on 4/2/15.
//
//
#import <Foundation/Foundation.h>
#import "ParseModels.h"

@interface ParseModelFactory : NSObject

+ (NSString *)MemberRoleNameForProject:(PFObject *)project;
+ (NSString *)MetaRoleNameForProject:(PFObject *)project;
+ (NSString *)AdminRoleNameForProject:(PFObject *)project;

+ (PFACL *)FactoryProjectACLUsingMemberRole:(PFRole *)memberRole
                             andMetaRoles:(PFRole *)metaRole;

+ (PFObject *)FactoryProject:(NSString *)projectName
 withDescription:(NSString *)projectDescription
     includeMeta:(BOOL)includeMeta;

+ (PFObject *)FactoryTicketForProject:(PFObject *)project
    withTicketDescription:(NSString *)ticketDescription
         andTicketDetails:(NSString *)ticketDetails
              includeMeta:(BOOL)includeMeta;

+ (PFObject *)FactoryDocumentForProject:(PFObject *)project
          withDocumentTitle:(NSString *)documentTitle
            andDocumentText:(NSString *)documentText
                includeMeta:(BOOL)includeMeta;

+ (PFObject *)FactoryAnnouncementForProject:(PFObject *)project
          withAnnouncementTitle:(NSString *)announcementTitle
            andAnnouncementText:(NSString *)announcementText
                    includeMeta:(BOOL)includeMeta;

+ (PFObject *)FactoryReportForProject:(PFObject *)project
          withReportTitle:(NSString *)reportTitle
         withReportFields:(NSArray *)reportFields
       andReportGroupings:(NSArray *)reportGroupings;

+ (PFObject *)FactoryCommentsForObject:(PFObject *)projectAsset
           withCommentText:(NSString *)commentText
           byCommentAuthor:(PFUser *)commentAuthor
               includeMeta:(BOOL)includeMeta;
@end