//
//  MTEditDetailedFieldController.h
//  My Tickets
//
//  Created by Jeff Chang on 1/9/15.
//
//

#import "MTGenericDetailedFieldController.h"

/**
 * A simple controller for the entry of a particular field.
 * Derived from MTGenericDetailedFieldController.
 */
@interface MTEditDetailedFieldController : MTGenericDetailedFieldController

- (instancetype)initWithFieldName:(NSString *)fieldName
                       fieldValue:(NSString *)fieldValue
                  controllerTitle:(NSString *)controllerTitle
                       parseModel:(PFObject *)parseModel;

@end
