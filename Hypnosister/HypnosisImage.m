//
//  HypnosisImage.m
//  Hypnosister
//
//  Created by Camron Schwoegler on 9/28/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import "HypnosisImage.h"

@implementation HypnosisImage

@synthesize image;

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Load image and get size
    image = [UIImage imageNamed:@"Image"];
    CGSize size = [image size];
    CGPoint center = CGPointMake(size.width / 2, size.height / 2);
    
    // Draw circular border and shadow
    CGContextSetLineWidth(context, 2);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGSize offset = CGSizeMake(1, 1);
    CGContextSetShadowWithColor(context, offset, 2, [[UIColor darkGrayColor] CGColor]);
    CGContextAddArc(context, center.x, center.y, (size.width / 2) - 1, 0, M_PI * 2, YES);
    CGContextStrokePath(context);
    
    
    CGContextAddArc(context, center.x, center.y, size.width / 2 - 1, 0, M_PI * 2, YES);
    CGContextClip(context);
    [image drawAtPoint:CGPointMake(0, 0)];
    
    // Draw gradient
    CGFloat components[8] = {0.5,0.5,1,0.35,1,1,1,0}; // Set alpha channel values so that the hat can show through the gradient since the image has a white background
    CGFloat location[2] = {0,1};
    CGContextDrawLinearGradient(context, CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), components, location, 2), CGPointMake(center.x, 0), CGPointMake(center.x, size.height), 0);
    
}

@end
