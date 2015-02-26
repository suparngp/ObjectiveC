//
//  ItemStore.h
//  Homepwner
//
//  Created by Suparn Gupta on 2/18/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;


@interface ItemStore : NSObject

@property (nonatomic, readonly, strong) NSArray *allItems;

+ (instancetype) sharedStore;
- (Item *) createItem;
- (void) removeItem:(Item *)item;
@end
