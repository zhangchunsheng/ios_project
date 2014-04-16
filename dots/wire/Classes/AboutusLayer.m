//
//  AboutusLayer.m
//  wire
//
//  Created by Peter Zhang on 14-3-23.
//  Copyright (c) 2014年 CpyShine. All rights reserved.
//

#import "AboutusLayer.h"
#import "DotGameScene.h"

@implementation AboutusLayer

+(CCScene *) scene {
    CCScene *scene = [CCScene node];
    AboutusLayer *layer = [AboutusLayer node];
    
    [scene addChild:layer];
    return scene;
};

-(id) init {
    self = [super initWithColor:ccc4(255, 255, 255, 255)];
    
    if(self) {
        CGSize size = [CCDirector sharedDirector].winSize;
        
        [self setAnchorPoint:ccp(0, 0)];
        m_title = [CCLabelTTF labelWithString:@"关于我们" fontName:@"Arial" fontSize:32];
        [m_title setColor:ccc3(0, 0, 0)];
        [m_title setPosition:ccp(size.width / 2, size.height - 50)];
        [self addChild:m_title];
        
        m_aboutusLabel = [CCLabelTTF labelWithString:@"微博:@一路向北GP" fontName:@"Arial" fontSize:16];
        [m_aboutusLabel setColor:ccc3(0, 0, 0)];
        [m_aboutusLabel setPosition:ccp(100, size.height - 100)];
        [self addChild:m_aboutusLabel];
        
        m_backToMenu = [CCMenuItemImage itemWithTarget:self selector:@selector(backToMenu)];
        CCMenu *menu = [CCMenu menuWithItems:m_backToMenu, nil];
        [m_backToMenu setPosition:ccp(0, -size.height / 2 + 30)];
        [self addChild:menu];
        
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"Images/TopExit.png"];
        CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0, 0, texture.contentSize.width, texture.contentSize.height)];
        [m_backToMenu setNormalSpriteFrame:frame];
        
        m_titleLabel = [CCLabelTTF labelWithString:@"If you think the app is just the same, there should only one \ngame for one kind.I like to learn that.Another thing is that \nI think apple map is like Google Map.I don't know why?" fontName:@"Arial" fontSize:12];
        [m_titleLabel setColor:ccc3(0, 0, 0)];
        [m_titleLabel setPosition:ccp(160, 100)];
        //[self addChild:m_titleLabel z:2];
    }
    
    return self;
};

-(void) backToMenu {
    [[CCDirector sharedDirector]popScene];
}

@end
