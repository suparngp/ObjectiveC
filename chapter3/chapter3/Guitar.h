//
//  Guitar.h
//  chapter3
//
//  Created by Suparn Gupta on 2/10/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Guitar : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, unsafe_unretained) int price;
@property (nonatomic, readonly) NSDate *releaseDate;
@property (nonatomic, weak) Guitar *container;
@property (nonatomic, strong) Guitar *containedBy;

- (instancetype)initWithName:(NSString *)name
                        type:(NSString *)type
                       price:(int)price
                 releaseDate:(NSDate *)releaseDate;

- (instancetype)initWithName:(NSString *)name;
@end
