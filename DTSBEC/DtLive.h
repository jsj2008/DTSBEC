#ifndef DtLive_h
#define DtLive_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "UserPortfolio.h"
#import "Beacon.h"
#import "Quote.h"
#import "SecBase.h"

typedef NS_ENUM(NSUInteger, DtliveErrCode) {
    E_SUCC = 0,
    E_ERR_NOT_LOGIN = 1,
    E_ERR_SVR = 99
};

typedef NS_ENUM(NSUInteger, DtLiveType) {
    E_LIVE_PORTFOLIO = 0,
    E_LIVE_MARKET = 1,
    E_LIVE_ALL = 2
};

typedef NS_ENUM(NSUInteger, MarketLiveMsgType) {
    E_LIVE_MSG_CHANGE_LIMIT = 0,
    E_LIVE_MSG_OPEN = 1,
    E_LIVE_MSG_MORNING_CLOSE = 2,
    E_LIVE_MSG_CLOSE = 3,
    E_LIVE_MSG_INDEX_CHANGE = 4,
    E_LIVE_MSG_PLATE_CHANGE = 5,
    E_LIVE_MSG_THEME_CHANGE = 6,
    E_LIVE_MSG_INDEX_FUND_MOVE = 7,
    E_LIVE_MSG_PLATE_FUND_MOVE = 8,
    E_LIVE_MSG_THEME_FUND_MOVE = 9,
    E_LIVE_MSG_HOUR_INDEX_CHANGE = 10,
    E_LIVE_MSG_PLATE_OPEN = 11,
    E_LIVE_MSG_PLATE_MORNING_CLOSE = 12,
    E_LIVE_MSG_PLATE_CLOSE = 13,
    E_LIVE_MSG_PLATE_HOUR = 14,
    E_LIVE_MSG_SEC_OPEN = 15,
    E_LIVE_MSG_SEC_MORNING_CLOSE = 16,
    E_LIVE_MSG_SEC_CLOSE = 17,
    E_LIVE_MSG_SEC_HOUR = 18
};

/////////////////////////////////////////////////////////////////
@interface PortfolioLiveMsgDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, assign) int32_t iMsgType;
@property (nonatomic, assign) int32_t iTotalNum;


- (void)write: (BaseEncodeStream *)eos;

- (PortfolioLiveMsgDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketLiveMsgDesc : Message

@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, assign) int32_t iMsgType;
@property (nonatomic, copy) NSString* sSimpleMsg;


- (void)write: (BaseEncodeStream *)eos;

- (MarketLiveMsgDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetLiveReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iTime;


- (void)write: (BaseEncodeStream *)eos;

- (GetLiveReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetLiveRsp : Message

@property (nonatomic, strong) NSArray* vPortfolioLive;
@property (nonatomic, strong) NSArray* vMarketLive;


- (void)write: (BaseEncodeStream *)eos;

- (GetLiveRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetBoxLiveReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, assign) int32_t iTime;


- (void)write: (BaseEncodeStream *)eos;

- (GetBoxLiveReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetBoxLiveRsp : Message

@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, copy) NSString* sSkipUrl;
@property (nonatomic, assign) int32_t iMsgType;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, assign) int32_t iLiveType;
@property (nonatomic, assign) int32_t iLiveMsgStatus;


- (void)write: (BaseEncodeStream *)eos;

- (GetBoxLiveRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface RecordMakertDesc : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fOpen;
@property (nonatomic, assign) float fNow;
@property (nonatomic, assign) float fClose;
@property (nonatomic, assign) int64_t lVolume;
@property (nonatomic, assign) int64_t lAmount;


- (void)write: (BaseEncodeStream *)eos;

- (RecordMakertDesc *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface RecordMakertMap : Message

@property (nonatomic, strong) NSDictionary* mRecordMakertDesc;


- (void)write: (BaseEncodeStream *)eos;

- (RecordMakertMap *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketLiveCacheInfo : Message

@property (nonatomic, strong) NSArray* vMarketLive;
@property (nonatomic, strong) NSArray* vSecLimit;
@property (nonatomic, copy) NSString* sDay;


- (void)write: (BaseEncodeStream *)eos;

- (MarketLiveCacheInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecLargeUnitInfo : Message

@property (nonatomic, strong) LargeUnitDesc* stDesc;
@property (nonatomic, assign) int32_t iTotalNum;


- (void)write: (BaseEncodeStream *)eos;

- (SecLargeUnitInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface LargeUnitCacheInfo : Message

@property (nonatomic, strong) NSDictionary* mLargeUnit;


- (void)write: (BaseEncodeStream *)eos;

- (LargeUnitCacheInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MinLimitSecCacheInfo : Message

@property (nonatomic, strong) NSArray* vSecLimit;
@property (nonatomic, copy) NSString* sDay;


- (void)write: (BaseEncodeStream *)eos;

- (MinLimitSecCacheInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ChoosedLimitSecCacheInfo : Message

@property (nonatomic, strong) NSDictionary* mChoosedLimitSec;


- (void)write: (BaseEncodeStream *)eos;

- (ChoosedLimitSecCacheInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ChangeFor5MinCacheInfo : Message

@property (nonatomic, strong) NSDictionary* mChangeInfo;


- (void)write: (BaseEncodeStream *)eos;

- (ChangeFor5MinCacheInfo *) read: (BaseDecodeStream *)dos;

@end

#endif
