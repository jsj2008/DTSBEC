#ifndef Quote_h
#define Quote_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, E_SEC_STATUS) {
    E_SS_NORMAL = 0,
    E_SS_SUSPENDED = 1
};

typedef NS_ENUM(NSUInteger, E_K_LINE_TYPE) {
    E_KLT_5_MIN = 0,
    E_KLT_15_MIN = 1,
    E_KLT_30_MIN = 2,
    E_KLT_60_MIN = 3,
    E_KLT_DAY = 4,
    E_KLT_WEEK = 5,
    E_KLT_MONTH = 6,
    E_KLT_1_MIN = 7
};

typedef NS_ENUM(NSUInteger, E_PLATE_QUOTE_REQ_TYPE) {
    E_PQT_PLATE = 0,
    E_PQT_RANK = 1,
    E_PQT_PLATE_REGION = 2,
    E_PQT_PLATE_BUSS = 3,
    E_PQT_PLATE_CONC = 4,
    E_PQT_FUTURES = 5,
    E_PQT_HK = 6,
    E_PQT_HK_GEM = 7,
    E_PQT_SH_HK = 8,
    E_PQT_AH = 9,
    E_PQT_US_CHINA = 10,
    E_PQT_SPX = 11,
    E_PQT_HK_SH = 12
};

typedef NS_ENUM(NSUInteger, E_PLATE_QUOTE_SORT_TYPE) {
    E_PQT_INCEREASE = 1,
    E_PQT_DECRREASE = 2
};

typedef NS_ENUM(NSUInteger, E_CAPITAL_DETAIL_SET_TYPE) {
    E_CDST_STOCK = 6,
    E_CDST_BUSS = 32,
    E_CDST_CONC = 33,
    E_CDST_REGION = 31
};

typedef NS_ENUM(NSUInteger, E_CAPITAL_DETAIL_SORT_TYPE) {
    E_CDST_INCEREASE = 1,
    E_CDST_DECRREASE = 2
};

typedef NS_ENUM(NSUInteger, E_CAPITAL_DETAIL_DATA_TYPE) {
    E_CDDT_1_DAY = 1,
    E_CDDT_3_DAY = 3,
    E_CDDT_5_DAY = 5,
    E_CDDT_10_DAY = 10
};

typedef NS_ENUM(NSUInteger, E_TRADING_TIME_TYPE) {
    E_TTT_TRADING = 0,
    E_TTT_CALLAUCTION = 1
};

typedef NS_ENUM(NSUInteger, E_TRADING_DEAL_TYPE) {
    E_TDT_OPEN = 0,
    E_TDT_CLOSE = 1
};

typedef NS_ENUM(NSUInteger, E_AH_SORT_TYPE) {
    E_AHST_INCEREASE = 1,
    E_AHST_DECRREASE = 2
};

typedef NS_ENUM(NSUInteger, E_CAPITAL_DDZ_TYPE) {
    E_CDT_MIN = 1,
    E_CDT_DAY = 2,
    E_CDT_WEEK = 3,
    E_CDT_MONTH = 4,
    E_CDT_YEAR = 5
};

typedef NS_ENUM(NSUInteger, E_SIMILAR_K_LINE_TYPE) {
    E_SKLT_CLOSE = 0
};

/////////////////////////////////////////////////////////////////
@interface QuoteReq : Message

@property (nonatomic, strong) NSArray* vDtSecCode;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (QuoteReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecQuote : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) float fOpen;
@property (nonatomic, assign) float fMax;
@property (nonatomic, assign) float fMin;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) float fBuy;
@property (nonatomic, assign) float fSell;
@property (nonatomic, assign) int64_t lVolume;
@property (nonatomic, assign) int64_t lNowVolume;
@property (nonatomic, assign) float fAmout;
@property (nonatomic, assign) int64_t lInside;
@property (nonatomic, assign) int64_t lOutside;
@property (nonatomic, assign) float fTickdiff;
@property (nonatomic, assign) float fVolinstock;
@property (nonatomic, assign) float fFhsl;
@property (nonatomic, strong) NSArray* vBuyp;
@property (nonatomic, strong) NSArray* vBuyv;
@property (nonatomic, strong) NSArray* vSellp;
@property (nonatomic, strong) NSArray* vSellv;
@property (nonatomic, assign) int8_t cInoutflag;
@property (nonatomic, assign) int64_t lRestvol;
@property (nonatomic, assign) int32_t iTpFlag;
@property (nonatomic, assign) float fSyl;
@property (nonatomic, assign) int32_t iUpnum;
@property (nonatomic, assign) int32_t iDownnum;
@property (nonatomic, assign) float fLtg;
@property (nonatomic, assign) float fYclose;
@property (nonatomic, assign) int64_t lYvolinstock;
@property (nonatomic, assign) float fAverageprice;
@property (nonatomic, assign) float fTotalmarketvalue;
@property (nonatomic, assign) float fCirculationmarketvalue;
@property (nonatomic, assign) int32_t iErveyhand;
@property (nonatomic, assign) float fDayincrease;
@property (nonatomic, assign) float fCointype;
@property (nonatomic, assign) float fHot;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, assign) E_SEC_STATUS eSecStatus;
@property (nonatomic, assign) float fFundNetValue;


