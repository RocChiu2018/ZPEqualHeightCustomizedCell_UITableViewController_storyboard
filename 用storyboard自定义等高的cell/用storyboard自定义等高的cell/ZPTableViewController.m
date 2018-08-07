//
//  ZPTableViewController.m
//  用storyboard自定义等高的cell
//
//  Created by apple on 16/5/18.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 有如下的三种方式来自定义UITableView控件的等高cell：
 1、用storyboard文件的方式来自定义等高的cell；
 2、用xib文件的方式来自定义等高的cell；
 3、用代码的方式来自定义等高的cell。

 MVC模式就是把model层、view层和controller层都分开。controller层的作用是承上启下的，在这个层中接收网络的数据，然后进行解析，把解析出来的字典传给model层，model层再进行封装，把封装后的对象传给controller层，controller层再把某个对象传递给view层，view层再把传递过来的对象的相关属性显示到屏幕上，总之是一个数据传递的过程。每个层之间通过对象的方式进行传递，这样就做到了最大程度上的解耦合。
 */
#import "ZPTableViewController.h"
#import "ZPDeal.h"
#import "ZPTableViewCell.h"

@interface ZPTableViewController ()

@property (nonatomic, strong) NSArray *deals;

@end

@implementation ZPTableViewController

#pragma mark ————— 懒加载 —————
-(NSArray *)deals
{
    if (_deals == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"deals" ofType:@"plist"];
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in dicArray)
        {
            //把字典转化成对象
            ZPDeal *deal = [ZPDeal dealWithDict:dic];
            [tempArray addObject:deal];
        }
        
        _deals = tempArray;
    }
    
    return _deals;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark ————— UITableViewDataSource —————
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.deals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     系统先从缓存池中去找带有特殊标识符的cell，如果没有找到的话就会去storyboard文件中的此视图控制器中去找，如果找到这个带有特殊标识符的自定义cell以后就会根据这个cell而创建新的自定义cell。
     */
    NSString *ID = @"deal";
    
    ZPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.deal = [self.deals objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
