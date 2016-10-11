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

//-(id)initWithSuperView
//{
//    self = [super init];
//    
//    Class superClass = class_getSuperclass([self class]);
//    
//    NSString *sClassName = NSStringFromClass(superClass);
//    UIView *superView = (UIView*)[[[NSBundle mainBundle] loadNibNamed:sClassName owner:self options:nil] lastObject];
//    
////    [self setFrame:CGRectMake(superView.frame.origin.x, superView.frame.origin.y,
////                              superView.frame.size.width, superView.frame.size.height)];
//    
//    unsigned propertyCount = 0;
//    objc_property_t *properties = class_copyPropertyList([superView class], &propertyCount);
//    for ( int i = 0 ; i < propertyCount ; i++ ) {
//        objc_property_t property = properties[i];
//        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//        if (propertyName)
//        {
//            UIView *subView = [superView valueForKey:propertyName];
//            [self setValue:subView forKey:propertyName];
//            [self addSubview:subView];
//        }
//    }
//    return self;
//}

-(void)customMethod
{
    NSLog(@"This is customMethod");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
