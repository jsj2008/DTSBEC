#ifndef AppConfig_h
#define AppConfig_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, E_IP_TYPE) {
    E_THOTH_PROXY = 1,
    E_THOTH_SOCKET_PROXY = 2
};

typedef NS_ENUM(NSUInteger, E_APN_TYPE) {
    E_APN_UNKNOWN = 0,
    E_APN_WIFI = 1,
    E_APN_CMWAP = 2,
    E_APN_CMNET = 3,
    E_APN_UNWAP = 4,
    E_APN_UNNET = 5,
    E_APN_CTWAP = 6,
    E_APN_CTNET = 7,
    E_APN_3GWAP = 8,
    E_APN_3GNET = 9,
    E_APN_777 = 10
};

typedef NS_ENUM(NSUInteger, E_CONFIG_TYPE) {
    E_CONFIG_OPTIONAL_INDEX = 0,
    E_CONFIG_HS_INDEX = 1,
    E_CONFIG_HK_INDEX = 2,
    E_CONFIG_HGT_INDEX = 3,
    E_CONFIG_US_INDEX = 4,
    E_CONFIG_COMMNET_SWITCH = 5,
    E_CONFIG_SPLASH_SCREEN = 6,
    E_CONFIG_PUSH_SWITCH = 7,
    E_CONFIG_NEW_ACTIVITY = 8,
    E_CONFIG_NEW_STOCK = 9,
    E_CONFIG_CHARGE_SWITCH = 10,
    E_CONFIG_INTELI_INVEST = 11,
    E_CONFIG_SERVICE_SWITCH = 12,
    E_CONFIG_OPEN_ACCOUNT = 13,
    E_CONFIG_PRIVI_BANNER_CONF = 14,
    E_PC_CLIENT_CONFIG_FILE = 15,
    E_CONFIG_OPEN_BLESSING_PACK = 16,
    E_CONFIG_ACCU_POINT_DESC = 17
};

typedef NS_ENUM(NSUInteger, E_CONFIG_PUSH_TYPE) {
    E_CONFIG_PUSH_UMENG = 1,
    E_CONFIG_PUSH_HUAWEI = 2
};

typedef NS_ENUM(NSUInteger, E_SHARE_TYPE) {
    E_STOCK_DETAIL = 1,
    E_STOCK_PORTRAIT = 2,
    E_CONC_DETAIL = 3,
    E_FUND_DETAIL = 4,
    E_INDEX_DETAIL = 5,
    E_FUTURES_DETAIL = 6,
    E_DISCOVER_MODULE = 7,
    E_BOTTOM_DETAIL = 8,
    E_MARKET_QUOTE = 9,
    E_HOT_CONC = 10,
    E_ACTIVITY_LIST = 11,
    E_STRATEGY_LIST = 12,
    E_SIMILAR_K_LINE = 13,
    E_SEC_HISTORY = 14,
    E_SEC_LIVE = 15,
    E_NEW_STOCK = 16,
    E_LHB_STOCK = 17,
    E_URL_USER_AGREEMENT = 18,
    E_GOLD_STOCK_DETAIL_URL = 19,
    E_GOLD_STOCK_SHARE_URL = 20,
    E_SMART_PICK_FAQ = 21,
    E_BIG_EVENT_REMINDER = 22,
    E_DT_INDEX_FAQ = 23,
    E_MARKET_WARNING = 24,
    E_DT_PORTFOLIO_LIVE = 25,
    E_DT_MARKET_LIVE = 26,
    E_DT_LIVE_FAQ = 27,
    E_DT_CHIP_DISTRIBUTION = 28,
    E_DT_CAPITAL_FLOW = 29,
    E_DT_INDEX_LIST = 30,
    E_DT_PRIVATE_TRACKING = 31,
    E_DT_PRIVATE_DETAIL = 32,
    E_AH_PREMIUM = 33,
    E_QRCODE_FAQ = 34,
    E_QRCODE_URL = 35,
    E_SUSPENTION_DETAIL = 36,
    E_DIRECTION_ADD = 37,
    E_PLATE_LIST_PAGE = 38,
    E_PLATE_SINGAL_PAGE = 39,
    E_INTELLIGENT_ANSWER = 40,
    E_PLATE_FLOW_PAGE = 41,
    E_DIRECTION_DETAIL = 42,
    E_INDEX_DETAIL_BOTTOM = 43,
    E_DT_PRIVI_DETAIL = 44,
    E_DT_PRIVI_SHARE = 45,
    E_SELF_DAILY_REPORT = 46,
    E_FEED_COMMENT_DETAIL = 47,
    E_FEED_OPINION_DETAIL = 48,
    E_FEED_DIAGNOSE_LIST = 49,
    E_STOCKDETAIL_ICON = 50,
    E_NEWS_ICON = 51,
    E_REPORT_ICON = 52,
    E_ANN_ICON = 53,
    E_STOCKPORTRAIT_ICON = 54,
    E_CONCDETAIL_ICON = 55,
    E_FUND_ICON = 56,
    E_INDEX_ICON = 57,
    E_FUTURES_ICON = 58,
    E_DISCOVERMARKET_ICON = 59,
    E_DISCOVERINTELLI_ICON = 60,
    E_SMART_PICKING_PORTFOLIO = 61,
    E_SMART_PICKING_CUSTOM = 62,
    E_AH_PREMIUM_LIST = 63,
    E_AH_PREMIUM_FAQ = 64,
    E_NEWS_LIST = 65,
    E_OPEN_ACCOUNT = 66,
    E_DT_SINGLE_PRIVI_DETAIL = 67,
    E_ACCU_POINT_INVITE_FRIEND = 68,
    E_FUND_EXPLAIN = 69,
    E_MARGIN_TRADE_EXPLAIN = 70,
    E_ACCU_POINT_FAQ = 71,
    E_VIDEO_DETAIL = 72,
    E_VIDEO_LIST = 73,
    E_DT_PRIVI_DETAIL_NEW = 74
};

