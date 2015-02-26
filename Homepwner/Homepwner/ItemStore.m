//
//  ItemStore.m
//  Homepwner
//
//  Created by Suparn Gupta on 2/18/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"
#import "ItemsImageStore.h"

@interface ItemStore ()

@property (nonatomic, strong) NSMutableArray *privateItems;
@end

@implementation ItemStore

+ (instancetype) sharedStore{
    static ItemStore *shared;
    if(!shared){
        shared =  [[self alloc] initPrivate];
    }
    NSLog(@"Just returning");
    return shared;
    
}

- (instancetype) init{
    [NSException raise:@"Singleton" format:@"Use + [ItemStore sharedStore]"];
    return nil;
}

- (instancetype) initPrivate{
    NSLog(@"Inside private");
    self = [super init];
    self.privateItems = [[NSMutableArray alloc] init];
    return  self;
}

- (NSArray *)allItems{
    return [self.privateItems copy];
}

- (Item *) createItem{
    Item *randomItem = [Item randomItem];
    [self.privateItems addObject:randomItem];
    return  randomItem;
}

- (void) removeItem:(Item *)item{
    NSString *key = item.key;
    [[ItemsImageStore sharedStore] deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}
@end
