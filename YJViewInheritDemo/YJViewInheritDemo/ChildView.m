//
//  ChildView.m
//  CustomView
//
//  Created by Alex on 2016/10/10.
//  Copyright © 2016年 wyj. All rights reserved.
//

#import "ChildView.h"
#import <objc/runtime.h>

@implementation ChildView

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
    
    
    
//    Class obj = NSClassFromString(sClassName);
//    id subView = obj.new;
    return subView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
