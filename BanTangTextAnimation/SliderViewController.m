//
//  SliderViewController.m
//  BanTangTextAnimation
//
//  Created by zack on 16/5/31.
//  Copyright © 2016年 HF. All rights reserved.
//

#import "SliderViewController.h"
#import "NSString+ToBezierPath.h"

@interface SliderViewController ()
@property (nonatomic, strong)CAShapeLayer *shapeLayer;
/** 设置文字*/
@property (nonatomic ,strong) NSString *text;
@end

@implementation SliderViewController
-(NSString *)text {
    if (!_text) {
        _text = @"我爱北京天安门";
    }
    return _text;
}
-(CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        [_shapeLayer removeAllAnimations];
        _shapeLayer.frame = CGRectMake(100, 120, 0, 0);
        [_shapeLayer setPath:[[self.text bezierPathWithFont:[UIFont systemFontOfSize:40]] CGPath]];
        [_shapeLayer setStrokeColor:[[UIColor blueColor] CGColor]];
        [_shapeLayer setFillColor:[[UIColor yellowColor] CGColor]];
        [_shapeLayer setLineWidth:1];
    }
    return _shapeLayer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view.layer addSublayer:self.shapeLayer];
    CABasicAnimation *textAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    textAnimation.duration  = 4.0;
    textAnimation.fromValue = @0.0;
    textAnimation.toValue   = @1.0;
    [textAnimation setRemovedOnCompletion:YES];
    
    [self.shapeLayer addAnimation:textAnimation forKey:@"strokeEndAnimation"];
    self.shapeLayer.speed = 0;
}
- (IBAction)clickSlider:(UISlider *)sender {
//    slider 的取值范围请与textAnimation的duration 保持一致
    self.shapeLayer.timeOffset = sender.value;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
