//
//  PhotoObject.h
//  InstaKilo
//
//  Created by Elle Ti on 2017-06-14.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotoObject : NSObject

@property (nonatomic) NSString *photoSubject;
@property (nonatomic) NSString *photoLocation;
@property (nonatomic) UIImage *photo;

- (instancetype)initWithImage:(UIImage *)photo subject:(NSString *)photoSubject location:(NSString *)photoLocation;

@end
