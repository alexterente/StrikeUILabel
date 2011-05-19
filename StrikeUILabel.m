//
//  StrikeUILabel.m
//  TTM-iPhone
//
//  Created by Alex Terente on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StrikeUILabel.h"


@implementation StrikeUILabel


@synthesize strikeColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//setters
- (void)setStrikeColor:(UIColor *)color{
    [strikeColor release];
    strikeColor = [color copy];
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
	
    CGContextSetShouldAntialias(context, true);
    CGContextSetShouldSmoothFonts(context, true);
    
    CGSize textSize;
    textSize = [self.text drawInRect:rect withFont:self.font];
    
    if([strikeColor isKindOfClass:[UIColor class]]){
    const CGFloat* components = CGColorGetComponents([self.strikeColor CGColor]);
    
        // Drawing lines with a white stroke color
        CGContextSetRGBStrokeColor(context, components[0], components[1], components[2], CGColorGetAlpha([self.strikeColor CGColor]));
        // Draw them with a 2.0 stroke width so they are a bit more visible.
        CGContextSetLineWidth(context, 1.0);
	
        // Draw a single line from left to right
        CGContextMoveToPoint(context, rect.origin.x, rect.origin.y+textSize.height/2);
        CGContextAddLineToPoint(context, rect.origin.x+textSize.width, rect.origin.y+textSize.height/2);
        CGContextStrokePath(context);
    }
    
}


- (void)dealloc
{
    [strikeColor release];
    [super dealloc];
}

@end
