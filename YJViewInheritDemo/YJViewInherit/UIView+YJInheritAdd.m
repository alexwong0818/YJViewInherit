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
    self = [super init];
    
    Class superClass = class_getSuperclass([self class]);
    
    NSString *sClassName = NSStringFromClass(superClass);
    id subView = [[[NSBundle mainBundle] loadNibNamed:sClassName owner:self options:nil] lastObject];
    
    unsigned propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([subView class], &propertyCount);
    for ( int i = 0 ; i < propertyCount ; i++ ) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        if (propertyName)
        {
            [self setValue:[subView valueForKey:propertyName] forKey:propertyName];
        }
    }
    return self;
}


@end
