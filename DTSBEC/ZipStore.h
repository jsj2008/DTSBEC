#ifndef ZipStore_h
#define ZipStore_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

/////////////////////////////////////////////////////////////////
@interface ZipDiffRes : Message

@property (nonatomic, copy) NSString* sFileName;
@property (nonatomic, copy) NSString* sMd5;
@property (nonatomic, copy) NSString* sUrl;


- (void)write: (BaseEncodeStream *)eos;

- (ZipDiffRes *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ZipRequest : Message

@property (nonatomic, assign) int32_t iType;
@property (nonatomic, assign) int32_t iVersion;


- (void)write: (BaseEncodeStream *)eos;

- (ZipRequest *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ZipResponse : Message

@property (nonatomic, assign) BOOL bLast;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, assign) int32_t iVersion;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, assign) int32_t iSize;
@property (nonatomic, copy) NSString* sMd5;
@property (nonatomic, copy) NSString* sUploadTime;
@property (nonatomic, copy) NSString* sAppVersion;
@property (nonatomic, strong) NSArray* vZipDiffRes;


- (void)write: (BaseEncodeStream *)eos;

- (ZipResponse *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ZipStoreReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSArray* vZipRequest;


- (void)write: (BaseEncodeStream *)eos;

- (ZipStoreReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ZipStoreRsp : Message

@property (nonatomic, strong) NSArray* vZipResponse;


- (void)write: (BaseEncodeStream *)eos;

- (ZipStoreRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
