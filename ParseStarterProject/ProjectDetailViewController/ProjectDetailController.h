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

@property (nonatomic, strong) PFObject *parseProjectModel;

@end
