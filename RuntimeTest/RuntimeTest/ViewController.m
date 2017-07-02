//
//  ViewController.m
//  RuntimeTest
//
//  Created by liushaochang on 2017/7/2.
//  Copyright © 2017年 YJYX. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

typedef void (*_IMP)(id,SEL);

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self go];
    
}

void speak(id self , SEL _cmd) {
    NSLog(@"speak instead of go");
};

+ (BOOL)resolveInstanceMethod:(SEL)sel {

    if (sel == @selector(go)) {
        // 动态添加方法
        class_addMethod([self class], sel, (IMP)speak, "v@:");
        
        return YES;
    }
    return [super resolveInstanceMethod:sel];
};

+ (BOOL)instancesRespondToSelector:(SEL)aSelector {
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {

}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return nil;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
