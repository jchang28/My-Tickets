//
//  MTGenericTableViewController.h
//  My Tickets
//
//  Created by Jeff Chang on 1/2/15.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MTGenericCell.h"
/**
 * Parse specific
 * Table View Controller that use the MTGenericCell.
 * Learned from ray??.com that can properly resize table cell height.
 * Created for future subclassing purposes.
 */
@interface MTGenericTableViewController : UITableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                     parseModel:(PFObject *)parseModel
               interestedFields:(NSArray *)interestedFields;

@end
