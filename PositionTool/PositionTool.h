//
//  PositionTool.h
//  Demo
//
//  Created by my on 16/5/11.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef void(^PlaceMarkBlock)(CLPlacemark *placemark);

@interface PositionTool : NSObject

+ (void)startLocate:(PlaceMarkBlock)result;
+ (NSString *)cityName:(CLPlacemark *)placemark;

@end
