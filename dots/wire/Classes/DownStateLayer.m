//
//  DownStateLayer.m
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import "DownStateLayer.h"
#import "DotHudController.h"


@implementation DownStateLayer


- (id) init
{
    CGSize s = [CCDirector sharedDirector].winSize;
    self = [super initWithColor:ccc4(255, 255, 255, 255) width:s.width height:60];
    if (self) {
        [self setAnchorPoint:ccp(0, 0)];
        
        CCMenuItemImage * skill_Time = [CCMenuItemImage itemWithNormalImage:@"Images/skillbutton_Time.png" selectedImage:@"Images/skillButton_Time_unselect.png" target:self selector:@selector(skill_TimePressed)];
        CCMenuItemImage * skill_DispelOne = [CCMenuItemImage itemWithNormalImage:@"Images/skillbutton_DispelOne.png" selectedImage:@"Images/skillButton_DispelOne_unselect.png" target:self selector:@selector(skill_DispelOnePressed)];
        CCMenuItemImage * skill_DispelTheSameColor = [CCMenuItemImage itemWithNormalImage:@"Images/skillbutton_DispelTheSameColor.png" selectedImage:@"Images/skillButton_DispelTheSameColor_unselect.png" target:self selector:@selector(skill_DispelTheSameColorPressed)];
        
        
        [skill_Time setAnchorPoint:ccp(0, 0)];
        [skill_DispelOne setAnchorPoint:ccp(0.5, 0)];
        [skill_DispelTheSameColor setAnchorPoint:ccp(1, 0)];
        
        [skill_Time setPosition:ccp(0, 0)];
        [skill_DispelOne setPosition:ccp(s.width / 2, 0)];
        [skill_DispelTheSameColor setPosition:ccp(s.width, 0)];
        
        CCMenu * menu = [CCMenu menuWithItems:skill_Time, skill_DispelOne, skill_DispelTheSameColor, nil];
        [menu setPosition:ccp(0, 17)];
        [self addChild:menu];
        
        [self setVisible:false];
    }
    return self;
}

-(void) startAnimationDisplay
{    
    [self setAnchorPoint:ccp(0, 0) ];
    [self setPosition:ccp(0, -60) ];
    
    [self setVisible:true];
//    
    CCMoveTo * moveTo1 = [CCMoveTo actionWithDuration:0.2 position:ccp(0, 0)];
    CCMoveTo * moveTo2 = [CCMoveTo actionWithDuration:0.2 position:ccp(0, -17)];
    
    [self runAction:[CCSequence actions:moveTo1, moveTo2, nil]];
}

-(void) skill_TimePressed
{
    if (self.parent) {
        DotHudController *dhc = (DotHudController*)self.parent;
        [dhc playerUseSkill:tooltime];
    }
}

-(void) skill_DispelOnePressed
{
    if (self.parent) {
        DotHudController *dhc = (DotHudController*)self.parent;
        [dhc playerUseSkill:toolDispelOne];
    }
}

-(void) skill_DispelTheSameColorPressed
{
    if (self.parent) {
        DotHudController *dhc = (DotHudController*)self.parent;
        [dhc playerUseSkill:toolDispelAll];
    }
}

@end
