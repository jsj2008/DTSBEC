#ifndef Notification_h
#define Notification_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "NewsInfo.h"

typedef NS_ENUM(NSUInteger, E_NOTIFICAIION_RET) {
    E_NFR_SUCC = 0,
    E_NFR_EXCEPTION = 1000,
    E_NFR_GUID_EMPTY = 1001,
    E_NFR_USER_NO_EXIST = 1002,
    E_NFR_DEVICETOKE_EMPTY = 1003,
    E_NFR_THIRD_PUSH_ERROR = 1004,
    E_NFR_DECODE_USERINFO_ERROR = 1005,
    E_NFR_PART_SENT_SUCCESS = 1006,
    E_NFR_CHECK_PUSHCNTROL_ERROR = 1007,
    E_NFR_NOT_ALLOWED_PUSH = 1008,
    E_NFR_ID_TO_GUID_ERROR = 1009,
    E_NFR_ID_TOO_MUCH_ERROR = 1010,
    E_NFR_FREQUENT_LIMIT_ERROR = 1011,
    E_NTR_TIME_ERROR = 1012,
    E_CLASS_ID_ERROR = 1013
};

typedef NS_ENUM(NSUInteger, E_MSG_CLASS) {
    E_MC_DISC_NEWS = 1,
    E_MC_SEC_PRICE = 2,
    E_MC_ANN_REP = 3,
    E_MC_DAILY_REPORT = 4,
    E_MC_TG = 5,
    E_MC_INTERACTION = 6,
    E_MC_NEW_STOCK = 7,
    E_MC_ACTIVITY = 8,
    E_MC_VALUE_ADDED_SERVICE = 9
};

typedef NS_ENUM(NSUInteger, E_PUSH_DATA_TYPE) {
    E_SEC_REMIND = 1,
    E_NEWS_REMIND = 2,
    E_NNT_ACTIVITY = 3,
    E_PDT_NEW_STOCK_REMIND = 4,
    E_PDT_DAILY_REPORT = 5,
    E_PDT_PC_START_PAGE = 6,
    E_TG_ATTITUDE = 7,
    E_USER_INTERACTION = 8,
    E_VALUE_ADDED_SERVICE = 9
};

typedef NS_ENUM(NSUInteger, E_NOTIFY_NEW_TYPE) {
    E_NNT_COMMON = 0,
    E_NNT_IMPORTANT = 1
};

typedef NS_ENUM(NSUInteger, PUSH_DEVICE_TYPE) {
    E_PDT_ALL = 0,
    E_PDT_ADR = 1,
    E_PDT_IOS = 2
};

typedef NS_ENUM(NSUInteger, E_PUSH_ID_TYPE) {
    E_PUSH_ACCOUNT_ID = 1,
    E_PUSH_GUID
};

typedef NS_ENUM(NSUInteger, E_FREQUENT_CONTROY_TYPE) {
    E_FCT_TYPE_CONTROL = 1,
    E_FCT_MSGID_CONTROL = 2
};

/////////////////////////////////////////////////////////////////
@interface SecNotify : Message

@property (nonatomic, strong) SecInfo* stSecInfo;
@property (nonatomic, copy) NSString* sNotifyMsg;


- (void) write: (BaseEncodeStream *)eos;

- (SecNotify *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface NewsNotify : Message

@property (nonatomic, copy) NSString* sCHNShortName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sNewsID;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sDtInfoUrl;
@property (nonatomic, copy) NSString* sNotifyMsg;
@property (nonatomic, assign) E_NOTIFY_NEW_TYPE eNotifyNewType;
@property (nonatomic, strong) NSMutableArray* vtTagInfo;
@property (nonatomic, copy) NSString* sAbstract;


- (void) write: (BaseEncodeStream *)eos;

- (NewsNotify *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ActivityNotify : Message

@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, copy) NSString* sMsg;


- (void) write: (BaseEncodeStream *)eos;

- (ActivityNotify *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StartPageNotify : Message

@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, assign) int32_t iShowTime;
@property (nonatomic, assign) int32_t iHeight;
@property (nonatomic, assign) int32_t iWidth;


- (void) write: (BaseEncodeStream *)eos;

- (StartPageNotify *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TgAttitudeNotify : Message

@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, copy) NSString* sUserName;
@property (nonatomic, copy) NSString* sIcon;
@property (nonatomic, copy) NSString* sNotifyMsg;
@property (nonatomic, assign) BOOL bVerify;
@property (nonatomic, assign) int32_t iFeedType;
@property (nonatomic, assign) int32_t iMemberType;


- (void) write: (BaseEncodeStream *)eos;

- (TgAttitudeNotify *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InteractionNotify : Message

@property (nonatomic, copy) NSString* sMsgId;
@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, copy) NSString* sIcon;
@property (nonatomic, copy) NSString* sUserName;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) BOOL bVerify;
@property (nonatomic, assign) int32_t iFeedType;
@property (nonatomic, assign) int32_t iMemberType;


- (void) write: (BaseEncodeStream *)eos;

- (InteractionNotify *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PushType : Message

@property (nonatomic, assign) E_PUSH_DATA_TYPE ePushDataType;
@property (nonatomic, copy) NSString* sBusinessId;
@property (nonatomic, copy) NSString* sMsgId;


- (void) write: (BaseEncodeStream *)eos;

- (PushType *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PushControlData : Message

@property (nonatomic, assign) int32_t iRealPushType;
@property (nonatomic, copy) NSString* sAndroidIconUrl;
@property (nonatomic, copy) NSString* sIosIconUrl;


- (void) write: (BaseEncodeStream *)eos;

- (PushControlData *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PushData : Message

@property (nonatomic, strong) NSData* vtData;
@property (nonatomic, strong) PushType* stPushType;
@property (nonatomic, assign) int32_t iPushTime;
@property (nonatomic, assign) int32_t iExpireTime;
@property (nonatomic, assign) int32_t iStartTime;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, assign) PUSH_DEVICE_TYPE eDeviceType;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, assign) int32_t iNotifyEffect;
@property (nonatomic, strong) PushControlData* stControl;
@property (nonatomic, assign) int32_t iClassID;


- (void) write: (BaseEncodeStream *)eos;

- (PushData *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PushReq : Message

@property (nonatomic, assign) E_PUSH_ID_TYPE ePushIdType;
@property (nonatomic, strong) NSMutableArray* vtId;
@property (nonatomic, strong) PushData* stPushData;
@property (nonatomic, assign) E_FREQUENT_CONTROY_TYPE eFreqControlType;
@property (nonatomic, strong) NSMutableArray* vTags;


- (void) write: (BaseEncodeStream *)eos;

- (PushReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PushRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mpPushResult;


- (void) write: (BaseEncodeStream *)eos;

- (PushRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface BroadcastPushReq : Message

@property (nonatomic, strong) PushData* stPushData;


- (void) write: (BaseEncodeStream *)eos;

- (BroadcastPushReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface BroadcastPushRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (BroadcastPushRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GroupcastPushReq : Message

@property (nonatomic, strong) PushData* stPushData;
@property (nonatomic, strong) NSMutableArray* vTags;


- (void) write: (BaseEncodeStream *)eos;

- (GroupcastPushReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GroupcastPushRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (GroupcastPushRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface QuickPushReq : Message

@property (nonatomic, assign) int32_t iId;


- (void) write: (BaseEncodeStream *)eos;

- (QuickPushReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
