//
//  DotPlayingScene.h
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#include "config.h"

@class DataHandle;
@class DotHudController;

@interface DotPlayingScene : CCLayer {
    DotHudController * m_hudController;
    DataHandle       * m_data;
    CCLabelTTF *m_titleLabel;
    
    CGFloat m_delta;
    
    NSInteger m_score;
    NSInteger m_timeCounter;
    
    BOOL m_pause;
}

+(CCScene*) scene;

-(void) startDotGame;
-(void) restartDotGame;

-(void) playingScoreAdd:(NSInteger) score;

-(void) playerUsedToolDispel:(PLAYERTOOLTYPE) type;

-(void) pauseGame;
-(void) resumeGame;

@end
