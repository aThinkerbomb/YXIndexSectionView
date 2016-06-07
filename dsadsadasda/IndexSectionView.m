
//
//  IndexSectionView.m
//  KZW_iPhone2
//
//  Created by YuXuan on 16/5/24.
//  Copyright © 2016年 课栈网. All rights reserved.
//

#import "IndexSectionView.h"

#define TagValue 100
@interface IndexSectionView ()
{
    ///记录每个label的高度
    CGFloat _labelHeight;
    ///数组个数
    NSInteger _arrayCount;
}

///移动的view
@property (nonatomic, strong) UIView *moveView;
@end


@implementation IndexSectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (NSIndexPath *)indexSectionViewWithPoint:(CGPoint)point
{
    if (point.y >= 0 && point.y < self.frame.size.height && point.x >= 0 && point.x <= self.frame.size.width) {
        //传入有效的中心点
        [self creatFingerPoint:point];
        int index = point.y / _labelHeight;
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:index];
        return indexpath;
    }
    return nil;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self];
    if ([self.delegate respondsToSelector:@selector(sendInterget:)] && self.delegate) {
        [self.delegate sendInterget:[self indexSectionViewWithPoint:point]];
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self];
    if ([self.delegate respondsToSelector:@selector(sendInterget:)] && self.delegate) {
        [self.delegate sendInterget:[self indexSectionViewWithPoint:point]];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.moveView removeFromSuperview];
    self.moveView = nil;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.moveView removeFromSuperview];
    self.moveView = nil;
}


- (void)setIndexSectionTitles:(NSArray<NSString *> *)array
{
    _arrayCount = [array count];
    _labelHeight = self.frame.size.height / _arrayCount;
    for (int i = 0; i < _arrayCount; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, i * _labelHeight, self.frame.size.width, _labelHeight)];
        label.tag = TagValue + i;
        [label setText:array[i]];
        [label setFont:_font ? _font : [UIFont systemFontOfSize:12]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:_fontColor ? _fontColor : [UIColor colorWithRed:95/255.0 green:155/255.0 blue:245/255.0 alpha:1.0]];
        [label setBackgroundColor:[UIColor clearColor]];
        [self addSubview:label];
    }
}


//设置指定的index 的背景颜色
-(void)setIndexSectionViewBackground:(NSArray<UIColor *> *)colors withIndexPath:(NSArray*)indexs
{
    if (colors && indexs) {
        if ([colors count] == [indexs count]) {
            NSInteger count = [colors count];
            for (int i = 0; i < count; i++) {
                UILabel *label = (UILabel *)[self viewWithTag:[indexs[i] integerValue] + TagValue];
                [label setBackgroundColor:colors[i]];
            }
        }
    }
}

//创建触摸点
- (void)creatFingerPoint:(CGPoint)point
{
    [self sendSubviewToBack:self.moveView];
    CGPoint newPoint = CGPointMake(self.frame.size.width / 2, point.y);
    [self.moveView setCenter:newPoint];
    [self.moveView setBounds:CGRectMake(0, 0, [self getMinmumDiameterSize], [self getMinmumDiameterSize])];
}

//获取最小直径
- (CGFloat)getMinmumDiameterSize
{
    CGFloat height = self.frame.size.height / _arrayCount;
    CGFloat width = self.frame.size.width;
    CGFloat diameter = width < height ? width : height;
    return diameter;
}



#pragma mark - setter
- (void)setFontColor:(UIColor *)fontColor
{
    _fontColor = fontColor;
    for (int i = 0; i < _arrayCount; i++) {
        UILabel *label = (UILabel *)[self viewWithTag:i + TagValue];
        [label setTextColor:_fontColor];
    }
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    for (int i = 0; i < _arrayCount; i++) {
        UILabel *label = (UILabel *)[self viewWithTag:i + TagValue];
        [label setFont:_font];
    }
}

- (void)setIndexSectionViewBackgroundColor:(UIColor *)IndexSectionViewBackgroundColor
{
    _IndexSectionViewBackgroundColor = IndexSectionViewBackgroundColor;
    [self setBackgroundColor:_IndexSectionViewBackgroundColor];
}


- (void)setFingerColor:(UIColor *)fingerColor
{
    _fingerColor = fingerColor;
    [self.moveView setBackgroundColor:_fingerColor];
}
#pragma mark - lazy loading
- (UIView *)moveView
{
    if (!_moveView) {
        _moveView = [[UIView alloc] init];
        _moveView.layer.cornerRadius = [self getMinmumDiameterSize]/2;
        [_moveView maskView];
        [_moveView setBackgroundColor:_fingerColor ? _fingerColor :[UIColor clearColor]];
        [self addSubview:_moveView];
    }
    return _moveView;
}
@end
