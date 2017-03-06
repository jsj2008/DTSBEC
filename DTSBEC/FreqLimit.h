#ifndef FreqLimit_h
#define FreqLimit_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"

typedef NS_ENUM(NSUInteger, FRELIMIT_RET_CODE) {
    E_FL_SUCC = 0,
    E_FL_EXCEPTION = 1,
    E_FL_NOT_FIND_BUSSINESS = 2,
    E_FL_GET_DATA_ERROR = 3
};

/////////////////////////////////////////////////////////////////
@interface LimitReq : Message

@property (nonatomic, copy) NSString* sGuid;
@property (nonatomic, copy) NSString* sBussinessId;
@property (nonatomic, copy) NSString* sStrategyId;
@property (nonatomic, strong) NSArray* vtKey;
@property (nonatomic, assign) BOOL bUpdateData;


- (void)write: (BaseEncodeStream *)eos;

- (LimitReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface LimitRsp : Message

@property (nonatomic, strong) NSDictionary* mpLimitRet;


- (void)write: (BaseEncodeStream *)eos;

- (LimitRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CacheValue : Message

@property (nonatomic, assign) int32_t iLastTime;
@property (nonatomic, assign) int32_t iCount;


- (void)write: (BaseEncodeStream *)eos;

- (CacheValue *) read: (BaseDecodeStream *)dos;

@end

#endif
