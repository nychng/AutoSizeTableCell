//
//  MasterViewController.h
//  AutoSizeTableCell
//
//  Created by adnim on 16/03/14.
//  Copyright (c) 2014 AppTakk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class MyTableViewCell;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSMutableArray * objects;

@property (nonatomic, strong) MyTableViewCell *prototypeCell;

@end
