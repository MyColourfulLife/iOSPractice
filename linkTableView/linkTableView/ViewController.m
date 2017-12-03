//
//  ViewController.m
//  linkTableView
//
//  Created by 黄家树 on 2017/12/4.
//  Copyright © 2017年 黄家树. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *leftTabel;
@property (weak, nonatomic) IBOutlet UITableView *rightTabel;
@property (strong, nonatomic) NSMutableArray *mutDatas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSMutableArray *)mutDatas{
    if (!_mutDatas) {
        _mutDatas = [NSMutableArray array];
        for (int i = 0; i <= 15; i++) {
            [_mutDatas addObject:[NSString stringWithFormat:@"第%d组",i+1]];
        }
    }
    return _mutDatas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftTabel) {
        return self.mutDatas.count;
    } else {
        return 16;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.leftTabel) {
        return 1;
    } else {
        return self.mutDatas.count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == self.leftTabel) {
        return nil;
    }else {
        return self.mutDatas[section];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTabel) {
        return 70;
    } else {
        return 45;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return tableView == self.leftTabel ? 0 : 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (tableView == self.leftTabel) {
        cell.textLabel.text = self.mutDatas[indexPath.row];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@,第%ld行",self.mutDatas[indexPath.section],(long)indexPath.row];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTabel) {
        //右边的表格滚动到相应位置
        [self.rightTabel scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    } else {
      //选中右边 暂不处理
        return;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.leftTabel) {
        //暂不处理
        return ;
    } else {
        // 获取第一行所在的分组
        NSIndexPath * indexPath = [self.rightTabel indexPathsForVisibleRows].firstObject;
        //选中左边的单元格
        [self.leftTabel selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }
}

@end
