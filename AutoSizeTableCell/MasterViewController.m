//
//  MasterViewController.m
//  AutoSizeTableCell
//
//  Created by adnim on 16/03/14.
//  Copyright (c) 2014 AppTakk. All rights reserved.
//

#import "MasterViewController.h"
#import "MyTableViewCell.h"

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.objects = [NSMutableArray arrayWithObjects:
                @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at feugiat dolor. Vestibulum vitae varius nisi. Proin bibendum sodales mauris, ut euismod nisl tempor nec. Integer id magna posuere, pulvinar dolor ac, feugiat elit. Sed scelerisque posuere felis, id pellentesque leo. Aenean id lacus quam. Phasellus rhoncus suscipit consequat. Curabitur suscipit sem nec molestie iaculis. In rhoncus pretium ante, sit amet rutrum magna sodales nec. Quisque ac libero at velit aliquam dignissim. Nam ut porta lorem.",
                @"Donec posuere, mi eget fringilla convallis, quam mauris ornare libero, fermentum elementum odio felis eget ante. Praesent tempor ligula felis, quis faucibus purus euismod condimentum. Suspendisse adipiscing lacus in tellus luctus, vel accumsan risus pharetra.",
                nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:1];
    [titleLabel setText:_objects[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (MyTableViewCell *)prototypeCell
{
    if (!_prototypeCell)
    {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell"];
    }
    return _prototypeCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self configureCell:self.prototypeCell forRowAtIndexPath:indexPath];
    
    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));
    
    [self.prototypeCell setNeedsLayout];    
    [self.prototypeCell layoutIfNeeded];
        
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


@end
