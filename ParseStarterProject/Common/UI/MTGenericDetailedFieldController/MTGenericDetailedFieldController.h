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

@property (nonatomic, strong) NSString *fieldName;
@property (nonatomic, strong) NSString *fieldValue;
@property (nonatomic, strong) PFObject *parseProjectModel;

@property (nonatomic, strong) IBOutlet UITextView *fieldValueTextView;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      fieldName:(NSString *)fieldName
                     fieldValue:(NSString *)fieldValue
              parseProjectModel:(PFObject *)parseProjectModel;

/**
 * Override this for additional setup.
 */
- (void)didCreateUI;

/**
 * Override this after ibActionSave - most likely to dismiss some view 
 * controller or satisfy some delegation methods.
 */
- (void)didSaveFieldToParse;

/**
 * Override this if save is cancelled - most likely to dismiss some
 * view controller or satisfy some delegation methods.
 */
- (void)didCancel;
@end
