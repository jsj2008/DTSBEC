#ifndef Stat_h
#define Stat_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, BEACON_STAT_TYPE) {
    E_BST_PUSH = 0,
    E_BST_SEC_ACCESS = 1,
    E_BST_APP_INSTALL = 2,
    E_BST_MAP_POSIITON = 3,
    E_BST_STAY_TIME = 4,
    E_BST_PORTFOLIO_PAGE = 5,
    E_BST_MARKET_QUOTE_PAGE = 6,
    E_BST_MARKET_QUOTE_FUNC = 7,
    E_BST_SEC_DETAIL_PAGE = 8,
    E_BST_SEC_DETAIL_KLINE = 9,
    E_BST_SEC_DETAIL_TECHNOLOGY = 10,
    E_BST_SEC_DETAIL_FUNC = 11,
    E_BST_MARKET_NEWS = 12,
    E_BST_SEC_NEWS = 13,
    E_BST_SMART_PICK = 14,
    E_BST_VIEW_NOTIFY_BAR = 15,
    E_BST_VIEW_MSG_CENTER = 16,
    E_BST_VIEW_PRIVI = 17,
    E_BST_BIAOGE_PAGE = 18,
    E_BST_SEARCH_PAGE = 19
};

typedef NS_ENUM(NSUInteger, BEACON_STAT_FUNCTION) {
    LOG_STAT = 0,
    NUMBER_STAT = 1
};

/////////////////////////////////////////////////////////////////
@interface BeaconStatData : Message

@property (nonatomic, assign) uint32_t iTime;
@property (nonatomic, assign) BEACON_STAT_TYPE eType;
@property (nonatomic, copy) NSString* sData;
@property (nonatomic, strong) NSMutableDictionary* mNumberData;
@property (nonatomic, assign) BEACON_STAT_FUNCTION eFunc;


- (void) write: (BaseEncodeStream *)eos;

- (BeaconStatData *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface BeaconStat : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vBeaconStatData;
@property (nonatomic, assign) int8_t cVersion;


- (void) write: (BaseEncodeStream *)eos;

- (BeaconStat *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FeedBackReq : Message

@property (nonatomic, assign) int32_t iAccountId;
@property (nonatomic, copy) NSString* sGuid;
@property (nonatomic, copy) NSString* sUA;
@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, copy) NSString* sContact;


- (void) write: (BaseEncodeStream *)eos;

- (FeedBackReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
