//
//  MTGenericDetailedFieldController.m
//  My Tickets
//
//  Created by Jeff@Level3 on 12/29/14.
//
//

#import "MTGenericDetailedFieldController.h"

@interface MTGenericDetailedFieldController ()

@property (nonatomic, strong) NSString *fieldName;
@property (nonatomic, strong) NSString *fieldValue;
@property (nonatomic, strong) PFObject *parseProjectModel;

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
    
    self.title = self.fieldName;
    self.fieldValueTextView.text = self.fieldValue;
}

- (void)_saveFieldValueToParse {
    self.parseProjectModel[self.fieldName] = self.fieldValue;
}

#pragma mark -
#pragma mark IBActions
- (void)ibSaveField:(id)sender {
    self.fieldValue = self.fieldValueTextView.text;
    
    [self _saveFieldValueToParse];
}

@end
