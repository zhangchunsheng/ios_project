//
//  DotHudController.m
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import "DotHudController.h"

#import "DotPlayingScene.h"

#import "DownStateLayer.h"
#import "UpStateLayer.h"
#import "PauseLayer.h"
#import "TopScoreLayer.h"

@implementation DotHudController

- (id)init
{
    self = [super init];
    if (self) {
        m_downStateLayer    = [DownStateLayer node];
        m_upstateLayer      = [UpStateLayer node];
        m_pauseLayer        = [PauseLayer node];
        m_topScoreLayer     = [TopScoreLayer node];
        
        [self addChild:m_downStateLayer z:2];
        [self addChild:m_upstateLayer z:2];
        [self addChild:m_pauseLayer z:1];
        [self addChild:m_topScoreLayer];
    }
    return self;
}

-(void)onEnter
{
    [super onEnter];
    
    [m_upstateLayer startAnimationDisplay];
    [m_downStateLayer startAnimationDisplay];
}

-(void)startGame
{
    if (self.parent) {
        DotPlayingScene *dps = (DotPlayingScene*)self.parent;
        [dps startDotGame];
    }
}

-(void)gamePause
{
    if (m_pause) {
        if (self.parent) {
            [m_pauseLayer setVisible:false];
            DotPlayingScene *playing = (DotPlayingScene*)self.parent;
            [playing resumeGame];
            m_pause = false;
        }
    } else {
        if (self.parent) {
            [m_pauseLayer startAnimationDiaplay];
            DotPlayingScene *playing = (DotPlayingScene*)self.parent;
            [playing pauseGame];
            m_pause = true;
        }
    }
}

-(void) currentGameOver:(NSInteger)score
{
    [m_downStateLayer setVisible:false];;
    [m_upstateLayer setVisible:false];
    [m_pauseLayer setVisible:false];
    [m_topScoreLayer startAnimationDisplay:score];
}


-(void)resetTimeString:(NSString *)string
{
    [m_upstateLayer resetTimeString:string];
}

-(void)resetScoreString:(NSString *)string
{
    [m_upstateLayer resetScoreString:string];
}

-(void)playerUseSkill:(PLAYERTOOLTYPE)skillTpye
{
    if (self.parent) {
        DotPlayingScene * playing = (DotPlayingScene*)self.parent;
        if (playing) {
            [playing playerUsedToolDispel:skillTpye];
        }
    }
}

@end
