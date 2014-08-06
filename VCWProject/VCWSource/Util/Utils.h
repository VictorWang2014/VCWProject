//
//  Utils.h
//  Test
//
//  Created by 王明权 on 8/3/14.
//  Copyright (c) 2014 王明权. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ButtonClickRevoke) (UIButton *btn);

@interface Utils : NSObject

+ (void)logCGPointValue:(CGPoint)point;
+ (void)logCGRectValue:(CGRect)rect;

+ (void)createDefaultButtonWithView:(UIView *)view AndSelectorBlock:(ButtonClickRevoke)buttonClickRevoke;

@end

@interface UIButton (InvokeBlock)

@property (strong, nonatomic) ButtonClickRevoke buttonCallBack;

- (void)bindButtonClickCallBack:(ButtonClickRevoke)buttonClickRevoke;

@end
