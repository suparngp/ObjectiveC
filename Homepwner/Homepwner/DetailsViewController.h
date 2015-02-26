//
//  DetailsViewController.h
//  Homepwner
//
//  Created by Suparn Gupta on 2/23/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;
@interface DetailsViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) Item *item;
@end
