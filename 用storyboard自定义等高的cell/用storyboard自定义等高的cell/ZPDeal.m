//
//  ZPDeal.m
//  用storyboard自定义等高的cell
//
//  Created by apple on 16/5/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPDeal.h"

@implementation ZPDeal

+(instancetype)dealWithDict:(NSDictionary *)dictionary
{
    ZPDeal *deal = [[self alloc] init];
    
    /**
     使用KVC的方式封装对象：
     如果要使用KVC的方式封装对象的话，则必须模型类里的属性要与字典里面的key完全相同。
     */
    [deal setValuesForKeysWithDictionary:dictionary];
    
    return deal;
}

@end
