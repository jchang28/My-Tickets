//
//  MTAutoPreferredWidthLabel.h
//  My Tickets
//
//  Created by Jeff@Level3 on 12/26/14.
//
//

#import <UIKit/UIKit.h>

/**
 * Referenced from: www.raywenderlich.com/73602/dynamic-table-view-cell-height-auto-layout
 *
 * A label that automatically adjust its auto preferred max layout wide
 * based when orientation changes.
 *
 * This was a custom label that the tutorial created to address the issue where
 * the preferred layout width (aka auto preferred max layout) is not
 * updated by the auto layout system (actually, it can't due to limitations
 * of tools - in the xcode, the design of the preferred with is a static one,
 * so it cannot account for runtime layout changes, so this custom label class
 * addresses this issue).
 *
 *
 */
@interface MTAutoPreferredWidthLabel : UILabel

@end
