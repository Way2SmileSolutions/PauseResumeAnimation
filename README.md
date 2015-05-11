# PauseResumeAnimation

##A Simple Demo to Pause and Resume an animation

**Creating an key frame animation**

	CAKeyframeAnimation* moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    moveAnimation.duration = 03.0f;
    moveAnimation.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)
                                                    cornerRadius:self.frame.size.width/2].CGPath;
    moveAnimation.rotationMode = kCAAnimationRotateAuto;
    moveAnimation.calculationMode = kCAAnimationCubicPaced;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.repeatCount = HUGE_VALF;
    
    [indicatorView.layer addAnimation:moveAnimation forKey:@"position"];

 To pause and resume an animation, the key idea is to use timing of an animation i.e CAMediaTiming protocol for the view layer. By using speed and timeoffset property of layer, we can control the animation timing.


    // To Pause
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;


    //To Resume
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;

**Refernce:**

http://www.objc.io/issue-12/animations-explained.html

http://ronnqvi.st/controlling-animation-timing/
