//
//  DotGameScene.m
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import "DotGameScene.h"

#include "AppDelegate.h"

#import "DotPlayingScene.h"
#import "DataController.h"
#import "TableLayer.h"
#import "TopScoreLayer.h"
#import "SettingsLayer.h"
#import "NextVersionLayer.h"
#import "AboutusLayer.h"
#import "config.h"
#import "NetWorkHandle.h"
#import "MutablePlayerScene.h"
#import "WebRegisterController.h"

#define GameLayerTag 1001

@implementation DotGameScene

- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
    
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    
}

- (id)init
{
    self = [super init];
    if (self) {
        CCLayerColor * backGroundLayer = [CCLayerColor layerWithColor:ccc4(255, 255, 255, 255)];
        [backGroundLayer setAnchorPoint:ccp(0, 0)];
        [self addChild:backGroundLayer];
        
//        [[DataController getSharedDataController] savePlayerTemplateData:300];
//
//        NSArray *array = [NSArray arrayWithArray:[[DataController getSharedDataController] readLoaclScoreTopList]];
//        
//        NSLog(@"%@",array);
//        for (int i = 0 ; i < 80 ; i++) {
//            NSLog(@"level %d:%ld", i + 1, expArray[i]);
//        }
    }
    return self;
}

-(void)onEnter
{
    [super onEnter];
    
    CGSize size = [CCDirector sharedDirector].winSize;
    
    m_playnow = [CCMenuItemImage itemWithNormalImage:@"Images/play_now.png" selectedImage:@"Images/play_now.png" target:self selector:@selector(playingNow:)];
    
    m_multiplayer = [CCMenuItemImage itemWithNormalImage:@"Images/multiple_player.png" selectedImage:@"Images/multiple_player.png" target:self selector:@selector(multiplePlayer:)];
    
    m_highscore = [CCMenuItemImage itemWithNormalImage:@"Images/high_score.png" selectedImage:@"Images/high_score.png" target:self selector:@selector(highScore:)];
    
    m_settings = [CCMenuItemImage itemWithNormalImage:@"Images/settings.png" selectedImage:@"Images/settings.png" target:self selector:@selector(settings:)];
    
    m_nextVersion = [CCMenuItemImage itemWithNormalImage:@"Images/nextVersion.png" selectedImage:@"Images/nextVersion.png" target:self selector:@selector(nextVersion:)];
    
    m_aboutus = [CCMenuItemImage itemWithNormalImage:@"Images/about_us.png" selectedImage:@"Images/about_us.png" target:self selector:@selector(aboutus:)];
    
    CCMenu *menu = [CCMenu menuWithItems:m_playnow,
                    m_highscore, m_nextVersion, m_aboutus, nil];
    
    [menu alignItemsVerticallyWithPadding:10];
    
    //[menu setPosition:ccp(size.width / 2, size.height / 3)];
    NSLog(@"size.width %f", size.width);

    [self addChild:menu];
}

-(void) startGame
{
    [self removeAllChildren];
    
}

-(void) playingNow:(id)sender
{
    CCScene *playingScene = [DotPlayingScene scene];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:playingScene]];
}

-(void) multiplePlayer:(id) sender
{
//    [[NetWorkHandle getSharedNetWork] startMatchOppoent:self];
    CCScene *multiplePlayerGameScene = [MutablePlayerScene node];
    [[CCDirector sharedDirector] pushScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:multiplePlayerGameScene]];
}

-(void) highScore:(id) sender
{
    CCScene *highScoreScene = [TopScoreLayer scene];
    [[CCDirector sharedDirector] pushScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:highScoreScene]];
}

-(void) settings:(id) sender
{
    CCScene *settingsScene = [SettingsLayer scene];
    [[CCDirector sharedDirector] pushScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:settingsScene]];
}

-(void) nextVersion:(id) sender
{
    CCScene *nextVersionScene = [NextVersionLayer scene];
    [[CCDirector sharedDirector] pushScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:nextVersionScene]];
}

-(void) aboutus:(id) sender
{
    CCScene *aboutusScene = [AboutusLayer scene];
    [[CCDirector sharedDirector] pushScene:[CCTransitionMoveInR transitionWithDuration:0.2 scene:aboutusScene]];
}

-(void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    NSLog(@"transitionDifFinish");
}

-(void) backToMenu {
    [[CCDirector sharedDirector]popScene];
}

@end
