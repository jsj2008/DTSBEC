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
    E_PQT_HK_SH = 12,
    E_PQT_GLOBAL = 13
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

typedef NS_ENUM(NSUInteger, E_PAN_KOU_TYPE) {
    E_PKT_SUPER_BUY = 0,
    E_PKT_SUPER_SELL = 1,
    E_PKT_UP_TO_STOP = 2,
    E_PKT_DOWN_TO_STOP = 3,
    E_PKT_OPEN_UP_TO_STOP = 4,
    E_PKT_OPEN_DOWN_TO_STOP = 5,
    E_PKT_POST_LARGE_BUY = 6,
    E_PKT_POST_LARGE_SELL = 7,
    E_PKT_SUPER_LARGE_BUY = 8,
    E_PKT_SUPER_LARGE_SELL = 9,
    E_PKT_LARGE_BUY_IN = 14,
    E_PKT_LARGE_SELL_OUT = 15,
    E_PKT_BUY_FEN_DAN = 16,
    E_PKT_SELL_FEN_DAN = 17,
    E_PKT_QUICK_UP = 22,
    E_PKT_QUICK_BACKUP = 23,
    E_PKT_HIGH_DIVING = 24,
    E_PKT_QUICK_DOWN = 25,
    E_PKT_CANCEL_BUY = 26,
    E_PKT_CANCEL_SELL = 27
};

typedef NS_ENUM(NSUInteger, E_TRAN_STAT_TYPE) {
    E_FST_BUY = 0,
    E_FST_SELL = 1
};

/////////////////////////////////////////////////////////////////
@interface QuoteReq : Message

