//
//  Item.h
//  RandomItems
//
//  Created by Suparn Gupta on 2/4/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueDollars;
    NSDate *_dateCreated;
    __weak Item *_containerItem;
    Item *_containedItem;
}

+ (instancetype) randomItem;
// Designated init for the Item

- (instancetype) initWithItemName:(NSString *)name
                    valueInDollar: (int) valueInDollar
                     serialNumber: (NSString *) serialNumber;
- (instancetype) initWithItemName:(NSString *)name;

- (void) setItemName:(NSString *) str;
- (NSString*)itemName;

- (void) setSerialNumber:(NSString *)str;
- (NSString *) serialNumber;

- (void) setValueDollars:(int)value;
- (int) valueDollars;
- (NSDate *) dateCreated;

- (void) setContainedItem:(Item *) item;
- (Item *) containedItem;

- (void) setContainerItem:(Item *)item;
- (Item *)containerItem;

@end