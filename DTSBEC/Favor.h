#ifndef Favor_h
#define Favor_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "NewsInfo.h"
#import "Account.h"

typedef NS_ENUM(NSUInteger, E_FAVOR_RET) {
    E_FR_SUCC = 0,
    E_FR_ERROR = -1,
    E_FR_NO_NEED_UPDATE = 1
};

typedef NS_ENUM(NSUInteger, E_FAVOR_ACTION) {
    E_FA_ADD = 0,
    E_FA_DEL = 1
};

/////////////////////////////////////////////////////////////////
@interface FavorNews : Message

@property (nonatomic, copy) NSString* sNewsID;
@property (nonatomic, assign) E_NEWS_TYPE eNewsType;
@property (nonatomic, strong) NewsDesc* stNewsDesc;
@property (nonatomic, assign) E_SEC_TYPE eSecType;
@property (nonatomic, assign) int32_t iTimeStamp;


- (void)write: (BaseEncodeStream *)eos;

- (FavorNews *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface FavorAction : Message

@property (nonatomic, strong) FavorNews* stFavorNews;
@property (nonatomic, assign) E_FAVOR_ACTION eFavorAction;


- (void)write: (BaseEncodeStream *)eos;

- (FavorAction *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface FavorList : Message

@property (nonatomic, strong) NSArray* vFavorNews;
@property (nonatomic, assign) int32_t iVersion;


- (void)write: (BaseEncodeStream *)eos;

- (FavorList *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QueryFavorNewsReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iVersion;


- (void)write: (BaseEncodeStream *)eos;

- (QueryFavorNewsReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QueryFavorNewsRsp : Message

@property (nonatomic, strong) FavorList* stFavorList;


- (void)write: (BaseEncodeStream *)eos;

- (QueryFavorNewsRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SaveFavorNewsReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) NSArray* vFavorAction;


- (void)write: (BaseEncodeStream *)eos;

- (SaveFavorNewsReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SaveFavorNewsRsp : Message

@property (nonatomic, assign) E_FAVOR_RET eRet;


- (void)write: (BaseEncodeStream *)eos;

- (SaveFavorNewsRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
