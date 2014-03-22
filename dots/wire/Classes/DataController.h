//
//  DataController.h
//  disappear
//
//  Created by ZhangChunsheng on 14-3-21.
//  Copyright (c) ZhangChunsheng 2014年. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataController : NSObject{
    
    NSString * m_filePath;
    
    NSDictionary * m_dataDic;
    
}

+(DataController*) getSharedDataController;

+(void) releaseSharedDataController;

-(void) savePlayerTemplateData:(NSInteger) score;


-(NSArray*) readLoaclScoreTopList;

-(NSDictionary*) readWorldScpreTopList;

-(NSArray *) readPlayerDefaultProperty;

-(NSInteger) getHighScore;

-(void) saveUserName:(NSString*)name;

@end
