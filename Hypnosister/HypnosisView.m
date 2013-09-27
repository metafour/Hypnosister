//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Camron Schwoegler on 9/24/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

@synthesize circleColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // All HypnosisView objects should have a clear background
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor redColor]];
    }
    
    return self;
}

#pragma mark overrides

- (void)setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
//    NSLog(@"Current context: %@\nCurrent bounds: %@", ctx, bounds);
    // Determine center of bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // Radius should be nearly as large as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // The thickness of the line should be 10pt wide
    CGContextSetLineWidth(ctx, 10);
    
    // Line color: gray
//    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    // Line color: red
//    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0);
    [[self circleColor] setStroke];
    
    // Add a shape to the context
//    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    
    // Perform a drawing instruction; Draw current shape with current state
//    CGContextStrokePath(ctx);
    
    // Draw concentric circles from outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0, M_PI * 2.0, YES);
        CGContextStrokePath(ctx);
    }
    
    NSString *text = @"You are getting sleepy.";
    
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    NSDictionary *attributes = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName, nil];
    
    // This doesn't work for an attributes dictionary
//    NSDictionary *textAttributes = [NSDictionary dictionaryWithObject:@28 forKey:@"boldSystemFontOfSize"];
    
    // This doesn't work for an attributes dictionary either
    // NSDictionary *textAttributes = [[font fontDescriptor] fontAttributes];
    
    CGRect textRect;
    
    textRect.size = [text sizeWithAttributes:attributes];
    
    // Need integers to size views
    textRect.size.width = ceil(textRect.size.width);
    textRect.size.height = ceil(textRect.size.height);
    
    // origin = center
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    // fill color = black
    [[UIColor blackColor] setFill];
    
    CGSize offset = CGSizeMake(4, 3);
    
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    // Draw the string
    [text drawInRect:textRect withAttributes:attributes];
//    NSLog(@"%@", attributes);
//    [text drawInRect:textRect withAttributes:nil];
    
//    NSLog(@"width: %f, height: %f", textRect.size.width, textRect.size.height);
    
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        
        if (circleColor == [UIColor redColor]) {
            [self setCircleColor:[UIColor greenColor]];
        } else {
            [self setCircleColor:[UIColor redColor]];
        }
        
    }
}

@end