typedef NS_ENUM(NSUInteger, T_CHARGE_POINT) {
    T_CHIP_DISTRIBUTION = 1,
    T_SIMILAR_K_LINE = 2,
    T_HISTORY_QUOTE = 3
};

typedef NS_ENUM(NSUInteger, T_CHARGE_SWITCH) {
    T_CHARGE_CLOSE = 0,
    T_CHARGE_OPEN = 1
};

/////////////////////////////////////////////////////////////////
@interface GenGuidReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GenGuidReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GenGuidRsp : Message

@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (GenGuidRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IpInfo : Message

@property (nonatomic, assign) E_IP_TYPE eIPType;
@property (nonatomic, strong) NSMutableArray* vtIPList;
@property (nonatomic, assign) E_APN_TYPE eApnType;


- (void) write: (BaseEncodeStream *)eos;

- (IpInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IpListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vtIPType;
@property (nonatomic, assign) E_APN_TYPE eApnType;
@property (nonatomic, copy) NSString* sApn;


- (void) write: (BaseEncodeStream *)eos;

- (IpListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IpListRsp : Message

@property (nonatomic, strong) NSMutableArray* vtIpInfo;


- (void) write: (BaseEncodeStream *)eos;

- (IpListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ShareUrlReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSMutableArray* vtShareType;
@property (nonatomic, copy) NSString* sSecName;


- (void) write: (BaseEncodeStream *)eos;

- (ShareUrlReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ShareUrl : Message

@property (nonatomic, assign) E_SHARE_TYPE eShareType;
@property (nonatomic, copy) NSString* sUrl;


- (void) write: (BaseEncodeStream *)eos;

- (ShareUrl *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ShareUrlRsp : Message

@property (nonatomic, strong) NSMutableArray* vtShareUrl;


- (void) write: (BaseEncodeStream *)eos;

- (ShareUrlRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SplashScreenReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (SplashScreenReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SplashScreenRsp : Message

@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, copy) NSString* sUpdateTime;


- (void) write: (BaseEncodeStream *)eos;

- (SplashScreenRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IndexDetail : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;


- (void) write: (BaseEncodeStream *)eos;

- (IndexDetail *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IndexListInfo : Message

@property (nonatomic, strong) NSMutableArray* vDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (IndexListInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CommentSwitchInfo : Message

@property (nonatomic, assign) int32_t iSwitchOn;
@property (nonatomic, assign) int32_t iFirstStartInterval;
@property (nonatomic, assign) int32_t iLaterStartInterval;


- (void) write: (BaseEncodeStream *)eos;

- (CommentSwitchInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SplashScreenInfo : Message

@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, assign) int32_t iEffectiveStartTime;
@property (nonatomic, assign) int32_t iEffectiveEndTime;
@property (nonatomic, assign) int32_t iAttr;
@property (nonatomic, assign) int32_t iPriority;
@property (nonatomic, copy) NSString* sID;
@property (nonatomic, copy) NSString* sSkipUrl;
@property (nonatomic, assign) int32_t iSkip;
@property (nonatomic, assign) int32_t iStaySecond;


- (void) write: (BaseEncodeStream *)eos;

- (SplashScreenInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SplashScreenList : Message

@property (nonatomic, strong) NSMutableArray* vList;


- (void) write: (BaseEncodeStream *)eos;

- (SplashScreenList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PushSwitchInfo : Message

@property (nonatomic, assign) int32_t iSwitchType;
@property (nonatomic, assign) int32_t iSwitchState;


- (void) write: (BaseEncodeStream *)eos;

- (PushSwitchInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PushSwitchList : Message

@property (nonatomic, strong) NSMutableArray* vSwitchList;


- (void) write: (BaseEncodeStream *)eos;

- (PushSwitchList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DtActivityInfo : Message

@property (nonatomic, assign) int32_t iVersion;
@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, assign) int32_t iForceRedDot;


- (void) write: (BaseEncodeStream *)eos;

- (DtActivityInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface NewStockInfo : Message

@property (nonatomic, assign) int32_t iNumber;
@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, assign) int32_t iLotResNum;


- (void) write: (BaseEncodeStream *)eos;

- (NewStockInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ChargePointInfo : Message

@property (nonatomic, assign) int32_t iChargePoint;
@property (nonatomic, assign) int32_t iSwitch;


- (void) write: (BaseEncodeStream *)eos;

- (ChargePointInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ChargePointList : Message

@property (nonatomic, strong) NSMutableArray* vChargeList;


- (void) write: (BaseEncodeStream *)eos;

- (ChargePointList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface EnableServiceSwitch : Message

@property (nonatomic, assign) int32_t iSwitch;


- (void) write: (BaseEncodeStream *)eos;

- (EnableServiceSwitch *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DtPriviBannerItem : Message

@property (nonatomic, assign) int32_t iPriviType;
@property (nonatomic, copy) NSString* sBannerName;
@property (nonatomic, copy) NSString* sBannerDesc;
@property (nonatomic, copy) NSString* sBannerUrl;
@property (nonatomic, copy) NSString* sSkipUrl;
@property (nonatomic, assign) int32_t iStaySecond;


- (void) write: (BaseEncodeStream *)eos;

- (DtPriviBannerItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DtPriviBannerList : Message

@property (nonatomic, strong) NSMutableDictionary* mBannerItem;


- (void) write: (BaseEncodeStream *)eos;

- (DtPriviBannerList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DtOpenBlessingPack : Message

@property (nonatomic, copy) NSString* sUrl;


- (void) write: (BaseEncodeStream *)eos;

- (DtOpenBlessingPack *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AccuPointDesc : Message

@property (nonatomic, copy) NSString* sDesc;


- (void) write: (BaseEncodeStream *)eos;

- (AccuPointDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetConfigReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vType;


- (void) write: (BaseEncodeStream *)eos;

- (GetConfigReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConfigDetail : Message

@property (nonatomic, assign) int32_t iType;
@property (nonatomic, strong) NSData* vData;
@property (nonatomic, assign) int32_t iVersion;


- (void) write: (BaseEncodeStream *)eos;

- (ConfigDetail *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetConfigRsp : Message

@property (nonatomic, strong) NSMutableArray* vList;


- (void) write: (BaseEncodeStream *)eos;

- (GetConfigRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportUserInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (ReportUserInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportUserInfoRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (ReportUserInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TradingDayReq : Message

@property (nonatomic, copy) NSString* sDay;


- (void) write: (BaseEncodeStream *)eos;

- (TradingDayReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TradingDayRsp : Message

@property (nonatomic, assign) int32_t iTradingDay;


- (void) write: (BaseEncodeStream *)eos;

- (TradingDayRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetDtSecListReq : Message

@property (nonatomic, copy) NSString* sComeFrom;


- (void) write: (BaseEncodeStream *)eos;

- (GetDtSecListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetDtSecListRsp : Message

@property (nonatomic, strong) NSMutableArray* vDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (GetDtSecListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSyncSwitchReq : Message

@property (nonatomic, copy) NSString* sComeFrom;


- (void) write: (BaseEncodeStream *)eos;

- (GetSyncSwitchReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSyncSwitchRsp : Message

@property (nonatomic, assign) int32_t iSwitch;


- (void) write: (BaseEncodeStream *)eos;

- (GetSyncSwitchRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
