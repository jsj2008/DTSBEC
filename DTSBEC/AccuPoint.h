#ifndef AccuPoint_h
#define AccuPoint_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Account.h"

typedef NS_ENUM(NSUInteger, AccuPointErrCode) {
    E_ACCU_POINT_SUCC = 0,
    E_ACCU_POINT_NOT_LOGIN = -1,
    E_ACCU_POINT_TICKET_EXPIRED = -2,
    E_ACCU_POINT_NO_ENOUGH_POINT = -3,
    E_ACCU_POINT_UNKOWN_TASK = -4,
    E_ACCU_POINT_TASK_LIMIT = -5,
    E_ACCU_POINT_INVALID_CODE = -6,
    E_ACCU_POINT_COMMIT_SELF_CODE = -7,
    E_ACCU_POINT_REPEATED_COMMIT = -8,
    E_ACCU_POINT_CODE_USED_ALREADY = -9,
    E_ACCU_POINT_OLD_USER_COMMIT_CODE = -10,
    E_ACCU_POINT_EXPIRED_CODE = -11,
    E_ACCU_POINT_SVR_ERR = -99
};

typedef NS_ENUM(NSUInteger, AccuPointTaskType) {
    E_ACCU_POINT_TASK_DAILY_SIGN = 0,
    E_ACCU_POINT_TASK_BIND_PHONE = 1,
    E_ACCU_POINT_TASK_SHARE = 2,
    E_ACCU_POINT_TASK_INVITE = 3,
    E_ACCU_POINT_TASK_BROWSE = 4,
    E_ACCU_POINT_TASK_PRAISE_FEED = 5,
    E_ACCU_POINT_TASK_COMMENT_FEED = 6,
    E_ACCU_POINT_TASK_PO_FEED = 7,
    E_ACCU_POINT_TASK_REGISTER = 8
};

typedef NS_ENUM(NSUInteger, AccuPointCodeType) {
    E_ACCU_POINT_CODE_INVITE = 0,
    E_ACCU_POINT_CODE_CONVERT = 1
};

typedef NS_ENUM(NSUInteger, AccuPointPriviType) {
    E_ACCU_POINT_PRIVI_CHIP = 1,
    E_ACCU_POINT_PRIVI_KLINE = 2,
    E_ACCU_POINT_PRIVI_HISTORY = 3
};

typedef NS_ENUM(NSUInteger, AccuPointOpenType) {
    E_ACCU_POINT_OPEN_BY_POINT = 0,
    E_ACCU_POINT_OPEN_BY_MONEY = 1
};

/////////////////////////////////////////////////////////////////
@interface CommitCodeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sCode;


- (void) write: (BaseEncodeStream *)eos;

