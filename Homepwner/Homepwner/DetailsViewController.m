//
//  DetailsViewController.m
//  Homepwner
//
//  Created by Suparn Gupta on 2/23/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "DetailsViewController.h"
#import "Item.h"
#import "ItemsImageStore.h"
@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, atomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) NSMutableArray *buttons;
@end

@implementation DetailsViewController

- (void) viewWillAppear:(BOOL)animated{
    
    
    Item *item = self.item;
    
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueDollars];
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = item.itemName;
    self.imageView.image = [[ItemsImageStore sharedStore] imageForKey:item.key];
    NSLog(@"%@", [ItemsImageStore sharedStore]);
    self.buttons = [self.toolbar.items mutableCopy];
    if(self.imageView.image){
        UIBarButtonItem *endButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(removeImage)];
        [self.buttons addObject:endButton];
    }
    [self.toolbar setItems:self.buttons animated:true];
}

- (void) setItem:(Item *)item{
    _item = item;
    ;
}

- (void) viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
    Item *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueDollars = [self.valueField.text intValue];
}

- (IBAction)takeImage:(id)sender {
    NSLog(@"Camera Button Tapped");
    
    UIImagePickerController *imagePicker =[[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    imagePicker.allowsEditing = TRUE;
    [self presentViewController:imagePicker animated:true completion:NULL];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"%@", self);
    UIImage *image = info[UIImagePickerControllerEditedImage];
    [[ItemsImageStore sharedStore] setImage:image forKey:self.item.key];
    self.imageView.image = image;
    [self dismissViewControllerAnimated:true completion:NULL];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}
- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:TRUE];
}

- (void) removeImage{
    self.imageView.image = nil;
    [[ItemsImageStore sharedStore] deleteImageForKey:self.item.key];
    [self.buttons removeObjectAtIndex:1];
    
    [self.toolbar setItems:self.buttons];
}
@end
