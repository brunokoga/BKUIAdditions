//
//  UIButton+CircularFrame.m
//  People
//
//  Created by Bruno Koga on 5/24/13.
//  Copyright (c) 2013 Ci&T. All rights reserved.
//

#import "UIButton+CircularFrame.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButton (CircularFrame)
- (void)setDiameter:(float)newSize;
{
    CGPoint saveCenter = self.center;
    CGRect newFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newSize, newSize);
    self.frame = newFrame;
    self.layer.cornerRadius = newSize / 2.0;
    self.center = saveCenter;
    [self setClipsToBounds:YES];
}

- (void)makeCircular
{
    [self setDiameter:self.frame.size.width];
}
@end
