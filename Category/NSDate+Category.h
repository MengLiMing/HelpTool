//
//  NSDate+Category.h
//  JiuNianTang
//
//  Created by apple on 15/9/17.
//  Copyright (c) 2015年 FuTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

+ (NSString *)stringWithTimeInterval:(long long)time andDateFormatteString:(NSString *)string;
- (NSString *)dateString;


//根据时间获得年月日时分秒
- (NSInteger)yearWithDate;

- (NSInteger)monthWithDate;

- (NSInteger)dayWithDate;

- (NSInteger)hourWithDate;

- (NSInteger)minuteWithDate;

- (NSInteger)secondWithDate;

//string类型转换成时间
+ (NSDate *)dateWithString:(NSString *)str;

@end
