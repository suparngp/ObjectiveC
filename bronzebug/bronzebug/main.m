//
//  main.m
//  bronzebug
//
//  Created by Suparn Gupta on 2/6/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Band.h"
#import "Concert.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray* bandsList = [[NSMutableArray alloc]  initWithCapacity:10];
        for(int i = 0; i < 5; i++){
            Band *band = [Band randomBand];
            [bandsList insertObject:band atIndex:i];
        }
        
        NSLog(@"%@", bandsList);
        //bronze
        //NSLog(@"%@", bandsList[928]);
        
        //Gold
        Concert *concert = [[Concert alloc] initWithName:@"NAMM" roster:bandsList date:[[NSDate alloc] init]];
        NSLog(@"%@", concert);
    }
    return 0;
}
