//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Suparn Gupta on 2/18/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "Item.h"


@interface ItemsViewController ()

@end

@implementation ItemsViewController

- (instancetype) init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if(self){
        for (int i = 0; i < 5; i++){
            [[ItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style{
    return [self init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    int above50 = 0;
    int below50 = 0;
    for (Item *item in [ItemStore sharedStore].allItems) {
        if (item.valueDollars > 50) {
            above50++;
        }
        else {
            below50++;
        }
    }
    NSLog(@"%d, %d", above50, below50);
    if(section == 0){
        return below50;
    }
    else {
        return above50;
    }
//    return [[ItemStore sharedStore].allItems count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
//                                                            forIndexPath:indexPath];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    NSArray *filteredArray = nil;
    NSArray *items = [[ItemStore sharedStore] allItems];
    
    if(indexPath.section == 0){
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"valueDollars <= 50"];
        filteredArray = [items filteredArrayUsingPredicate:pred];
    }
    else {
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"valueDollars > 50"];
        filteredArray = [items filteredArrayUsingPredicate:pred];
    }
    
    NSLog(@"%@", filteredArray);
    
    cell.textLabel.text = [filteredArray[indexPath.row] description];
    
    return cell;
}

- (void) viewDidLoad{
    [super viewDidLoad];
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    
//    if (self.tableView.contentSize.height > self.tableView.frame.size.height)
//    {
//        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
//        [self.tableView setContentOffset:offset animated:YES];
//    }
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"Items below $50";
    }
    else {
        return @"Items above $50";
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"No more items";
}

@end
