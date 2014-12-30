//
//  ProjectDetailController.h
//  My Tickets
//
//  Created by Jeff Chang on 12/25/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ProjectModel.h"

@interface ProjectDetailController : UITableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
              parseProjectModel:(PFObject *)parseProjectMode;

@end
