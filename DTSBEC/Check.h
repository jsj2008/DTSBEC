#ifndef Check_h
#define Check_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "NewsInfo.h"

typedef NS_ENUM(NSUInteger, E_REFRESH_FUNC_TYPE) {
    E_RFT_GET_SEC_BASE = 1,
    E_RFT_GET_CONC_STOCK_LIST = 2,
    E_RFT_GET_CONC_BASE_INFO = 3,
    E_RFT_GET_COMPANY = 4,
    E_RFT_GET_FINANCE = 5,
    E_RFT_GET_STOCK_RATE = 6,
    E_RFT_GET_STOCK_VAL = 7,
    E_RFT_GET_STOCK_NEWS_LIST = 8,
    E_RFT_GET_STOCK_NEWS_CONTENT = 9,
    E_RFT_GET_DISC_NEWS_LIST = 10,
    E_RFT_GET_DISC_NEWS_CONTENT = 11,
    E_RFT_GET_SIMILAR_KLINE = 12
};

/////////////////////////////////////////////////////////////////
@interface RefreshSecInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, strong) NSArray* vtFuncType;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, copy) NSString* sNewsId;


- (void)write: (BaseEncodeStream *)eos;

- (RefreshSecInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface RefreshDataReq : Message

@property (nonatomic, strong) NSArray* vtRefreshSecInfo;


- (void)write: (BaseEncodeStream *)eos;

- (RefreshDataReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface RefreshDataRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void)write: (BaseEncodeStream *)eos;

- (RefreshDataRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
