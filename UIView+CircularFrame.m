//
//  UIView+CircularFrame.m
//  People
//
//  Created by Bruno Koga on 5/1/13.
//  Copyright (c) 2013 Ci&T. All rights reserved.
//

#import "UIView+CircularFrame.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (CircularFrame)

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
