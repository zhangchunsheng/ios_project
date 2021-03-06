//
//  DataHandle.h
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#include "config.h"

@class DrawSprite;

@interface DataHandle : CCLayerColor {
    NSMutableArray *m_drawSpriteArray;
    
    ccColor4F m_currentDrawColor;
    
    NSMutableArray *m_stackArray;
    
    BOOL m_drawLine;
    BOOL m_objectHasContain;
    BOOL m_removeAllSameColor;
    BOOL m_toolsDispel;
    BOOL m_toolsDispelType;
    BOOL m_canPlaying;
    
    CGPoint m_movePos;
}

-(void) startAnimtionDisplay;

-(void) startPlaying;

//-(DrawSprite *)getCurrentSelectSprite:(CGPoint)pos color:(ccColor4F) color;

-(BOOL) touchBegine:(CGPoint) local;//touch begine

-(void) touchMove:(CGPoint) local; // touch moved

-(void) touchEnd;// touch end

-(void) dispelEnd;// dispel end

-(BOOL) allDrawNodeBeSelected:(BOOL) dispelType;//select all

//-(void) cancelAllDrawNodeBeSelected;// cancel select all

-(void) moveOut;
-(void) moveIn;

@end
