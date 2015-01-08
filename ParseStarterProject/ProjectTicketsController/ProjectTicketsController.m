//
//  ProjectTicketsController.m
//  My Tickets
//
//  Created by Jeff Chang on 1/2/15.
//
//

#import "ProjectTicketsController.h"
#import "ProjectTicketDetailController.h"

@interface ProjectTicketsController ()

@end

@implementation ProjectTicketsController

#pragma mark -
#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
#pragma mark UITableViewDelegate obligations
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PFObject *ticketModel = [self objectAtIndexPath:indexPath];
    
    ProjectTicketDetailController *ticketDetailController = [[ProjectTicketDetailController alloc] initWithTicketModel:ticketModel];
    
    [self.navigationController pushViewController:ticketDetailController
                                         animated:YES];
}

#pragma mark -
#pragma mark Parse Overrides

#pragma mark -
#pragma mark Privates
#pragma mark Private - Add button
- (void)_setupUI {
    self.title = @"Tickets";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(ibAddTicket:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

#pragma mark -
#pragma mark IBactions
- (IBAction)ibAddTicket:(id)sender {
#warning Add in real ticket add controller
    [self presentViewController:[[UIViewController alloc] init]
                       animated:YES
                     completion:nil];
}

#pragma mark -
#pragma mark ProjectTicketsControllerDelegate obligations
- (void)didAddTicket:(PFObject *)ticket {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
    [self loadObjects];
}

- (void)didCancelAddTicket {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}


@end
