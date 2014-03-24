//
//  NextVersionLayer.m
//  wire
//
//  Created by Peter Zhang on 14-3-24.
//  Copyright (c) 2014年 CpyShine. All rights reserved.
//

#import "NextVersionLayer.h"
#import "DotGameScene.h"

@implementation NextVersionLayer

+(CCScene *) scene {
    CCScene *scene = [CCScene node];
    NextVersionLayer *layer = [NextVersionLayer node];
    
    [scene addChild:layer];
    return scene;
}

-(id) init {
    self = [super initWithColor:ccc4(255, 255, 255, 255)];
    
    if(self) {
        CGSize size = [CCDirector sharedDirector].winSize;
        
        [self setAnchorPoint:ccp(0, 0)];
        m_title = [CCLabelTTF labelWithString:@"下一版本" fontName:@"Arial" fontSize:32];
        [m_title setColor:ccc3(0, 0, 0)];
        [m_title setPosition:ccp(size.width / 2, size.height - 50)];
        [self addChild:m_title];
        
        m_nextVersionLabel = [CCLabelTTF labelWithString:@"增加社交功能：\n1.连接Game Center；\n2.连接微博；\n3.连接QQ；\n4.连接微信" fontName:@"Arial" fontSize:16 dimensions:CGSizeMake(200, 120) hAlignment:kCCTextAlignmentLeft];
        [m_nextVersionLabel setColor:ccc3(0, 0, 0)];
        [m_nextVersionLabel setPosition:ccp(200, size.height - 140)];
        [self addChild:m_nextVersionLabel];
        
        m_backToMenu = [CCMenuItemImage itemWithTarget:self selector:@selector(backToMenu)];
        CCMenu *menu = [CCMenu menuWithItems:m_backToMenu, nil];
        [m_backToMenu setPosition:ccp(0, -size.height / 2 + 30)];
        [self addChild:menu];
        
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"Images/TopExit.png"];
        CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0, 0, texture.contentSize.width, texture.contentSize.height)];
        [m_backToMenu setNormalSpriteFrame:frame];
    }
    
    return self;
}

-(void) backToMenu {
    [[CCDirector sharedDirector]popScene];
}

@end
