#ifndef AccuPoint_h
#define AccuPoint_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Account.h"

typedef NS_ENUM(NSInteger, AccuPointErrCode) {
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
    E_ACCU_POINT_USER_NOT_EXIST = -12,
    E_ACCU_POINT_COMMIT_TOO_FREQ = -13,
    E_ACCU_POINT_INVALID_COUPON_TYPE = -14,
    E_ACCU_POINT_REPEAT_RECEIVE_COUPON = -15,
    E_ACCU_POINT_NO_MORE_COUPON = -16,
    E_ACCU_POINT_NO_BIND_PHONE = -17,
    E_ACCU_POINT_INVALID_RISK_EVAL = -18,
    E_ACCU_POINT_EVAL_NO_ID = -19,
    E_ACCU_POINT_EVAL_NOT_EXIST = -20,
    E_ACCU_POINT_MEMBER_COUPON = -21,
    E_ACCU_POINT_SVR_ERR = -99,
    E_ACCU_POINT_BIND_PHONE = 1
};

typedef NS_ENUM(NSInteger, AccuPointTaskType) {
    E_ACCU_POINT_TASK_DAILY_SIGN = 0,
    E_ACCU_POINT_TASK_BIND_PHONE = 1,
    E_ACCU_POINT_TASK_SHARE = 2,
    E_ACCU_POINT_TASK_INVITE = 3,
    E_ACCU_POINT_TASK_BROWSE = 4,
    E_ACCU_POINT_TASK_PRAISE_FEED = 5,
    E_ACCU_POINT_TASK_COMMENT_FEED = 6,
    E_ACCU_POINT_TASK_PO_FEED = 7,
    E_ACCU_POINT_TASK_REGISTER = 8,
    E_ACCU_POINT_TASK_EXCHANGE_PRIVI = 9,
    E_ACCU_POINT_TASK_ACTIVITY = 10,
    E_ACCU_POINT_TASK_DO_RISK_EVAL = 11
};

typedef NS_ENUM(NSInteger, AccuPointCodeType) {
    E_ACCU_POINT_CODE_INVITE = 0,
    E_ACCU_POINT_CODE_CONVERT = 1,
    E_ACCU_POINT_CODE_ACTIVATE = 2
};

typedef NS_ENUM(NSInteger, AccuPointPriviType) {
    E_ACCU_POINT_PRIVI_CHIP = 1,
    E_ACCU_POINT_PRIVI_KLINE = 2,
    E_ACCU_POINT_PRIVI_HISTORY = 3,
    E_ACCU_POINT_PRIVI_BSSIGNAL = 4,
    E_ACCU_POINT_SECRET_DECISION = 5,
    E_ACCU_POINT_KLINE_SELECT = 6,
    E_ACCU_POINT_FINANCE_TRACK = 7,
    E_ACCU_POINT_YXT_ADVANCED_COURSE = 8,
    E_ACCU_POINT_YP_PRIVATE_STOCK_TACTICS = 9,
    E_ACCU_POINT_YP_PDJN = 10,
    E_ACCU_POINT_YP_FPDS = 11,
    E_ACCU_POINT_INVEST_MAP = 12,
    E_ACCU_POINT_DIRECT_ADD_ISS = 13,
    E_ACCU_POINT_YP_ZLTJ = 14,
    E_ACCU_POINT_YP_JZTJ = 15
};

typedef NS_ENUM(NSInteger, AccuPointOpenType) {
    E_ACCU_POINT_OPEN_BY_POINT = 0,
    E_ACCU_POINT_OPEN_BY_MONEY = 1,
    E_ACCU_POINT_OPEN_BY_CONVER_CODE = 2,
    E_ACCU_POINT_OPEN_BY_ACTIVITY = 3,
    E_ACCU_POINT_OPEN_BY_DT = 4
};

typedef NS_ENUM(NSInteger, AccuPointUseType) {
    E_ACCU_POINT_USE_OPEN_BLESS_PACK = 1
};

typedef NS_ENUM(NSInteger, AccuPointUserRiskType) {
    E_USER_RISK_EVAL_INVALID = -1,
    E_USER_RISK_NO_EVAL = 0,
    E_USER_RISK_CONSERVATIVE = 1,
    E_USER_RISK_CAUTIOUS = 2,
    E_USER_RISK_STEADY = 3,
    E_USER_RISK_POSITIVE = 4,
    E_USER_RISK_RADICAL = 5
};

typedef NS_ENUM(NSInteger, AccuPointTimeUnit) {
    E_ACCU_POINT_TIME_UNIT_DAY = 0,
    E_ACCU_POINT_TIME_UNIT_MONTH = 1,
    E_ACCU_POINT_TIME_UNIT_YEAR = 2
};

