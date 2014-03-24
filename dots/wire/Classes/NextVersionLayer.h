//
//  NextVersionLayer.h
//  wire
//
//  Created by Peter Zhang on 14-3-24.
//  Copyright (c) 2014年 CpyShine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface NextVersionLayer : CCLayerColor {
    CCLabelTTF *m_title;
    CCLabelTTF *m_nextVersionLabel;
    CCMenuItemImage *m_backToMenu;
}

+(CCScene *) scene;

@end
