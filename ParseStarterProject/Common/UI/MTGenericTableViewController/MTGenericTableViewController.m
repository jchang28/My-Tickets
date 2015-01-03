//
//  MTGenericTableViewController.m
//  My Tickets
//
//  Created by Jeff Chang on 1/2/15.
//
//

#import "MTGenericTableViewController.h"

@interface MTGenericTableViewController ()

@property (nonatomic, strong) PFObject *parseModel;
@property (nonatomic, strong) NSArray *interestedFields;

@end

static NSString * const MTGenericCellIdentifier = @"MTGenericCell";

@implementation MTGenericTableViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                     parseModel:(PFObject *)parseModel
               interestedFields:(NSArray *)interestedFields {
    self = [super init];
    
    if(self) {
        _parseModel = parseModel;
        _interestedFields = interestedFields;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupUI];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.interestedFields count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTGenericCell *cell = [tableView dequeueReusableCellWithIdentifier:MTGenericCellIdentifier
                                                            forIndexPath:indexPath];
    
    // Configure the cell...
    [self _configureCell:cell
             atIndexPath:indexPath];

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

#pragma mark -
#pragma mark UITableView delegate obligations
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self _heightForRowAtIndexPath:indexPath];
}

#pragma mark -
#pragma mark Privates
#pragma mark Private - Setup UI
- (void)_setupUI {
    [self.tableView registerNib:[UINib nibWithNibName:MTGenericCellIdentifier
                                               bundle:nil]
         forCellReuseIdentifier:MTGenericCellIdentifier];
}

#pragma mark Private - Cell configuraiton
- (void)_configureCell:(MTGenericCell *)cell
           atIndexPath:(NSIndexPath *)indexPath {
    cell.titleLabel.text = self.interestedFields[indexPath.row];
    cell.subtitleLabel.text = self.parseModel[self.interestedFields[indexPath.row]];
}

#pragma mark Private - Cell height calculations
/**
 * The money shots...
 */
- (CGFloat)_calculateHeightForConfiguredSizingCell:(MTGenericCell *)sizingCell {
    //...todo
    
}

- (CGFloat)_heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    static MTGenericCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:MTGenericCellIdentifier];
    });
    
    [self _configureCell:sizingCell
             atIndexPath:indexPath];
    
    return [self _calculateHeightForConfiguredSizingCell:sizingCell];
}


@end
