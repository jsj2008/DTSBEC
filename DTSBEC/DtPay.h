#ifndef DtPay_h
#define DtPay_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Account.h"
#import "AccuPoint.h"
#import "AppConfig.h"

typedef NS_ENUM(NSUInteger, E_DT_PAY_ERROR_CODE) {
    E_DT_PAY_SUCC = 0,
    E_DT_PAY_NOT_LOGIN = -1,
    E_DT_PAY_TICKET_EXPIRED = -2,
    E_DT_PAY_INNER_ORDER_TIMEOUT = -3,
    E_DT_PAY_INNER_ORDER_INVALID = -4,
    E_DT_PAY_SIGN_CHECK_ERROR = -6,
    E_DT_PAY_APP_ID_NOMATCH = -7,
    E_DT_PAY_ORDER_FINISHED = -8,
    E_DT_PAY_INVALID_APPID = -9,
    E_DT_PAY_CHECK_SIG_ERROR = -10,
    E_DT_PAY_INVALID_ASYNC_NOTIFY = -11,
    E_DT_PAY_WX_RETURN_ERR = -12,
    E_DT_PAY_WX_RESULT_ERR = -13,
    E_DT_PAY_ORDER_PAYING = -14,
    E_DT_PAY_NO_TRADE_ID = 15,
    E_DT_PAY_INVALID_SUBJECT_TYPE = -16,
    E_DT_PAY_NOT_BIND_PHONE = -17,
    E_DT_PAY_SVR_ERR = -99
};

typedef NS_ENUM(NSUInteger, E_DT_SUBJECT_TYPE) {
    E_DT_SUBJECT_MEMBER = 0,
    E_DT_SUBJECT_SECRET_DECISION = 1,
    E_DT_SUBJECT_YXT_ADVANCED_COURSE = 2,
    E_DT_SUBJECT_YP_PRIVATE_STOCK_TACTICS = 3,
    E_DT_SUBJECT_YP_PDJN = 4
};

typedef NS_ENUM(NSUInteger, E_DT_SUBJECT_RISK_LEVEL) {
    E_DT_SUBJECT_RISK_NO = 0,
    E_DT_SUBJECT_RISK_LOW = 1,
    E_DT_SUBJECT_RISK_MID = 2,
    E_DT_SUBJECT_RISK_HIGH = 3
};

typedef NS_ENUM(NSUInteger, E_DT_PAY_TYPE) {
    E_DT_PAY_WX = 0,
    E_DT_PAY_ALI = 1
};

typedef NS_ENUM(NSUInteger, E_DT_SUBJECT_PAY_CHANNEL) {
    E_SUBJECT_PAY_DT = 0,
    E_SUBJECT_PAY_YP = 1,
    E_SUBJECT_PAY_YXT = 2
};

typedef NS_ENUM(NSUInteger, E_DT_PAY_STATUS) {
    E_DT_PAY_WATING_PAY = 0,
    E_DT_PAY_SUCCESS = 1,
    E_DT_PAY_FAIL = 2,
    E_DT_PAY_PAYING = 3,
    E_DT_PAY_PART_PAY = 4
};

typedef NS_ENUM(NSUInteger, E_DT_PAY_TIME_UNIT) {
    E_DT_PAY_TIME_MONTH = 0,
    E_DT_PAY_TIME_DAY = 1
};

typedef NS_ENUM(NSUInteger, E_DT_PAY_CHANNEL) {
    E_DT_PAY_CHANNEL_APP = 0,
    E_DT_PAY_CHANNEL_QQ_BROWSER_H5 = 1
};

/////////////////////////////////////////////////////////////////
@interface DtPayItem : Message

@property (nonatomic, copy) NSString* sDtPayOrderId;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, assign) int64_t lTimeStamp;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, assign) int32_t iTotalAmount;
@property (nonatomic, assign) int32_t iNumber;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, assign) int32_t iNumberUnit;


- (void) write: (BaseEncodeStream *)eos;

