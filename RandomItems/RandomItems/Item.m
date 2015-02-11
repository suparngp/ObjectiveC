//
//  Item.m
//  RandomItems
//
//  Created by Suparn Gupta on 2/4/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "Item.h"

@implementation Item

+ (instancetype) randomItem{
    NSArray *randomAdjectivesList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounsList = @[@"Bear", @"Spork", @"Mac" ];
    
    //Get the index of a random adjective/npioun from the lists
    NSInteger randomAdjectiveIndex = arc4random() % [randomAdjectivesList count];
    NSInteger randomNounIndex = arc4random() % [randomNounsList count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectivesList objectAtIndex:randomAdjectiveIndex], [randomNounsList objectAtIndex:randomNounIndex]];
    int randomValue = arc4random() % 10;
    NSString *randomSerial = [NSString stringWithFormat:@"%c%c%c%c%c",
                              '0' + arc4random() % 10,
                              'A' + arc4random() % 26,
                              '0' + arc4random() % 10,
                              'A' + arc4random() % 26,
                              '0' + arc4random() % 10];
    Item *item = [[self alloc] initWithItemName:randomName valueInDollar:randomValue serialNumber:randomSerial];
    return item;
}

/**
 *  kldshklahdshg
 *
 *  @param name          lskjfdkgjdf
 *  @param valueInDollar akldfjgklja
 *  @param serialNumber  slkdfjblk
 *
 *  @return slkdfjglk
 */

- (instancetype) initWithItemName:(NSString *)name valueInDollar:(int)valueInDollar serialNumber:(NSString *)serialNumber{
    self = [super init];
    if(self){
        _itemName = name;
        _valueDollars = valueInDollar;
        _serialNumber = serialNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (instancetype) initWithItemName:(NSString *)name{
    return [self initWithItemName:name valueInDollar:0 serialNumber:@""];
}

- (instancetype) init{
    return [self initWithItemName:@"" valueInDollar:0 serialNumber:@""];
}

- (void) setItemName:(NSString *)str {
    _itemName = str;
}

- (NSString *) itemName{
    return _itemName;
}

- (void) setSerialNumber:(NSString *)str{
    _serialNumber = str;
}

- (NSString *) serialNumber{
    return _serialNumber;
}

- (NSDate *) dateCreated{
    return _dateCreated;
}

- (void) setValueDollars:(int)value{
    _valueDollars = value;
}

- (int) valueDollars{
    return _valueDollars;
}
- (NSString *) description{
    NSString* description = [[NSString alloc] initWithFormat:@"%@, %@, %@, %d", self.itemName, self.serialNumber, self.dateCreated, self.valueDollars];
    return description;
}

- (void) setContainerItem:(Item *)item{
    _containerItem = item;
}

- (Item *) containerItem{
    return _containerItem;
}

- (void) setContainedItem:(Item *)item{
    _containedItem = item;
    item.containerItem = self;
}

- (Item *) containedItem{
    return _containedItem;
}

- (void) dealloc{
    NSLog(@"Destroyed %@", self);
}
@end
