//
//  ViewController.m
//  RunloopLearning
//
//  Created by 乔奕博 on 2022/3/11.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self timersInMainThread];
    
    [self timersInOtherThread];
    
    
}

- (void)timersInOtherThread {
    //开启子线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerOutPut) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
    });
    
}


- (void)timersInMainThread {
    //需要主动添加到runloop
    NSTimer *timer1 = [NSTimer timerWithTimeInterval:2.0
                                             target:self
                                           selector:@selector(timerOutPut)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSRunLoopCommonModes];
    
    //无需主动添加到runloop中
    NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                       target:self
                                                     selector:@selector(scheduledTimerOutPut)
                                                     userInfo:nil
                                                      repeats:YES];
    
//    [[NSRunLoop currentRunLoop] addTimer:timer2 forMode:NSRunLoopCommonModes];
}

- (void)timerOutPut {
    NSLog(@"nstimer fired!");
}

- (void)scheduledTimerOutPut {
    NSLog(@"scheduledTimer fired!");
}

@end
