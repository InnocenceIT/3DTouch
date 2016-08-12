//
//  SKPeekViewController.m
//  3DTouch
//
//  Created by saikr on 16/8/12.
//  Copyright © 2016年 saikr. All rights reserved.
//
//获取屏幕的高度和宽度
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define  SCREENWIDTH [UIScreen mainScreen].bounds.size.width

//随机获取颜色
#define GETARANDCOLORA1 [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];


#import "SKPeekViewController.h"

@interface SKPeekViewController ()

@end

@implementation SKPeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GETARANDCOLORA1;
    self.title = _str;
    
    [self createView];
}

- (void)createView
{
    //label 展示~
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, SCREENWIDTH, 100)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:40.0f];
    titleLabel.text = self.str;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
}



#pragma mark - 3DTouch代理
//当弹出预览时，上滑预览视图，出现预览视图中快捷选项
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Aciton1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Aciton2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton2");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Aciton3" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton3");
    }];
    
    NSArray *actions = @[action1,action2,action3];
    
    // and return them (return the array of actions instead to see all items ungrouped)
    return actions;
}

//按住移动or压力值改变时的回调
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSLog(@"%f",touch.force);
        self.view.backgroundColor = [UIColor colorWithRed:(touch.force / touch.maximumPossibleForce) green:1 blue:0  alpha:1];
    
    if (touch.force == touch.maximumPossibleForce)
    {
        NSLog(@"%f",touch.force);
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
        self.view.backgroundColor = [UIColor greenColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
