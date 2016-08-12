//
//  ViewController.m
//  3DTouch
//
//  Created by saikr on 16/8/12.
//  Copyright © 2016年 saikr. All rights reserved.
//

//获取屏幕的高度和宽度
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define  SCREENWIDTH [UIScreen mainScreen].bounds.size.width

//随机获取颜色
#define GETARANDCOLORA [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:(float)arc4random_uniform(500)/1000];

#import "ViewController.h"
#import "SKPeekViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>

@property(nonatomic,strong)UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"3D_Touch Demo";
    self.view.backgroundColor = [UIColor brownColor];
    
    [self createView];
}

- (void)createView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strId = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%li",(long)indexPath.row];
    cell.contentView.backgroundColor = GETARANDCOLORA;
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        
        //给cell注册3DTouch的peek（预览）和pop功能
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    } else {
        NSLog(@"3D Touch 无效");
    }
    
    return cell;
}

#pragma mark - 3DTouchShortcut点击方法~
- (void)shortcutItemClick:(NSString *)type
{
    if ([type intValue]==1) {
//        NSLog(@"11111");
        SKPeekViewController * peekVC1 = [[SKPeekViewController alloc]init];
        peekVC1.str = @"test1";
        [self.navigationController pushViewController:peekVC1 animated:YES];
        
    }
    else if ([type intValue]==2) {
//        NSLog(@"22222");
        
        SKPeekViewController * peekVC2 = [[SKPeekViewController alloc]init];
        peekVC2.str = @"test2";
        [self.navigationController pushViewController:peekVC2 animated:YES];
    }
    else if ([type intValue]==3) {
        NSLog(@"33333");
        
        SKPeekViewController * peekVC3 = [[SKPeekViewController alloc]init];
//        peekVC3.str = @"test3";
        [self.navigationController pushViewController:peekVC3 animated:YES];
    }
    else if ([type intValue]==4) {
//        NSLog(@"44444");
        
        SKPeekViewController * peekVC4 = [[SKPeekViewController alloc]init];
        peekVC4.str = @"test3";
        [self.navigationController pushViewController:peekVC4 animated:YES];
    }
    
}

#pragma mark - 以下3DTouch  peek and pop 方法
//peek(预览)
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    
    //防止重复加入
    if ([self.presentedViewController isKindOfClass:[SKPeekViewController class]])
    {
        return nil;
    }
    
    //获取按压的cell所在行，[previewingContext sourceView]就是按压的那个视图
    NSIndexPath *indexPath = [_tableView indexPathForCell:(UITableViewCell* )[previewingContext sourceView]];
    
    //设定预览的界面
    SKPeekViewController * peekVC = [[SKPeekViewController alloc]init];
    peekVC.str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    //调整不被虚化的范围，按压的那个cell不被虚化（轻轻按压时周边会被虚化，再少用力展示预览，再加力跳页至设定界面）
    CGRect rect = CGRectMake(0, 0, SCREENWIDTH,40);
    previewingContext.sourceRect = rect;
    
    //返回预览界面
    return peekVC;
}

//pop（按用点力进入）
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    [self showViewController:viewControllerToCommit sender:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
