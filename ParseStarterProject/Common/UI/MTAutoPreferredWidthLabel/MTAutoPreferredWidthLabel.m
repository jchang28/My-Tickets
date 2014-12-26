//
//  MTAutoPreferredWidthLabel.m
//  My Tickets
//
//  Created by Jeff@Level3 on 12/26/14.
//
//

#import "MTAutoPreferredWidthLabel.h"

/**
 * Key functionality added to this label:
 * 1.   setBounds:bounds - required as at design time you can only set the
 *      bounds for a single orientation, whereas during run time the orientation
 *      can change.
 */
@implementation MTAutoPreferredWidthLabel

/**
 * "...when screen orientation changes, the labes' width aren't updated -
 * consequently, the intrinsic height calculation fo each is wrong."
 *
 * - Note that the implicit height is derived based on the intrinsic width.
 * - Note that although auto layout can adjust for the label width using
 * constraints, the existing implicit height is still probably using
 * the original implicit height in the original orientation dimesions.
 * -jchang
 */
- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    
    if(self.numberOfLines == 0 && bounds.size.width != self.preferredMaxLayoutWidth) {
        self.preferredMaxLayoutWidth = self.bounds.size.width;
        
        [self setNeedsUpdateConstraints];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
