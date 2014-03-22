//
//  DotPlayingScene.m
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import "DotPlayingScene.h"
#import "DataHandle.h"
#import "DotHudController.h"

@implementation DotPlayingScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	DotPlayingScene *layer = [DotPlayingScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self setAnchorPoint:ccp(0, 0)];
        
        m_data      = [DataHandle node];
        [self addChild:m_data];
        
        m_hudController = [DotHudController node];
        
        [self addChild:m_hudController];
    }
    return self;
}

-(void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
}


-(void) startDotGame
{
    [m_data startAnimtionDisplay];
    [m_data startPlaying];
    [self startTimerCounter];
}

-(void)playingScoreAdd:(NSInteger)score
{
    m_score += score;
    NSString * scores = [NSString stringWithFormat:@"%d",m_score];
    [m_hudController resetScoreString:scores];
}

-(void) startTimerCounter
{
    m_pause = false;
    m_timeCounter = 60;
    [self schedule:@selector(tick:)];
}

-(void) tick:(float) dt
{
    if (!m_pause) {
        m_delta +=dt;
    }
    
    if (m_delta >= 0.9999) {
        m_delta = 0.0;
        m_timeCounter -= 1;
        if (m_timeCounter <= 0) {
#warning gameover
            [m_hudController resetTimeString:[NSString stringWithFormat:@"%d", m_timeCounter]];
            [m_data moveOut];
//            [m_hudController gamePause];
            [m_hudController currentGameOver:m_score];
            [self unscheduleAllSelectors];
        } else {
            [m_hudController resetTimeString:[NSString stringWithFormat:@"%d", m_timeCounter]];
        }
    }
}

-(void)pauseGame
{
    m_pause = true;
    [m_data moveOut];
}

-(void) resumeGame
{
    m_pause = false;
    [m_data moveIn];
}

-(void) playerUsedToolDispel:(PLAYERTOOLTYPE)type
{
    if (type == tooltime) {
        m_timeCounter += 3;
    } else {
        if (type == toolDispelAll) {
            if([m_data allDrawNodeBeSelected:YES]){
                
            }
        } else {
            if([m_data allDrawNodeBeSelected:NO]){
                
            }
        }
    }
}


@end
