#ifndef SecBase_h
#define SecBase_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
//#import "InvestAdviser.h"

typedef NS_ENUM(NSUInteger, E_SECBASE_RET) {
    E_SB_SUCC = 0,
    E_SB_EXCEPTION = 1000,
    E_SB_PARAM_ERROR = 1001
};

typedef NS_ENUM(NSUInteger, E_SEC_LIVE_MSG_TYPE) {
    E_SLMT_GOOD = 0,
    E_SLMT_BAD = 1,
    E_SLMT_NORMAL = 2
};

/////////////////////////////////////////////////////////////////
@interface SecLiveMsg : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, copy) NSString* sMsg;
@property (nonatomic, assign) E_SEC_LIVE_MSG_TYPE eSecLiveMsgType;


- (void)write: (BaseEncodeStream *)eos;

- (SecLiveMsg *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecLiveMsgReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sId;


- (void)write: (BaseEncodeStream *)eos;

- (SecLiveMsgReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecLiveMsgRsp : Message

@property (nonatomic, strong) NSArray* vSecLiveMsg;
@property (nonatomic, assign) int32_t iLiveMsgStatus;


- (void)write: (BaseEncodeStream *)eos;

- (SecLiveMsgRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
