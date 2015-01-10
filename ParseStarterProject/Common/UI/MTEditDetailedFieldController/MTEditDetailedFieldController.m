//
//  MTEditDetailedFieldController.m
//  My Tickets
//
//  Created by Jeff Chang on 1/9/15.
//
//

#import "MTEditDetailedFieldController.h"

@interface MTEditDetailedFieldController ()

@property (nonatomic, strong) NSString *controllerTitle;

@end

static NSString * const MTGenericDetailedFieldControllerNib = @"MTGenericDetailedFieldController";

@implementation MTEditDetailedFieldController

#pragma mark -
#pragma mark Initializers
- (instancetype)initWithFieldName:(NSString *)fieldName
                       fieldValue:(NSString *)fieldValue
                  controllerTitle:(NSString *)controllerTitle
                       parseModel:(PFObject *)parseModel {
    self = [super initWithNibName:MTGenericDetailedFieldControllerNib
                           bundle:nil
                        fieldName:fieldName
                       fieldValue:fieldValue
                parseModel:parseModel];
    
    if(self) {
        _controllerTitle = controllerTitle;
    }
    
    return self;
}

#pragma mark -
#pragma mark Overrides
- (void)didCreateUI {
    self.title = self.controllerTitle;
    self.fieldValueTextView.text = self.fieldValue;
}

@end
