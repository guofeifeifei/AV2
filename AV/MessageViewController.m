//
//  MessageViewController.m
//  AV
//
//  Created by ZZCN77 on 2017/9/21.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "MessageViewController.h"
#import "ClientViewController.h"
#define KMainScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MessageViewController ()
@property (strong, nonatomic)  UIButton *loginBtn;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.loginBtn];
    self.view.backgroundColor = [UIColor blackColor];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if ([user objectForKey:@"username"] == nil) {
        NSString *idStr = [NSString stringWithFormat:@"%ld",  [self getRandomNumber:1000 to:100000]];
    [self.loginBtn setTitle:[NSString stringWithFormat:@"%@",  idStr] forState:UIControlStateNormal];
       //  [user setValue:idStr forKey:@"username"];
    }else{
        [self.loginBtn setTitle:[NSString stringWithFormat:@"%@", [user objectForKey:@"username"]] forState:UIControlStateNormal];

    }
   
}
- (void)loginBtn:(id)sender {
    ClientViewController *clientVc = [[ClientViewController alloc] init];
    clientVc.acountStr =self.loginBtn.titleLabel.text;
    [self presentViewController:clientVc animated:YES completion:nil];
}
-(long int)getRandomNumber:(long int)from to:(long int)to
{
    return (long int)(from + (arc4random() % (to - from + 1)));
}
- (UIButton *)loginBtn{
    if (_loginBtn == nil) {
        self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.loginBtn.frame = CGRectMake(10, 200, KMainScreenWidth - 20, 50 );
        [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.loginBtn.backgroundColor = [UIColor clearColor];
        self.loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.loginBtn addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
