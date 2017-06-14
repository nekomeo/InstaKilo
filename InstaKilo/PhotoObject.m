//
//  PhotoObject.m
//  InstaKilo
//
//  Created by Elle Ti on 2017-06-14.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "PhotoObject.h"

@implementation PhotoObject

- (instancetype)initWithImage:(UIImage *)photo subject:(NSString *)photoSubject location:(NSString *)photoLocation
{
    self = [super init];
    if (self)
    {
        self.photo = photo;
        self.photoSubject = photoSubject;
        self.photoLocation = photoLocation;
    }
    return self;
}

@end
