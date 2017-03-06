#ifndef TextProcess_h
#define TextProcess_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

/////////////////////////////////////////////////////////////////
@interface ProcessNewsContentReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sContent;


- (void)write: (BaseEncodeStream *)eos;

- (ProcessNewsContentReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ProcessNewsContentRsp : Message

@property (nonatomic, copy) NSString* sResult;


- (void)write: (BaseEncodeStream *)eos;

- (ProcessNewsContentRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
