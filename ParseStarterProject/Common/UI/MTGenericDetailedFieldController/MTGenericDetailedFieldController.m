//
//  MTGenericDetailedFieldController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 12/29/14.
//
//

#import "MTGenericDetailedFieldController.h"

@interface MTGenericDetailedFieldController ()

@end

@implementation MTGenericDetailedFieldController

#pragma mark -
#pragma mark Initializers
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                     fieldName:(NSString *)fieldName
                     fieldValue:(NSString *)fieldValue
              parseProjectModel:(PFObject *)parseProjectModel {
    
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if(self) {
        _fieldName = [NSString stringWithString:fieldName];
        _fieldValue = [NSString stringWithString:fieldValue];
        _parseProjectModel = parseProjectModel;
    }
    
    return self;
}



#pragma mark -
#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self _setupUI];
    [self didCreateUI];
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
#pragma mark Privates
- (void)_setupUI {
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                target:self
                                                                                action:@selector(ibSaveField:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                  target:self
                                                                                  action:@selector(ibCancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
}

- (void)_saveFieldValueToParse {
    NSLog(@"Saving field[%@]=%@", self.fieldName, self.fieldValue);
    
    self.parseProjectModel[self.fieldName] = self.fieldValue;
    
    [self.parseProjectModel saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"Save [%@].", succeeded ? @"succeeded" : @"failed");
    }];     
}

#pragma mark -
#pragma mark IBActions
- (void)ibSaveField:(id)sender {
    self.fieldValue = self.fieldValueTextView.text;
    
    [self _saveFieldValueToParse];
    [self didSaveFieldToParse];
}

- (void)ibCancel:(id)sender {
    [self didCancel];
}

#pragma mark -
#pragma mark Publics
- (void)didCreateUI {
    self.title = self.fieldName;
    self.fieldValueTextView.text = self.fieldValue;
}

//For others to override if necessary
- (void)didSaveFieldToParse {
}

- (void)didCancel {
}

@end
