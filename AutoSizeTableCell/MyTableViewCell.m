//
//  MyTableViewCell.m
//  AutoSizeTableCell
//
//  Created by adnim on 16/03/14.
//  Copyright (c) 2014 AppTakk. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    self.myLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.myLabel.frame);
}

@end
