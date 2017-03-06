#ifndef NewsInfo_h
#define NewsInfo_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, E_NEWS_TYPE) {
    NT_UNKNOWN = 0,
    NT_NEWS = 1,
    NT_REPORT = 2,
    NT_ANNOUNCEMENT = 3,
    NT_DISC_NEWS = 4,
    NT_TEMP_ANN = 5,
    NT_CONC_NEWS = 6,
    NT_RSS_NEWS = 7,
    NT_RSS_MORN_NEWS = 8,
    NT_NEWSMARKERS = 9,
    NT_FLASHNEWS = 10,
    NT_ALLMAKERT_NEWS = 11
};

typedef NS_ENUM(NSUInteger, E_NEWS_ATTITUDE) {
    NA_UNKOWN = 99,
    NA_MBUY = 10,
    NA_BUY = 13,
    NA_WAIT = 20,
    NA_SOLD = 30,
    NA_MSOLD = 33
};

typedef NS_ENUM(NSUInteger, E_NEWS_DB_SOURCE) {
    NDS_HS_NEWS = 101,
    NDS_HS_ANN = 102,
    NDS_HS_TMP_ANN = 103,
    NDS_HS_REPORT = 104,
    NDS_HS_HK_NEWS = 105,
    NDS_HS_US_NEWS = 107,
    NDS_HS_FUND_ANN = 108,
    NDS_HS_FUND_TEMP_ANN = 109,
    NDS_JC_SZ_ANN = 201,
    NDS_JC_SH_ANN = 202,
    NDS_JC_FUND = 203,
    NDS_JC_HK_ANN = 204,
    NDS_DT_SELF = 1,
    NDS_DT_SPIDE_NEWS = 2,
    NDS_DT_RSS_NEWS = 3,
    NDS_DT_RSS_MORN_NEWS = 4,
    NDS_DT_SPIDER_PUSH = 5,
    NDS_DT_SPIDER_HK_NEWS = 6,
    NDS_DT_SPIDER_US_NEWS = 7,
    NDS_DT_SPIDER_XWLB = 8,
    NDS_UP_CONC_NEWS = 301,
    NDS_UP_JGDY_NEWS = 302,
    NDS_UP_CALE_STK = 303,
    NDS_UP_ORIGI_NEWS_MAIN = 304,
    NDS_UP_ANNC = 305,
    NDS_UP_REPORT = 306,
    NDS_UP_TB_NEWS = 307,
    NDS_UP_TB_ANNC = 308,
    NDS_UP_TB_REPORT = 309,
    NDS_UP_TB_NEWSMARKERS = 310,
    NDS_UP_NEWS = 311,
    NDS_UP_HK_NEWS = 312,
    NDS_UP_US_NEWS = 313,
    NDS_UP_FUND_ANN = 314,
    NDS_UP_HK_REPORT = 315
};

typedef NS_ENUM(NSUInteger, E_NEWS_TABLE_LIST) {
    E_TL_UNKNOWN = 0,
    E_TL_A_STOCK_NEWS_TABLE = 1,
    E_TL_HK_STOCK_NEWS_TABLE = 2,
    E_TL_US_STOCK_NEWS_TABLE = 3,
    E_TL_CON_UP_NEWS_TABLE = 4,
    E_TL_A_STOCK_REPORT_TABLE = 5,
    E_TL_HK_STOCK_REPORT_TABLE = 6,
    E_TL_A_STOCK_ANN_TABLE = 7,
    E_TL_A_FUND_ANN_TABLE = 8,
    E_TL_DISC_NEWS_TABLE = 9,
    E_TL_RSS_NEWS_TABLE = 10,
    E_TL_RSS_MORNING_NEWS_TABLE = 11,
    E_TL_A_NEWSMARKERS_TABLE = 12,
    E_TL_FLASH_NEWS_TABLE = 13,
    E_TL_HK_STOCK_ANN_TABLE = 14,
    E_TL_TB_STOCK_NEWS_TABLE = 15,
    E_TL_TB_STOCK_ANN_TABLE = 16,
    E_TL_TB_STOCK_REPORT_TABLE = 17,
    E_TL_TB_NEWSMARKERS_TABLE = 18
};

