//
//  ItemsImageStore.m
//  Homepwner
//
//  Created by Suparn Gupta on 2/24/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "ItemsImageStore.h"

@interface ItemsImageStore()
@property (strong, nonatomic) NSMutableDictionary *dictionary;
@end

@implementation ItemsImageStore
+ (instancetype) sharedStore{
    static ItemsImageStore *sharedStore;
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype) init{
    [NSException raise:@"Singleton" format:@"Use +[ItemsImageStore sharedStore]"];
    return nil;
}

- (instancetype) initPrivate{
    self = [super init];
    if (self) {
        self.dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) setImage:(UIImage *)image
           forKey: (NSString *)key{
    self.dictionary[key] = image;
}
- (UIImage *) imageForKey:(NSString *)key{
    return self.dictionary[key];
}
- (void) deleteImageForKey:(NSString *)key{
    [self.dictionary removeObjectForKey:key];
}
@end
