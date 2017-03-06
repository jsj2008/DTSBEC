#ifndef FileAccess_h
#define FileAccess_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

/////////////////////////////////////////////////////////////////
@interface FaceImageSaveReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sFileName;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) NSData* vtData;


- (void)write: (BaseEncodeStream *)eos;

- (FaceImageSaveReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface FaceImageSaveRsp : Message

@property (nonatomic, copy) NSString* sUrl;


- (void)write: (BaseEncodeStream *)eos;

- (FaceImageSaveRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
