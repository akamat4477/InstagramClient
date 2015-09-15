//
//  DeatailViewController.m
//  Instagram
//
//  Created by anjaneya kamat on 9/14/15.
//  Copyright (c) 2015 anjaneya kamat. All rights reserved.
//

#import "DeatailViewController.h"
#import "SecCustomView.h"
#import "UIImageView+AFNetworking.h"

@interface DeatailViewController ()

@end

@implementation DeatailViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   //  SecCustonImageView *cell = [UITableView dequeueReusableCellWithIdentifier:@"anjaneya-sec"];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SecCustomView *cell = [tableView dequeueReusableCellWithIdentifier:@"anjaneya-sec"];
    
    NSString *imgURL = self.photoURL;
    [cell.SecCustonImageView setImageWithURL:[NSURL URLWithString:imgURL]];
    NSLog(@"tableView is: %@", self.photoURL);
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
