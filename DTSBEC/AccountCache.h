#ifndef AccountCache_h
#define AccountCache_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"

/////////////////////////////////////////////////////////////////
@interface VerifyCodeValue : Message

@property (nonatomic, copy) NSString* sPhoneCode;
@property (nonatomic, assign) int32_t iPhoneCodeTime;


- (void)write: (BaseEncodeStream *)eos;

- (VerifyCodeValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface AccountValue : Message

@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, copy) NSString* sUserName;
@property (nonatomic, copy) NSString* sPasswordHash;
@property (nonatomic, copy) NSString* sPasswordSalt;
@property (nonatomic, copy) NSString* sPhone;
@property (nonatomic, copy) NSString* sWxOpenId;
@property (nonatomic, copy) NSString* sQqOpenId;
@property (nonatomic, copy) NSString* sWbOpenId;
@property (nonatomic, copy) NSString* sFaceUrl;
@property (nonatomic, assign) int32_t iUpdateTime;


- (void)write: (BaseEncodeStream *)eos;

- (AccountValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface UserNameIndexValue : Message

@property (nonatomic, assign) uint32_t iAccountId;


- (void)write: (BaseEncodeStream *)eos;

- (UserNameIndexValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PhoneIndexValue : Message

@property (nonatomic, assign) uint32_t iAccountId;


- (void)write: (BaseEncodeStream *)eos;

- (PhoneIndexValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface WxIdIndexValue : Message

@property (nonatomic, assign) uint32_t iAccountId;


- (void)write: (BaseEncodeStream *)eos;

- (WxIdIndexValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface WbIdIndexValue : Message

@property (nonatomic, assign) uint32_t iAccountId;


- (void)write: (BaseEncodeStream *)eos;

- (WbIdIndexValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QqIdIndexValue : Message

@property (nonatomic, assign) uint32_t iAccountId;


- (void)write: (BaseEncodeStream *)eos;

- (QqIdIndexValue *) read: (BaseDecodeStream *)dos;

@end

#endif
