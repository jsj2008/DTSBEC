#ifndef OssAccess_h
#define OssAccess_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"

/////////////////////////////////////////////////////////////////
@interface OssKey : Message

@property (nonatomic, copy) NSString* sBucketName;
@property (nonatomic, copy) NSString* sObjName;


- (void)write: (BaseEncodeStream *)eos;

- (OssKey *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface OssUrl : Message

@property (nonatomic, strong) OssKey* stOssKey;
@property (nonatomic, copy) NSString* sIntranetUrl;
@property (nonatomic, copy) NSString* sExtranetUrl;


- (void)write: (BaseEncodeStream *)eos;

- (OssUrl *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface OssData : Message

@property (nonatomic, strong) OssKey* stOssKey;
@property (nonatomic, strong) NSData* vObjData;


- (void)write: (BaseEncodeStream *)eos;

- (OssData *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PutOssReq : Message

@property (nonatomic, strong) NSArray* vPutOssRequest;


- (void)write: (BaseEncodeStream *)eos;

- (PutOssReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PutOssRsp : Message

@property (nonatomic, strong) NSArray* vPutOssResponse;


- (void)write: (BaseEncodeStream *)eos;

- (PutOssRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetOssReq : Message

@property (nonatomic, strong) NSArray* vGetOssRequest;


- (void)write: (BaseEncodeStream *)eos;

- (GetOssReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetOssRsp : Message

@property (nonatomic, strong) NSArray* vGetOssResponse;


- (void)write: (BaseEncodeStream *)eos;

- (GetOssRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
