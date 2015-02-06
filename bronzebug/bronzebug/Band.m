//
//  Band.m
//  bronzebug
//
//  Created by Suparn Gupta on 2/6/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "Band.h"


@implementation Band

+ (instancetype) randomBand {
    NSArray *randomBandNames = @[@"Beatles", @"The Who", @"Pink Floyd", @"Rush", @"Van Halen", @"Metallica"];
    NSArray *genres = @[@"Blues", @"Rock", @"Progressive Rock", @"Hard Rock", @"Classic Rock", @"Thrash Metal"];
    
    int index = arc4random() % [randomBandNames count];
    
    Band *band = [[Band alloc] initWithName:randomBandNames[index] genre: genres[index]];
    return band;
}

- (instancetype) initWithName:(NSString *)name genre:(NSString *)genre{
    self = [super init];
    _name = name;
    _genre = genre;
    return self;
}

- (instancetype) initWithName:(NSString *)name{
    return [self initWithName:name genre:@"Unknown Genre"];
}

- (void) setName:(NSString *)name{
    _name = name;
}

- (NSString *) name{
    return _name;
}

- (void) setGenre:(NSString *)genre{
    _genre = genre;
}

- (NSString *) genre{
    return _genre;
}

- (void) startShow{
    NSLog(@"%@ is going to rock the world", _name);
}

- (NSString *) description{
    return [[NSString alloc] initWithFormat:@"%@, %@", [self name], [self genre]];
}

@end
