//
//  PauseLayer.h
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PauseLayer : CCLayerColor {
    CCMenuItemImage *m_resume;
    CCMenuItemImage *m_restart;
    CCMenuItemImage *m_exittomain;
}

-(void) startAnimationDiaplay;

@end
