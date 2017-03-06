#ifndef PushControl_h
#define PushControl_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Notification.h"

typedef NS_ENUM(NSUInteger, E_PUSH_CONTROL_RET) {
    E_PCR_SUCCESS = 0,
    E_PCR_EXCEPTION = 1000,
    E_PCR_TOO_FREQUENT = 1001
};

typedef NS_ENUM(NSUInteger, E_PUSH_CAST_TYPE) {
    E_PCT_UNICAST = 1,
    E_PCT_BROADCAST = 2
};

/////////////////////////////////////////////////////////////////
@interface CheckUserPushReq : Message

@property (nonatomic, strong) NSArray* vtId;
@property (nonatomic, strong) PushType* stPushType;
@property (nonatomic, assign) E_FREQUENT_CONTROY_TYPE eFreqControlType;
@property (nonatomic, assign) E_PUSH_CAST_TYPE ePushCastType;


- (void)write: (BaseEncodeStream *)eos;

- (CheckUserPushReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CheckUserPushRsp : Message

@property (nonatomic, strong) NSDictionary* mpCheckResult;


- (void)write: (BaseEncodeStream *)eos;

- (CheckUserPushRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
