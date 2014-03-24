//
//  SettingsLayer.m
//  wire
//
//  Created by Peter Zhang on 14-3-23.
//  Copyright (c) 2014年 CpyShine. All rights reserved.
//

#import "SettingsLayer.h"

@implementation SettingsLayer

+(CCScene *) scene {
    CCScene *scene = [CCScene node];
    SettingsLayer *layer = [SettingsLayer node];
    [scene addChild:layer];
    return scene;
};

-(int) void {
    self = [super initWithColor:ccc4(255, 255, 255, 255)];
    return self;
};

@end