@property (nonatomic, strong) NSMutableArray* vDtSecCode;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (QuoteReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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
@property (nonatomic, strong) NSMutableArray* vBuyp;
@property (nonatomic, strong) NSMutableArray* vBuyv;
@property (nonatomic, strong) NSMutableArray* vSellp;
@property (nonatomic, strong) NSMutableArray* vSellv;
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
@property (nonatomic, assign) float fMaxLimit;
@property (nonatomic, assign) float fMinLimit;


- (void) write: (BaseEncodeStream *)eos;

- (SecQuote *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface QuoteRsp : Message

@property (nonatomic, strong) NSMutableArray* vSecQuote;


- (void) write: (BaseEncodeStream *)eos;

- (QuoteRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (SecSimpleQuote *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface QuoteSimpleRsp : Message

@property (nonatomic, strong) NSMutableArray* vSecSimpleQuote;


- (void) write: (BaseEncodeStream *)eos;

- (QuoteSimpleRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface QuoteCacheKey : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (QuoteCacheKey *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface QuoteCacheValue : Message

@property (nonatomic, strong) SecQuote* stSecQuote;
@property (nonatomic, assign) int32_t iFlushTime;


- (void) write: (BaseEncodeStream *)eos;

- (QuoteCacheValue *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (TrendDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TrendReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (TrendReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TrendRsp : Message

@property (nonatomic, strong) NSMutableArray* vTrendDesc;
@property (nonatomic, assign) BOOL bSupport;


- (void) write: (BaseEncodeStream *)eos;

- (TrendRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TrendCacheKey : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (TrendCacheKey *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TrendCacheValue : Message

@property (nonatomic, strong) NSMutableArray* vTrendDesc;
@property (nonatomic, assign) int32_t iFlushTime;


- (void) write: (BaseEncodeStream *)eos;

- (TrendCacheValue *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (CapitalFlow *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalFlowReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iPeriod;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iNum;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalFlowReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalFlowRsp : Message

@property (nonatomic, strong) NSMutableArray* vCapitalFlow;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalFlowRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (KLineDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (KLineReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface KLineRsp : Message

@property (nonatomic, strong) NSMutableArray* vKLineDesc;
@property (nonatomic, assign) E_K_LINE_TYPE eKLineType;


- (void) write: (BaseEncodeStream *)eos;

- (KLineRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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
@property (nonatomic, assign) E_SEC_STATUS eSecStatus;


- (void) write: (BaseEncodeStream *)eos;

- (PlateQuoteDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (PlateQuoteReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PlateQuoteRsp : Message

@property (nonatomic, strong) NSMutableArray* vPlateQuoteDesc;


- (void) write: (BaseEncodeStream *)eos;

- (PlateQuoteRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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
@property (nonatomic, copy) NSString* sHeadName;
@property (nonatomic, assign) float fHeadNow;
@property (nonatomic, assign) float fHeadClose;


- (void) write: (BaseEncodeStream *)eos;

- (ConcQuoteDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcQuoteReq : Message

@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (ConcQuoteReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcQuoteRsp : Message

@property (nonatomic, strong) NSMutableArray* vConcQuoteDesc;


- (void) write: (BaseEncodeStream *)eos;

- (ConcQuoteRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (CapitalDetailDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (CapitalDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDetailRsp : Message

@property (nonatomic, strong) NSMutableArray* vCapitalDetailDesc;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TickDesc : Message

@property (nonatomic, assign) int32_t iMinute;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) int64_t lNowVolume;
@property (nonatomic, assign) int32_t iInOut;
@property (nonatomic, assign) int32_t iTradeIndex;
@property (nonatomic, assign) int32_t iTime;


- (void) write: (BaseEncodeStream *)eos;

- (TickDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TickReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (TickReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TickRsp : Message

@property (nonatomic, strong) NSMutableArray* vTickDesc;


- (void) write: (BaseEncodeStream *)eos;

- (TickRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (CapitalMainFlowDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalMainFlowReq : Message

@property (nonatomic, strong) NSMutableArray* vDtSecCode;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalMainFlowReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalMainFlowRsp : Message

@property (nonatomic, strong) NSMutableArray* vCapitalMainFlowDesc;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalMainFlowRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcIndexDesc : Message

@property (nonatomic, assign) int64_t lYmd;
@property (nonatomic, assign) float fHotIndex;


- (void) write: (BaseEncodeStream *)eos;

- (ConcIndexDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcIndexReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (ConcIndexReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcIndexRsp : Message

@property (nonatomic, strong) NSMutableArray* vConcIndexDesc;


- (void) write: (BaseEncodeStream *)eos;

- (ConcIndexRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TradingTimeDesc : Message

@property (nonatomic, assign) E_MARKET_TYPE eMarketType;
@property (nonatomic, assign) int32_t iOpenTime;
@property (nonatomic, assign) int32_t iCloseTime;
@property (nonatomic, assign) E_TRADING_TIME_TYPE eTradingTimeType;
@property (nonatomic, assign) E_TRADING_DEAL_TYPE eTradingDealType;


- (void) write: (BaseEncodeStream *)eos;

- (TradingTimeDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TradingTimeReq : Message

@property (nonatomic, assign) int32_t iLocalTime;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (TradingTimeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TradingTimeRsp : Message

@property (nonatomic, assign) int32_t iNow;
@property (nonatomic, strong) NSMutableArray* vTradingTimeDesc;


- (void) write: (BaseEncodeStream *)eos;

- (TradingTimeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AHPlateReq : Message

@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, assign) int32_t iColype;
@property (nonatomic, assign) E_CAPITAL_DETAIL_SORT_TYPE eSortType;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (AHPlateReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (AHPlateDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AHPlateRsp : Message

@property (nonatomic, strong) NSMutableArray* vAHPlateDesc;


- (void) write: (BaseEncodeStream *)eos;

- (AHPlateRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AHExtendInfo : Message

@property (nonatomic, assign) float fRmbHkExchangeRate;
@property (nonatomic, assign) float fSHHKFlowInto;
@property (nonatomic, assign) float fSHHKQuota;
@property (nonatomic, assign) float fHKSHFlowInto;
@property (nonatomic, assign) float fHKSHQuota;


- (void) write: (BaseEncodeStream *)eos;

- (AHExtendInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AHExtendReq : Message

@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (AHExtendReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AHExtendRsp : Message

@property (nonatomic, strong) AHExtendInfo* stAHExtendInfo;


- (void) write: (BaseEncodeStream *)eos;

- (AHExtendRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PlateStockListReq : Message

@property (nonatomic, strong) NSData* vGuid;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (PlateStockListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PlateStockListRsp : Message

@property (nonatomic, strong) NSMutableArray* vSecSimpleQuote;


- (void) write: (BaseEncodeStream *)eos;

- (PlateStockListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeInfo : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) float fBuyBalance;
@property (nonatomic, assign) float fSellBalance;


- (void) write: (BaseEncodeStream *)eos;

- (MarginTradeInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeReq : Message

@property (nonatomic, strong) NSData* vGuid;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (MarginTradeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeRsp : Message

@property (nonatomic, strong) NSMutableArray* vMarginTradeInfo;


- (void) write: (BaseEncodeStream *)eos;

- (MarginTradeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (CapitalDDZDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDDZReq : Message

@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iNum;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSData* vGuid;
@property (nonatomic, assign) E_CAPITAL_DDZ_TYPE eCapitalDDZType;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalDDZReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalDDZRsp : Message

@property (nonatomic, strong) NSMutableArray* vCapitalDDZDesc;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalDDZRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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
@property (nonatomic, strong) NSMutableArray* vKLineDesc;


- (void) write: (BaseEncodeStream *)eos;

- (SimilarKLineBase *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SimilarKLineReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_SIMILAR_K_LINE_TYPE eSimilarKLineType;
@property (nonatomic, strong) NSMutableArray* vDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (SimilarKLineReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SimilarKLineDaysRst : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sUpBan;
@property (nonatomic, copy) NSString* sUpVal;
@property (nonatomic, copy) NSString* sValue1;
@property (nonatomic, copy) NSString* sValue2;
@property (nonatomic, assign) E_SIMILAR_K_LINE_TYPE eSimilarKLineType;
@property (nonatomic, strong) NSMutableArray* vKLineDesc;
@property (nonatomic, strong) NSMutableArray* vSimilarKLine;


- (void) write: (BaseEncodeStream *)eos;

- (SimilarKLineDaysRst *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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
@property (nonatomic, strong) NSMutableArray* vKLineDesc;
@property (nonatomic, strong) NSMutableArray* vSimilarKLine;
@property (nonatomic, strong) NSMutableArray* vSimilarKLineSelf;
@property (nonatomic, copy) NSString* sUpValDay60;
@property (nonatomic, copy) NSString* sValue1Day60;
@property (nonatomic, copy) NSString* sValue2Day60;
@property (nonatomic, strong) NSMutableArray* vKLineDescDay60;
@property (nonatomic, strong) NSMutableArray* vSimilarKLineDay60;
@property (nonatomic, strong) NSMutableArray* vSimilarKLineDay60Self;


- (void) write: (BaseEncodeStream *)eos;

- (SimilarKLineRst *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SimilarKLineRsp : Message

@property (nonatomic, strong) NSMutableArray* vRst;


- (void) write: (BaseEncodeStream *)eos;

- (SimilarKLineRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ShortLineStrategy : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, assign) E_PAN_KOU_TYPE ePanKouType;
@property (nonatomic, copy) NSString* sInfo;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) float fClose;


- (void) write: (BaseEncodeStream *)eos;

- (ShortLineStrategy *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ShortLineStrategyList : Message

@property (nonatomic, strong) NSMutableArray* vShortLineStrategy;


- (void) write: (BaseEncodeStream *)eos;

- (ShortLineStrategyList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) E_PAN_KOU_TYPE ePanKouType;
@property (nonatomic, assign) int64_t lFenDan;


- (void) write: (BaseEncodeStream *)eos;

- (LargeUnitDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitDescListReq : Message

@property (nonatomic, assign) int32_t iTime;


- (void) write: (BaseEncodeStream *)eos;

- (LargeUnitDescListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitDescListRsp : Message

@property (nonatomic, strong) NSMutableArray* vLargeUnitDesc;


- (void) write: (BaseEncodeStream *)eos;

- (LargeUnitDescListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iNum;
@property (nonatomic, assign) int32_t iTimeStamp;
@property (nonatomic, assign) int32_t iSort;
@property (nonatomic, assign) int32_t iDirection;


- (void) write: (BaseEncodeStream *)eos;

- (LargeUnitReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitRsp : Message

@property (nonatomic, strong) NSMutableArray* vLargeUnitDesc;


- (void) write: (BaseEncodeStream *)eos;

- (LargeUnitRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RecentLargeUnitReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (RecentLargeUnitReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RecentLargeUnit : Message

@property (nonatomic, strong) LargeUnitDesc* stDesc;
@property (nonatomic, assign) int32_t iTotalNum;


- (void) write: (BaseEncodeStream *)eos;

- (RecentLargeUnit *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RecentLargeUnitRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mLargeUnitDesc;


- (void) write: (BaseEncodeStream *)eos;

- (RecentLargeUnitRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

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


- (void) write: (BaseEncodeStream *)eos;

- (MarketStatDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;


- (void) write: (BaseEncodeStream *)eos;

- (MarketStatReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatMap : Message

@property (nonatomic, strong) NSMutableDictionary* mMarketStatDesc;


- (void) write: (BaseEncodeStream *)eos;

- (MarketStatMap *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatList : Message

@property (nonatomic, strong) NSMutableArray* vMarketStatDesc;


- (void) write: (BaseEncodeStream *)eos;

- (MarketStatList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarketStatRsp : Message

@property (nonatomic, strong) MarketStatList* stMarketStatList;


- (void) write: (BaseEncodeStream *)eos;

- (MarketStatRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TransStatDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_TRAN_STAT_TYPE eTranStatType;
@property (nonatomic, assign) int32_t iNo;
@property (nonatomic, assign) int64_t lTotalAmt;
@property (nonatomic, assign) float fPriceAvg;
@property (nonatomic, assign) int64_t lTotalVol;
@property (nonatomic, assign) int32_t iLastTime;


- (void) write: (BaseEncodeStream *)eos;

- (TransStatDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TransStat : Message

@property (nonatomic, strong) NSMutableArray* vTransStatDesc;


- (void) write: (BaseEncodeStream *)eos;

- (TransStat *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TransStatReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iStartxh;
@property (nonatomic, assign) int32_t iWantnum;


- (void) write: (BaseEncodeStream *)eos;

- (TransStatReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TransStatRsp : Message

@property (nonatomic, strong) TransStat* stTransStatBuy;
@property (nonatomic, strong) TransStat* stTransStatSell;
@property (nonatomic, assign) int64_t lTotalBuyAmt;
@property (nonatomic, assign) int64_t lTotalSellAmt;
@property (nonatomic, assign) float fPriceAvg;
@property (nonatomic, assign) int64_t lTotalBuyVol;
@property (nonatomic, assign) int64_t lTotalSellVol;


- (void) write: (BaseEncodeStream *)eos;

- (TransStatRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
