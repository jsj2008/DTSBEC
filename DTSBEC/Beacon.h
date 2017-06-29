#ifndef Beacon_h
#define Beacon_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"

typedef NS_ENUM(NSUInteger, E_DEVICE_TOKEN_TYPE) {
    E_DTT_UMENG = 1,
    E_DTT_HUAWEI = 2
};

typedef NS_ENUM(NSUInteger, E_ENV_TYPE) {
    E_ENV_FORMAL = 0,
    E_ENV_LOCAL = 1
};

typedef NS_ENUM(NSUInteger, E_FUND_TYPE) {
    E_OTHERS = 0,
    E_LOF = 1,
    E_ETF = 2,
    E_CCO,
    E_CC
};

typedef NS_ENUM(NSUInteger, E_MARKET_TYPE) {
    E_MT_NO = 99,
    E_MT_SZ = 0,
    E_MT_SH = 1,
    E_MT_HK = 2,
    E_MT_IC = 3,
    E_MT_NASDAQ = 13,
    E_MT_NYSE = 14,
    E_MT_AMEX = 15,
    E_MT_HIS = 16,
    E_MT_USI = 17,
    E_MT_DT = 20,
    E_MT_JPN = 18,
    E_MT_KOR = 19,
    E_MT_SGP = 21,
    E_MT_MYS = 22,
    E_MT_THA = 23,
    E_MT_IDN = 24,
    E_MT_AUS = 25,
    E_MT_NZL = 26,
    E_MT_IND = 27,
    E_MT_CAN = 28,
    E_MT_USDX = 29,
    E_MT_FRA = 30,
    E_MT_DEU = 31,
    E_MT_NLD = 32,
    E_MT_DNK = 33,
    E_MT_BEL = 34,
    E_MT_CHE = 35,
    E_MT_BRA = 36,
    E_MT_RUS = 37,
    E_MT_ITA = 38,
    E_MT_FX = 39,
    E_MT_GBR = 40,
    E_MT_GOLD = 41,
    E_MT_LME = 42,
    E_MT_OIL = 43,
    E_MT_TB = 47,
    E_MT_CNY = 48,
    E_MT_TWN = 98
};

typedef NS_ENUM(NSUInteger, E_SEC_TYPE) {
    E_ST_UNKNOWN = 0,
    E_ST_STOCK = 1,
    E_ST_BOND = 2,
    E_ST_FUND = 3,
    E_ST_WARRANT = 4,
    E_ST_INDEX = 5,
    E_ST_PLATE = 20,
    E_ST_CONC = 21,
    E_ST_FUTURES = 6
};

typedef NS_ENUM(NSUInteger, E_SEC_ATTR) {
    E_SEC_ATTR_SHHK = 1,
    E_SEC_ATTR_MARGIN = 2,
    E_SEC_ATTR_SUB_NEW = 3,
    E_SEC_ATTR_PLATE_FAUCET = 4,
    E_SEC_ATTR_CONC_STRONG = 5,
    E_SEC_ATTR_NEW = 6,
    E_SEC_ATTR_SZHK = 7
};

typedef NS_ENUM(NSUInteger, E_SEC_CHANGE_STATUS) {
    E_STATUS_FIX = 0,
    E_STATUS_SUSPEND = 1,
    E_STATUS_PRIVATIZE = 2,
    E_STATUS_LIFTED = 3
};

typedef NS_ENUM(NSUInteger, E_SEASON_TYPE) {
    E_ST_FIRST = 1,
    E_ST_SECOND = 2,
    E_ST_THIRD = 3,
    E_ST_FORTH = 4
};

typedef NS_ENUM(NSUInteger, E_FR_UNIT) {
    E_FRU_YUAN = 1,
    E_FRU_WANYUAN = 2,
    E_FRU_MILION = 3,
    E_FRU_YIYUAN = 4
};

typedef NS_ENUM(NSUInteger, ShareholderChange) {
    SHC_UNCHANGE = 0,
    SHC_INCREASE = 1,
    SHC_DECREASE = 2
};

