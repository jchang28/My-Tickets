//
//  ProjectContentsController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 12/30/14.
//
//

#import "ProjectContentsController.h"

@interface ProjectContentsController ()

@end

static NSString * const ContentHeaderIdentifier = @"header";
static NSString * const ContentCellIdentifier = @"cell";

@implementation ProjectContentsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    [self.tableView registerClass:[UITableViewHeaderFooterView class]
//forHeaderFooterViewReuseIdentifier:ContentHeaderIdentifier];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:ContentCellIdentifier];
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
            
        case PROJECT_CONTENT_SECTION_MEMBERS:
            cell.textLabel.text = PROJECT_CONTENT_SECTION_MEMBERS_HEADER;
            
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
