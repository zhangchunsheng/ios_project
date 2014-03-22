//
//  MatchHudLayer.h
//  disappear
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MatchHudLayer : CCLayer<UIAlertViewDelegate> {
    BOOL hasResponse;
}

-(void) reveiveMessage:(NSDictionary*)dic Error:(NSDictionary*) error;

@end
