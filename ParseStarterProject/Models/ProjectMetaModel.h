//
//  MetaModel.h
//  My Tickets
//
//  Created by Jeff@Level3 on 4/3/15.
//
//

#ifndef My_Tickets_MetaModel_h
#define My_Tickets_MetaModel_h

static NSString * const MTParseProjectMetaClassName = @"ProjectMeta";

//5/12/15 - Decided not to have ciruclar dependency due to complications
//and api call reduction; can put back if needed in the future... -jchang
//static NSString * const MTParseProjectMetaProjectKey = @"Project";

static NSString * const MTParseProjectMetaTicketsRelationKey = @"TicketsRelation";

//Do later....
static NSString * const MTParseProjectMetaDocumentsRelationKey = @"";
static NSString * const MTParseProjectMetaAnnouncementsRelationKey = @"";
static NSString * const MTParseProjectMetaReportsRelationKey = @"";




#endif
