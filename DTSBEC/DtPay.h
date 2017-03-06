#ifndef DtPay_h
#define DtPay_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Account.h"

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
    E_DT_PAY_SVR_ERR = -99
};

typedef NS_ENUM(NSUInteger, E_DT_SUBJECT_TYPE) {
    E_DT_SUBJECT_MEMBER = 0
};

typedef NS_ENUM(NSUInteger, E_DT_PAY_TYPE) {
    E_DT_PAY_WX = 0,
    E_DT_PAY_ALI = 1
};

typedef NS_ENUM(NSUInteger, E_DT_PAY_STATUS) {
    E_DT_PAY_WATING_PAY = 0,
    E_DT_PAY_SUCCESS = 1,
    E_DT_PAY_FAIL = 2
};

/////////////////////////////////////////////////////////////////
@interface DtPayItem : Message

@property (nonatomic, copy) NSString* sDtPayOrderId;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, assign) int64_t lTimeStamp;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, assign) int32_t iTotalAmount;
@property (nonatomic, assign) int32_t iNumber;
@property (nonatomic, assign) int32_t iStatus;


- (void) write: (BaseEncodeStream *)eos;

- (DtPayItem *) read: (BaseDecodeStream *)dos;

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

#endif
