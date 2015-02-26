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
#import "DetailsViewController.h"

@interface ItemsViewController ()
//@property (nonatomic, strong) IBOutlet UIView *headerView;
//@property (weak, nonatomic) IBOutlet UIButton *editButton;
@end

@implementation ItemsViewController

- (instancetype) init{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self){
        for (int i = 0; i < 5; i++){
            [[ItemStore sharedStore] createItem];
        }
    }
    UINavigationItem *navItem = [self navigationItem];
    navItem.title = @"Items";
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
    navItem.rightBarButtonItem = button;
    navItem.leftBarButtonItem = self.editButtonItem;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ItemStore sharedStore].allItems count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    NSArray *items = [[ItemStore sharedStore] allItems];
    cell.textLabel.text = [items[indexPath.row] description];
    
    return cell;
}

- (void) viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
//    UIView *header = self.headerView;
//    [self.tableView setTableHeaderView:header];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"No more items";
}

- (IBAction) addNewItem:(id)sender{
    Item *newItem = [[ItemStore sharedStore] createItem];
    NSInteger lastRow = [[[ItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}
//
//- (IBAction)toggleEditingMode:(id)sender{
//    [self setEditing:![self isEditing] animated:true];
//    if(self.editing){
//        [self.editButton setTitle:@"Done" forState:UIControlStateNormal];
//        [self.editButton.titleLabel sizeToFit];
//    }
//    else {
//        [self.editButton setTitle:@"Edit" forState:UIControlStateNormal];
//        [self.editButton.titleLabel sizeToFit];
//    }
//}
//- (UIView *) headerView{
//    if(!_headerView){
//        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
//    }
//    
//    return _headerView;
//}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        NSArray *items = [[ItemStore sharedStore] allItems];
        [[ItemStore sharedStore] removeItem:items[indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // create a details view controller and push it on the navigation controller
    UINavigationController *navigationController = [self navigationController];
    DetailsViewController *detailsController = [[DetailsViewController alloc] init];
    Item *item = [[ItemStore sharedStore] allItems][indexPath.row];
    detailsController.item = item;
    [navigationController pushViewController:detailsController animated:YES];
}
@end
