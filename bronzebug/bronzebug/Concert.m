//
//  Concert.m
//  bronzebug
//
//  Created by Suparn Gupta on 2/6/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import "Concert.h"

@implementation Concert

- (instancetype) initWithName:(NSString *)name roster:(NSMutableArray *)roster date:(NSDate *)date{
    self = [super init];
    _roster = roster;
    _date = date;
    _festivalName = name;
    return self;
}

- (NSString *) description{
    NSString *description = [[NSString alloc] initWithFormat:@"%@ %@ %@", _festivalName, _date, _roster];
    return description;
}
@end
