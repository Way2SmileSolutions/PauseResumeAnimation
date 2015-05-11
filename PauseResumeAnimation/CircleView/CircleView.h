//
//  CircleView.h
//  StopWatch
//
//  Created by way2smile on 26/12/14.
//  Copyright (c) 2014 way2smile pvt ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>


@interface CircleView : UIView  {
    
    IBOutlet UIButton *_startStopButton;
    CAKeyframeAnimation* moveAnimation;
    CAShapeLayer *circle;
}

@property (nonatomic, strong) UIView *indicatorView;

-(void)resume;
-(void) pause;
-(void) pause:(CALayer *) layer;
-(void) resume:(CALayer *) layer;
-(void) addAnimations;
-(void) removeAllAnimations;


@end
