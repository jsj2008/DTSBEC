#ifndef Alert_h
#define Alert_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "UserPortfolio.h"
#import "Notification.h"
#import "PushStatus.h"
#import "Feed.h"

/////////////////////////////////////////////////////////////////
@interface AlertReq : Message

@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) NSMutableArray* vProSecInfo;


- (void) write: (BaseEncodeStream *)eos;

- (AlertReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertRsp : Message

@property (nonatomic, assign) uint32_t iSetSize;


- (void) write: (BaseEncodeStream *)eos;

- (AlertRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertMessageListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) uint32_t iStart;
@property (nonatomic, assign) uint32_t iNum;


- (void) write: (BaseEncodeStream *)eos;

- (AlertMessageListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertMessageListRsp : Message

@property (nonatomic, strong) NSMutableArray* vPushData;
@property (nonatomic, assign) uint32_t iClearTimeStamp;
@property (nonatomic, strong) NSMutableDictionary* mClearTimeStamp;


- (void) write: (BaseEncodeStream *)eos;

- (AlertMessageListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ClearAlertMessageListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iClassID;


- (void) write: (BaseEncodeStream *)eos;

- (ClearAlertMessageListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RecordAlertMsgReq : Message

@property (nonatomic, strong) NSMutableArray* vPushData;


- (void) write: (BaseEncodeStream *)eos;

- (RecordAlertMsgReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertMsgClassDesc : Message

@property (nonatomic, assign) int32_t iClassID;
@property (nonatomic, copy) NSString* sClassName;
@property (nonatomic, copy) NSString* sAndroidIconUrl;
@property (nonatomic, copy) NSString* sIosIconUrl;
@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, assign) int32_t iPushTime;
@property (nonatomic, assign) int32_t iNewsPushCount;


- (void) write: (BaseEncodeStream *)eos;

- (AlertMsgClassDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertMsgClassListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) NSMutableDictionary* mEndPushTime;


- (void) write: (BaseEncodeStream *)eos;

- (AlertMsgClassListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertMsgClassListRsp : Message

@property (nonatomic, strong) NSMutableArray* vAlertMsgClassDesc;


- (void) write: (BaseEncodeStream *)eos;

- (AlertMsgClassListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertMsgClassDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iClassID;
@property (nonatomic, assign) int32_t iStart;
@property (nonatomic, assign) int32_t iNum;


- (void) write: (BaseEncodeStream *)eos;

- (AlertMsgClassDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertMsgClassDetailRsp : Message

@property (nonatomic, strong) NSMutableArray* vPushData;


- (void) write: (BaseEncodeStream *)eos;

- (AlertMsgClassDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertUserInteractionReq : Message

@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, assign) uint32_t iFromAccountId;
@property (nonatomic, copy) NSString* sFromUserIcon;
@property (nonatomic, copy) NSString* sFromUserName;
@property (nonatomic, copy) NSString* sMsgId;
@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) BOOL bVerify;
@property (nonatomic, assign) E_FEED_TYPE eFeedType;


- (void) write: (BaseEncodeStream *)eos;

- (AlertUserInteractionReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertUserInteractionRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (AlertUserInteractionRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertTgAttitudeReq : Message

@property (nonatomic, strong) FeedContent* stFeedContent;


- (void) write: (BaseEncodeStream *)eos;

- (AlertTgAttitudeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AlertTgAttitudeRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (AlertTgAttitudeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
