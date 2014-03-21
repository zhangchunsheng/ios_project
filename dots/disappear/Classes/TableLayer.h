//
//  TableLayer.h
//  disappear
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TableLayer : CCNode {
    CCLayerColor * m_localLayer;
    CCLayerColor * m_worldLayer;
//    CCLayerColor * m_sharedLayer;
    
    NSInteger m_pageMaxCount;
    NSInteger m_pageCurrent;
}


-(void) loadLoaclLayer:(NSInteger) score;

-(void) loadWorldLayer;

-(void) leftPageMove:(CGFloat) distance;

-(void) rightPageMove:(CGFloat) distance;

@end
