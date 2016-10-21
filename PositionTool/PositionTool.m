//
//  PositionTool.m
//  Demo
//
//  Created by my on 16/5/11.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "PositionTool.h"

static PositionTool *toolManager = nil;

@interface PositionTool () <CLLocationManagerDelegate>

@property (nonatomic, copy) PlaceMarkBlock palceBlock;
@property (nonatomic, retain) CLLocationManager *locationManager;

@end

//iOS8系统中需要在info.plist中添加NSLocationAlwaysUsageDescription或NSLocationWhenInUseUsageDescription
@implementation PositionTool

+ (PositionTool *)manger {
    if (!toolManager) {
        toolManager = [[PositionTool alloc] init];
    }
    return toolManager;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        if ([[[UIDevice currentDevice] systemVersion] doubleValue] > 8.0) {
            [self.locationManager requestWhenInUseAuthorization];//前台定位
//            [self.locationManager requestAlwaysAuthorization];//前后台同时定位
        }
    }
    return self;
}

//开启定位
+ (void)startLocate:(PlaceMarkBlock)result {
    [[PositionTool manger] startLocate:result];
}

- (void)startLocate:(PlaceMarkBlock)result {
    if (![CLLocationManager locationServicesEnabled]) {
        //提示用户无法进行定位操作
        NSLog(@"无法进行定位");
        return;
    }
    
    self.palceBlock = [result copy];

    // 停止上一次的
    [self.locationManager stopUpdatingLocation];
    //开始定位
    [self.locationManager startUpdatingLocation];
}

#pragma mark - 定位代理
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续保持更新位置，则在此方法中获取一个之后让locationManager stopUpdatingLocation
    CLLocation *currentLocation = [locations lastObject];
    
    //获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    //根据经纬度方向地理编译出地址信息
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *array, NSError *error) {
        
        if (array.count > 0) {
            
            CLPlacemark *placemark = [array objectAtIndex:0];
            if (toolManager.palceBlock) {
                toolManager.palceBlock(placemark);
            }
            
//            NSString *city = placemark.locality;
//            
//            if (!city) {
//                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
//                city = placemark.administrativeArea;
//            }
            
        } else if (error == nil && array.count == 0) {
            if (toolManager.palceBlock) {
                toolManager.palceBlock(nil);
            }
        } else if (error != nil) {
            if (toolManager.palceBlock) {
                toolManager.palceBlock(nil);
            }
        }
    }];
    
    
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSString *errorString;
    [manager stopUpdatingLocation];
    if (toolManager.palceBlock) {
        toolManager.palceBlock(nil);
    }
    NSLog(@"Error: %@",[error localizedDescription]);
    switch([error code]) {
        case kCLErrorDenied:
            //Access denied by user
            errorString = @"请在设置中开启定位";
            //Do something...
            break;
        case kCLErrorLocationUnknown:
            //Probably temporary...
            errorString = @"定位数据不可用";
            //Do something else...
            break;
        default:
            errorString = @"未知错误,定位失败";
            break;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:errorString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];

}

+ (NSString *)cityName:(CLPlacemark *)placemark {
    NSString *cityName;
    if (placemark) {
        cityName = placemark.locality;
        if (!cityName) {
            //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
            cityName = placemark.administrativeArea;
        }
    } else {
        cityName = @"定位";
    }
    return cityName;
}

@end