typedef NS_ENUM(NSInteger, HOT_SEARCH_TYPE) {
    E_HOT_SEARCH_SHAREHOLDER = 1,
    E_HOT_SEARCH_SENIOR_EXEC = 2,
    E_HOT_SEARCH_STOCK = 3
};

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
@property (nonatomic, strong) NSMutableArray* vYXTCourseId;
@property (nonatomic, copy) NSString* sMemberEndDay;
@property (nonatomic, assign) int32_t iMemberLeftDays;


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
@property (nonatomic, strong) NSMutableArray* vCouponId;


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
@interface OpenMemberReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iOpenDays;
@property (nonatomic, strong) NSMutableArray* vCouponId;
@property (nonatomic, assign) int32_t iOpenType;


- (void) write: (BaseEncodeStream *)eos;

- (OpenMemberReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OpenMemberRsp : Message

@property (nonatomic, copy) NSString* sMemberEndDay;


- (void) write: (BaseEncodeStream *)eos;

- (OpenMemberRsp *) read: (BaseDecodeStream *)dos;

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
@property (nonatomic, assign) int32_t iMemberPoints;


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
@property (nonatomic, assign) int32_t iTaskPoints;


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
@property (nonatomic, assign) int32_t iCodeType;


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
@property (nonatomic, assign) int32_t iRetCode;
@property (nonatomic, copy) NSString* sRetMsg;


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
@property (nonatomic, copy) NSString* sTaskDesc;
@property (nonatomic, copy) NSString* sTaskClassDesc;


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
@property (nonatomic, assign) int32_t iOpenNumber;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, assign) int32_t iSize;
@property (nonatomic, assign) int64_t lInvalidTimeStamp;
@property (nonatomic, assign) int32_t iCodeType;
@property (nonatomic, assign) int32_t iSubjectType;
@property (nonatomic, assign) int32_t iOpenUnit;


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

/////////////////////////////////////////////////////////////////
@interface UseAccuPointReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iUseType;
@property (nonatomic, assign) int32_t iUsePointNum;
@property (nonatomic, assign) int32_t iGetPointNum;
@property (nonatomic, assign) int64_t lTimeStamp;


- (void) write: (BaseEncodeStream *)eos;

