//
//  DotGameScene.h
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import <GameKit/GameKit.h>

@interface DotGameScene : CCScene<UIActionSheetDelegate,
                                  GKGameCenterControllerDelegate,
                                  GKAchievementViewControllerDelegate,
                                  GKLeaderboardViewControllerDelegate>
{
    CCMenuItemImage * m_playnow;
    CCMenuItemImage * m_multiplayer;
    CCMenuItemImage * m_highscore;
    CCMenuItemImage * m_settings;
    CCMenuItemImage * m_nextVersion;
    CCMenuItemImage * m_aboutus;
}

-(void) backToMenu;

@end
