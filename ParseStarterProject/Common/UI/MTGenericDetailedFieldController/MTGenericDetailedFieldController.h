//
//  MTGenericDetailedFieldController.h
//  My Tickets
//
//  Created by Jeff@Level3 on 12/29/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MTGenericDetailedFieldController : UIViewController

@property (nonatomic, strong) IBOutlet UITextView *fieldValueTextView;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      fieldName:(NSString *)fieldName
                     fieldValue:(NSString *)fieldValue
              parseProjectModel:(PFObject *)parseProjectModel;

@end
