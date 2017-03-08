#ifndef Singal_h
#define Singal_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Account.h"
#import "Quote.h"

typedef NS_ENUM(NSUInteger, E_IPS_BACKGROUND_TYPE) {
    E_IBT_TECH = 1,
    E_IBT_BASIC = 2,
    E_IBT_MESSAGE = 3
};

typedef NS_ENUM(NSUInteger, E_IPS_STYLE) {
    E_IPS_SCALPING = 0,
    E_IPS_SHORT = 1,
    E_IPS_MIDDLE = 2,
    E_IPS_LONG = 3
};

typedef NS_ENUM(NSUInteger, E_STRATEGY_RANK_TYPE) {
    E_SRT_HOT = 1,
    E_SRT_PROFIT = 2,
    E_SRT_WIN = 3
};

typedef NS_ENUM(NSUInteger, E_SEARCH_CONDITION) {
    E_SEARCH_CDT_ALL = 0,
    E_SEARCH_CDT_INCREASE = 1,
    E_SEARCH_CDT_SUCCPERCENT = 2,
    E_SEARCH_CDT_SUPSCRIPTIONS = 3,
    E_SERACH_CDT_FLAG = 4,
    E_SEARCH_CDT_SOURCE = 5
};

typedef NS_ENUM(NSUInteger, E_STRATEGY_SUB_ACTION) {
    E_SSA_ADD = 1,
    E_SSA_DEL = 2,
    E_SSA_CHECK = 3
};

typedef NS_ENUM(NSUInteger, E_STRATEGY_SUB_RESULT) {
    E_SSR_SUCC = 0,
    E_SSR_EXISTS = 1,
    E_SSR_SAME_NAME = 2,
    E_SSR_FAIL = 3,
    E_SSR_UNSUB = 4
};

typedef NS_ENUM(NSUInteger, E_IPO_STATUS) {
    E_IPO_ALL = 0,
    E_IPO_FUTURE = 1,
    E_IPO_DOING = 2,
    E_IPO_GOING_PUB = 3,
    E_IPO_ALREADY_PUB = 4,
    E_IPO_LOT_NUMBER = 5,
    E_IPO_PAY_IN = 6
};

typedef NS_ENUM(NSUInteger, DT_ACTIVITY_TYPE) {
    T_ACTIVITY_LIST = 0,
    T_ACTIVITY_OPEN_ACCOUNT = 1,
    T_ACTIVITY_OPEN_MEMBER = 2
};

typedef NS_ENUM(NSUInteger, E_SEC_ACT_TYPE) {
    E_LHB_ACT_BUY = 1,
    E_LHB_ACT_SELL = 2
};

typedef NS_ENUM(NSUInteger, SingalErrCode) {
    E_SINGAL_SUCC = 0,
    E_SINGAL_NOT_LOGIN = -1,
    E_SINGAL_INVALID_STRATEGY_ID = -2,
    E_SINGAL_REPEATED_STRATEGY = -3,
    E_SINGAL_INVALID_ACT = -4,
    E_SINGAL_SVR_ERR = -99
};

typedef NS_ENUM(NSUInteger, E_STRATEGY_SUB_ACT_TYPE) {
    E_STRATEGY_SUB_ACT_ADD = 1,
    E_STRATEGY_SUB_ACT_CANCEL = 2,
    E_STRATEGY_SUB_ACT_TOP = 3
};

typedef NS_ENUM(NSUInteger, E_PRIV_PACE_CODE) {
    PRIV_PC_UNKOWN = 0,
    PRIV_PC_OFFER = 1,
    PRIV_PC_NEGOTIATED = 2,
    PRIV_PC_CHECK = 3,
    PRIV_PC_PASS = 4,
    PRIV_PC_DONE = 5,
    PRIV_PC_FAIL = 6
};

typedef NS_ENUM(NSUInteger, E_PRIV_PACE_TYPE) {
    PRIV_PT_START = 1,
    PRIV_PT_DOING = 2,
    PRIV_PT_END = 3
};

typedef NS_ENUM(NSUInteger, PlateHisCycleType) {
    E_CYCLE_WEEK = 0,
    E_CYCLE_MONTH = 1,
    E_CYCLE_HALF_YEAR = 2,
    E_CYCLE_YEAR = 3
};

