//
//  SettingsLayer.h
//  wire
//
//  Created by Peter Zhang on 14-3-23.
//  Copyright (c) 2014年 CpyShine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SettingsLayer : CCLayerColor {
    CCLabelTTF *m_settingsLabel;
}

+(CCScene *) scene;

@end