typedef NS_ENUM(NSUInteger, E_NEWS_FLAG) {
    E_NF_NORMAL = 0,
    E_NF_TOPIC = 1,
    E_NF_TOP = 2
};

typedef NS_ENUM(NSUInteger, E_CHANNEL_TYPE) {
    E_CT_PUBLIC = 0,
    E_CT_CQTV = 1
};

typedef NS_ENUM(NSUInteger, E_NEWS_GET_SOURCE) {
    E_NGS_MARKET_GET = 1,
    E_NGS_NEWSLIST_GET = 2
};

/////////////////////////////////////////////////////////////////
@interface NewsId : Message

@property (nonatomic, copy) NSString* sTime;
@property (nonatomic, copy) NSString* sId;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, assign) E_MARKET_TYPE eMarketType;
@property (nonatomic, assign) E_SEC_TYPE eSecType;
@property (nonatomic, assign) E_NEWS_DB_SOURCE eDataDbSource;
@property (nonatomic, assign) E_NEWS_TABLE_LIST eNewsTable;


- (void)write: (BaseEncodeStream *)eos;

- (NewsId *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface VideoConfig : Message

@property (nonatomic, copy) NSString* sVideoName;
@property (nonatomic, strong) NSDictionary* mChannelConfig;


- (void)write: (BaseEncodeStream *)eos;

- (VideoConfig *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsDesc : Message

@property (nonatomic, copy) NSString* sNewsID;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, copy) NSString* sFrom;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSArray* vtTagInfo;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, copy) NSString* sDtInfoUrl;
@property (nonatomic, assign) int32_t iStyleType;
@property (nonatomic, strong) NSArray* vtRelaStock;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, copy) NSString* sThirdUrl;
@property (nonatomic, assign) int32_t iCreateTime;
@property (nonatomic, copy) NSString* sSubTypeName;
@property (nonatomic, assign) int32_t iPublish;
@property (nonatomic, copy) NSString* sImgUrl;
@property (nonatomic, assign) E_NEWS_FLAG eNewsFlag;
@property (nonatomic, assign) int32_t iShow;
@property (nonatomic, strong) NSArray* vVideoConfig;
@property (nonatomic, assign) int32_t iTopicId;


- (void)write: (BaseEncodeStream *)eos;

