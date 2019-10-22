//
//  NZFlutterViewController.m
//  FLB
//
//  Created by lv on 2019/10/17.
//  Copyright © 2019 lvfumei. All rights reserved.
//

#import "NZFlutterViewController.h"
#import "TTTViewController.h"

@interface NZFlutterViewController ()<UIGestureRecognizerDelegate>

@end

@implementation NZFlutterViewController

- (void)dealloc
{
    [self.engine destroyContext];
    [EAGLContext setCurrentContext:nil];
    NSLog(@"dealloc:%@",NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *xeaChannel = @"com.qqxnz.flutter/url_route";
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:xeaChannel binaryMessenger:self.binaryMessenger];
    
    __weak typeof(self) weakSelf = self;
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"flutter：\nmethod=%@ \narguments = %@",call.method,call.arguments);
        NSString *method = [NSString stringWithFormat:@"%@:callback:",call.method];
        SEL selector = NSSelectorFromString(method);
        if([strongSelf respondsToSelector:selector]){
              IMP imp = [strongSelf methodForSelector:selector];
              void (*func)(id, SEL,id,id) = (void *)imp;
              func(strongSelf, selector,call.arguments,result);
        }else{
            result(@{@"message":@"我是Native发给Flutter的数据",@"alert":@"我还有没有实现这个方法呢，不要太急"});
        }
        
    }];
    
}

- (void)setInitialRoute:(NSString *)route withParams:(NSDictionary *)dic{
    //isRoot
    //preset //push
    
    
    [self setInitialRoute:@""];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}


- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if(err) {
        return nil;
    }
    return dic;
}

- (NSString*)dictionaryToJson:(NSDictionary *)dic{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

#pragma - mark Flutter与原生交互方法实现

/// 侧滑手势开着
/// @param arguments 参数
/// @param callback 回调
-(void)backTouch:(id)arguments callback:(FlutterResult)callback{
    if([arguments isKindOfClass:[NSString class]]){
        NSString * enable = (NSString *) arguments;
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            if([enable isEqualToString:@"enable"]){
                self.navigationController.interactivePopGestureRecognizer.enabled = YES;
            }else{
                self.navigationController.interactivePopGestureRecognizer.enabled = NO;
            }
            self.navigationController.interactivePopGestureRecognizer.delegate = self;
        }
    callback([self dictionaryToJson:@{@"success":@(YES)}]);
    }
    callback([self dictionaryToJson:@{@"success":@(NO)}]);
}

/// POP
/// @param arguments 参数
/// @param callback 回调
-(void)backNative:(NSDictionary *)arguments callback:(FlutterResult)callback{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)flutter_native_method_test:(NSDictionary *)arguments callback:(FlutterResult)callback{
    NZFlutterViewController *flutter = [[NZFlutterViewController alloc]init];
    [flutter setInitialRoute:@"page1?action=1&message=newFlutter"];
    [self.navigationController pushViewController:flutter animated:YES];
    callback(@{@"message":@"你调用了原生的flutter_native_method_test方法"});
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
