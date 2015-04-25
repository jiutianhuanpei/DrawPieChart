//
//  DrawView.m
//  TestOne
//
//  Created by 张国栋 on 15/4/25.
//  Copyright (c) 2015年 JiangXi University. All rights reserved.
//

#import "DrawView.h"

#define TORO(jiao) ((jiao) * M_PI / 180.)

@implementation DrawView {
    NSMutableArray *_colors;
    NSMutableArray *_values;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _colors = [[NSMutableArray alloc] initWithCapacity:0];
        _values = [[NSMutableArray alloc] initWithCapacity:0];
        
        for (int i = 0; i < 10; i++) {
            UIColor *color = [UIColor colorWithRed:arc4random() % 256 / 255. green:arc4random() % 256 / 255. blue:arc4random() % 256 / 255. alpha:1];
            [_colors addObject:color];
            
            CGFloat value = arc4random() % 100;
            [_values addObject:[NSString stringWithFormat:@"%f", value]];
        }
        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetAllowsAntialiasing(context, YES);
    
    CGFloat centerX = 100;
    CGFloat centerY = 200;
    CGFloat rodiao = 50;
    
    CGContextSaveGState(context);
    CGContextScaleCTM(context, 1, 1);
    
    CGFloat sum = 0;
    
    for (NSString *count in _values) {
        CGFloat value = [count floatValue];
        sum += value;
    }
    
    CGFloat current = 0;
    
    for (int i = 0; i < _values.count; i++) {
        CGFloat start = TORO(current);
        CGFloat value = [_values[i] floatValue];
        CGFloat temp = value / sum * 360;
        current += temp;
        
        CGFloat end = TORO(current);
        CGContextMoveToPoint(context, centerX, centerY);
        UIColor *color = _colors[i];
        [color setFill];
        [color setStroke];
        CGContextAddArc(context, centerX, centerY, rodiao, start, end, 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFill);
        
        
    }
    
    
    CGContextSaveGState(context);
    CGContextAddArc(context, centerX, centerY, rodiao - 25, TORO(0), TORO(360), 0);
    [[UIColor whiteColor] setFill];
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    
    
    
}


@end
