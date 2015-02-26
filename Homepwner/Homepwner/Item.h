//
//  Item.h
//  RandomItems
//
//  Created by Suparn Gupta on 2/4/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (strong, nonatomic) NSString* itemName;
@property (strong, nonatomic) NSString *serialNumber;
@property (nonatomic) int valueDollars;
@property (strong, nonatomic) NSDate *dateCreated;
@property (strong, readonly, nonatomic) NSString *key;
+ (instancetype) randomItem;
// Designated init for the Item

- (instancetype) initWithItemName:(NSString *)name
                    valueInDollar: (int) valueInDollar
                     serialNumber: (NSString *) serialNumber;
- (instancetype) initWithItemName:(NSString *)name;

@end