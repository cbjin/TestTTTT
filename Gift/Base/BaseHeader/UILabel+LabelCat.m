//
//  UILabel+LabelCat.m
//  Gift
//
//  Created by 蔡佰津 on 2018/4/9.
//  Copyright © 2018年 cbj. All rights reserved.
//

#import "UILabel+LabelCat.h"
#import "BaseHeader.h"

static const void *associatedKey = "associatedKey";
@implementation UILabel (LabelCat)

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, associatedKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.text = name;
}

- (NSString *)name {
    return objc_getAssociatedObject(self, associatedKey);
}

+ (void)load {
//    Method method = class_getInstanceMethod(self, @selector(backgroundColor));
//    Method methodreset = class_getInstanceMethod(self, @selector(resetColor));
//    method_exchangeImplementations(method, methodreset);
}

- (CGSize)labelWithStr:(NSString *)str Size:(CGSize)size font:(UIFont *)font {
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize sizeResult = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    return sizeResult;
}



+ (void)initialize {
    
}

@end
