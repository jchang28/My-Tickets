//
//  ProjectDetailController.m
//  My Tickets
//
//  Created by Jeff Chang on 12/25/14.
//
//

#import "ProjectDetailController.h"
#import "MTGenericCell.h"
#import "MTGenericDetailedFieldController.h"

@interface ProjectDetailController ()

@property (nonatomic, strong) PFObject *parseProjectModel;
@property (nonatomic, strong) NSArray *interestedParseFields;

@end

static NSString * const MTGenericCellIdentifier = @"MTGenericCell";
//static NSString * const MTGenericDetailedFieldControllerNib = @"MTGenericDetailedFieldController";

@implementation ProjectDetailController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
              parseProjectModel:(PFObject *)parseProjectMode {
    
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if(self) {
        _parseProjectModel = parseProjectMode;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //0.    Setup interested fields to retrieve from parse to present
    [self _setupInterestedParseFields];
    
    //1.    Register the custom cell we are using.
    [self.tableView registerNib:[UINib nibWithNibName:MTGenericCellIdentifier
                                               bundle:nil]
         forCellReuseIdentifier:MTGenericCellIdentifier];
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
    return [self.interestedParseFields count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTGenericCell *cell = [tableView dequeueReusableCellWithIdentifier:MTGenericCellIdentifier
                                                          forIndexPath:indexPath];
    
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
#pragma mark UITableView Delegate obligations
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self _heightForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MTGenericDetailedFieldController *detailedFieldController = [[MTGenericDetailedFieldController alloc] initWithNibName:@"MTGenericDetailedFieldController"
                                                                                                                   bundle:nil
                                                                                                                fieldName:@"abc"
                                                                                                               fieldValue:@"xyz"
                                                                                                        parseProjectModel:self.parseProjectModel];
    [self.navigationController pushViewController:detailedFieldController
                                         animated:YES];
}

#pragma mark -
#pragma mark Privates
#pragma mark Private - Cell presentation configuration from model
- (void)_configureCell:(MTGenericCell *)cell
           atIndexPath:(NSIndexPath *)indexPath {
    
    cell.titleLabel.text = self.interestedParseFields[indexPath.row];
    cell.subtitleLabel.text = self.parseProjectModel[self.interestedParseFields[indexPath.row]];
    

//    Test data to test presentation of the cells.
//    cell.titleLabel.text = @"Gibberish lines and more lines.  Gibberish lines and more lines.  Gibberish lines and more lines.  Gibberish lines and more lines.  Gibberish lines and more lines.  ";
//    cell.subtitleLabel.text = @"The content of the gibberish lines and more lines, etc, etc. The content of the  lines and more lines, etc, etc. The content of the gibberish lines and more lines, etc, etc.  The content of the gibberish lines and more lines, etc, etc. The content of the gibberish lines and more lines, etc, etc. The content of the gibberish lines and more lines, etc, etc.  The content of the gibberish lines and more lines, etc, etc. The content of the gibberish lines and more lines, etc, etc. The content of the gibberish lines and more lines, etc, etc.";
}

#pragma mark Private - Cell height calculations
/**
 * The money shots...
 */
- (CGFloat)_calculateHeightForConfiguredSizingCell:(MTGenericCell *)sizingCell {
    
    //Added to work with auto resizing width labels.
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(sizingCell.bounds));
    
    //q:    Not sure clear on the following two.
    //a:    I think it just means do a manual layout of the cells.
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    //q:    Not sure, does it mean provide the smallest fitted size?
    //a:    Asks to layout system to provided the smallest size that fits into
    //      the auto layout constraints.
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    //Add 1.0f for the cell separator height..
    return size.height + 1.0f;
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

#pragma mark Private - Setup data source / fields we are interested in
- (void)_setupInterestedParseFields {
    self.interestedParseFields = [NSArray arrayWithObjects:MTParseProjectNameKey, MTParseProjectDescriptionKey, nil];
    
}


@end
