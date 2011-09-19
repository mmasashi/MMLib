//
//  UIView+MM.h
//  MMLib
//
//  Created by Miyazaki Masashi on 11/09/18.
//  Copyright 2011 mmasashi.jp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MM)

/**
    Get view with specified tag from subviews.
    While the target UIView's viewWithTag method includes 
    subviews of subviews, the target of this method is includes
    only subviews of self.
    @param tag target tag
    @return view object
 */
- (id)viewWithTagFromSubviews:(NSInteger)tag;

@end
