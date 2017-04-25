#ifndef MarginTrade_h
#define MarginTrade_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, E_STRATEGY_TYPE) {
    E_STRATEGY_GE10 = 1,
    E_STRATEGY_GE20 = 2,
    E_STRATEGY_GE30 = 3,
    E_STRATEGY_GE40 = 4,
    E_STRATEGY_GE50 = 5
};

/////////////////////////////////////////////////////////////////
@interface MarginTradeDt : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fBuyValue;
@property (nonatomic, assign) float fBuyPercent;
@property (nonatomic, copy) NSString* sBuyValue;
@property (nonatomic, copy) NSString* sBuyPercent;


- (void) write: (BaseEncodeStream *)eos;

- (MarginTradeDt *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeMkt : Message

@property (nonatomic, copy) NSString* sOpDate;
@property (nonatomic, assign) float fMarginBalance;
@property (nonatomic, assign) float fBuyValue;


- (void) write: (BaseEncodeStream *)eos;

- (MarginTradeMkt *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PlateBuyValue : Message

@property (nonatomic, copy) NSString* sPlate;
@property (nonatomic, assign) float fBuyValue;
@property (nonatomic, copy) NSString* sBuyValue;


- (void) write: (BaseEncodeStream *)eos;

- (PlateBuyValue *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IndustryRank : Message

@property (nonatomic, assign) int32_t iPosition;
@property (nonatomic, assign) int32_t iTotal;


- (void) write: (BaseEncodeStream *)eos;

- (IndustryRank *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockDateMarginTrade : Message

@property (nonatomic, copy) NSString* sOpDate;
@property (nonatomic, assign) float fMarginBalance;
@property (nonatomic, assign) float fBuyValue;
@property (nonatomic, copy) NSString* sMarginBalance;
@property (nonatomic, copy) NSString* sBuyValue;


- (void) write: (BaseEncodeStream *)eos;

- (StockDateMarginTrade *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StoreStockMarginTrade : Message

@property (nonatomic, strong) NSMutableArray* vtStockDateMarginTrade;


- (void) write: (BaseEncodeStream *)eos;

- (StoreStockMarginTrade *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeMktReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (MarginTradeMktReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarginTradeMktRsp : Message

@property (nonatomic, strong) NSMutableArray* vtSZMarginTrade;
@property (nonatomic, strong) NSMutableArray* vtSHMarginTrade;


- (void) write: (BaseEncodeStream *)eos;

- (MarginTradeMktRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IndustryPlateBuyValueReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (IndustryPlateBuyValueReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IndustryPlateBuyValueRsp : Message

@property (nonatomic, strong) NSMutableArray* vtIndustryBuyValue;
@property (nonatomic, strong) NSMutableArray* vtPlateBuyValue;


- (void) write: (BaseEncodeStream *)eos;

- (IndustryPlateBuyValueRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IndustryPlateDtMarginReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sIndustryPlate;
@property (nonatomic, assign) int32_t iStartPos;
@property (nonatomic, assign) int32_t iWantNum;


- (void) write: (BaseEncodeStream *)eos;

- (IndustryPlateDtMarginReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface IndustryPlateDtMarginRsp : Message

@property (nonatomic, strong) NSMutableArray* vtIndustryBuyValue;


- (void) write: (BaseEncodeStream *)eos;

- (IndustryPlateDtMarginRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockMarginTradeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iWantNum;


- (void) write: (BaseEncodeStream *)eos;

- (StockMarginTradeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockMarginTradeRsp : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sIndustry;
@property (nonatomic, strong) NSMutableArray* vtStockDateMarginTrade;
@property (nonatomic, strong) IndustryRank* stBalanceRank;
@property (nonatomic, strong) IndustryRank* stBuyValueRank;


- (void) write: (BaseEncodeStream *)eos;

- (StockMarginTradeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockHaveMarginReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vtDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (StockHaveMarginReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockHaveMarginRsp : Message

@property (nonatomic, strong) NSMutableArray* vtDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (StockHaveMarginRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockBackTraceRst : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_STRATEGY_TYPE e_strategy_type;
@property (nonatomic, assign) int32_t iHoldDays;
@property (nonatomic, assign) float fIncRateAvg;
@property (nonatomic, assign) float fWinPer;


- (void) write: (BaseEncodeStream *)eos;

- (StockBackTraceRst *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockBackTraceReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (StockBackTraceReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockBackTraceRsp : Message

@property (nonatomic, strong) StockBackTraceRst* stMaxIncRst;
@property (nonatomic, strong) StockBackTraceRst* stMaxWinRst;


- (void) write: (BaseEncodeStream *)eos;

- (StockBackTraceRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
