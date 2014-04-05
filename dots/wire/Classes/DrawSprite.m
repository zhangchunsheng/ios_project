//
//  DrawSprite.m
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//
#include "DataHandle.h"
#import "DrawSprite.h"

#define caleActiontag 100

@implementation DrawSprite

@synthesize m_x;
@synthesize m_y;
@synthesize m_color;
@synthesize m_dispel;

-(CGPoint) calcPos:(NSInteger)x y:(NSInteger) y
{
    CGFloat width = [self anchorPoint].x * m_w + x * m_w + addWidth;
    CGFloat height = [self anchorPoint].y * m_h + y * m_h + addHeight;
    return ccp(width, height);
}

-(void) calcColor
{
    int type = arc4random() % TOTAL_TYPE;
    switch (type) {
        case 0:
            m_color = ccc4fBlue;
            break;
        case 1:
            m_color = ccc4fGreen;
            break;
        case 2:
            m_color = ccc4fRed;
            break;
        case 3:
            m_color = ccc4fPurple;
            break;
        case 4:
            m_color = ccc4fOrange;
            break;
        default:
            m_color = ccc4fPurple;
            break;
    }
}

-(void) spawnAtX:(NSInteger)x Y:(NSInteger)y Width:(CGFloat)w Height:(CGFloat)h
{
    m_hasSelected = YES;
    m_dispel = NO;
    m_x = x;
    m_y = y;
    
    m_w = w * 2;
    m_h = h * 2;
        
    [self calcColor];
    
//    [self setContentSize:CGSizeMake(DRAWSPRITE_RADIUES, DRAWSPRITE_RADIUES)];
    
    CGSize size = [CCDirector sharedDirector].winSize;
    CGFloat wd = [self anchorPoint].x * m_w + x * m_w + addWidth;
    
    m_drawNode = [CCDrawNode node];
        
    [m_drawNode setPosition:ccp(wd, size.height)];
    
    [m_drawNode setContentSize:CGSizeMake(DRAWSPRITE_RADIUES, DRAWSPRITE_RADIUES)];
    
    [self addChild:m_drawNode];
    
    //[m_drawNode drawDot:ccp(0, 0) radius:DRAWSPRITE_RADIUES color:m_color];
    CGFloat _x = 0;
    CGFloat _y = 10;
    //五角星边的长度为10px，x1、h1为五角星的底部点坐标偏差值，x2、h2为五角星上部点偏差值
    CGFloat x1 = 20 * sin(M_PI / 10);
    CGFloat h1 = 10 * cos(M_PI / 10);
    CGFloat x2 = 10;
    CGFloat h2 = 5 * tan(M_PI / 5);

    CGPoint starPoints[] = {ccp(0,-10),
        ccp(_x + x1, _y + h1),
        ccp(_x - x2, _y + h2),
        ccp(_x + x2, _y + h2),
        ccp(_x - x1, _y + h1),
        ccp(_x,_y)
    };
    [m_drawNode drawPolyWithVerts:starPoints count:6 fillColor:m_color borderWidth:0 borderColor:m_color];
    
    m_selectNode = [CCDrawNode node];
    [m_drawNode addChild:m_selectNode];
    
    ccColor4F col = ccc4f(m_color.r, m_color.g, m_color.b, 255 * 0.75);
    
    //[m_selectNode drawDot:ccp(0, 0) radius:DRAWSPRITE_RADIUES color:col];
    [m_selectNode drawPolyWithVerts:starPoints count:6 fillColor:m_color borderWidth:0 borderColor:col];
    m_selectNode.visible = false;
//    [m_drawNode clear];
}

-(void) respawn
{
    m_dispel = NO;
    [m_drawNode stopAllActions];
    [m_drawNode clear];
    [m_drawNode setScale:1.0];
    
    [m_selectNode clear];
    [m_selectNode setScale:1.0];
    
    [self calcColor];
    
    CGSize size = [CCDirector sharedDirector].winSize;
    CGFloat wd = [self anchorPoint].x * m_w + m_x * m_w +addWidth;
    
    [m_drawNode setPosition:ccp(wd, size.height)];
    
    //[m_drawNode drawDot:self.position radius:DRAWSPRITE_RADIUES color:m_color];
    CGFloat _x = 0;
    CGFloat _y = 10;
    //五角星边的长度为10px，x1、h1为五角星的底部点坐标偏差值，x2、h2为五角星上部点偏差值
    CGFloat x1 = 20 * sin(M_PI / 10);
    CGFloat h1 = 10 * cos(M_PI / 10);
    CGFloat x2 = 10;
    CGFloat h2 = 5 * tan(M_PI / 5);
    
    CGPoint starPoints[] = {ccp(0,-10),
        ccp(_x + x1, _y + h1),
        ccp(_x - x2, _y + h2),
        ccp(_x + x2, _y + h2),
        ccp(_x - x1, _y + h1),
        ccp(_x,_y)
    };
    [m_drawNode drawPolyWithVerts:starPoints count:6 fillColor:m_color borderWidth:0 borderColor:m_color];
    
    ccColor4F col = ccc4f(m_color.r, m_color.g, m_color.b, 255 * 0.75);
    
    //[m_selectNode drawDot:ccp(0, 0) radius:DRAWSPRITE_RADIUES color:col];
    [m_selectNode drawPolyWithVerts:starPoints count:6 fillColor:m_color borderWidth:0 borderColor:col];
    
    [self respawnDropdown];
}

