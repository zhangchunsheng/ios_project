//
//  CycleBallSprite.h
//  disappear
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CycleBallSprite : CCSprite {
}

@property(readonly) BOOL canRo;
@property(readwrite) CGFloat angle;

-(void)startCycleMove:(CGPoint)cp :(CGFloat)ag;

@end
