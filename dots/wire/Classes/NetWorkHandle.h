//
//  NetWorkHandle.h
//  wire
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright (c) ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASIHTTPRequest.h"
#import "ASIHTTPRequestDelegate.h"

@interface NetWorkHandle : NSObject {
    NSString * selfMd5Address;
    id startMatchDel;
    id sendPointDel;
    id sendGameOverDel;
}

+(NetWorkHandle*) getSharedNetWork;

-(void) startMatchOppoent:(id) startMatchDelegate;
-(void) cancellationMatchOppoent;

-(void) sendCurrentPoint:(id) sendDelegate point:(NSInteger) point;
-(void) cancellationSendPoint;

-(void) sendGameOver:(id) gameOver point:(NSInteger)point;
-(void) cancellationGameOver;

@end