-(void) spawnDropdown
{
    m_dropCount = 0;
    
    [self stopAllActions];
    
    CGPoint pos = [self calcPos:m_x y:m_y];
    
    CCActionInterval *wait = [CCActionInterval actionWithDuration:m_y * SPAWN_DROPDOWN_TIME / 5];
    
    CCMoveTo *moveto = [CCMoveTo actionWithDuration:SPAWN_DROPDOWN_TIME / 2 position:pos];
    
    CCJumpTo *jump = [CCJumpTo actionWithDuration:SPAWN_JUMP_TIME position:pos height:30 jumps:1];
    
    CCCallBlockO *callB = [CCCallBlockO actionWithBlock:^(id object) {
        m_hasSelected = NO;
        self.visible = YES;
    } object:self];
    
    CCSequence *seq = [CCSequence actions:wait, moveto, jump, callB, nil];
    
    [m_drawNode runAction:seq];
}

-(void) respawnDropdown
{
    m_dropCount = 0;
    
    [self stopAllActions];
    
    CGPoint pos = [self calcPos:m_x y:m_y];
    
//    CCActionInterval * wait = [CCActionInterval actionWithDuration:m_y*SPAWN_DROPDOWN_TIME/5];
    
    CCMoveTo *moveto = [CCMoveTo actionWithDuration:SPAWN_DROPDOWN_TIME / 3 position:pos];
    
    CCJumpTo *jump = [CCJumpTo actionWithDuration:SPAWN_JUMP_TIME / 3 * 2 position:pos height:20 jumps:1];
    
    CCCallBlockO *callB = [CCCallBlockO actionWithBlock:^(id object) {
        m_hasSelected = NO;
        self.visible = YES;
    } object:self];
    
    CCSequence *seq = [CCSequence actions:moveto,jump,callB, nil];
    
    [m_drawNode runAction:seq];
}

-(void) resetPropertyA:(NSInteger)x Y:(NSInteger)y
{
    if (y <m_y) {
        m_dropCount ++;
    }
    m_x = x;
    m_y = y;
}

-(void) resetDropdown
{
    m_hasSelected = YES;
    
    CGPoint pos = [self calcPos:m_x y:m_y];
    
    CCMoveTo *moveto = [CCMoveTo actionWithDuration:RESET_DROPDOWN_TIME position:pos];
    
    CCJumpTo *jump = [CCJumpTo actionWithDuration:RESET_JUMP_TIME / 3
                                          position:pos height:15 jumps:1];
    
    CCCallBlockO *callB = [CCCallBlockO actionWithBlock:^(id object) {
        m_hasSelected = NO;
    } object:self];
    
    CCSequence *seq = [CCSequence actions:moveto, jump, callB, nil];
    
    [m_drawNode runAction:seq];
    m_dropCount = 0;
}

-(BOOL) positionInContent:(CGPoint)pos
{
//    CGFloat width = DRAWSPRITE_WIDTH;
//    CGFloat height = DRAWSPRITE_HEIGHT;
    
    CGFloat orgx = m_drawNode.position.x - DRAWSPRITE_WIDTH;
    CGFloat orgy = m_drawNode.position.y - DRAWSPRITE_HEIGHT;
    
    CGRect rect = CGRectMake(orgx, orgy, DRAWSPRITE_WIDTH * 2, DRAWSPRITE_HEIGHT * 2);
    
    return  CGRectContainsPoint(rect, pos);
}

-(BOOL) selectedType
{
    m_hasSelected = YES;
    
    [m_selectNode stopAllActions];
    [m_selectNode setScale:1.0];
    [m_selectNode setVisible:true];
    
    CCScaleBy *scaleBy = [CCScaleBy actionWithDuration:0.1 scale:2.0];
    CCCallBlock *block = [CCCallBlock actionWithBlock:^{
        [m_selectNode setVisible:false];
    }];
    
    CCSequence *seq = [CCSequence actions:scaleBy, [scaleBy reverse], block, nil];
    [seq setTag:caleActiontag];
    [m_selectNode runAction:seq];
    
    return YES;
}

-(void) dispel:(bool)callf
{
    CCScaleBy *scaleBy = [CCScaleBy actionWithDuration:0.1 scale:1.5];
    CCScaleBy *scaleBy2 = [CCScaleBy actionWithDuration:0.2 scale:0];
    CCSequence *seq = NULL;
    
    if (callf) {
        CCCallBlockO *callfu  = [CCCallBlockO actionWithBlock:^(id object) {
            
            if (self.parent) {
                DataHandle *data = (DataHandle*)self.parent;
                [data dispelEnd];
            }
            
        } object:self];
        seq = [CCSequence actions:scaleBy, scaleBy2, callfu, nil];
    } else {
        seq = [CCSequence actions:scaleBy, scaleBy2, nil];
    }
    
    m_dispel = YES;
    
    [m_drawNode runAction:seq];
}

-(void) unselected
{
    m_hasSelected = NO;
}

-(CGPoint) getDrawNodePosition
{
    return m_drawNode.position;
}

-(void) KeepSelected
{
    m_hasSelected = YES;
    [m_selectNode stopAllActions];
    [m_selectNode setVisible:true];
    CCScaleBy *scaleBy = [CCScaleBy actionWithDuration:0.1 scale:1.7];
    [m_selectNode runAction:scaleBy];
}

-(void) unKeepSelected
{
    m_hasSelected = NO;
    [m_selectNode stopAllActions];
    
    CCScaleTo *scaleTo = [CCScaleTo actionWithDuration:0.1 scale:1.0];
    CCCallBlock *block = [CCCallBlock actionWithBlock:^{
        [m_selectNode setVisible:false];
    }];
    
    CCSequence *seq = [CCSequence actions:scaleTo, block, nil];
    [seq setTag:caleActiontag];
    [m_selectNode runAction:seq];
}

@end
