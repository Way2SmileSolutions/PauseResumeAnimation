//
//  ViewController.m
//  PauseResumeAnimation
//
//  Created by way2smile on 09/05/15.
//  Copyright (c) 2015 way2smile pvt ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize startStop;

@synthesize circleView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [circleView addAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAnimation:(id)sender {
    
    NSLog(@"%s",__func__);
    
    if (circleView.indicatorView.layer.speed == 1.0) {
        [startStop setTitle:@"Pause" forState:UIControlStateNormal];
        [circleView pause];
    }
    else {
        [startStop setTitle:@"Resume" forState:UIControlStateNormal];
        [circleView resume];
    }
    
    
}


@end
