#ifndef PushStatus_h
#define PushStatus_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "UserPortfolio.h"
#import "Notification.h"

/////////////////////////////////////////////////////////////////
@interface PushStatusReq : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, strong) PushData* stPushData;


- (void) write: (BaseEncodeStream *)eos;

- (PushStatusReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PushStatusRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (PushStatusRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
