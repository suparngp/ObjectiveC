//
//  Item.m
//  RandomItems
//
//  Created by Suparn Gupta on 2/4/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "Item.h"
@interface Item()
@property (strong, readwrite, nonatomic) NSString* key;
@end
@implementation Item

+ (instancetype) randomItem{
    NSArray *randomAdjectivesList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounsList = @[@"Bear", @"Spork", @"Mac" ];
    
    //Get the index of a random adjective/npioun from the lists
    NSInteger randomAdjectiveIndex = arc4random() % [randomAdjectivesList count];
    NSInteger randomNounIndex = arc4random() % [randomNounsList count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectivesList objectAtIndex:randomAdjectiveIndex], [randomNounsList objectAtIndex:randomNounIndex]];
    int randomValue = arc4random() % 100;
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
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *uuidString = [uuid UUIDString];
        _key = uuidString;
    }
    return self;
}

- (instancetype) initWithItemName:(NSString *)name{
    return [self initWithItemName:name valueInDollar:0 serialNumber:@""];
}

- (instancetype) init{
    return [self initWithItemName:@"" valueInDollar:0 serialNumber:@""];
}


- (int) valueDollars{
    return _valueDollars;
}
- (NSString *) description{
    NSString* description = [[NSString alloc] initWithFormat:@"%@, %d, %@, %@", self.itemName, self.valueDollars, self.serialNumber, self.dateCreated];
    return description;
}



- (void) dealloc{
    NSLog(@"Destroyed %@", self);
}
@end
