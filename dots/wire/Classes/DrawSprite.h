//
//  DrawSprite.h
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"
#include "config.h"

@interface DrawSprite : CCNode {
    int m_w;
    int m_h;
    
    BOOL m_hasSelected;//可否被选择
    
    CCDrawNode *m_drawNode;// 画当前颜色的圆点
    
    CCDrawNode *m_selectNode;// 用于 被选中时播放动画
    
    int m_dropCount;
}

@property(nonatomic,readonly) NSInteger m_x;
@property(nonatomic,readonly) NSInteger m_y;
@property(nonatomic,readonly) ccColor4F m_color;
@property(nonatomic,readonly) BOOL m_dispel;//是否消除

//生成 该节点 x y 宽和高
-(void) spawnAtX:(NSInteger)x Y:(NSInteger)y Width:(CGFloat)w Height:(CGFloat) h;

-(void) respawn;// 重新生成 

-(void) spawnDropdown;//生成后掉落下来

-(void) resetPropertyA:(NSInteger)x Y:(NSInteger)y;// 重置属性 x和y坐标值

-(void) resetDropdown;// 重置后掉落函数

-(BOOL) positionInContent:(CGPoint) pos;// 判断是移动的点是否在 检查范围内

-(BOOL) selectedType;// 被选中调用该方法

-(void) dispel:(bool) callf;// 消除

-(void) unselected;// 取消选中状态

-(CGPoint) getDrawNodePosition;//得到当前 绘制节点的位置

-(void) KeepSelected;//保持被选中状态

-(void) unKeepSelected;// 取消保持被选中状态

@end
