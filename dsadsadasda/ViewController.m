//
//  ViewController.m
//  dsadsadasda
//
//  Created by YuXuan on 16/6/7.
//  Copyright © 2016年 客栈网. All rights reserved.
//

#import "ViewController.h"
#import "IndexSectionView.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

static NSString * identifier = @"tableViewCell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, IndexSectionVIewDelegate>
{
    NSArray *_sactionArray;
    NSArray *_rowArray;
}
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)IndexSectionView *indexSectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sactionArray = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    _rowArray = @[@"啊西吧", @"但萨卡", @"扩大死了", @"诶哦呜", @"OK取名字", @"歪哦"];
    [self tableView];
    [self indexSectionView];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [_rowArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sactionArray[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_rowArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sactionArray count];
}

- (void)sendInterget:(NSIndexPath *)indexpath
{
    [_tableView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (IndexSectionView *)indexSectionView
{
    if (!_indexSectionView) {
        _indexSectionView = [[IndexSectionView alloc] initWithFrame:CGRectMake(kScreenWidth-20, 0, 20, kScreenHeight)];
        
        [_indexSectionView setFingerColor:[UIColor orangeColor]];
//        _indexSectionView.IndexSectionViewBackgroundColor = [UIColor grayColor];
//        _indexSectionView.fontColor = [UIColor redColor];
//        _indexSectionView.font = [UIFont systemFontOfSize:15.f];
        [_indexSectionView setIndexSectionTitles:_sactionArray];
//        [_indexSectionView setIndexSectionViewBackground:@[[UIColor purpleColor], [UIColor greenColor], [UIColor brownColor]] withIndexPath:@[@"5", @"11", @"21"]];
        
        _indexSectionView.delegate = self;
        
        [self.view addSubview:_indexSectionView];
    }
    return _indexSectionView;
}

@end
