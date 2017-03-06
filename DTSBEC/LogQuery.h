#ifndef LogQuery_h
#define LogQuery_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"

/////////////////////////////////////////////////////////////////
@interface GetLogListReq : Message

@property (nonatomic, copy) NSString* sUserId;
@property (nonatomic, copy) NSString* sBussName;
@property (nonatomic, copy) NSString* sStartDay;
@property (nonatomic, copy) NSString* sEndDay;
@property (nonatomic, copy) NSString* sStartVN;
@property (nonatomic, copy) NSString* sEndVN;
@property (nonatomic, copy) NSString* sStartBN;
@property (nonatomic, copy) NSString* sEndBN;
@property (nonatomic, copy) NSString* sGuid;
@property (nonatomic, copy) NSString* sPackage;
@property (nonatomic, copy) NSString* sIMEI;


- (void)write: (BaseEncodeStream *)eos;

- (GetLogListReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface LogDetailInfo : Message

@property (nonatomic, copy) NSString* sDay;
@property (nonatomic, copy) NSString* sUserId;
@property (nonatomic, copy) NSString* sGuid;
@property (nonatomic, assign) int32_t iErrCode;
@property (nonatomic, copy) NSString* sErrMsg;
@property (nonatomic, copy) NSString* sReportTime;
@property (nonatomic, copy) NSString* sFileName;
@property (nonatomic, copy) NSString* sBussName;
@property (nonatomic, copy) NSString* sVN;
@property (nonatomic, copy) NSString* sMo;
@property (nonatomic, copy) NSString* sBN;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, assign) int32_t uFileSize;
@property (nonatomic, copy) NSString* sQua;
@property (nonatomic, copy) NSString* sOrigBussName;
@property (nonatomic, copy) NSString* sIMEI;
@property (nonatomic, copy) NSString* sPackName;


- (void)write: (BaseEncodeStream *)eos;

- (LogDetailInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetLogListRsp : Message

@property (nonatomic, strong) NSArray* vList;
@property (nonatomic, assign) int32_t iTotal;


- (void)write: (BaseEncodeStream *)eos;

- (GetLogListRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface BussInfo : Message

@property (nonatomic, copy) NSString* sBussId;
@property (nonatomic, copy) NSString* sBussEngName;
@property (nonatomic, copy) NSString* sBussChiName;
@property (nonatomic, copy) NSString* sBussDesc;
@property (nonatomic, strong) NSArray* vAlarm;
@property (nonatomic, copy) NSString* sLastUser;
@property (nonatomic, copy) NSString* sLastTime;
@property (nonatomic, assign) int32_t iStatus;


- (void)write: (BaseEncodeStream *)eos;

- (BussInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface BussInfoList : Message

@property (nonatomic, strong) NSArray* vList;
@property (nonatomic, assign) int32_t iTotal;


- (void)write: (BaseEncodeStream *)eos;

- (BussInfoList *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PackInfo : Message

@property (nonatomic, copy) NSString* sPackName;


- (void)write: (BaseEncodeStream *)eos;

- (PackInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PackInfoList : Message

@property (nonatomic, strong) NSArray* vList;
@property (nonatomic, assign) int32_t iTotal;


- (void)write: (BaseEncodeStream *)eos;

- (PackInfoList *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface BussLogUrl : Message

@property (nonatomic, copy) NSString* sUrl;


- (void)write: (BaseEncodeStream *)eos;

- (BussLogUrl *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface BussErrInfo : Message

@property (nonatomic, assign) int32_t iErrCode;
@property (nonatomic, copy) NSString* sErrMsg;
@property (nonatomic, copy) NSString* sBussName;
@property (nonatomic, copy) NSString* sLastUser;
@property (nonatomic, copy) NSString* sLastTime;


- (void)write: (BaseEncodeStream *)eos;

- (BussErrInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface BussErrList : Message

@property (nonatomic, strong) NSArray* vList;
@property (nonatomic, assign) int32_t iTotal;


- (void)write: (BaseEncodeStream *)eos;

- (BussErrList *) read: (BaseDecodeStream *)dos;

@end

#endif
