//
//  main.m
//  RandomItems
//
//  Created by Suparn Gupta on 2/4/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // Crate a mmutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        //Send the message addObject to the NSMutableArray pointed to
        //by the varuable items passwinf a string each time
        
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        //Send another messge insertObject:atIndex:, to that same array object
        [items insertObject:@"Zero" atIndex:0];
        
        // Loop through the items and print them
        for(int i = 0; i < [items count]; i++){
            NSString *item = [items objectAtIndex:i];
            NSLog(@"%@", item);
        }
        NSLog(@"Using the fast enumeration");
        // Using the fast enumeration
        for(NSString *item in items){
            NSLog(@"%@", item);
        }
        
        Item *item = [[Item alloc] init];
        [item setItemName:@"The best computing book"];
        [item setSerialNumber:@"ABESR68DS"];
        [item setValueDollars:10];
        NSLog(@"%@", item);
        
        item.itemName = @"The Rockers Manual";
        item.serialNumber = @"Metal";
        item.valueDollars = 123;
        
        NSLog(@"%@", item);
        item = [[Item alloc] initWithItemName:@"Yahoo"];
        
        NSLog(@"%@", item);
        
        item = [item initWithItemName:@"I am awesome" valueInDollar:13 serialNumber:@"SuperCool"];
        NSLog(@"%@", item);

        NSMutableArray * newItems = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < 10; i++){
            Item *item = [Item randomItem];
            [newItems addObject:item];
        }
        
        Item *specialItem
        
        NSLog(@"%@", newItems);
        // Destroy the instance of the items array
        items = nil;
    }
    return 0;
}