- (UseAccuPointReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface UseAccuPointRsp : Message

@property (nonatomic, assign) int32_t iLeftAccuPoint;


- (void) write: (BaseEncodeStream *)eos;

- (UseAccuPointRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ValueAddedPackageDesc : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, assign) int32_t iFee;
@property (nonatomic, assign) int32_t iNumber;


- (void) write: (BaseEncodeStream *)eos;

- (ValueAddedPackageDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ValueAddedDesc : Message

@property (nonatomic, assign) int32_t iType;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, copy) NSString* sFeeDesc;
@property (nonatomic, copy) NSString* sIcon;
@property (nonatomic, assign) float fFee;
@property (nonatomic, assign) int32_t iNumber;
@property (nonatomic, assign) int32_t iOnlineState;
@property (nonatomic, copy) NSString* sBeforeSaleIcon;
@property (nonatomic, copy) NSString* sPreSalingUrl;


- (void) write: (BaseEncodeStream *)eos;

- (ValueAddedDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetValueAddedListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetValueAddedListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetValueAddedListRsp : Message

@property (nonatomic, strong) NSMutableArray* vList;


- (void) write: (BaseEncodeStream *)eos;

- (GetValueAddedListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetValueAddedPackageListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iType;


- (void) write: (BaseEncodeStream *)eos;

- (GetValueAddedPackageListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetValueAddedPackageListRsp : Message

@property (nonatomic, strong) NSMutableArray* vList;


- (void) write: (BaseEncodeStream *)eos;

- (GetValueAddedPackageListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPreSaleLeftNumReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iSubjectType;


- (void) write: (BaseEncodeStream *)eos;

- (GetPreSaleLeftNumReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPreSaleLeftNumRsp : Message

@property (nonatomic, assign) int32_t iLeftNum;


- (void) write: (BaseEncodeStream *)eos;

- (GetPreSaleLeftNumRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OpenDtPrivi4YXTReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sClassId;
@property (nonatomic, copy) NSString* sOpenPhoneNum;
@property (nonatomic, strong) NSMutableArray* vCouponId;


- (void) write: (BaseEncodeStream *)eos;

- (OpenDtPrivi4YXTReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OpenDtPrivi4YXTRsp : Message

@property (nonatomic, assign) int32_t iRetCode;


- (void) write: (BaseEncodeStream *)eos;

- (OpenDtPrivi4YXTRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserCouponNumReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iCouponStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserCouponNumReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserCouponNumRsp : Message

@property (nonatomic, assign) int32_t iCouponNum;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserCouponNumRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserCouponListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iCouponStatus;
@property (nonatomic, assign) int32_t iReqType;
@property (nonatomic, copy) NSString* sActName;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserCouponListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AccuPointCoupon : Message

@property (nonatomic, copy) NSString* sCouponCode;
@property (nonatomic, assign) int32_t iValueMoney;
@property (nonatomic, assign) int32_t iUseCondMoney;
@property (nonatomic, assign) int32_t iSubjectType;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, assign) int64_t lGenTimeStamp;
@property (nonatomic, assign) int64_t lStartTimeStamp;
@property (nonatomic, assign) int64_t lInvalidTimeStamp;
@property (nonatomic, assign) int64_t lUseTimeStamp;
@property (nonatomic, copy) NSString* iUseCondDesc;
@property (nonatomic, copy) NSString* sCouponName;
@property (nonatomic, copy) NSString* sAppScope;
@property (nonatomic, copy) NSString* sActName;


- (void) write: (BaseEncodeStream *)eos;

- (AccuPointCoupon *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserCouponListRsp : Message

@property (nonatomic, strong) NSMutableArray* vList;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserCouponListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReceiveCouponReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iCouponType;
@property (nonatomic, assign) int32_t iUseCondMoney;
@property (nonatomic, copy) NSString* sActName;


- (void) write: (BaseEncodeStream *)eos;

- (ReceiveCouponReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReceiveCouponRsp : Message

@property (nonatomic, assign) int32_t iReturnCode;
@property (nonatomic, strong) AccuPointCoupon* stCoupon;


- (void) write: (BaseEncodeStream *)eos;

- (ReceiveCouponRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface UserEvalItem : Message

@property (nonatomic, assign) int32_t iQuestionId;
@property (nonatomic, assign) int32_t iAnswerId;


- (void) write: (BaseEncodeStream *)eos;

- (UserEvalItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CommitUserEvalReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iEvalType;
@property (nonatomic, strong) NSMutableArray* vItem;
@property (nonatomic, assign) int32_t iSubjectType;
@property (nonatomic, copy) NSString* sEvalVersion;
@property (nonatomic, copy) NSString* sUserSignStr;


- (void) write: (BaseEncodeStream *)eos;

- (CommitUserEvalReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CommitUserEvalRsp : Message

@property (nonatomic, assign) int32_t iRetCode;
@property (nonatomic, assign) int32_t iGetScore;
@property (nonatomic, copy) NSString* sRiskType;
@property (nonatomic, copy) NSString* sRiskDesc;
@property (nonatomic, assign) int32_t iRiskType;


- (void) write: (BaseEncodeStream *)eos;

- (CommitUserEvalRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserEvalResultReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iEvalType;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserEvalResultReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserEvalResultRsp : Message

@property (nonatomic, assign) int32_t iRiskType;
@property (nonatomic, copy) NSString* sRiskType;
@property (nonatomic, copy) NSString* sRiskDesc;
@property (nonatomic, copy) NSString* sRiskTolerance;
@property (nonatomic, copy) NSString* sContractUrl;
@property (nonatomic, copy) NSString* sRiskAnswer;
@property (nonatomic, strong) NSMutableArray* vShowText;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserEvalResultRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SaveEvalContractReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iEvalType;
@property (nonatomic, copy) NSString* sRiskEvalId;
@property (nonatomic, copy) NSString* sContractUrl;


- (void) write: (BaseEncodeStream *)eos;

- (SaveEvalContractReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SaveEvalContractRsp : Message

@property (nonatomic, assign) int32_t iRetCode;


- (void) write: (BaseEncodeStream *)eos;

- (SaveEvalContractRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetHotSecReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetHotSecReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface HotSecItem : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;


- (void) write: (BaseEncodeStream *)eos;

- (HotSecItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetHotSecRsp : Message

@property (nonatomic, strong) NSMutableArray* vList;


- (void) write: (BaseEncodeStream *)eos;

- (GetHotSecRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetHotSearchReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetHotSearchReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface HotSearchItem : Message

@property (nonatomic, assign) int32_t iType;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSrcName;
@property (nonatomic, copy) NSString* sFlagId;


- (void) write: (BaseEncodeStream *)eos;

- (HotSearchItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetHotSearchRsp : Message

@property (nonatomic, strong) NSMutableArray* vItem;


- (void) write: (BaseEncodeStream *)eos;

- (GetHotSearchRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPriviMatchResultReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iPriviType;


- (void) write: (BaseEncodeStream *)eos;

- (GetPriviMatchResultReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPriviMatchResultRsp : Message

@property (nonatomic, assign) int32_t iMatchResult;


- (void) write: (BaseEncodeStream *)eos;

- (GetPriviMatchResultRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetExChangePriviListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetExChangePriviListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PriviExchangeDesc : Message

@property (nonatomic, assign) int32_t iPriviType;
@property (nonatomic, assign) int32_t iPriviPoints;
@property (nonatomic, assign) int32_t iExchangeDays;
@property (nonatomic, copy) NSString* sTitleDesc;
@property (nonatomic, copy) NSString* sPriviDesc;
@property (nonatomic, copy) NSString* sPriviIcon;


- (void) write: (BaseEncodeStream *)eos;

- (PriviExchangeDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetExChangePriviListRsp : Message

@property (nonatomic, strong) NSMutableArray* vItem;


- (void) write: (BaseEncodeStream *)eos;

- (GetExChangePriviListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
