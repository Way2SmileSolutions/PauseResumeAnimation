//
//  CircleView.m
//
//  Created by way2smile on 26/12/14.
//  Copyright (c) 2014 way2smile pvt ltd. All rights reserved.
//

#import "CircleView.h"

typedef NS_ENUM(NSInteger, kTTCounter){
    kTTCounterRunning = 0,
    kTTCounterStopped,
    kTTCounterReset,
    kTTCounterEnded
};

@implementation CircleView

@synthesize indicatorView;

- (void)drawRect:(CGRect)rect {
    
    // Drawing code
    
    [self makeCircleBorder];
    
    indicatorView = [[UIView alloc] initWithFrame:CGRectMake(62.5, 0, 12, 12)];
    
    circle = [[CAShapeLayer alloc] init];
    
    [self.layer addSublayer:indicatorView.layer];
    [self buildAnimationLayers];
    [self addAnimations];
}

-(void) makeCircleBorder {
    
    [self setBackgroundColor:[UIColor clearColor]];
}

-(void) buildAnimationLayers {
    
    if (circle != nil) {
        
        CGRect textRect = CGRectMake(0, 0, 145, 145);
        
        circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)
                                                 cornerRadius:self.frame.size.width/2].CGPath;
        
        circle.frame = textRect;
        circle.fillColor = [UIColor clearColor].CGColor;
        circle.strokeColor = [UIColor orangeColor].CGColor;
        circle.lineWidth = 5.0f;
        
        [self.layer addSublayer:circle];
    }
    
    if (indicatorView != nil) {
        
        indicatorView.layer.masksToBounds = YES;
        indicatorView.layer.cornerRadius = indicatorView.frame.size.height / 2;
        indicatorView.backgroundColor = [UIColor orangeColor];
        indicatorView.center = CGPathGetCurrentPoint([UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)
                                                                                cornerRadius:self.frame.size.width/2].CGPath);
        
        [self bringSubviewToFront:indicatorView];
    }
}

#pragma mark - Animation Methods

-(void) addAnimations {
    
    if ([[indicatorView.layer animationKeys] count] > 0) {
        
        [indicatorView.layer removeAllAnimations];
        indicatorView.layer.timeOffset = 0.0;
        indicatorView.layer.beginTime = 0.0;
        indicatorView.layer.speed = 1.0f;
    }
    
    moveAnimation = nil;
    moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    moveAnimation.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)
                                                    cornerRadius:self.frame.size.width/2].CGPath;
    moveAnimation.duration = 03.0f;
    moveAnimation.rotationMode = kCAAnimationRotateAuto;
    moveAnimation.calculationMode = kCAAnimationCubicPaced;
    moveAnimation.delegate=self;

    moveAnimation.rotationMode = kCAAnimationRotateAuto;
    moveAnimation.calculationMode = kCAAnimationCubicPaced;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.repeatCount = HUGE_VALF;
    
    [indicatorView.layer addAnimation:moveAnimation forKey:@"position"];
    
}

-(void)resume {
    [self resume:indicatorView.layer];
}

-(void) pause {
    [self pause:indicatorView.layer];
}


- (void)pause:(CALayer*)layer {

    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

- (void)resume:(CALayer*)layer {

    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

-(void) removeAllAnimations {
    [indicatorView.layer removeAllAnimations];
}

@end
