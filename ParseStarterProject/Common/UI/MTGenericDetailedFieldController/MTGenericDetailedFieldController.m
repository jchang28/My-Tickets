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
                     fieldTitle:(NSString *)fieldTitle
                     fieldValue:(NSString *)fieldValue {
    
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if(self) {
        self.title = fieldTitle;
        [_fieldValueTextView setText:fieldValue];

    }
    
    return self;
}



#pragma mark -
#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.fieldValueTextView.text = @"gibberish...";
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

@end
