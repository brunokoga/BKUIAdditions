//
//  BKUIAdditions.m
//  MobileFieldCollection
//
//  Created by Bruno Koga on 4/1/13.
//  Copyright (c) 2013 Monsanto Company. All rights reserved.
//

#import "BKUIColorAdditions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (BKUIColorAdditions)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


+ (UIImage *)imageByRenderingView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 2.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

@end

@implementation UIView (BKUIAdditions)

- (void)applyGradientwithColor1:(UIColor*)c1 color2:(UIColor*)c2
{
	CAGradientLayer *gradient = [CAGradientLayer layer];
	gradient.frame = self.bounds;
	
	gradient.colors = [NSArray arrayWithObjects:(id)[c1 CGColor], (id)[c2 CGColor], nil];
	[self.layer insertSublayer:gradient atIndex:0];
}

@end

@implementation UIButton (BKUIAdditions)

- (void)applyBackgroundGradientImageWithTopColor:(UIColor *)topColor
                                     bottomColor:(UIColor *)bottomColor
                                        forState:(UIControlState)state
{
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    [backgroundView applyGradientwithColor1:topColor
                                     color2:bottomColor];
    UIImage *backgroundImage = [UIImage imageByRenderingView:backgroundView];
    [self setBackgroundImage:backgroundImage
                    forState:state];
}

@end

@implementation UIColor (BKUIAdditions)

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom:colorString start:0 length:1];
            green = [self colorComponentFrom:colorString start:1 length:1];
            blue  = [self colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString start:0 length:1];
            red   = [self colorComponentFrom:colorString start:1 length:1];
            green = [self colorComponentFrom:colorString start:2 length:1];
            blue  = [self colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom:colorString start:0 length:2];
            green = [self colorComponentFrom:colorString start:2 length:2];
            blue  = [self colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString start:0 length:2];
            red   = [self colorComponentFrom:colorString start:2 length:2];
            green = [self colorComponentFrom:colorString start:4 length:2];
            blue  = [self colorComponentFrom:colorString start:6 length:2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}



@end