typedef NS_ENUM(NSUInteger, E_ATTITUDE_TYPE) {
    ATT_NULL = 0,
    ATT_BUY = 1,
    ATT_HOLDINGS = 2,
    ATT_NEUTRUAL = 3,
    ATT_REDUCTION = 4,
    ATT_SELL = 5,
    ATT_UNRATE = 6
};

typedef NS_ENUM(NSUInteger, E_TAG_TYPE) {
    E_TT_COMMON = 1,
    E_TT_INTELI_TYPE = 2,
    E_TT_INTELI_DATASOURCE = 3
};

typedef NS_ENUM(NSUInteger, E_FIN_UNIT) {
    E_FU_YUAN = 1,
    E_FU_WAN_YUAN = 2,
    E_FU_BAIWAN_YUAN = 3,
    E_FU_YI_YUAN = 4
};

typedef NS_ENUM(NSUInteger, E_SEC_HIS_SUBJECT_TYPE) {
    E_HIS_SUBJECT_LH = 0,
    E_HIS_SUBJECT_AYH = 1,
    E_HIS_SUBJECT_BOAO = 2
};

/////////////////////////////////////////////////////////////////
@interface UserInfo : Message

@property (nonatomic, strong) NSData* vGUID;
@property (nonatomic, copy) NSString* sDUA;
@property (nonatomic, copy) NSString* sIMEI;
@property (nonatomic, copy) NSString* sDeviceTokens;
@property (nonatomic, copy) NSString* sPackageName;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) NSMutableDictionary* mpDeviceTokens;
@property (nonatomic, copy) NSString* sTag;
@property (nonatomic, assign) int32_t iMember;


- (void) write: (BaseEncodeStream *)eos;

