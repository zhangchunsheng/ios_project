//
//  HelloWorldLayer.h
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class DataHandle;
// GameLayer
@interface GameLayer : CCLayer
{
    DataHandle *m_data;
}

// returns a CCScene that contains the GameLayer as the only child
+(CCScene *) scene;

@end