- (DtPayItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PayOrderExtra : Message

@property (nonatomic, copy) NSString* sClassId;


- (void) write: (BaseEncodeStream *)eos;

- (PayOrderExtra *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPayOrderIdReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iSubjectType;
@property (nonatomic, assign) int32_t iNumber;
@property (nonatomic, strong) PayOrderExtra* stExtra;
@property (nonatomic, assign) int32_t iNumberUnit;
@property (nonatomic, assign) int32_t iPayChannel;
@property (nonatomic, strong) NSMutableArray* vCouponCode;
@property (nonatomic, copy) NSString* sCommExtraJson;


- (void) write: (BaseEncodeStream *)eos;

- (GetPayOrderIdReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPayOrderIdRsp : Message

@property (nonatomic, strong) DtPayItem* stDtPayItem;


- (void) write: (BaseEncodeStream *)eos;

- (GetPayOrderIdRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetAliPaySignReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sDtPayOrderId;
@property (nonatomic, copy) NSString* sPassback;
@property (nonatomic, copy) NSString* sAppId;


- (void) write: (BaseEncodeStream *)eos;

- (GetAliPaySignReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetAliPaySignRsp : Message

@property (nonatomic, assign) int32_t iReturnCode;
@property (nonatomic, copy) NSString* sSign;
@property (nonatomic, assign) int32_t iStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetAliPaySignRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetWxPayPrepayIdReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sDtPayOrderId;
@property (nonatomic, copy) NSString* sPassback;
@property (nonatomic, copy) NSString* sAppId;


- (void) write: (BaseEncodeStream *)eos;

- (GetWxPayPrepayIdReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface WxPayPrepayInfo : Message

@property (nonatomic, copy) NSString* sAppId;
@property (nonatomic, copy) NSString* sPartnerId;
@property (nonatomic, copy) NSString* sPrepayId;
@property (nonatomic, copy) NSString* sPackage;
@property (nonatomic, copy) NSString* sNonceStr;
@property (nonatomic, assign) int64_t lTimeStamp;
@property (nonatomic, copy) NSString* sSign;


- (void) write: (BaseEncodeStream *)eos;

- (WxPayPrepayInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetWxPayPrepayIdRsp : Message

@property (nonatomic, assign) int32_t iReturnCode;
@property (nonatomic, copy) NSString* sResultDesc;
@property (nonatomic, strong) WxPayPrepayInfo* stPrepay;


- (void) write: (BaseEncodeStream *)eos;

- (GetWxPayPrepayIdRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetMemberFeeListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iSubjectType;


- (void) write: (BaseEncodeStream *)eos;

- (GetMemberFeeListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DtMemberFeeItem : Message

@property (nonatomic, assign) int32_t iMonthNum;
@property (nonatomic, assign) int32_t iAvgMoney;
@property (nonatomic, assign) int32_t iTotalMoney;
@property (nonatomic, assign) int32_t iUnit;


- (void) write: (BaseEncodeStream *)eos;

- (DtMemberFeeItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetMemberFeeListRsp : Message

@property (nonatomic, strong) NSMutableArray* vItem;


- (void) write: (BaseEncodeStream *)eos;

- (GetMemberFeeListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetYxtCourseFeeListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetYxtCourseFeeListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface YxtCourseFeeItem : Message

@property (nonatomic, copy) NSString* sClassId;
@property (nonatomic, copy) NSString* sClassName;
@property (nonatomic, assign) int32_t iTotalMoney;
@property (nonatomic, assign) int32_t iClassHour;
@property (nonatomic, copy) NSString* sTeacher;
@property (nonatomic, copy) NSString* sOpenTime;


- (void) write: (BaseEncodeStream *)eos;

- (YxtCourseFeeItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetYxtCourseFeeListRsp : Message

@property (nonatomic, strong) NSMutableArray* vItem;


- (void) write: (BaseEncodeStream *)eos;

- (GetYxtCourseFeeListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserPayListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iDirection;
@property (nonatomic, copy) NSString* sStartId;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserPayListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserPayListRsp : Message

@property (nonatomic, strong) NSMutableArray* vItem;
@property (nonatomic, assign) int32_t iTotalNum;
@property (nonatomic, copy) NSString* sNextId;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserPayListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportPayResultReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) NSMutableDictionary* mPayResult;
@property (nonatomic, assign) int32_t iPayType;


- (void) write: (BaseEncodeStream *)eos;

- (ReportPayResultReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportPayResultRsp : Message

@property (nonatomic, assign) int32_t iPayStatus;


- (void) write: (BaseEncodeStream *)eos;

- (ReportPayResultRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetOrderPayResultReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iPayType;
@property (nonatomic, copy) NSString* sInnerOrderId;


- (void) write: (BaseEncodeStream *)eos;

- (GetOrderPayResultReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetOrderPayResultRsp : Message

@property (nonatomic, assign) int32_t iReturnCode;
@property (nonatomic, assign) int32_t iPayStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetOrderPayResultRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CheckUserCouponReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iSubjectType;
@property (nonatomic, assign) int32_t iNumber;
@property (nonatomic, assign) int32_t iNumberUnit;
@property (nonatomic, copy) NSString* sCommExtraJson;


- (void) write: (BaseEncodeStream *)eos;

- (CheckUserCouponReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PayUserAddAgreement : Message

@property (nonatomic, assign) int32_t iType;
@property (nonatomic, assign) int32_t iIndex;
@property (nonatomic, strong) PayUserAgreementDesc* stDynamicAgreement;


- (void) write: (BaseEncodeStream *)eos;

- (PayUserAddAgreement *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface UserRiskEvalResult : Message

@property (nonatomic, assign) int32_t iSubjectRiskLevel;
@property (nonatomic, copy) NSString* sSubjectRiskDesc;
@property (nonatomic, assign) int32_t iUserRiskType;
@property (nonatomic, copy) NSString* sUserRiskType;
@property (nonatomic, copy) NSString* sEvalResult;
@property (nonatomic, strong) PayUserAddAgreement* stAddAgreement;


- (void) write: (BaseEncodeStream *)eos;

- (UserRiskEvalResult *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CheckUserCouponRsp : Message

@property (nonatomic, assign) int32_t iCouponNum;
@property (nonatomic, strong) UserRiskEvalResult* stRiskResult;


- (void) write: (BaseEncodeStream *)eos;

- (CheckUserCouponRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPayCouponReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iSubjectType;
@property (nonatomic, assign) int32_t iNumber;
@property (nonatomic, assign) int32_t iNumberUnit;
@property (nonatomic, copy) NSString* sCommExtraJson;
@property (nonatomic, assign) int32_t iStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetPayCouponReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPayCouponRsp : Message

@property (nonatomic, strong) NSMutableArray* vCoupon;


- (void) write: (BaseEncodeStream *)eos;

- (GetPayCouponRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
