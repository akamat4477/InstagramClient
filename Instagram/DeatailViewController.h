//
//  DeatailViewController.h
//  Instagram
//
//  Created by anjaneya kamat on 9/14/15.
//  Copyright (c) 2015 anjaneya kamat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeatailViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSString *photoCaption;


@end
