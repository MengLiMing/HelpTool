/************************************************************
 *  * EaseMob CONFIDENTIAL
 * __________________
 * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of EaseMob Technologies.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from EaseMob Technologies.
 */

#import <Foundation/Foundation.h>

@interface NSString (Category)

-(BOOL)isChinese;

- (CGSize)stringSizeWithFont:(UIFont *)font Size:(CGSize)size;

- (BOOL)validateMobile;
- (BOOL)validateEmail;
- (BOOL)validateIdentityCard;
- (BOOL)onlyNum;

/*添加下划线*/
- (NSAttributedString *)laeblUnderLine;
- (NSAttributedString *)underLineWithRange:(NSRange)range andColor:(UIColor *)color;

/*改变目标字体的颜色*/
- (NSAttributedString *)stylegoalColor:(UIColor *)goalColor
                            otherColor:(UIColor *)otherColor
                              andRange:(NSRange)range
                               andFont:(UIFont *)font;
@end
