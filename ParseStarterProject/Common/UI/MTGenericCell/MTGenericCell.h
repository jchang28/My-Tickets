//
//  MTGenericCell.h
//  My Tickets
//
//  Created by Jeff@Level3 on 12/26/14.
//
//

#import <UIKit/UIKit.h>
#import "MTAutoPreferredWidthLabel.h"

/**
 * A generic cell used in table view to display fields in models from Parse
 * in the form of Title/Subtitle - Key/Value respectively in a multiline format.
 *
 * Makes use of the MTAutoPreferredWidthLabel that can properly handle multiline
 * and orientation changes.
 *
 * q: What is the difference between Table View Cell's Row Height vs.
 * View's Height? (in the xib/interface builder?)
 */
@interface MTGenericCell : UITableViewCell

@property (strong, nonatomic) IBOutlet MTAutoPreferredWidthLabel *titleLabel;
@property (strong, nonatomic) IBOutlet MTAutoPreferredWidthLabel *subtitleLabel;

@end
