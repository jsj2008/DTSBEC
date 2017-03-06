#ifndef UploadApp_h
#define UploadApp_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"

/////////////////////////////////////////////////////////////////
@interface UploadAppReq : Message

@property (nonatomic, copy) NSString* sFileName;
@property (nonatomic, copy) NSString* sFileContent;


- (void)write: (BaseEncodeStream *)eos;

- (UploadAppReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface UploadAppRsp : Message

@property (nonatomic, copy) NSString* sDownloadUrl;


- (void)write: (BaseEncodeStream *)eos;

- (UploadAppRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
