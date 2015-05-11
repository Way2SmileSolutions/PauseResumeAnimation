//
//  ViewController.h
//  PauseResumeAnimation
//
//  Created by way2smile on 09/05/15.
//  Copyright (c) 2015 way2smile pvt ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet CircleView *circleView;

@property (weak, nonatomic) IBOutlet UIButton *startStop;

@end

