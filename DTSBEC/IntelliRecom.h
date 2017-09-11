#ifndef IntelliRecom_h
#define IntelliRecom_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "NewsInfo.h"

typedef NS_ENUM(NSInteger, E_RECOM_TYPE) {
    E_RT_NEWS = 1
};

/////////////////////////////////////////////////////////////////
@interface RecomItem : Message

@property (nonatomic, assign) E_RECOM_TYPE eRecomType;
@property (nonatomic, copy) NSString* sKey;
@property (nonatomic, strong) NSData* vData;


- (void) write: (BaseEncodeStream *)eos;

- (RecomItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportReadReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) RecomItem* stRecomItem;


- (void) write: (BaseEncodeStream *)eos;

- (ReportReadReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RecomListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iCount;
@property (nonatomic, strong) NSMutableArray* vKeys;


- (void) write: (BaseEncodeStream *)eos;

- (RecomListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RecomListRsp : Message

@property (nonatomic, strong) NSMutableArray* vRecomItem;


- (void) write: (BaseEncodeStream *)eos;

- (RecomListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
