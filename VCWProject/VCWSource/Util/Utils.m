//
//  Utils.m
//  Test
//
//  Created by 王明权 on 8/3/14.
//  Copyright (c) 2014 王明权. All rights reserved.
//

#import "Utils.h"
#import <objc/runtime.h>

static char const * const ObjectTagKey = "ObjectTag";

@implementation UIButton(InvokeBlock)

- (ButtonClickRevoke)buttonCallBack {
    return objc_getAssociatedObject(self, ObjectTagKey);
}

- (void)setButtonCallBack:(ButtonClickRevoke)newObjectTag {
    objc_setAssociatedObject(self, ObjectTagKey, newObjectTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)bindButtonClickCallBack:(ButtonClickRevoke)buttonClickRevoke
{
    self.buttonCallBack = buttonClickRevoke;
    [self addTarget:self action:@selector(buttonClickCallBack:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClickCallBack:(id)sender
{
    self.buttonCallBack(sender);
}

@end

@implementation Utils

+ (void)logCGPointValue:(CGPoint)point
{
    NSLog(@"Log:  point.x=%f, point.y=%f", point.x, point.y);
}

+(void)logCGRectValue:(CGRect)rect
{
    NSLog(@"Log:  rect.orgin.x=%f, rect.orgin.y=%f, rect.size.width=%f, rect.size.height=%f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

+ (void)createDefaultButtonWithView:(UIView *)view AndSelectorBlock:(ButtonClickRevoke)buttonClickRevoke
{
    UIButton *defaultButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    defaultButton.backgroundColor = [UIColor blackColor];
    defaultButton.titleLabel.text = @"Click Me";
    [defaultButton setTitle:@"Click Me" forState:UIControlStateNormal];
    [defaultButton bindButtonClickCallBack:buttonClickRevoke];
    
    [view addSubview:defaultButton];
}

@end
