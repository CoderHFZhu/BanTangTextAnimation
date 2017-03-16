//
//  ViewController.m
//  BanTangTextAnimation
//
//  Created by zack on 16/5/31.
//  Copyright © 2016年 HF. All rights reserved.
//

#import "ViewController.h"
#import "NSString+ToBezierPath.h"
@interface ViewController ()
@property (nonatomic, strong)CAShapeLayer *shapeLayer;
/** 设置文字*/
@property (nonatomic ,strong) NSString *text;
@end

@implementation ViewController
-(NSString *)text {
    if (!_text) {
        _text = @"I'm sorry, many projects have to be, at the end of the year.";
    }
    return _text;
}
-(CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        [_shapeLayer removeAllAnimations];
        _shapeLayer.frame = CGRectMake(10, 120, 0, 0);
        [_shapeLayer setPath:[[self.text bezierPathWithFont:[UIFont systemFontOfSize:20]] CGPath]];
        [_shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
        [_shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
        [_shapeLayer setLineWidth:1];
    }
    return _shapeLayer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view.layer addSublayer:self.shapeLayer];
  
    
}
//点击开始按钮
- (IBAction)clickBeginAnimationBtn:(UIButton *)sender {
    [self.shapeLayer removeAllAnimations];
    CABasicAnimation *textAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    textAnimation.duration  = 4.0;
    textAnimation.fromValue = @0.0;
    textAnimation.toValue   = @1.0;
    [textAnimation setRemovedOnCompletion:YES];
    
    [self.shapeLayer addAnimation:textAnimation forKey:@"strokeEndAnimation"];
    self.shapeLayer.speed = 1;
}
- (IBAction)clickStopAnimationBtn:(UIButton *)sender {
    CFTimeInterval pausedTime = [self.shapeLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.shapeLayer.speed = 0.0;
    self.shapeLayer.timeOffset = pausedTime;
}
- (IBAction)clickContinueAnimationBtn:(UIButton *)sender {
    CFTimeInterval pausedTime = [self.shapeLayer timeOffset];
    self.shapeLayer.speed = 1.0;
    self.shapeLayer.timeOffset = 0.0;
    self.shapeLayer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.shapeLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.shapeLayer.beginTime = timeSincePause;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
