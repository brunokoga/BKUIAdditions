//
//  BKUIAdditions.h
//  MobileFieldCollection
//
//  Created by Bruno Koga on 4/1/13.
//  Copyright (c) 2013 Monsanto Company. All rights reserved.
//

@interface UIImage (BKUIColorAdditions)

+ (UIImage *)imageByRenderingView:(UIView *)view;
+ (UIImage *)imageWithColor:(UIColor *)color;

@end

@interface UIView (BKUIAdditions)

- (void)applyGradientwithColor1:(UIColor*)c1 color2:(UIColor*)c2;

@end

@interface UIButton (BKUIAdditions)

- (void)applyBackgroundGradientImageWithTopColor:(UIColor *)topColor
                                     bottomColor:(UIColor *)bottomColor
                                        forState:(UIControlState)state;
@end

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UIColor (BKUIAdditions)

+ (UIColor *) colorWithHexString: (NSString *) hexString;

@end