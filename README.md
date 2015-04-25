# DrawPieChart
画一个饼状图
```object
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
```
