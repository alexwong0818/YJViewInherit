//
//  UIView+YJInheritAdd.m
//  CustomView
//
//  Created by Alex on 2016/10/10.
//  Copyright © 2016年 wyj. All rights reserved.
//

#import "UIView+YJInheritAdd.h"
#import <objc/runtime.h>

@implementation UIView (YJInheritAdd)

-(id)initWithSuperView
{
    //子类
    self = [self init];
    
    //runtime获取父类
    Class superClass = class_getSuperclass([self class]);
    NSString *sClassName = NSStringFromClass(superClass);
    
    //获取子类，验证子类是否存在xib
    NSString *sSelfClassName = NSStringFromClass([self class]);
    NSArray *selfXib = [[NSBundle mainBundle] loadNibNamed:sSelfClassName owner:self options:nil];
    
    //存在则利用同名xib进行实例
    if (selfXib.count > 0) {
        self = [selfXib lastObject];
    } else {
        UIView *superView = (UIView*)[[[NSBundle mainBundle] loadNibNamed:sClassName owner:self options:nil] lastObject];
        //初始化view属性
        [self setFrame:superView.frame];
        
        self.backgroundColor = [superView backgroundColor];
        
        //取出父类成员，并加进子类中
        unsigned propertyCount = 0;
        objc_property_t *properties = class_copyPropertyList([superView class], &propertyCount);
        for ( int i = 0 ; i < propertyCount ; i++ ) {
            objc_property_t property = properties[i];
            NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            if (propertyName)
            {
                //父类控件成员
                UIView *subView = [superView valueForKey:propertyName];
                [self setValue:subView forKey:propertyName];
            }
        }
        
        [self addSubview:superView];
    }
    return self;
}


@end
