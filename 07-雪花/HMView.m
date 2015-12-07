//
//  HMView.m
//  07-雪花
//
//  Created by apple on 14-9-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMView.h"

@interface HMView()
{
    int count;
}
@property (nonatomic, assign) CGFloat snowY;

@end

@implementation HMView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// 加载xib完毕就调用
- (void)awakeFromNib
{
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    
    // iphone每秒刷新60次
    // 屏幕刷新的时候就会触发
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    _snowY += 5;
   
    
        UIImage *image = [UIImage imageNamed:@"雪花"];
        [image drawAtPoint:CGPointMake(0, _snowY)];

    // Drawing code
    
    if (_snowY >= 480) {
        _snowY = 0;
    }
}


@end