- (void)write: (BaseEncodeStream *)eos;

- (SecQuote *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QuoteRsp : Message

@property (nonatomic, strong) NSArray* vSecQuote;


- (void)write: (BaseEncodeStream *)eos;

- (QuoteRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecSimpleQuote : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) float fTotalmarketvalue;
@property (nonatomic, assign) int32_t iTpFlag;
@property (nonatomic, assign) float fFhsl;
@property (nonatomic, assign) float fSyl;
@property (nonatomic, assign) int32_t iUpnum;
@property (nonatomic, assign) int32_t iDownnum;
@property (nonatomic, assign) float fHot;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, assign) E_SEC_STATUS eSecStatus;
@property (nonatomic, strong) SecAttr* stSecAttr;


- (void)write: (BaseEncodeStream *)eos;

- (SecSimpleQuote *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QuoteSimpleRsp : Message

@property (nonatomic, strong) NSArray* vSecSimpleQuote;


- (void)write: (BaseEncodeStream *)eos;

- (QuoteSimpleRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QuoteCacheKey : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void)write: (BaseEncodeStream *)eos;

- (QuoteCacheKey *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QuoteCacheValue : Message

@property (nonatomic, strong) SecQuote* stSecQuote;
@property (nonatomic, assign) int32_t iFlushTime;


- (void)write: (BaseEncodeStream *)eos;

- (QuoteCacheValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TrendDesc : Message

@property (nonatomic, assign) int32_t iMinute;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) float fAverage;
@property (nonatomic, assign) int64_t lNowvol;
@property (nonatomic, assign) int64_t lBuyvol;
@property (nonatomic, assign) int64_t lSellvol;
@property (nonatomic, assign) float fLead;
@property (nonatomic, assign) float fAmount;
@property (nonatomic, assign) int64_t lTotalvol;
@property (nonatomic, assign) int64_t fTotalAmount;


- (void)write: (BaseEncodeStream *)eos;

- (TrendDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TrendReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (TrendReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TrendRsp : Message

@property (nonatomic, strong) NSArray* vTrendDesc;


- (void)write: (BaseEncodeStream *)eos;

- (TrendRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TrendCacheKey : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void)write: (BaseEncodeStream *)eos;

- (TrendCacheKey *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TrendCacheValue : Message

@property (nonatomic, strong) NSArray* vTrendDesc;
@property (nonatomic, assign) int32_t iFlushTime;


- (void)write: (BaseEncodeStream *)eos;

- (TrendCacheValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalFlow : Message

@property (nonatomic, assign) int64_t lTime;
@property (nonatomic, assign) float fSuperin;
@property (nonatomic, assign) float fSuperout;
@property (nonatomic, assign) float fBigin;
@property (nonatomic, assign) float fBigout;
@property (nonatomic, assign) float fMidin;
@property (nonatomic, assign) float fMidout;
@property (nonatomic, assign) float fSmallin;
@property (nonatomic, assign) float fSmallout;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalFlow *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalFlowReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iPeriod;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iNum;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalFlowReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalFlowRsp : Message

@property (nonatomic, strong) NSArray* vCapitalFlow;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalFlowRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface KLineDesc : Message

@property (nonatomic, assign) int64_t lYmd;
@property (nonatomic, assign) int64_t lMinute;
@property (nonatomic, assign) float fOpen;
@property (nonatomic, assign) float fHigh;
@property (nonatomic, assign) float fLow;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) int64_t lAmout;
@property (nonatomic, assign) int64_t lVolume;
@property (nonatomic, assign) int64_t lUp;
@property (nonatomic, assign) int64_t lDown;
@property (nonatomic, assign) float fZjs;
@property (nonatomic, assign) int64_t lTotalvol;
@property (nonatomic, assign) int64_t fTotalAmount;


- (void)write: (BaseEncodeStream *)eos;

- (KLineDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface KLineReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_K_LINE_TYPE eKLineType;
@property (nonatomic, assign) int32_t iMulnum;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, assign) BOOL bTg;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (KLineReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface KLineRsp : Message

@property (nonatomic, strong) NSArray* vKLineDesc;
@property (nonatomic, assign) E_K_LINE_TYPE eKLineType;


- (void)write: (BaseEncodeStream *)eos;

- (KLineRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PlateQuoteDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) int64_t lVolume;
@property (nonatomic, assign) float fAmout;
@property (nonatomic, assign) float fFhsl;
@property (nonatomic, copy) NSString* sHeadName;
@property (nonatomic, assign) float fHeadNow;
@property (nonatomic, assign) float fHeadClose;
@property (nonatomic, assign) float fYclose;
@property (nonatomic, assign) int32_t iTpFlag;
@property (nonatomic, strong) SecAttr* stSecAttr;


- (void)write: (BaseEncodeStream *)eos;

- (PlateQuoteDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PlateQuoteReq : Message

@property (nonatomic, assign) E_PLATE_QUOTE_REQ_TYPE ePlateQuoteReqType;
@property (nonatomic, assign) int32_t iColype;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, assign) E_PLATE_QUOTE_SORT_TYPE ePlateQuoteSortType;
@property (nonatomic, assign) E_MARKET_TYPE eMarketType;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (PlateQuoteReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PlateQuoteRsp : Message

@property (nonatomic, strong) NSArray* vPlateQuoteDesc;


- (void)write: (BaseEncodeStream *)eos;

- (PlateQuoteRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConcQuoteDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sConcName;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) float fOpen;
@property (nonatomic, assign) float fMax;
@property (nonatomic, assign) float fMin;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) int64_t lNowVolume;
@property (nonatomic, assign) float fAmout;
@property (nonatomic, assign) float fHot;


- (void)write: (BaseEncodeStream *)eos;

- (ConcQuoteDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConcQuoteReq : Message

@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (ConcQuoteReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConcQuoteRsp : Message

@property (nonatomic, strong) NSArray* vConcQuoteDesc;


- (void)write: (BaseEncodeStream *)eos;

- (ConcQuoteRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDetailDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) float fChangeRate;
@property (nonatomic, assign) float fChangeValue;
@property (nonatomic, assign) float fZljlr;
@property (nonatomic, assign) float fZljzb;
@property (nonatomic, assign) float fShjlr;
@property (nonatomic, assign) float fShjzb;
@property (nonatomic, assign) float fCddjlr;
@property (nonatomic, assign) float fCddjzb;
@property (nonatomic, assign) float fDdjlr;
@property (nonatomic, assign) float fDdjzb;
@property (nonatomic, assign) float fZdjlr;
@property (nonatomic, assign) float fZdjzb;
@property (nonatomic, assign) float fXdjlr;
@property (nonatomic, assign) float fXdjzb;
@property (nonatomic, assign) E_SEC_STATUS eSecStatus;
@property (nonatomic, strong) SecAttr* stSecAttr;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalDetailDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDetailReq : Message

@property (nonatomic, assign) E_CAPITAL_DETAIL_SET_TYPE eSetType;
@property (nonatomic, assign) int32_t iColype;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iNum;
@property (nonatomic, assign) E_CAPITAL_DETAIL_SORT_TYPE eSortType;
@property (nonatomic, assign) E_CAPITAL_DETAIL_DATA_TYPE eDataType;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalDetailReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDetailRsp : Message

@property (nonatomic, strong) NSArray* vCapitalDetailDesc;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalDetailRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TickDesc : Message

@property (nonatomic, assign) int32_t iMinute;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) int64_t lNowVolume;
@property (nonatomic, assign) int32_t iInOut;
@property (nonatomic, assign) int32_t iTradeIndex;


- (void)write: (BaseEncodeStream *)eos;

- (TickDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TickReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (TickReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TickRsp : Message

@property (nonatomic, strong) NSArray* vTickDesc;


- (void)write: (BaseEncodeStream *)eos;

- (TickRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalMainFlowDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) float fChangeRate;
@property (nonatomic, assign) float fChangeValue;
@property (nonatomic, assign) float fZljlr;
@property (nonatomic, assign) float fZljzb;
@property (nonatomic, assign) E_SEC_STATUS eSecStatus;
@property (nonatomic, strong) SecAttr* stSecAttr;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalMainFlowDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalMainFlowReq : Message

@property (nonatomic, strong) NSArray* vDtSecCode;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalMainFlowReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalMainFlowRsp : Message

@property (nonatomic, strong) NSArray* vCapitalMainFlowDesc;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalMainFlowRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConcIndexDesc : Message

@property (nonatomic, assign) int64_t lYmd;
@property (nonatomic, assign) float fHotIndex;


- (void)write: (BaseEncodeStream *)eos;

- (ConcIndexDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConcIndexReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (ConcIndexReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConcIndexRsp : Message

@property (nonatomic, strong) NSArray* vConcIndexDesc;


- (void)write: (BaseEncodeStream *)eos;

- (ConcIndexRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TradingTimeDesc : Message

@property (nonatomic, assign) E_MARKET_TYPE eMarketType;
@property (nonatomic, assign) int32_t iOpenTime;
@property (nonatomic, assign) int32_t iCloseTime;
@property (nonatomic, assign) E_TRADING_TIME_TYPE eTradingTimeType;
@property (nonatomic, assign) E_TRADING_DEAL_TYPE eTradingDealType;


- (void)write: (BaseEncodeStream *)eos;

- (TradingTimeDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TradingTimeReq : Message

@property (nonatomic, assign) int32_t iLocalTime;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (TradingTimeReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TradingTimeRsp : Message

@property (nonatomic, assign) int32_t iNow;
@property (nonatomic, strong) NSArray* vTradingTimeDesc;


- (void)write: (BaseEncodeStream *)eos;

- (TradingTimeRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AHPlateReq : Message

@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, assign) int32_t iColype;
@property (nonatomic, assign) E_CAPITAL_DETAIL_SORT_TYPE eSortType;
@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (AHPlateReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AHPlateDesc : Message

@property (nonatomic, assign) float fPremiumrate;
@property (nonatomic, copy) NSString* sADtSecCode;
@property (nonatomic, copy) NSString* sHKDtSecCode;
@property (nonatomic, copy) NSString* sASecName;
@property (nonatomic, copy) NSString* sHKSecName;
@property (nonatomic, assign) float fANow;
@property (nonatomic, assign) float fHKNow;
@property (nonatomic, assign) float fAIncrease;
@property (nonatomic, assign) float fHKIncrease;
@property (nonatomic, assign) int64_t lATotalhand;
@property (nonatomic, assign) int64_t lHKTotalhand;
@property (nonatomic, assign) float fAFhsl;
@property (nonatomic, assign) float fHKFhsl;


- (void)write: (BaseEncodeStream *)eos;

- (AHPlateDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AHPlateRsp : Message

@property (nonatomic, strong) NSArray* vAHPlateDesc;


- (void)write: (BaseEncodeStream *)eos;

- (AHPlateRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AHExtendInfo : Message

@property (nonatomic, assign) float fRmbHkExchangeRate;
@property (nonatomic, assign) float fSHHKFlowInto;
@property (nonatomic, assign) float fSHHKQuota;
@property (nonatomic, assign) float fHKSHFlowInto;
@property (nonatomic, assign) float fHKSHQuota;


- (void)write: (BaseEncodeStream *)eos;

- (AHExtendInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AHExtendReq : Message

@property (nonatomic, strong) NSData* vGuid;


- (void)write: (BaseEncodeStream *)eos;

- (AHExtendReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AHExtendRsp : Message

@property (nonatomic, strong) AHExtendInfo* stAHExtendInfo;


- (void)write: (BaseEncodeStream *)eos;

- (AHExtendRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PlateStockListReq : Message

@property (nonatomic, strong) NSData* vGuid;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void)write: (BaseEncodeStream *)eos;

- (PlateStockListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PlateStockListRsp : Message

@property (nonatomic, strong) NSArray* vSecSimpleQuote;


- (void)write: (BaseEncodeStream *)eos;

- (PlateStockListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeInfo : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) float fBuyBalance;
@property (nonatomic, assign) float fSellBalance;


- (void)write: (BaseEncodeStream *)eos;

- (MarginTradeInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeReq : Message

@property (nonatomic, strong) NSData* vGuid;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void)write: (BaseEncodeStream *)eos;

- (MarginTradeReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeRsp : Message

@property (nonatomic, strong) NSArray* vMarginTradeInfo;


- (void)write: (BaseEncodeStream *)eos;

- (MarginTradeRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDDZDesc : Message

@property (nonatomic, assign) int64_t lTime;
@property (nonatomic, assign) float fSuperInAmt;
@property (nonatomic, assign) float fSuperOutAmt;
@property (nonatomic, assign) float fBigInAmt;
@property (nonatomic, assign) float fBigOutAmt;
@property (nonatomic, assign) float fMidInAmt;
@property (nonatomic, assign) float fMidOutAmt;
@property (nonatomic, assign) float fSmallInAmt;
@property (nonatomic, assign) float fSmallOutAmt;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalDDZDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDDZReq : Message

@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iNum;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSData* vGuid;
@property (nonatomic, assign) E_CAPITAL_DDZ_TYPE eCapitalDDZType;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalDDZReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDDZRsp : Message

@property (nonatomic, strong) NSArray* vCapitalDDZDesc;


- (void)write: (BaseEncodeStream *)eos;

- (CapitalDDZRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SimilarKLineBase : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sUpBanner;
@property (nonatomic, copy) NSString* sUpValue;
@property (nonatomic, copy) NSString* sLeftValue1;
@property (nonatomic, copy) NSString* sLeftValue2;
@property (nonatomic, copy) NSString* sRightBanner;
@property (nonatomic, strong) NSArray* vKLineDesc;


- (void)write: (BaseEncodeStream *)eos;

- (SimilarKLineBase *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SimilarKLineReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_SIMILAR_K_LINE_TYPE eSimilarKLineType;
@property (nonatomic, strong) NSArray* vDtSecCode;


- (void)write: (BaseEncodeStream *)eos;

- (SimilarKLineReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SimilarKLineRst : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sUpBan;
@property (nonatomic, copy) NSString* sUpVal;
@property (nonatomic, copy) NSString* sValue1;
@property (nonatomic, copy) NSString* sValue2;
@property (nonatomic, assign) E_SIMILAR_K_LINE_TYPE eSimilarKLineType;
@property (nonatomic, strong) NSArray* vKLineDesc;
@property (nonatomic, strong) NSArray* vSimilarKLine;


- (void)write: (BaseEncodeStream *)eos;

- (SimilarKLineRst *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SimilarKLineRsp : Message

@property (nonatomic, strong) NSArray* vRst;


- (void)write: (BaseEncodeStream *)eos;

- (SimilarKLineRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitDesc : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) int64_t lLargeBuy;
@property (nonatomic, assign) int64_t lLargeSell;
@property (nonatomic, assign) int64_t lSuperBuy;
@property (nonatomic, assign) int64_t lSuperSell;
@property (nonatomic, assign) int64_t lSuperLargeBuy;
@property (nonatomic, assign) int64_t lSuperLargeSell;
@property (nonatomic, assign) int64_t lCancelBuy;
@property (nonatomic, assign) int64_t lCancelSell;
@property (nonatomic, assign) int64_t lPostLargeBuy;
@property (nonatomic, assign) int64_t lPostLargeSell;


- (void)write: (BaseEncodeStream *)eos;

- (LargeUnitDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitDescListReq : Message

@property (nonatomic, assign) int32_t iTime;


- (void)write: (BaseEncodeStream *)eos;

- (LargeUnitDescListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitDescListRsp : Message

@property (nonatomic, strong) NSArray* vLargeUnitDesc;


- (void)write: (BaseEncodeStream *)eos;

- (LargeUnitDescListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iNum;


- (void)write: (BaseEncodeStream *)eos;

- (LargeUnitReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitRsp : Message

@property (nonatomic, strong) NSArray* vLargeUnitDesc;


- (void)write: (BaseEncodeStream *)eos;

- (LargeUnitRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatDesc : Message

@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, assign) int32_t iChange10;
@property (nonatomic, assign) int32_t iChange5;
@property (nonatomic, assign) int32_t iChangeN5;
@property (nonatomic, assign) int32_t iChangeN10;
@property (nonatomic, assign) int32_t iChangeMax;
@property (nonatomic, assign) int32_t iChangeMin;


- (void)write: (BaseEncodeStream *)eos;

- (MarketStatDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;


- (void)write: (BaseEncodeStream *)eos;

- (MarketStatReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatMap : Message

@property (nonatomic, strong) NSDictionary* mMarketStatDesc;


- (void)write: (BaseEncodeStream *)eos;

- (MarketStatMap *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatList : Message

@property (nonatomic, strong) NSArray* vMarketStatDesc;


- (void)write: (BaseEncodeStream *)eos;

- (MarketStatList *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatRsp : Message

@property (nonatomic, strong) MarketStatList* stMarketStatList;


- (void)write: (BaseEncodeStream *)eos;

- (MarketStatRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
