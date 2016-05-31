//
//  NSString+ToBezierPath.h
//  BanTangTextAnimation
//
//  Created by zack on 16/5/31.
//  Copyright © 2016年 HF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (ToBezierPath)
- (UIBezierPath*)bezierPathWithFont:(UIFont*)font;
@end