- (UserInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sCHNShortName;
@property (nonatomic, copy) NSString* sConcDesc;


- (void) write: (BaseEncodeStream *)eos;

- (ConcInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PlateInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sPlateName;


- (void) write: (BaseEncodeStream *)eos;

- (PlateInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FundInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sCHNShortName;
@property (nonatomic, copy) NSString* sCHNFullName;
@property (nonatomic, copy) NSString* sFundDesc;
@property (nonatomic, copy) NSString* sFundType;
@property (nonatomic, copy) NSString* sFundOrgName;
@property (nonatomic, copy) NSString* sInvestType;
@property (nonatomic, copy) NSString* sInvestStyle;
@property (nonatomic, copy) NSString* sInvestTarget;
@property (nonatomic, copy) NSString* sInvestOrient;
@property (nonatomic, copy) NSString* sPerformanceBench;
@property (nonatomic, copy) NSString* sRiskEarn;
@property (nonatomic, assign) int32_t iIsStructFund;


- (void) write: (BaseEncodeStream *)eos;

- (FundInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecCode : Message

@property (nonatomic, copy) NSString* sSecCode;
@property (nonatomic, assign) E_MARKET_TYPE eMarketType;
@property (nonatomic, assign) E_SEC_TYPE eSecType;


- (void) write: (BaseEncodeStream *)eos;

- (SecCode *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecBaseInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sCHNShortName;


- (void) write: (BaseEncodeStream *)eos;

- (SecBaseInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecStatusInfo : Message

@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, copy) NSString* sKey;


- (void) write: (BaseEncodeStream *)eos;

- (SecStatusInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecCoordsInfo : Message

@property (nonatomic, copy) NSString* sLongitude;
@property (nonatomic, copy) NSString* sLatitude;


- (void) write: (BaseEncodeStream *)eos;

- (SecCoordsInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sCHNShortName;
@property (nonatomic, strong) PlateInfo* stPlateInfo;
@property (nonatomic, strong) NSMutableArray* vConcInfo;
@property (nonatomic, strong) NSMutableDictionary* mSecAttr;
@property (nonatomic, strong) NSMutableArray* vRelateSecInfo;
@property (nonatomic, strong) NSMutableArray* vStatusInfo;
@property (nonatomic, strong) NSMutableArray* vPlateInfo;
@property (nonatomic, strong) SecCoordsInfo* stSecCoordsInfo;


- (void) write: (BaseEncodeStream *)eos;

- (SecInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecAttr : Message

@property (nonatomic, strong) PlateInfo* stPlateInfo;
@property (nonatomic, strong) NSMutableDictionary* mSecAttr;


- (void) write: (BaseEncodeStream *)eos;

- (SecAttr *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecBaseInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (SecBaseInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecBaseInfoRsp : Message

@property (nonatomic, strong) NSMutableArray* vSecInfo;


- (void) write: (BaseEncodeStream *)eos;

- (SecBaseInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcBaseInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (ConcBaseInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcBaseInfoRsp : Message

@property (nonatomic, strong) NSMutableArray* vConcInfo;


- (void) write: (BaseEncodeStream *)eos;

- (ConcBaseInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcStockListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) ConcInfo* stConcInfo;


- (void) write: (BaseEncodeStream *)eos;

- (ConcStockListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelateSecInfo : Message

@property (nonatomic, assign) float fRelate;
@property (nonatomic, strong) SecInfo* stSecInfo;


- (void) write: (BaseEncodeStream *)eos;

- (RelateSecInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ConcStockListRsp : Message

@property (nonatomic, strong) NSMutableArray* vRelateSecInfo;


- (void) write: (BaseEncodeStream *)eos;

- (ConcStockListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FundBaseInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (FundBaseInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FundBaseInfoRsp : Message

@property (nonatomic, strong) FundInfo* stFundInfo;


- (void) write: (BaseEncodeStream *)eos;

- (FundBaseInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface Positions : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) int64_t lCapital;


- (void) write: (BaseEncodeStream *)eos;

- (Positions *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SeasonOperatingRevenue : Message

@property (nonatomic, assign) E_SEASON_TYPE eSeasonType;
@property (nonatomic, assign) float fIncome;
@property (nonatomic, assign) float fNetProfit;


- (void) write: (BaseEncodeStream *)eos;

- (SeasonOperatingRevenue *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OperatingRevenue : Message

@property (nonatomic, copy) NSString* sYear;
@property (nonatomic, assign) float fIncome;
@property (nonatomic, assign) float fYearOnYear;
@property (nonatomic, strong) NSMutableArray* vtSeasonOperatingRevenue;


- (void) write: (BaseEncodeStream *)eos;

- (OperatingRevenue *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface Profit : Message

@property (nonatomic, copy) NSString* sYear;
@property (nonatomic, assign) float fNetProfit;
@property (nonatomic, assign) float fYearOnYear;


- (void) write: (BaseEncodeStream *)eos;

- (Profit *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface Profitability : Message

@property (nonatomic, copy) NSString* sYear;
@property (nonatomic, assign) float fEPS;
@property (nonatomic, assign) float fROE;


- (void) write: (BaseEncodeStream *)eos;

- (Profitability *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinancePerformance : Message

@property (nonatomic, strong) NSMutableArray* vOperatingRevenue;
@property (nonatomic, copy) NSString* sOperatingDesc;
@property (nonatomic, strong) NSMutableArray* vProfit;
@property (nonatomic, copy) NSString* sProfitDesc;
@property (nonatomic, strong) NSMutableArray* vProfitability;
@property (nonatomic, copy) NSString* sProfitabilityDesc;
@property (nonatomic, assign) E_FR_UNIT eOPUnit;
@property (nonatomic, assign) E_FR_UNIT eProfitUnit;
@property (nonatomic, assign) E_FR_UNIT eEPSUnit;


- (void) write: (BaseEncodeStream *)eos;

- (FinancePerformance *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinancialAnalysis : Message

@property (nonatomic, copy) NSString* sEPS;
@property (nonatomic, copy) NSString* sBVPS;
@property (nonatomic, copy) NSString* sPB;
@property (nonatomic, copy) NSString* sROE;
@property (nonatomic, copy) NSString* sGrossRevenue;
@property (nonatomic, copy) NSString* sOperatingProfit;
@property (nonatomic, copy) NSString* sNetProfit;
@property (nonatomic, copy) NSString* sBusinessRevenueGrowth;
@property (nonatomic, copy) NSString* sProfitGrowth;
@property (nonatomic, copy) NSString* sNetGrowth;
@property (nonatomic, copy) NSString* sTotalAssets;
@property (nonatomic, copy) NSString* sTotalLiabilities;
@property (nonatomic, copy) NSString* sTotalEquities;
@property (nonatomic, copy) NSString* sLEV;
@property (nonatomic, copy) NSString* sOperationalCashFlow;
@property (nonatomic, copy) NSString* sInvestmentCashFlows;
@property (nonatomic, copy) NSString* sFinancingCashFlows;
@property (nonatomic, copy) NSString* sUpdateTime;
@property (nonatomic, copy) NSString* sNetCF;


- (void) write: (BaseEncodeStream *)eos;

- (FinancialAnalysis *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinanceReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (FinanceReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinanceRsp : Message

@property (nonatomic, strong) FinancePerformance* stFinancePerformance;
@property (nonatomic, strong) FinancialAnalysis* stFinancialAnalysis;


- (void) write: (BaseEncodeStream *)eos;

- (FinanceRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CompanyProfile : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sListingDate;
@property (nonatomic, copy) NSString* sIssuePrice;
@property (nonatomic, copy) NSString* sIssuanceNumber;
@property (nonatomic, copy) NSString* sRegion;
@property (nonatomic, copy) NSString* sIndustry;
@property (nonatomic, copy) NSString* sMainBusiness;
@property (nonatomic, copy) NSString* sListedAddr;
@property (nonatomic, copy) NSString* sCountry;
@property (nonatomic, copy) NSString* sSecCategory;
@property (nonatomic, copy) NSString* sTradingUnit;
@property (nonatomic, copy) NSString* sTransferType;
@property (nonatomic, copy) NSString* sMarketStartDate;
@property (nonatomic, copy) NSString* sMarketMakers;


- (void) write: (BaseEncodeStream *)eos;

- (CompanyProfile *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PrimeOperatingRevenue : Message

@property (nonatomic, copy) NSString* sTypeName;
@property (nonatomic, copy) NSString* sSalesRevenue;
@property (nonatomic, copy) NSString* sRatio;


- (void) write: (BaseEncodeStream *)eos;

- (PrimeOperatingRevenue *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DividendPayingPlacing : Message

@property (nonatomic, copy) NSString* sYear;
@property (nonatomic, copy) NSString* sDetail;
@property (nonatomic, copy) NSString* sDate;


- (void) write: (BaseEncodeStream *)eos;

- (DividendPayingPlacing *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalStructureDetail : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) int32_t iShareholderNumber;
@property (nonatomic, assign) float fPerCapitaHoldings;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalStructureDetail *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CapitalStructure : Message

@property (nonatomic, copy) NSString* sEquity;
@property (nonatomic, copy) NSString* sCirculationStock;
@property (nonatomic, copy) NSString* sShareholderNumber;
@property (nonatomic, copy) NSString* sPerCapitaHoldings;
@property (nonatomic, strong) NSMutableArray* vCapitalStructureDetail;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, copy) NSString* sFloatShare;


- (void) write: (BaseEncodeStream *)eos;

- (CapitalStructure *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopShareholder : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sRatio;
@property (nonatomic, assign) ShareholderChange eShareholderChange;
@property (nonatomic, copy) NSString* sChangeDetail;


- (void) write: (BaseEncodeStream *)eos;

- (TopShareholder *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface Fundsholder : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sRatio;
@property (nonatomic, assign) ShareholderChange eShareholderChange;
@property (nonatomic, copy) NSString* sChangeDetail;


- (void) write: (BaseEncodeStream *)eos;

- (Fundsholder *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CompanyDesc : Message

@property (nonatomic, strong) CompanyProfile* stCompanyProfile;
@property (nonatomic, strong) NSMutableArray* vPrimeOperatingRevenue;
@property (nonatomic, strong) NSMutableArray* vDividendPayingPlacing;
@property (nonatomic, strong) CapitalStructure* stCapitalStructure;
@property (nonatomic, strong) NSMutableArray* vTopShareholder;
@property (nonatomic, strong) NSMutableArray* vFundsholder;
@property (nonatomic, strong) NSMutableArray* vConcInfo;
@property (nonatomic, copy) NSString* sTopShareholderDate;
@property (nonatomic, copy) NSString* sFundsholderDate;
@property (nonatomic, strong) NSMutableArray* vPlateInfo;


- (void) write: (BaseEncodeStream *)eos;

- (CompanyDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CompanyReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (CompanyReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface CompanyRsp : Message

@property (nonatomic, strong) CompanyDesc* stCompanyDesc;


- (void) write: (BaseEncodeStream *)eos;

- (CompanyRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecUpdowns : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sWeekUd;
@property (nonatomic, copy) NSString* sMonthUd;
@property (nonatomic, copy) NSString* sThreeMonthUd;
@property (nonatomic, copy) NSString* sHalfYearUd;
@property (nonatomic, copy) NSString* sYearUd;


- (void) write: (BaseEncodeStream *)eos;

- (SecUpdowns *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StocksUpdownsReq : Message

@property (nonatomic, strong) NSMutableArray* vtDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (StocksUpdownsReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StocksUpdownsRsp : Message

@property (nonatomic, strong) NSMutableArray* vtSecUpdowns;


- (void) write: (BaseEncodeStream *)eos;

- (StocksUpdownsRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelateStocksUpdownsReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (RelateStocksUpdownsReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelateStocksUpdownsRsp : Message

@property (nonatomic, strong) NSMutableArray* vtSecUpdowns;
@property (nonatomic, assign) int32_t iUpdateTime;


- (void) write: (BaseEncodeStream *)eos;

- (RelateStocksUpdownsRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelateStocksSimpleFinanceAnalysisReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (RelateStocksSimpleFinanceAnalysisReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SimpleFinancialAnalysis : Message

@property (nonatomic, copy) NSString* sStockName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sROE;
@property (nonatomic, copy) NSString* sGrossRevenue;
@property (nonatomic, copy) NSString* sNetProfit;
@property (nonatomic, assign) float fNAPS;


- (void) write: (BaseEncodeStream *)eos;

- (SimpleFinancialAnalysis *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelateStocksSimpleFinanceAnalysisRsp : Message

@property (nonatomic, strong) NSMutableArray* vtFinancialAnalysis;
@property (nonatomic, assign) int32_t iUpdateTime;
@property (nonatomic, copy) NSString* sPlatePb;
@property (nonatomic, copy) NSString* sPlatePe;


- (void) write: (BaseEncodeStream *)eos;

- (RelateStocksSimpleFinanceAnalysisRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TagInfo : Message

@property (nonatomic, copy) NSString* sTagName;
@property (nonatomic, assign) E_TAG_TYPE eTagType;
@property (nonatomic, assign) E_ATTITUDE_TYPE eAttiType;


- (void) write: (BaseEncodeStream *)eos;

- (TagInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecValuation : Message

@property (nonatomic, copy) NSString* sStockName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sMarketValue;
@property (nonatomic, copy) NSString* sPe;
@property (nonatomic, copy) NSString* sPb;


- (void) write: (BaseEncodeStream *)eos;

- (SecValuation *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelaSecValuationReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (RelaSecValuationReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelaSecValuationRsp : Message

@property (nonatomic, strong) NSMutableArray* vtSecValuation;
@property (nonatomic, copy) NSString* sPeDesc;
@property (nonatomic, copy) NSString* sPbDesc;
@property (nonatomic, assign) int32_t iUpdateTime;
@property (nonatomic, copy) NSString* sPlatePb;
@property (nonatomic, copy) NSString* sPlatePe;


- (void) write: (BaseEncodeStream *)eos;

- (RelaSecValuationRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface OrgRate : Message

@property (nonatomic, copy) NSString* sOrgName;
@property (nonatomic, assign) int32_t iRate;
@property (nonatomic, copy) NSString* sChange;
@property (nonatomic, copy) NSString* sTargetPrice;
@property (nonatomic, assign) int32_t iDate;


- (void) write: (BaseEncodeStream *)eos;

- (OrgRate *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecRateReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void) write: (BaseEncodeStream *)eos;

- (SecRateReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecRateRsp : Message

@property (nonatomic, strong) NSMutableArray* vtOrgRate;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, assign) float fRate;


- (void) write: (BaseEncodeStream *)eos;

- (SecRateRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface UserInfoCache : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iUpdateTime;


- (void) write: (BaseEncodeStream *)eos;

- (UserInfoCache *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisMonthQuotaInfo : Message

@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) float fRisePct;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisMonthQuotaInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisAvgRiseQuotaInfo : Message

@property (nonatomic, assign) int32_t iMonth;
@property (nonatomic, assign) float fRisePct;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisAvgRiseQuotaInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisAvgRiseChanceQuotaInfo : Message

@property (nonatomic, assign) int32_t iMonth;
@property (nonatomic, assign) float fRiseChance;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisAvgRiseChanceQuotaInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisMonthQuota : Message

@property (nonatomic, strong) NSMutableArray* vMonthInfo;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisMonthQuota *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisSingalQuota : Message

@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, strong) NSMutableArray* vInfo;
@property (nonatomic, copy) NSString* sSelectName;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisSingalQuota *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecLHHisQuota : Message

@property (nonatomic, copy) NSString* sMainTitle;
@property (nonatomic, strong) NSMutableArray* vQuota;
@property (nonatomic, copy) NSString* sBannerUrl;
@property (nonatomic, copy) NSString* sBannerDesc;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, copy) NSString* sBannerSkipUrl;


- (void) write: (BaseEncodeStream *)eos;

- (SecLHHisQuota *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisAvgRiseQuota : Message

@property (nonatomic, strong) NSMutableArray* vAvgRiseInfo;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisAvgRiseQuota *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisAvgRiseChanceQuota : Message

@property (nonatomic, strong) NSMutableArray* vAvgRiseChanceInfo;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisAvgRiseChanceQuota *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecHistoryReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iMonth;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecHistoryReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecHistoryRsp : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iMonth;
@property (nonatomic, strong) SecHisMonthQuota* stMonthQuota;
@property (nonatomic, strong) SecHisAvgRiseQuota* stAvgRiseQuota;
@property (nonatomic, strong) SecHisAvgRiseChanceQuota* stAvgRiseChanceQuota;
@property (nonatomic, strong) SecLHHisQuota* stLHQuota;
@property (nonatomic, strong) NSMutableArray* vSubjectQuota;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecHistoryRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisWeekQuotaInfo : Message

@property (nonatomic, assign) int32_t iWeek;
@property (nonatomic, assign) float fAvgUpPct;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisWeekQuotaInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecHisWeekQuota : Message

@property (nonatomic, strong) NSMutableArray* vWeekInfo;


- (void) write: (BaseEncodeStream *)eos;

- (SecHisWeekQuota *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecWeekHistoryReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iWeek;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecWeekHistoryReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecWeekHistoryRsp : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) SecHisWeekQuota* stWeekQuota;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iWeek;
@property (nonatomic, assign) float fAvgUpPct;
@property (nonatomic, assign) float fAvgUpChancePct;
@property (nonatomic, assign) int32_t iYearNum;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecWeekHistoryRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecPeriodHistoryReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, copy) NSString* sTradingDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecPeriodHistoryReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecPeriodHistoryRsp : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fRisePct;
@property (nonatomic, assign) float fRiseChance;
@property (nonatomic, strong) SecHisMonthQuota* stMonthQuota;
@property (nonatomic, copy) NSString* sTradingDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecPeriodHistoryRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecMonthTopUpReq : Message

@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iMonth;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecMonthTopUpReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface HisTopSecItem : Message

@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iTotalYear;
@property (nonatomic, assign) int32_t iUpYear;
@property (nonatomic, assign) float fRisePct;
@property (nonatomic, assign) float fRiseChance;


- (void) write: (BaseEncodeStream *)eos;

- (HisTopSecItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecMonthTopUpRsp : Message

@property (nonatomic, strong) NSMutableArray* vItem;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iMonth;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecMonthTopUpRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPlateMonthTopReq : Message

@property (nonatomic, copy) NSString* sPlateCode;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iMonth;


- (void) write: (BaseEncodeStream *)eos;

- (GetPlateMonthTopReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPlateMonthTopRsp : Message

@property (nonatomic, copy) NSString* sPlateCode;
@property (nonatomic, copy) NSString* sPlateName;
@property (nonatomic, strong) NSMutableArray* vItem;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iMonth;


- (void) write: (BaseEncodeStream *)eos;

- (GetPlateMonthTopRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPlateWeekTopReq : Message

@property (nonatomic, copy) NSString* sPlateCode;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iWeekDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetPlateWeekTopReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPlateWeekTopRsp : Message

@property (nonatomic, copy) NSString* sPlateCode;
@property (nonatomic, copy) NSString* sPlateName;
@property (nonatomic, strong) NSMutableArray* vItem;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, assign) int32_t iWeekDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetPlateWeekTopRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPlatePeriodTopReq : Message

@property (nonatomic, copy) NSString* sPlateCode;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, copy) NSString* sTradingDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetPlatePeriodTopReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetPlatePeriodTopRsp : Message

@property (nonatomic, copy) NSString* sPlateCode;
@property (nonatomic, copy) NSString* sPlateName;
@property (nonatomic, strong) NSMutableArray* vItem;
@property (nonatomic, assign) int32_t iYear;
@property (nonatomic, copy) NSString* sTradingDay;


- (void) write: (BaseEncodeStream *)eos;

- (GetPlatePeriodTopRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelatedNews : Message

@property (nonatomic, copy) NSString* sNewsId;
@property (nonatomic, copy) NSString* sTitle;


- (void) write: (BaseEncodeStream *)eos;

- (RelatedNews *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RelatedSecurity : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sCode;
@property (nonatomic, copy) NSString* sDtCode;


- (void) write: (BaseEncodeStream *)eos;

- (RelatedSecurity *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetNewsRelationInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sNewsId;


- (void) write: (BaseEncodeStream *)eos;

- (GetNewsRelationInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetNewsRelationInfoRsp : Message

@property (nonatomic, copy) NSString* sNewsId;
@property (nonatomic, strong) NSMutableArray* vRelatedNews;
@property (nonatomic, strong) NSMutableArray* vRelatedPlates;
@property (nonatomic, strong) NSMutableArray* vRelatedStocks;
@property (nonatomic, strong) NSMutableArray* vRelatedTags;


- (void) write: (BaseEncodeStream *)eos;

- (GetNewsRelationInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InvestAdvisor : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sOrgName;
@property (nonatomic, copy) NSString* sFaceUrl;


- (void) write: (BaseEncodeStream *)eos;

- (InvestAdvisor *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InvestAdviseInfo : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sQuestion;
@property (nonatomic, copy) NSString* sAnwser;
@property (nonatomic, strong) InvestAdvisor* stInvestAdvisor;
@property (nonatomic, assign) int32_t iUpdateTime;


- (void) write: (BaseEncodeStream *)eos;

- (InvestAdviseInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InvestAdviseInfoList : Message

@property (nonatomic, strong) NSMutableArray* vInvestAdviseInfo;


- (void) write: (BaseEncodeStream *)eos;

- (InvestAdviseInfoList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DtSecStatItem : Message

@property (nonatomic, copy) NSString* sTradingDay;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, copy) NSString* sImgUrl;
@property (nonatomic, assign) int32_t iUpdateTime;


- (void) write: (BaseEncodeStream *)eos;

- (DtSecStatItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecStatListReq : Message

@property (nonatomic, assign) int32_t iStart;
@property (nonatomic, assign) int32_t iWantNum;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecStatListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetSecStatListRsp : Message

@property (nonatomic, strong) NSMutableArray* vItem;


- (void) write: (BaseEncodeStream *)eos;

- (GetSecStatListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