- (NewsDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsList : Message

@property (nonatomic, strong) NSArray* vNewsDesc;


- (void)write: (BaseEncodeStream *)eos;

- (NewsList *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sStartId;
@property (nonatomic, copy) NSString* sEndId;
@property (nonatomic, assign) E_NEWS_GET_SOURCE eGetSource;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;


- (void)write: (BaseEncodeStream *)eos;

- (NewsReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsRsp : Message

@property (nonatomic, strong) NewsList* stNewsList;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, copy) NSString* sNextNewsID;


- (void)write: (BaseEncodeStream *)eos;

- (NewsRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsContentReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sNewsID;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, assign) E_SEC_TYPE eSecType;


- (void)write: (BaseEncodeStream *)eos;

- (NewsContentReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsContentRsp : Message

@property (nonatomic, strong) NewsDesc* stNewsDesc;


- (void)write: (BaseEncodeStream *)eos;

- (NewsContentRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsSimple : Message

@property (nonatomic, copy) NSString* sNewsID;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, assign) E_SEC_TYPE eSecType;


- (void)write: (BaseEncodeStream *)eos;

- (NewsSimple *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsListReq : Message

@property (nonatomic, strong) NSArray* vNewsSimple;


- (void)write: (BaseEncodeStream *)eos;

- (NewsListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsListRsp : Message

@property (nonatomic, strong) NSDictionary* mNewsDesc;


- (void)write: (BaseEncodeStream *)eos;

- (NewsListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface FlashNewsListReq : Message

@property (nonatomic, copy) NSString* sStartId;
@property (nonatomic, copy) NSString* sEndId;
@property (nonatomic, strong) UserInfo* stUserInfo;


- (void)write: (BaseEncodeStream *)eos;

- (FlashNewsListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface FlashNewsListRsp : Message

@property (nonatomic, strong) NSArray* vtId;
@property (nonatomic, copy) NSString* sNextNewsID;


- (void)write: (BaseEncodeStream *)eos;

- (FlashNewsListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface FlashNewsContentReq : Message

@property (nonatomic, strong) NSArray* vtId;


- (void)write: (BaseEncodeStream *)eos;

- (FlashNewsContentReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface FlashNewsContentRsp : Message

@property (nonatomic, strong) NSArray* vtNewsDesc;


- (void)write: (BaseEncodeStream *)eos;

- (FlashNewsContentRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface DiscoveryNewsReq : Message

@property (nonatomic, copy) NSString* sStartId;
@property (nonatomic, copy) NSString* sEndId;
@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_NEWS_FLAG eNewsFlag;
@property (nonatomic, assign) int32_t iSupportTop;
@property (nonatomic, assign) int32_t iSupportTopic;
@property (nonatomic, assign) E_CHANNEL_TYPE eChannelType;


- (void)write: (BaseEncodeStream *)eos;

- (DiscoveryNewsReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface DiscoveryNewsIdListRsp : Message

@property (nonatomic, strong) NSArray* vtId;
@property (nonatomic, copy) NSString* sNextNewsID;


- (void)write: (BaseEncodeStream *)eos;

- (DiscoveryNewsIdListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface DiscoveryNewsContentReq : Message

@property (nonatomic, strong) NSArray* vtId;
@property (nonatomic, assign) E_CHANNEL_TYPE eChannelType;


- (void)write: (BaseEncodeStream *)eos;

- (DiscoveryNewsContentReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface DiscoveryNewsContentRsp : Message

@property (nonatomic, strong) NSArray* vtNewsDesc;
@property (nonatomic, copy) NSString* sNextNewsID;


- (void)write: (BaseEncodeStream *)eos;

- (DiscoveryNewsContentRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecNewsIdListReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, copy) NSString* sCurNewestId;
@property (nonatomic, assign) BOOL bForceUpdate;
@property (nonatomic, assign) BOOL bGetIncrementRsp;


- (void)write: (BaseEncodeStream *)eos;

- (SecNewsIdListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecNewsIdListRsp : Message

@property (nonatomic, strong) NSArray* vtId;


- (void)write: (BaseEncodeStream *)eos;

- (SecNewsIdListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecNewsContentReq : Message

@property (nonatomic, strong) NSArray* vtId;
@property (nonatomic, assign) E_SEC_TYPE eSecType;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;


- (void)write: (BaseEncodeStream *)eos;

- (SecNewsContentReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecNewsContentRsp : Message

@property (nonatomic, strong) NSArray* vtNewsDesc;


- (void)write: (BaseEncodeStream *)eos;

- (SecNewsContentRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ModifyNewsContentReq : Message

@property (nonatomic, strong) NewsId* stNewsId;
@property (nonatomic, assign) BOOL bDelete;
@property (nonatomic, strong) NSArray* vtDtSecCode;


- (void)write: (BaseEncodeStream *)eos;

- (ModifyNewsContentReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetUpInfoIdListReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;


- (void)write: (BaseEncodeStream *)eos;

- (GetUpInfoIdListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface UpInfoIdList : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, strong) NSDictionary* mNewsDesc;


- (void)write: (BaseEncodeStream *)eos;

- (UpInfoIdList *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SetUpInfoIdListRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void)write: (BaseEncodeStream *)eos;

- (SetUpInfoIdListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsPageReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, copy) NSString* sPageNo;
@property (nonatomic, assign) int32_t iSupportTop;
@property (nonatomic, assign) int32_t iSupportTopic;
@property (nonatomic, assign) E_CHANNEL_TYPE eChannelType;


- (void)write: (BaseEncodeStream *)eos;

- (NewsPageReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface NewsPageRsp : Message

@property (nonatomic, strong) NewsList* stNewsList;
@property (nonatomic, assign) int32_t iTotalPageNum;
@property (nonatomic, assign) int32_t iTotalDataNum;


- (void)write: (BaseEncodeStream *)eos;

- (NewsPageRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AdditionProgress : Message

@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, copy) NSString* sProgress;


- (void)write: (BaseEncodeStream *)eos;

- (AdditionProgress *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AdditionDesc : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, copy) NSString* sProcess;
@property (nonatomic, copy) NSString* sProcessDate;
@property (nonatomic, assign) float fFund;
@property (nonatomic, assign) float fCount;
@property (nonatomic, assign) float fPrice;
@property (nonatomic, copy) NSString* sObject;
@property (nonatomic, copy) NSString* sProject;
@property (nonatomic, assign) float fLatestPrice;
@property (nonatomic, assign) float fDiffRate;
@property (nonatomic, copy) NSString* sIndustry;
@property (nonatomic, strong) NSArray* vProgress;
@property (nonatomic, strong) NSArray* vRelAnnc;


- (void)write: (BaseEncodeStream *)eos;

- (AdditionDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AdditionListReq : Message

@property (nonatomic, copy) NSString* sStartId;
@property (nonatomic, copy) NSString* sEndId;
@property (nonatomic, strong) UserInfo* stUserInfo;


- (void)write: (BaseEncodeStream *)eos;

- (AdditionListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AdditionListRsp : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, strong) NSArray* vAdditionDesc;
@property (nonatomic, copy) NSString* sNextId;


- (void)write: (BaseEncodeStream *)eos;

- (AdditionListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AdditionDetailReq : Message

@property (nonatomic, strong) NSArray* vDtSecCode;
@property (nonatomic, strong) UserInfo* stUserInfo;


- (void)write: (BaseEncodeStream *)eos;

- (AdditionDetailReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AdditionDetailRsp : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, strong) NSArray* vAdditionDesc;


- (void)write: (BaseEncodeStream *)eos;

- (AdditionDetailRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AdditionBreifInfoReq : Message

@property (nonatomic, strong) NSArray* vDtSecCode;
@property (nonatomic, strong) UserInfo* stUserInfo;


- (void)write: (BaseEncodeStream *)eos;

- (AdditionBreifInfoReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AdditionBreifInfoRsp : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, strong) NSDictionary* mAdditionBreifInfo;


- (void)write: (BaseEncodeStream *)eos;

- (AdditionBreifInfoRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetInvestAdvisorListReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;


- (void)write: (BaseEncodeStream *)eos;

- (GetInvestAdvisorListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetInvestAdvisorListRsp : Message

@property (nonatomic, strong) InvestAdviseInfoList* stInvestAdviseInfoList;


- (void)write: (BaseEncodeStream *)eos;

- (GetInvestAdvisorListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TopicSubDir : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, strong) NSArray* vNewsIdList;


- (void)write: (BaseEncodeStream *)eos;

- (TopicSubDir *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TopicInfo : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sImg;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, assign) int32_t iCreatetime;
@property (nonatomic, strong) NewsDesc* stFaceNews;
@property (nonatomic, strong) NSArray* vTopicSubDir;


- (void)write: (BaseEncodeStream *)eos;

- (TopicInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TopicInfoReq : Message

@property (nonatomic, assign) int32_t iTopicId;
@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_CHANNEL_TYPE eChannelType;


- (void)write: (BaseEncodeStream *)eos;

- (TopicInfoReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface TopicInfoRsp : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, strong) TopicInfo* stTopicInfo;


- (void)write: (BaseEncodeStream *)eos;

- (TopicInfoRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
