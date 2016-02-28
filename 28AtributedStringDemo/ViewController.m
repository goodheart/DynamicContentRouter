//
//  ViewController.m
//  28AtributedStringDemo
//
//  Created by majian on 16/2/28.
//  Copyright © 2016年 majian. All rights reserved.
//

#import "ViewController.h"
#import "PMTextView.h"

static NSString * firstURL = @"http://www.baidu.com";
static NSString * secondURL = @"http://www.snh48.com?id=123";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PMTextView * textView = [[PMTextView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    textView.scrollEnabled = NO;
    textView.editable = NO;
    [self.view addSubview:textView];
    
    NSMutableAttributedString * attributedStringM = [[NSMutableAttributedString alloc] initWithString:@"哈呵嘻哦噢喔" attributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]}];
    NSMutableAttributedString * urlAtrributedString = [[NSMutableAttributedString alloc] initWithString:firstURL];
    [urlAtrributedString addAttribute:PMLinkKey
                                value:firstURL
                                range:NSMakeRange(0, urlAtrributedString.length)];
    
    NSMutableAttributedString * urlAtrributedString2 = [[NSMutableAttributedString alloc] initWithString:secondURL];
    [urlAtrributedString2 addAttribute:PMLinkKey
                                 value:secondURL
                                 range:NSMakeRange(0, urlAtrributedString2.length)];
    
    [attributedStringM appendAttributedString:urlAtrributedString];
    [attributedStringM appendAttributedString:urlAtrributedString2];
    
    /*需要解析表情、URL以及其他需要转换的字符
     例如：将http://www.baidu.com 转成 网页链接并高亮
          将 snh48://11   转成成员名字并高亮
    */
    textView.attributedText = attributedStringM;
}

- (void)router:(NSString *)routerName info:(NSDictionary *)userInfo {
    if ([routerName isEqualToString:PMURLRouterNameKey]) {
        if (userInfo[PMLinkKey]) {
            NSString * url = userInfo[PMLinkKey];
            //解析url,跳转到不同界面
            NSLog(@"url : %@",url);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end







