# DrawPieChart
画一个饼状图

首先定义一个宏, 来计算角度
```object
#define TORO(jiao) ((jiao) * M_PI / 180.)
```
接下来是重写自定义view人drawRect方法
```object
- (void)drawRect:(CGRect)rect {
    // UIGraphicsGetCurrentContext()会取栈顶的CGContextRef
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 抗锯齿
    CGContextSetAllowsAntialiasing(context, YES);
    
    // 设置圆心坐标 和 圆的半径
    CGFloat centerX = 100;
    CGFloat centerY = 200;
    CGFloat rodiao = 50;
    
    // 在Quartz创建图形上下文时，该堆栈是空的。CGContextSaveGState函数的作用是将当前图形状态推入堆栈。之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。
    CGContextSaveGState(context);
    
    // 缩放操作根据指定的x, y因子来改变坐标空间的大小，从而放大或缩小图像。x, y因子的大小决定了新的坐标空间是否比原始坐标空间大或者小。另外，通过指定x因子为负数，可以倒转x轴，同样可以指定y因子为负数来倒转y轴。通过调用CGContextScaleCTM函数来指定x, y缩放因子。
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
        
        // 移动画笔到 圆心
        CGContextMoveToPoint(context, centerX, centerY);
        UIColor *color = _colors[i];
        
        // 填充颜色
        [color setFill];
        
        // 描边颜色
        [color setStroke];
        
        // 绘制圆形
        CGContextAddArc(context, centerX, centerY, rodiao, start, end, 0);
        
        // 闭合路径
        CGContextClosePath(context);
        
        // 绘制
        CGContextDrawPath(context, kCGPathFill);
    }
}
```
