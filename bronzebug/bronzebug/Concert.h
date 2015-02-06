//
//  Concert.h
//  bronzebug
//
//  Created by Suparn Gupta on 2/6/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Concert : NSObject
{
    NSDate *_date;
    NSString *_festivalName;
    NSMutableArray *_roster;
}

- (instancetype) initWithName:(NSString *)name
                       roster:(NSMutableArray *)roster
                         date:(NSDate *)date;
@end
