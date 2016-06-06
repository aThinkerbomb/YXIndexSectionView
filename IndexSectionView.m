
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
    if (point.y >= 0 && point.y < self.frame.size.height) {
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



- (void)setIndexSectionTitles:(NSArray<NSString *> *)array
{
    _arrayCount = [array count];
    _labelHeight = self.frame.size.height / _arrayCount;
    for (int i = 0; i < _arrayCount; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, i * _labelHeight, self.frame.size.width, _labelHeight)];
        label.tag = TagValue + i;
        [label setText:array[i]];
        [label setFont:[UIFont systemFontOfSize:12]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor colorWithRed:95/255.0 green:155/255.0 blue:245/255.0 alpha:1.0]];
        [label setBackgroundColor:[UIColor clearColor]];
        [self addSubview:label];
    }
}


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


- (void)setIndexSectionTitleBackgroundColor:(UIColor *)IndexSectionTitleBackgroundColor
{
    _IndexSectionViewBackgroundColor = IndexSectionTitleBackgroundColor;
    for (int i = 0; i < _arrayCount; i++) {
        UILabel *label = (UILabel *)[self viewWithTag:i + TagValue];
        [label setBackgroundColor:_IndexSectionViewBackgroundColor];
    }
}


@end
