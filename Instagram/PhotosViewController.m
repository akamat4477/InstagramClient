//
//  PhotosViewController.m
//  Instagram
//
//  Created by anjaneya kamat on 9/14/15.
//  Copyright (c) 2015 anjaneya kamat. All rights reserved.
//

#import "PhotosViewController.h"
#import "CustomTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "DeatailViewController.h"

@interface PhotosViewController ()
@property (nonatomic) NSDictionary *responseDictionary;

@end

@implementation PhotosViewController
@synthesize responseDictionary;

- (void)viewDidLoad {
    [super viewDidLoad];
    
        NSURL *url = [NSURL URLWithString:@"https://api.instagram.com/v1/media/popular?client_id=a7d9dfb190bd4cf08de08e101c5a8e82"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
        responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        [self.myCustomTableView reloadData];

    }];
    
    self.myCustomTableView.dataSource = self;
    self.myCustomTableView.delegate = self;
    self.myCustomTableView.rowHeight= 320;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    DeatailViewController *destViewController = (DeatailViewController *)segue.destinationViewController;
    NSIndexPath *indexPath = [self.myCustomTableView indexPathForCell:sender];
    NSString *imagePath = responseDictionary[@"data"][indexPath.row][@"images"][@"standard_resolution"][@"url"];

   // UIImage *image = [UIImage imageNamed:imagePath];
    destViewController.imageURL = [NSURL URLWithString:imagePath];

}



#pragma mark - Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"com.yahoo.anjaneya" forIndexPath:indexPath];
    NSString *UrlString = responseDictionary[@"data"][indexPath.row][@"images"][@"standard_resolution"][@"url"];
    
    NSURL *Url = [NSURL URLWithString:UrlString];
    [cell.myCustomImageView setImageWithURL:(Url)];
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
