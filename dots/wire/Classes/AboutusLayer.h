//
//  AboutusLayer.h
//  wire
//
//  Created by Peter Zhang on 14-3-23.
//  Copyright (c) 2014年 CpyShine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface AboutusLayer : CCLayerColor {
    CCLabelTTF *m_title;
    CCLabelTTF *m_aboutusLabel;
    CCLabelTTF *m_titleLabel;
    
    CCMenuItemImage *m_backToMenu;
}

+(CCScene *) scene;

@end
