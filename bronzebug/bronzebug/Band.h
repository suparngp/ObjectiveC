//
//  Band.h
//  bronzebug
//
//  Created by Suparn Gupta on 2/6/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Band : NSObject

{
    /**
     *  the name of the band
     */
    NSString *_name;
    /**
     *  the genre of the band
     */
    NSString *_genre;
}

/**
 *  Generates a random band
 *
 *  @return an instance of a band
 */
+ (instancetype) randomBand;


/**
 *  Initializes a Band object with using name and genre
 *
 *  @param name  the name of the namd
 *  @param genre the genre of the band
 *
 *  @return a Band object or nil if it cannot be initialized
 */
- (instancetype) initWithName:(NSString *)name
                        genre:(NSString *)genre;

/**
 *  Initializes a Band object with name and a random genre
 *
 *  @param name the name of the band
 *
 *  @return a Band object or nil if it cannot be initialized
 */
- (instancetype)initWithName:(NSString *)name;

/**
 *  Setter for name
 *
 *  @param name the name of the band
 */
- (void) setName:(NSString *)name;

/**
 *  Getter for name
 *
 *  @return the name of the band
 */
- (NSString *) name;

/**
 *  Setter for genre
 *
 *  @param genre the genre of the band
 */
- (void) setGenre:(NSString *)genre;

/**
 *  Getter for and
 *
 *  @return the genre of the band
 */
- (NSString *) genre;

/**
 *  Start playing the show
 */
- (void) startShow;
@end
