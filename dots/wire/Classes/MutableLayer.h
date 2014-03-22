//
//  MutableLayer.h
//  disappear
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MutableLayer : CCLayerColor {
    CGFloat radiues;
    CGPoint centerPos;
    BOOL    m_started;
    CGFloat m_angle;
    CGFloat m_timeCtrl;
    CGFloat m_r;
}

-(void) startAnimation;

@end
