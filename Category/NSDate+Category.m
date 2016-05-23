//
//  NSDate+Category.m
//  JiuNianTang
//
//  Created by apple on 15/9/17.
//  Copyright (c) 2015年 FuTang. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

+ (NSString *)stringWithTimeInterval:(long long)time andDateFormatteString:(NSString *)string {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:string];
    return [df stringFromDate:date];
}

- (NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentOlderOneDateStr = [dateFormatter stringFromDate:self];
    return currentOlderOneDateStr;
}


- (NSDateComponents *)dateComponent {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return dateComponent;
}

//根据时间获得年月日时分秒
- (NSInteger)yearWithDate {
    return [self dateComponent].year;
}

- (NSInteger)monthWithDate {
    return [self dateComponent].month;
}

- (NSInteger)dayWithDate {
    return [self dateComponent].day;
}

- (NSInteger)hourWithDate {
    return [self dateComponent].hour;
}

- (NSInteger)minuteWithDate {
    return [self dateComponent].minute;
}

- (NSInteger)secondWithDate {
    return [self dateComponent].second;
}


//string类型转换成时间
+ (NSDate *)dateWithString:(NSString *)str {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSDate *date = [[NSDate alloc] init];
    date = [df dateFromString:str];
    return date;
}


@end
