#ifndef AIConsultStock_h
#define AIConsultStock_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"

typedef NS_ENUM(NSUInteger, E_FIN_TYPE) {
    E_FIN_INCOME = 1,
    E_FIN_PROFIT = 2,
    E_FIN_ROE = 3,
    E_FIN_BEPS = 4,
    E_FIN_TOTAL_ASS = 5,
    E_FIN_ASS_DEBT = 6,
    E_FIN_OPER_CASH = 7
};

/////////////////////////////////////////////////////////////////
@interface STRank : Message

@property (nonatomic, assign) int32_t iRank;
@property (nonatomic, assign) int32_t iDtNum;


- (void) write: (BaseEncodeStream *)eos;

- (STRank *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STTrendPredict : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, strong) NSMutableArray* vtClose;
@property (nonatomic, assign) float fScore;


- (void) write: (BaseEncodeStream *)eos;

- (STTrendPredict *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STPopuIndex : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) int32_t iIndexVal;


- (void) write: (BaseEncodeStream *)eos;

- (STPopuIndex *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STPopularity : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSMutableArray* vtPopuIndex;
@property (nonatomic, copy) NSString* sPopularityDesc;
@property (nonatomic, assign) float fVal;


- (void) write: (BaseEncodeStream *)eos;

- (STPopularity *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STAnno : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSMutableArray* vtPositiveDate;
@property (nonatomic, strong) NSMutableArray* vtNegativeDate;
@property (nonatomic, copy) NSString* sAnnoDesc;


- (void) write: (BaseEncodeStream *)eos;

- (STAnno *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STInsRes : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fVal;
@property (nonatomic, assign) int32_t iIndustryRank;
@property (nonatomic, assign) int32_t iIndDtNum;
@property (nonatomic, assign) float fIndInsResAvg;


- (void) write: (BaseEncodeStream *)eos;

- (STInsRes *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STMainCap : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fVal;
@property (nonatomic, assign) int32_t iIndustryRank;
@property (nonatomic, assign) int32_t iIndDtNum;
@property (nonatomic, copy) NSString* sMainCapDesc;


- (void) write: (BaseEncodeStream *)eos;

- (STMainCap *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STLHDateNet : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) float fNetBuy;


- (void) write: (BaseEncodeStream *)eos;

- (STLHDateNet *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STLongHu : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fVal;
@property (nonatomic, assign) float fSumNetBuy;
@property (nonatomic, strong) NSMutableArray* vtDateNet;
@property (nonatomic, assign) int32_t iIndustryRank;
@property (nonatomic, assign) int32_t iIndDtNum;
@property (nonatomic, copy) NSString* sLongHuDesc;


- (void) write: (BaseEncodeStream *)eos;

- (STLongHu *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STMTBuy : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) float fBuy;


- (void) write: (BaseEncodeStream *)eos;

- (STMTBuy *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STMarginTrade : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fVal;
@property (nonatomic, strong) NSMutableArray* vtMTBuy;
@property (nonatomic, assign) int32_t iIndustryRank;
@property (nonatomic, assign) int32_t iIndDtNum;
@property (nonatomic, copy) NSString* sMarginTradeDesc;


- (void) write: (BaseEncodeStream *)eos;

- (STMarginTrade *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STDateValue : Message

@property (nonatomic, copy) NSString* sYearMonth;
@property (nonatomic, assign) float fValue;


- (void) write: (BaseEncodeStream *)eos;

- (STDateValue *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STFinDate : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fVal;
@property (nonatomic, strong) NSMutableArray* vtDateValue;
@property (nonatomic, strong) NSMutableArray* vtDateValueAvg;
@property (nonatomic, strong) STRank* stIndSTRank;
@property (nonatomic, copy) NSString* sFinanceDesc;


- (void) write: (BaseEncodeStream *)eos;

- (STFinDate *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface STConsult : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fVal;
@property (nonatomic, strong) STRank* stIndSTRank;
@property (nonatomic, strong) STRank* stAllDtSTRank;
@property (nonatomic, copy) NSString* sConsultDesc;


- (void) write: (BaseEncodeStream *)eos;

- (STConsult *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConsultReq : Message

@property (nonatomic, strong) NSMutableArray* vtDtSecCode;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (ConsultReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TrendPredictRsp : Message

@property (nonatomic, strong) NSMutableArray* vtTrendPredict;


- (void) write: (BaseEncodeStream *)eos;

- (TrendPredictRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PopularityRsp : Message

@property (nonatomic, strong) NSMutableArray* vtPopularity;


- (void) write: (BaseEncodeStream *)eos;

- (PopularityRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AnnoRsp : Message

@property (nonatomic, strong) NSMutableArray* vtAnno;


- (void) write: (BaseEncodeStream *)eos;

- (AnnoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InsResRsp : Message

@property (nonatomic, strong) NSMutableArray* vtInsRes;


- (void) write: (BaseEncodeStream *)eos;

- (InsResRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MainCapRsp : Message

@property (nonatomic, strong) NSMutableArray* vtMainCap;


- (void) write: (BaseEncodeStream *)eos;

- (MainCapRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LongHuRsp : Message

@property (nonatomic, strong) NSMutableArray* vtLongHu;


- (void) write: (BaseEncodeStream *)eos;

- (LongHuRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface MarTraRsp : Message

@property (nonatomic, strong) NSMutableArray* vtMarginTrade;


- (void) write: (BaseEncodeStream *)eos;

- (MarTraRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinDataInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_FIN_TYPE eFinType;


- (void) write: (BaseEncodeStream *)eos;

- (FinDataInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinDataRst : Message

@property (nonatomic, strong) STFinDate* stFinDate;
@property (nonatomic, assign) E_FIN_TYPE eFinType;


- (void) write: (BaseEncodeStream *)eos;

- (FinDataRst *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinDataReq : Message

@property (nonatomic, strong) NSMutableArray* vtFinDateInfo;
@property (nonatomic, strong) NSData* vGuid;


- (void) write: (BaseEncodeStream *)eos;

- (FinDataReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinDataRsp : Message

@property (nonatomic, strong) NSMutableArray* vtFinDateRst;


- (void) write: (BaseEncodeStream *)eos;

- (FinDataRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConsultRsp : Message

@property (nonatomic, strong) NSMutableArray* vtConsult;


- (void) write: (BaseEncodeStream *)eos;

- (ConsultRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConsultScore : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iRiseScore;
@property (nonatomic, assign) int32_t iMktHotScore;
@property (nonatomic, assign) int32_t iMainScore;
@property (nonatomic, assign) int32_t iTrendScore;
@property (nonatomic, assign) int32_t iValueScore;
@property (nonatomic, assign) int32_t iConsultScore;
@property (nonatomic, assign) float fVal;
@property (nonatomic, copy) NSString* sScoreDesc;


- (void) write: (BaseEncodeStream *)eos;

- (ConsultScore *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConsultScoreRsp : Message

@property (nonatomic, strong) NSMutableArray* vtConsultScore;


- (void) write: (BaseEncodeStream *)eos;

- (ConsultScoreRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
