//
//  ProjectContentsController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 12/30/14.
//
//

#import "ProjectContentsController.h"
#import "ProjectTicketsController.h"
#import "ProjectInviteController.h"
#import "ProjectInvitationsController.h"
#import "ParseModels.h"

#import "ParseObjectDebugger.h"
#import "GenericInfoController.h"

@interface ProjectContentsController ()

@end

static NSString * const ContentHeaderIdentifier = @"header";
static NSString * const ContentCellIdentifier = @"cell";

@implementation ProjectContentsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDelegate obligations
/*
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ContentHeaderIdentifier];
    
    if([view isKindOfClass:[UITableViewHeaderFooterView class]]) {
        UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
        
        switch (section) {
            case PROJECT_CONTENT_SECTION_TICKETS:
                header.textLabel.text = PROJECT_CONTENT_SECTION_TICKETS_HEADER;
                break;
                
            case PROJECT_CONTENT_SECTION_REPORTS:
                header.textLabel.text = PROJECT_CONTENT_SECTION_REPORTS_HEADER;
                
            case PROJECT_CONTENT_SECTION_MEMBERS:
                header.textLabel.text = PROJECT_CONTENT_SECTION_MEMBERS_HEADER;
                
            default:
                break;
        }
    }
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section {
    return 20.0f;
}
*/

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return PROJECT_CONTENT_SECTION_COUNT;
}
 */

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return PROJECT_CONTENT_SECTION_COUNT;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ContentCellIdentifier
                                                            forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case PROJECT_CONTENT_SECTION_TICKETS:
            cell.textLabel.text = PROJECT_CONTENT_SECTION_TICKETS_HEADER;
            break;
            
        case PROJECT_CONTENT_SECTION_REPORTS:
            cell.textLabel.text = PROJECT_CONTENT_SECTION_REPORTS_HEADER;
            break;
            
        case PROJECT_CONTENT_SECTION_MEMBERS:
            cell.textLabel.text = PROJECT_CONTENT_SECTION_MEMBERS_HEADER;
            break;
            
        case PROJECT_CONTENT_SECTION_INVITE:
            cell.textLabel.text = PROJECT_CONTENT_SECTION_INVITE_HEADER;
            break;
            
        case PROJECT_CONTENT_SECTION_INVITATIONS:
            cell.textLabel.text = PROJECT_CONTENT_SECTION_INVITATIONS_HEADER;
            break;
            
        case PROJECT_CONTENT_SECTION_INFO:
            cell.textLabel.text = PROJECT_CONTENT_SECTION_INFO_HEADER;
            break;
            
        default:
            break;
    }

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case PROJECT_CONTENT_SECTION_TICKETS: {
            ProjectTicketsController *ticketsController = [[ProjectTicketsController alloc] initWithClassName:MTParseTicketClassName];
            //Provide it an instance of the current project we are working with.
            //Most defintely will need to use it as a filtering as
            //A user's acl for tickets can span multiple projects.
            ticketsController.project = self.project;
            ticketsController.textKey = MTParseTicketNameKey;
            
            [self.navigationController pushViewController:ticketsController
                                                 animated:YES];
        }
            break;
            
        case PROJECT_CONTENT_SECTION_REPORTS:
            break;
            
        case PROJECT_CONTENT_SECTION_MEMBERS:
            break;
            
        case PROJECT_CONTENT_SECTION_INVITE: {
            ProjectInviteController *inviteController = [[ProjectInviteController alloc] initWithNibName:@"ProjectInviteController"
                                                                                                  bundle:nil];
            //Provide it an instance of the current project we are working with.
            inviteController.project = self.project;
            
            [self.navigationController pushViewController:inviteController
                                                 animated:YES];
        }
            break;
            
        case PROJECT_CONTENT_SECTION_INVITATIONS: {
            ProjectInvitationsController *invitationsController = [[ProjectInvitationsController alloc] initWithClassName:MTParseInvitationClassName];
            invitationsController.textKey = MTParseInvitationMessageKey;
            
            [self.navigationController pushViewController:invitationsController
                                                 animated:YES];
        }
            
            break;
            
        case PROJECT_CONTENT_SECTION_INFO: {
            GenericInfoController *projectInfoController = [[GenericInfoController alloc] initWithNibName:@"GenericInfoController"
                                                                                                   bundle:nil];
            projectInfoController.infoText = [ParseObjectDebugger DebugProject:self.project];
            [self.navigationController pushViewController:projectInfoController
                                                 animated:YES];
            
        }
            break;
            
        default:
            break;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark Privates
#pragma mark Privage - Setup UI
- (void)_setupUI {
    self.title = self.project[MTParseProjectNameKey];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //    [self.tableView registerClass:[UITableViewHeaderFooterView class]
    //forHeaderFooterViewReuseIdentifier:ContentHeaderIdentifier];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:ContentCellIdentifier];
}

@end
