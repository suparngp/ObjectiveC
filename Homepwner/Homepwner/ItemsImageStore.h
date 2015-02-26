//
//  ItemsImageStore.h
//  Homepwner
//
//  Created by Suparn Gupta on 2/24/15.
//  Copyright (c) 2015 Suparn Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsImageStore : NSObject

+ (instancetype) sharedStore;
- (void) setImage:(UIImage *)image
           forKey: (NSString *)key;
- (UIImage *) imageForKey:(NSString *)key;
- (void) deleteImageForKey:(NSString *)key;
@end
