//
//  PhotosViewController.h
//  Instagram
//
//  Created by anjaneya kamat on 9/14/15.
//  Copyright (c) 2015 anjaneya kamat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myCustomTableView;

@end

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@end