typedef NS_ENUM(NSUInteger, E_INDEX_STOCKS_REQ_TYPE) {
    E_ALL_REQ = 0,
    E_UP_RATE_REQ = 1,
    E_DOWN_RATE_REQ = 2,
    E_TURNOVER_RATE_REQ = 3
};

typedef NS_ENUM(NSUInteger, E_DAILY_NEWS_TYPE) {
    E_DAILY_DEFAULT = 0,
    E_DAILY_PORTFOLIO = 1
};

typedef NS_ENUM(NSUInteger, E_SCENE_TYPE) {
    E_ST_ADR = 1,
    E_ST_IOS = 2,
    E_ST_H5WX = 3,
    E_ST_H5FF = 4,
    E_ST_H5ZX = 5,
    E_ST_H5QQ = 6
};

/////////////////////////////////////////////////////////////////
@interface IntelliStock : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) float fSelectedPrice;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliStock *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IncomeResult : Message

@property (nonatomic, assign) int32_t iDay;
@property (nonatomic, assign) float fAvgIncrease;


- (void) write: (BaseEncodeStream *)eos;

- (IncomeResult *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStock : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, assign) E_IPS_BACKGROUND_TYPE eBackgroundType;
@property (nonatomic, strong) NSMutableArray* vtTagInfo;
@property (nonatomic, strong) NSMutableArray* vtIntelliStock;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, copy) NSString* sDescription;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStock *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStockEx : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, assign) E_IPS_BACKGROUND_TYPE eBackgroundType;
@property (nonatomic, strong) NSMutableArray* vtTagInfo;
@property (nonatomic, strong) NSMutableArray* vtIntelliStock;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, assign) int32_t iHoldingPeriod;
@property (nonatomic, assign) float fAvgIncrease;
@property (nonatomic, assign) float fMorrowAvgIncrease;
@property (nonatomic, copy) NSString* sSource;
@property (nonatomic, strong) NSMutableArray* vIncomeResult;
@property (nonatomic, assign) float fSuccPrecent;
@property (nonatomic, assign) float fAnnualizedReturn;
@property (nonatomic, copy) NSString* sUpBanner;
@property (nonatomic, copy) NSString* sDownBanner;
@property (nonatomic, assign) float fWeekIncrease;
@property (nonatomic, assign) float fTodayIncrease;
@property (nonatomic, assign) float fMaxSuccPercent;
@property (nonatomic, assign) int32_t iMaxSuccHoldingPeriod;
@property (nonatomic, assign) float fWeekIncreaseEx;
@property (nonatomic, assign) BOOL bNew;
@property (nonatomic, assign) float fMaxRetAvgIncrease;
@property (nonatomic, copy) NSString* sMaxRetUpBanner;
@property (nonatomic, assign) int32_t iSubscriptionsCount;
@property (nonatomic, copy) NSString* sSubscriptionsCount;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStockEx *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliBroker : Message

@property (nonatomic, copy) NSString* sBrokerName;
@property (nonatomic, copy) NSString* sBrokerIcon;
@property (nonatomic, copy) NSString* sBrokerUrl;
@property (nonatomic, strong) NSMutableArray* vTag;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliBroker *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStockV2 : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, strong) NSMutableArray* vtTagInfo;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, copy) NSString* sSource;
@property (nonatomic, strong) NSMutableArray* vtAvgIncrease;
@property (nonatomic, strong) NSMutableArray* vtSuccPercent;
@property (nonatomic, strong) NSMutableArray* vtYearEarning;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, strong) NSMutableArray* vtIntelliStock;
@property (nonatomic, strong) NSMutableArray* vBrokerList;
@property (nonatomic, assign) int32_t iSubscriptionsCount;
@property (nonatomic, copy) NSString* sSubscriptionsCount;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStockV2 *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStockReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sStartId;
@property (nonatomic, copy) NSString* sEndId;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStockReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStockRsp : Message

@property (nonatomic, strong) NSMutableArray* vtIntelliPickStock;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStockRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStockRspEx : Message

@property (nonatomic, strong) NSMutableArray* vtIntelliPickStockEx;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStockRspEx *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStockDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sId;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStockDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStockDetailRsp : Message

