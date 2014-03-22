//
//  UpStateLayer.h
//  disappear
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface UpStateLayer : CCLayerColor {
    CCLabelTTF * m_labelTime;
    CCLabelTTF * m_labelScore;
    
    CCMenuItemImage * m_scoreItem;
    CCMenuItemImage * m_timeItem;
}

-(void) resetTimeString:(NSString*) string;
-(void) resetScoreString:(NSString*) string;

-(void) startAnimationDisplay;

@end
