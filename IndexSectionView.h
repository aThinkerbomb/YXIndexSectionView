//
//  IndexSectionView.h
//  KZW_iPhone2
//
//  Created by YuXuan on 16/5/24.
//  Copyright © 2016年 课栈网. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IndexSectionVIewDelegate <NSObject>

/**
 *  协议方法，return  NSIndexPath
 */
- (void)sendInterget:(NSIndexPath *)indexpath;

@end

@interface IndexSectionView : UIView

/**
 *  设置字体颜色，default is [UIColor colorWithRed:95/255.0 green:155/255.0 blue:245/255.0 alpha:1.0]
 */
@property (nonatomic, strong) UIColor *fontColor;

/**
 *  设置字号，default is 12
 */
@property (nonatomic, strong) UIFont *font;

/**
 *  设置背景颜色，default is clearColor
 */
@property (nonatomic, strong) UIColor *IndexSectionViewBackgroundColor;

/**
 *  设置每一块按钮的颜色，default is clearColor
 */
@property (nonatomic, strong) UIColor *IndexSectionTitleBackgroundColor;
@property (nonatomic, assign) id<IndexSectionVIewDelegate>delegate;

/**
 *  设置检索栏
 */
- (void)setIndexSectionTitles:(NSArray<NSString *> *)array;

@end