@property (nonatomic, strong) IntelliPickStockEx* stIntelliPickStockEx;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStockDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliPickStockDetailV2Rsp : Message

@property (nonatomic, strong) IntelliPickStockV2* stIntelliPickStockV2;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliPickStockDetailV2Rsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliSec : Message

@property (nonatomic, copy) NSString* sChnName;
@property (nonatomic, copy) NSString* sDtCode;
@property (nonatomic, assign) float fFirstIncrease;
@property (nonatomic, assign) float fToNowIncrease;
@property (nonatomic, assign) float fDayAvgIncrease;
@property (nonatomic, assign) float fSelectedPrice;
@property (nonatomic, assign) float fMaxIncrease;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliSec *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliDaySec : Message

@property (nonatomic, copy) NSString* sOptime;
@property (nonatomic, strong) NSMutableArray* vtSec;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliDaySec *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliSecPoolReq : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliSecPoolReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IntelliSecPoolRsp : Message

@property (nonatomic, strong) NSMutableArray* vtDaySec;


- (void) write: (BaseEncodeStream *)eos;

- (IntelliSecPoolRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface HotStockListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (HotStockListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface HotStockDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sStrategyName;


- (void) write: (BaseEncodeStream *)eos;

- (HotStockDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface HotStockListRsp : Message

@property (nonatomic, strong) NSMutableArray* vtHotStock;
@property (nonatomic, copy) NSString* sHotDesc;


- (void) write: (BaseEncodeStream *)eos;

- (HotStockListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StrategyListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_STRATEGY_RANK_TYPE eRankType;


- (void) write: (BaseEncodeStream *)eos;

- (StrategyListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StrategyListRsp : Message

@property (nonatomic, strong) NSMutableArray* vtDaySec;


- (void) write: (BaseEncodeStream *)eos;

- (StrategyListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SearchIntelliPickStockListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_SEARCH_CONDITION eSearchCondition;
@property (nonatomic, copy) NSString* sSearchStr;


- (void) write: (BaseEncodeStream *)eos;

- (SearchIntelliPickStockListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SearchIntelliPickStockListRsp : Message

@property (nonatomic, strong) NSMutableArray* vIntelliPickStockEx;


- (void) write: (BaseEncodeStream *)eos;

- (SearchIntelliPickStockListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StrategySourceListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (StrategySourceListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StrategySourceListRsp : Message

@property (nonatomic, strong) NSMutableArray* vSource;


- (void) write: (BaseEncodeStream *)eos;

- (StrategySourceListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConditionPickStrategy : Message

@property (nonatomic, copy) NSString* sStrategyName;
@property (nonatomic, copy) NSString* sUniKey;
@property (nonatomic, strong) NSMutableArray* vCondition;
@property (nonatomic, strong) NSMutableArray* vtTagInfo;
@property (nonatomic, assign) int32_t iSubTime;
@property (nonatomic, copy) NSString* sUrl;


- (void) write: (BaseEncodeStream *)eos;

- (ConditionPickStrategy *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SubConditionPickStrategyReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) E_STRATEGY_SUB_ACTION eSubAction;
@property (nonatomic, strong) ConditionPickStrategy* stConditionPickStrategy;


- (void) write: (BaseEncodeStream *)eos;

- (SubConditionPickStrategyReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SubConditionPickStrategyRsp : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, assign) E_STRATEGY_SUB_RESULT eSubResult;
@property (nonatomic, strong) ConditionPickStrategy* stConditionPickStrategy;


- (void) write: (BaseEncodeStream *)eos;

- (SubConditionPickStrategyRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConditionPickStrategyListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void) write: (BaseEncodeStream *)eos;

- (ConditionPickStrategyListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConditionPickStrategyListRsp : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, strong) NSMutableArray* vtConditionPickStrategy;


- (void) write: (BaseEncodeStream *)eos;

- (ConditionPickStrategyListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LotNumResult : Message

@property (nonatomic, copy) NSString* sDescriptio;
@property (nonatomic, copy) NSString* sNumber;


- (void) write: (BaseEncodeStream *)eos;

- (LotNumResult *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecIPOBasicInfo : Message

@property (nonatomic, assign) E_IPO_STATUS eStatus;
@property (nonatomic, copy) NSString* sIPOCode;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) float fIssPrice;
@property (nonatomic, assign) float fAplCeil;
@property (nonatomic, assign) float fPerCeil;
@property (nonatomic, assign) float fAplRatio;
@property (nonatomic, copy) NSString* sListDate;
@property (nonatomic, assign) float fChangePct;
@property (nonatomic, copy) NSString* sIPODate;
@property (nonatomic, copy) NSString* sLotNumberDate;
@property (nonatomic, copy) NSString* sPayInDate;
@property (nonatomic, copy) NSString* sLotResPubDay;
@property (nonatomic, strong) NSMutableArray* vLotNumResult;
@property (nonatomic, assign) E_MARKET_TYPE eMarketType;
@property (nonatomic, assign) float fIncomePerSign;
@property (nonatomic, assign) int32_t iTopIncreaseDay;
@property (nonatomic, assign) int32_t iIncreseStatus;


- (void) write: (BaseEncodeStream *)eos;

- (SecIPOBasicInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecIPODetailInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sIPOCode;
@property (nonatomic, copy) NSString* sIPODate;
@property (nonatomic, copy) NSString* sLotDeclDate;
@property (nonatomic, assign) float fAplRatio;
@property (nonatomic, copy) NSString* sListDate;
@property (nonatomic, assign) float fIssPrice;
@property (nonatomic, assign) float fPerCeil;
@property (nonatomic, assign) int64_t fShareNum;
@property (nonatomic, assign) float fOnlineShareNum;
@property (nonatomic, assign) float fAplCeil;
@property (nonatomic, assign) float fAplFundCeil;
@property (nonatomic, copy) NSString* sCompanyDesc;
@property (nonatomic, copy) NSString* sMainBusi;
@property (nonatomic, copy) NSString* sLotResPubDay;
@property (nonatomic, strong) NSMutableArray* vLotNumResult;


- (void) write: (BaseEncodeStream *)eos;

- (SecIPODetailInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetIPOBasicInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_IPO_STATUS eStatus;
@property (nonatomic, assign) int32_t iVersion;


- (void) write: (BaseEncodeStream *)eos;

- (GetIPOBasicInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetIPOBasicInfoRsp : Message

@property (nonatomic, strong) NSMutableArray* vInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetIPOBasicInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetIPODetailInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetIPODetailInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetIPODetailInfoRsp : Message

@property (nonatomic, strong) SecIPODetailInfo* stInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetIPODetailInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetDtActivityListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) DT_ACTIVITY_TYPE eType;


- (void) write: (BaseEncodeStream *)eos;

- (GetDtActivityListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DtActivityDetail : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, copy) NSString* sPicUrl;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, assign) int64_t lOnlineTime;
@property (nonatomic, assign) int64_t lOfflineTime;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, assign) int32_t iPriority;
@property (nonatomic, copy) NSString* sPlat;
@property (nonatomic, assign) int32_t iType;


- (void) write: (BaseEncodeStream *)eos;

- (DtActivityDetail *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetDtActivityListRsp : Message

@property (nonatomic, strong) NSMutableArray* vList;


- (void) write: (BaseEncodeStream *)eos;

- (GetDtActivityListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LHBActiveDay : Message

@property (nonatomic, strong) NSMutableArray* vLHBActiveDay;
@property (nonatomic, strong) NSMutableDictionary* mLHBStockActiveDay;
@property (nonatomic, strong) NSMutableDictionary* mLHBSaleDepActiveDay;


- (void) write: (BaseEncodeStream *)eos;

- (LHBActiveDay *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LHBReasonDetail : Message

@property (nonatomic, copy) NSString* sSaleDepName;
@property (nonatomic, assign) float fBuyAmount;
@property (nonatomic, assign) float fSellAmount;
@property (nonatomic, assign) E_SEC_ACT_TYPE eActType;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) float fIncome;


- (void) write: (BaseEncodeStream *)eos;

- (LHBReasonDetail *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LHBReason : Message

@property (nonatomic, copy) NSString* sReasonMsg;
@property (nonatomic, strong) NSMutableArray* vDetail;


- (void) write: (BaseEncodeStream *)eos;

- (LHBReason *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LHBSecInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) E_SEC_ACT_TYPE eActType;
@property (nonatomic, assign) float fActMoney;
@property (nonatomic, assign) float fClosePrice;
@property (nonatomic, assign) float fChangePct;
@property (nonatomic, copy) NSString* sFundType;
@property (nonatomic, strong) NSMutableArray* vReason;


- (void) write: (BaseEncodeStream *)eos;

- (LHBSecInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LHBSaleDepInfo : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, assign) int32_t sStockNum;
@property (nonatomic, assign) float fIncome;
@property (nonatomic, strong) NSMutableArray* vLHBReasonDetail;


- (void) write: (BaseEncodeStream *)eos;

- (LHBSaleDepInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, assign) int32_t iSubList;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBListRsp : Message

@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, copy) NSString* sWeekDay;
@property (nonatomic, assign) int32_t iSHSecNum;
@property (nonatomic, assign) int32_t iSZSecNum;
@property (nonatomic, strong) NSMutableArray* vSecList;
@property (nonatomic, strong) NSMutableArray* vJgqcList;
@property (nonatomic, strong) NSMutableArray* vYzbyList;
@property (nonatomic, strong) NSMutableArray* vSaleDepList;
@property (nonatomic, strong) NSMutableArray* vDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBDetailRsp : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSMutableArray* vReason;
@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, copy) NSString* sWeekDay;
@property (nonatomic, strong) NSMutableArray* vDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBStockListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBStockListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBStockListRsp : Message

@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, assign) int32_t iSHSecNum;
@property (nonatomic, assign) int32_t iSZSecNum;
@property (nonatomic, strong) NSMutableArray* vSecList;
@property (nonatomic, strong) NSMutableArray* vDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBStockListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBSaleDepListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBSaleDepListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBSaleDepListRsp : Message

@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, strong) NSMutableArray* vSaleDepList;
@property (nonatomic, strong) NSMutableArray* vDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBSaleDepListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBSaleDepDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, copy) NSString* sSaleDepName;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBSaleDepDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLHBSaleDepDetailRsp : Message

@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, copy) NSString* sSaleDepName;
@property (nonatomic, assign) float fIncome;
@property (nonatomic, assign) int32_t sStockNum;
@property (nonatomic, strong) NSMutableArray* vLHBReasonDetail;
@property (nonatomic, strong) NSMutableArray* vDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetLHBSaleDepDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetCategoryListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetCategoryListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CategoryInfo : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sPicUrl;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, copy) NSString* sDesc;


- (void) write: (BaseEncodeStream *)eos;

- (CategoryInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetCategoryListRsp : Message

@property (nonatomic, strong) NSMutableArray* vList;


- (void) write: (BaseEncodeStream *)eos;

- (GetCategoryListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetCategoryDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sCategoryId;


- (void) write: (BaseEncodeStream *)eos;

- (GetCategoryDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CategoryHotStockDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDesc;


- (void) write: (BaseEncodeStream *)eos;

- (CategoryHotStockDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetCategoryDetailRsp : Message

@property (nonatomic, strong) NSMutableArray* vtDaySec;
@property (nonatomic, strong) NSMutableArray* vHotStock;


- (void) write: (BaseEncodeStream *)eos;

- (GetCategoryDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StrategySubItem : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, strong) NSMutableArray* vtTagInfo;
@property (nonatomic, strong) NSMutableArray* vtIntelliStock;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, copy) NSString* sSource;
@property (nonatomic, assign) float fMaxRetAvgIncrease;
@property (nonatomic, copy) NSString* sMaxRetUpBanner;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, assign) float fSuccPercent;
@property (nonatomic, assign) int32_t iSubscriptionsCount;
@property (nonatomic, copy) NSString* sSubscriptionsCount;


- (void) write: (BaseEncodeStream *)eos;

- (StrategySubItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetStrategySubListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void) write: (BaseEncodeStream *)eos;

- (GetStrategySubListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetStrategySubListRsp : Message

@property (nonatomic, strong) NSMutableArray* vList;
@property (nonatomic, assign) int32_t iUpdateTimeStamp;


- (void) write: (BaseEncodeStream *)eos;

- (GetStrategySubListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ActStrategySubReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iActType;
@property (nonatomic, copy) NSString* sStrategyId;


- (void) write: (BaseEncodeStream *)eos;

- (ActStrategySubReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ActStrategySubRsp : Message

@property (nonatomic, assign) int32_t iRetCode;


- (void) write: (BaseEncodeStream *)eos;

- (ActStrategySubRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PrivInfo : Message

@property (nonatomic, copy) NSString* sDtCode;
@property (nonatomic, copy) NSString* sSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sReleaseTime;
@property (nonatomic, assign) float fRedeemPrice;
@property (nonatomic, assign) float fArbitrageSpace;
@property (nonatomic, assign) E_PRIV_PACE_CODE ePaceCode;
@property (nonatomic, copy) NSString* sPace;
@property (nonatomic, copy) NSString* sNegotiatedTime;
@property (nonatomic, assign) float fNegotiatedPrice;
@property (nonatomic, copy) NSString* sDelistingTime;
@property (nonatomic, copy) NSString* sOfferor;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, copy) NSString* sWhereAbouts;
@property (nonatomic, copy) NSString* sWBDtCode;
@property (nonatomic, copy) NSString* sWBSecName;
@property (nonatomic, copy) NSString* sWBDescription;


- (void) write: (BaseEncodeStream *)eos;

- (PrivInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPrivBreifInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vDtCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetPrivBreifInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPrivBreifInfoRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mPrivBreifInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetPrivBreifInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPrivListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetPrivListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPrivListRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mPrivInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetPrivListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPrivDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vDtCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetPrivDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPrivDetailRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mPrivInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetPrivDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPrivTopListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iTopN;


- (void) write: (BaseEncodeStream *)eos;

- (GetPrivTopListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPrivTopListRsp : Message

@property (nonatomic, strong) NSMutableArray* vPrivInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetPrivTopListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SuspendDetailInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) int64_t lSuspendTime;
@property (nonatomic, assign) int64_t lResumeTime;
@property (nonatomic, copy) NSString* sDuration;
@property (nonatomic, copy) NSString* sReason;
@property (nonatomic, copy) NSString* sProgress;


- (void) write: (BaseEncodeStream *)eos;

- (SuspendDetailInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSuspendDetailReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vDtCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetSuspendDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSuspendDetailRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mDetailInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetSuspendDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPlateHisQuoteReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iPlateType;
@property (nonatomic, assign) int32_t iCycleType;


- (void) write: (BaseEncodeStream *)eos;

- (GetPlateHisQuoteReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PlateHisCycleInfo : Message

@property (nonatomic, copy) NSString* sDtPlateCode;
@property (nonatomic, copy) NSString* sPlateName;
@property (nonatomic, assign) float fClosePrive;
@property (nonatomic, copy) NSString* sTradingDay;


- (void) write: (BaseEncodeStream *)eos;

- (PlateHisCycleInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPlateHisQuoteRsp : Message

@property (nonatomic, strong) NSMutableArray* vHisInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetPlateHisQuoteRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecStatusReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vDtCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecStatusReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecStatusRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mSecStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecStatusRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetAllStatusReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_SEC_CHANGE_STATUS iStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetAllStatusReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetIndexStocksReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sIndexDtCode;
@property (nonatomic, assign) int32_t iReqType;
@property (nonatomic, assign) int32_t iNum;


- (void) write: (BaseEncodeStream *)eos;

- (GetIndexStocksReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetIndexStocksRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mStocks;


- (void) write: (BaseEncodeStream *)eos;

- (GetIndexStocksRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecDailyReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iStart;
@property (nonatomic, assign) int32_t iCount;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sTradingDay;
@property (nonatomic, copy) NSString* sPreTradingDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecDailyReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DefaultDailyItem : Message

@property (nonatomic, copy) NSString* sCode;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) float fUpPct;
@property (nonatomic, assign) int64_t lAmout;
@property (nonatomic, assign) float fAmoutUpPct;
@property (nonatomic, assign) float fFundIn;
@property (nonatomic, assign) float fFundInUpPct;


- (void) write: (BaseEncodeStream *)eos;

- (DefaultDailyItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DefaultDailyInfo : Message

@property (nonatomic, strong) NSMutableArray* vItem;
@property (nonatomic, copy) NSString* sTradingDay;


- (void) write: (BaseEncodeStream *)eos;

- (DefaultDailyInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecDailyInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, strong) NSMutableArray* vStatus;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) float fUpPct;
@property (nonatomic, assign) float fWinSHIndexUpPct;
@property (nonatomic, assign) float fWinIndusPlatePct;
@property (nonatomic, copy) NSString* sIndusPlateName;
@property (nonatomic, copy) NSString* sIndusPlateCode;
@property (nonatomic, assign) float fMainFundIn;
@property (nonatomic, assign) int32_t iPosInHSMarket;
@property (nonatomic, assign) int32_t iHSMarketSecNum;
@property (nonatomic, assign) int32_t iPosInIndusPlate;
@property (nonatomic, assign) int32_t iIndusPlateSecNum;
@property (nonatomic, assign) BOOL bInLHList;
@property (nonatomic, assign) float fSupportPrice;
@property (nonatomic, assign) float fPressPrice;
@property (nonatomic, assign) float fAvgCost;
@property (nonatomic, strong) InvestAdviseInfo* stAdvise;
@property (nonatomic, copy) NSString* sTradingDay;
@property (nonatomic, assign) E_SEC_STATUS eSecStatus;


- (void) write: (BaseEncodeStream *)eos;

- (SecDailyInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DtMorNewsItem : Message

@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sAbstract;
@property (nonatomic, copy) NSString* sNewsId;
@property (nonatomic, copy) NSString* sPublish;


- (void) write: (BaseEncodeStream *)eos;

- (DtMorNewsItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecDailyRsp : Message

@property (nonatomic, copy) NSString* sTradingDay;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, strong) NSMutableArray* vInfo;
@property (nonatomic, strong) DefaultDailyInfo* stDefault;
@property (nonatomic, strong) DtMorNewsItem* stMorNews;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecDailyRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface BannerInfo : Message

@property (nonatomic, assign) int32_t iID;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sImgUrl;
@property (nonatomic, copy) NSString* sSkippUrl;
@property (nonatomic, strong) NSMutableArray* vSceneType;


- (void) write: (BaseEncodeStream *)eos;

- (BannerInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetDiscBannerReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_SCENE_TYPE eSceneType;


- (void) write: (BaseEncodeStream *)eos;

- (GetDiscBannerReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetDiscBannerRsp : Message

@property (nonatomic, strong) NSMutableArray* vBannerInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetDiscBannerRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CalendarEventDetail : Message

@property (nonatomic, assign) int32_t iId;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, copy) NSString* sTag;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, strong) NSMutableArray* vtRelaStock;
@property (nonatomic, strong) NSMutableArray* vtRelaPlate;


- (void) write: (BaseEncodeStream *)eos;

- (CalendarEventDetail *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetCalendarEventsReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetCalendarEventsReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetCalendarEventsRsp : Message

@property (nonatomic, copy) NSString* sStartDate;
@property (nonatomic, copy) NSString* sEndDate;
@property (nonatomic, strong) NSMutableArray* vtCalendarEventDetail;


- (void) write: (BaseEncodeStream *)eos;

- (GetCalendarEventsRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetHSTradingStatusReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetHSTradingStatusReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetHSTradingStatusRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mTradingStatus;


- (void) write: (BaseEncodeStream *)eos;

- (GetHSTradingStatusRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecBsInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) int32_t iBs;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) float fClosePre;
@property (nonatomic, assign) float fBetaValue;
@property (nonatomic, assign) float fBsValue;
@property (nonatomic, assign) float fProbability;


- (void) write: (BaseEncodeStream *)eos;

- (SecBsInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecBsInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) int32_t iSize;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecBsInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecBsInfoRsp : Message

@property (nonatomic, strong) NSMutableArray* vSecBsInfo;
@property (nonatomic, assign) float fValue;
@property (nonatomic, copy) NSString* sTypeText;
@property (nonatomic, copy) NSString* sDescText;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecBsInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecBsTopReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecBsTopReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecBsTopRsp : Message

@property (nonatomic, strong) NSMutableArray* vSecBsInfoBuy;
@property (nonatomic, strong) NSMutableArray* vSecBsInfoSell;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecBsTopRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
