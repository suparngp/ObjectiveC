//
//  Item.h
//  RandomItems
//
//  Created by Suparn Gupta on 2/4/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueDollars;
@property (nonatomic, strong) NSDate *dateCreated;
@property (nonatomic, weak) Item *containerItem;
@property (nonatomic, strong) Item *containedItem;

+ (instancetype) randomItem;
// Designated init for the Item

- (instancetype) initWithItemName:(NSString *)name
                    valueInDollar: (int) valueInDollar
                     serialNumber: (NSString *) serialNumber;
- (instancetype) initWithItemName:(NSString *)name;



- (void) setContainedItem:(Item *) item;
- (Item *) containedItem;

@end