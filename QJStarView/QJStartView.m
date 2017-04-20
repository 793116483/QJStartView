//
//  QJStartView.m
//  QJStarView
//
//  Created by 瞿杰 on 2017/4/20.
//  Copyright © 2017年 yiniu. All rights reserved.
//

#import "QJStartView.h"

@interface QJStartView ()

@property (nonatomic , strong)CALayer * normalLayer ;

@property (nonatomic , strong)CALayer * selectionLayer ;
@property (nonatomic , strong)CALayer * subLayer ;

@end

@implementation QJStartView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.normalLayer = [CALayer layer];
        self.normalLayer.masksToBounds = YES ;
        self.normalLayer.backgroundColor = [UIColor clearColor].CGColor ;
        [self.layer addSublayer:self.normalLayer];
        
        self.selectionLayer = [CALayer layer];
        self.selectionLayer.masksToBounds = YES ;
        self.selectionLayer.backgroundColor = [UIColor clearColor].CGColor ;
        [self.normalLayer addSublayer:self.selectionLayer];
        
        self.subLayer = [CALayer layer];
        self.subLayer.masksToBounds = YES ;
        self.subLayer.backgroundColor = [UIColor clearColor].CGColor ;
        [self.selectionLayer addSublayer:self.subLayer];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    }
    return self ;
}

-(void)tap:(UITapGestureRecognizer *)tap
{
    CGFloat location = [tap locationInView:self].x;
    
    self.selectionProgress = location/self.frame.size.width ;
    NSLog(@"=== %f",location/self.frame.size.width);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.normalLayer.frame = self.bounds ;
    
    CGFloat offX = (1.0 - self.selectionProgress) * self.bounds.size.width ;
    
    self.selectionLayer.frame = CGRectMake(-offX, 0, self.normalLayer.bounds.size.width, self.normalLayer.bounds.size.height);
    
    self.subLayer.frame = CGRectMake(offX, 0, self.selectionLayer.bounds.size.width, self.selectionLayer.bounds.size.height);
}

-(void)setLayer:(CALayer *)layer contentsImageName:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName] ;
    layer.contents = (__bridge id __nullable)image.CGImage;
    layer.contentsGravity = kCAGravityCenter ;
    layer.contentsScale = [UIScreen mainScreen].scale ;
    
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, image.size.width, image.size.height);
}

-(void)setStarImageNameNormal:(NSString *)starImageNameNormal
{
    _starImageNameNormal = starImageNameNormal ;
    
    [self setLayer:self.normalLayer contentsImageName:starImageNameNormal];
}

-(void)setStarImageNameSelection:(NSString *)starImageNameSelection
{
    _starImageNameSelection = starImageNameSelection ;
    
    [self setLayer:self.subLayer contentsImageName:starImageNameSelection];
}

-(void)setSelectionProgress:(CGFloat)selectionProgress
{
    if (selectionProgress < 0) {
        selectionProgress = 0 ;
    }
    else if (selectionProgress > 1.0){
        selectionProgress = 1.0 ;
    }
    
    _selectionProgress = selectionProgress ;
    
    [self setNeedsLayout];
}

@end