- (CommitCodeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CommitCodeRsp : Message

@property (nonatomic, assign) int32_t iCodeType;
@property (nonatomic, assign) int32_t iGetPoints;


- (void) write: (BaseEncodeStream *)eos;

- (CommitCodeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserPointInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserPointInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AccuPointPriviInfo : Message

@property (nonatomic, assign) int32_t iPriviType;
@property (nonatomic, copy) NSString* sPriviEndDay;
@property (nonatomic, assign) int32_t iPriviLeftDays;


- (void) write: (BaseEncodeStream *)eos;

- (AccuPointPriviInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserPointInfoRsp : Message

@property (nonatomic, copy) NSString* sInviteCode;
@property (nonatomic, assign) int32_t iAccuPoints;
@property (nonatomic, assign) int32_t iGetPointsDaily;
@property (nonatomic, assign) int32_t iLeftTaskNum;
@property (nonatomic, strong) NSMutableArray* vPrivi;
@property (nonatomic, strong) NSMutableDictionary* mPriviPoints;
@property (nonatomic, assign) int32_t iInviteUserNum;
@property (nonatomic, assign) int32_t iInviteGetPoints;
@property (nonatomic, assign) int32_t iWebRetCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserPointInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPointConverCodeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iGetNum;
@property (nonatomic, assign) BOOL bGetNew;


- (void) write: (BaseEncodeStream *)eos;

- (GetPointConverCodeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPointConverCodeRsp : Message

@property (nonatomic, strong) NSMutableArray* vCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetPointConverCodeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OpenPointPriviItem : Message

@property (nonatomic, assign) int32_t iPriviType;
@property (nonatomic, assign) int32_t iOpenDays;


- (void) write: (BaseEncodeStream *)eos;

- (OpenPointPriviItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OpenPointPriviReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) AccuPointOpenType eOpenType;
@property (nonatomic, strong) NSMutableArray* vItem;


- (void) write: (BaseEncodeStream *)eos;

- (OpenPointPriviReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OpenPointPriviRsp : Message

@property (nonatomic, strong) NSMutableArray* vPrivi;


- (void) write: (BaseEncodeStream *)eos;

- (OpenPointPriviRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPointTaskListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void) write: (BaseEncodeStream *)eos;

- (GetPointTaskListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AccuPointTaskItem : Message

@property (nonatomic, assign) int32_t iType;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, copy) NSString* sSkipUrl;
@property (nonatomic, assign) int32_t iGetPoints;
@property (nonatomic, assign) int32_t iTimesLimit;
@property (nonatomic, copy) NSString* sIcon;


- (void) write: (BaseEncodeStream *)eos;

- (AccuPointTaskItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPointTaskListRsp : Message

@property (nonatomic, strong) NSMutableArray* vTask;
@property (nonatomic, strong) NSMutableArray* vFinished;


- (void) write: (BaseEncodeStream *)eos;

- (GetPointTaskListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportFinishTaskReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iTaskType;


- (void) write: (BaseEncodeStream *)eos;

- (ReportFinishTaskReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportFinishTaskRsp : Message

@property (nonatomic, assign) int32_t iGetPoints;


- (void) write: (BaseEncodeStream *)eos;

- (ReportFinishTaskRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CommitAccuPointCodeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sCode;


- (void) write: (BaseEncodeStream *)eos;

- (CommitAccuPointCodeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CommitAccuPointCodeRsp : Message

@property (nonatomic, assign) int32_t iGetPoints;
@property (nonatomic, assign) int32_t iGetPriviDays;


- (void) write: (BaseEncodeStream *)eos;

- (CommitAccuPointCodeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserPointDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iDirection;
@property (nonatomic, copy) NSString* sStartId;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserPointDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface UserPointDetailItem : Message

@property (nonatomic, assign) int32_t iTaskType;
@property (nonatomic, assign) int64_t lTimeStamp;
@property (nonatomic, assign) int32_t iGetPoints;


- (void) write: (BaseEncodeStream *)eos;

- (UserPointDetailItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserPointDetailRsp : Message

@property (nonatomic, strong) NSMutableArray* vItem;
@property (nonatomic, assign) int32_t iTotalNum;
@property (nonatomic, assign) int32_t iStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserPointDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetOpenPriviDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iDirection;
@property (nonatomic, copy) NSString* sStartId;


- (void) write: (BaseEncodeStream *)eos;

- (GetOpenPriviDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OpenPriviDetailItem : Message

@property (nonatomic, assign) int32_t iOpenType;
@property (nonatomic, assign) int32_t iPriviType;
@property (nonatomic, assign) int32_t iOpenDays;
@property (nonatomic, copy) NSString* sPriviEndDay;
@property (nonatomic, assign) int64_t lTimeStamp;


- (void) write: (BaseEncodeStream *)eos;

- (OpenPriviDetailItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetOpenPriviDetailRsp : Message

@property (nonatomic, strong) NSMutableArray* vPriviItem;
@property (nonatomic, assign) int32_t iTotalNum;
@property (nonatomic, assign) int32_t iStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetOpenPriviDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetAccuPointConverCodeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iOpenPriviDays;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, assign) int32_t iSize;
@property (nonatomic, assign) int64_t lInvalidTimeStamp;


- (void) write: (BaseEncodeStream *)eos;

- (GetAccuPointConverCodeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetAccuPointConverCodeRsp : Message

@property (nonatomic, strong) NSMutableArray* vConversionCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetAccuPointConverCodeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
