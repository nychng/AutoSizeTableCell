# AutoSizeTableCell

A minimal example of how to use auto layout to calculate table cell height dynamically based on the content of a UILabel - also works when orientation changes.

Followed the example from [useyourloaf.com](http://useyourloaf.com/blog/2014/02/14/table-view-cells-with-varying-row-heights.html) and added the following from [stackoverflow.com](http://stackoverflow.com/questions/18746929/using-auto-layout-in-uitableview-for-dynamic-cell-layouts-variable-row-heights)

added the following to my custom cell:

```
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
```

and added the **self.prototypeCell.bounds** line in to the heightForRowAtIndexPath in the custom TableViewController


```
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
    
    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));
    
    [self.prototypeCell setNeedsLayout];    
    [self.prototypeCell layoutIfNeeded];
        
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
}
```

don't seem to need the UIContentSizeCategoryDidChangeNotification or the extra constraints in my case.