//
//  CycleBallSprite.m
//  disappear
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import "CycleBallSprite.h"


@implementation CycleBallSprite

@synthesize canRo;
@synthesize angle;

- (id)init
{
    self = [super initWithFile:@"Images/ball.png"];
    if (self) {
        canRo = false;
        self.scale = 0.5;
    }
    return self;
}

-(void)startCycleMove:(CGPoint)cp :(CGFloat)ag{
    
    canRo  = true;
    angle = ag;
}
@end
