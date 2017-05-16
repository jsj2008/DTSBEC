#ifndef DtTemp_h
#define DtTemp_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, E_CYCLE_TYPE) {
    CT_HOUR = 1,
    CT_DAY = 2
};

typedef NS_ENUM(NSUInteger, E_TEMP_KEY) {
    TK_STOCK = 1,
    TK_TAG = 2,
    TK_TOPIC = 3
};

/////////////////////////////////////////////////////////////////
@interface TempItem : Message

@property (nonatomic, copy) NSString* sKey;
@property (nonatomic, assign) int32_t iTimestamp;
@property (nonatomic, assign) float fHeatIndex;
@property (nonatomic, assign) float fTotalHeatIndex;
@property (nonatomic, assign) float fTemperature;
@property (nonatomic, assign) float fMarketHeatIndex;
@property (nonatomic, assign) float fMarketTotalHeatIndex;
@property (nonatomic, assign) float fMarketTemperature;
@property (nonatomic, assign) float fNewsHeatIndex;
@property (nonatomic, assign) float fNewsTotalHeatIndex;
@property (nonatomic, assign) float fNewsTemperature;


- (void) write: (BaseEncodeStream *)eos;

- (TempItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TempTopReq : Message

@property (nonatomic, assign) int32_t iStartTime;
@property (nonatomic, assign) int32_t iEndTime;
@property (nonatomic, assign) E_CYCLE_TYPE eCycleType;
@property (nonatomic, assign) E_TEMP_KEY eTempKey;
@property (nonatomic, assign) int32_t iTopCount;
@property (nonatomic, strong) NSMutableArray* vKeys;


- (void) write: (BaseEncodeStream *)eos;

- (TempTopReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TempTopRsp : Message

@property (nonatomic, strong) NSMutableArray* vTempItem;


- (void) write: (BaseEncodeStream *)eos;

- (TempTopRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TempDataReq : Message

@property (nonatomic, copy) NSString* sKey;
@property (nonatomic, assign) int32_t iStartTime;
@property (nonatomic, assign) int32_t iEndTime;
@property (nonatomic, assign) E_CYCLE_TYPE eCycleType;
@property (nonatomic, assign) E_TEMP_KEY eTempKey;
@property (nonatomic, assign) int32_t iCycleCount;


- (void) write: (BaseEncodeStream *)eos;

- (TempDataReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TempDataRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mTempItem;
@property (nonatomic, assign) BOOL bHasMore;


- (void) write: (BaseEncodeStream *)eos;

- (TempDataRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface StockRela : Message

@property (nonatomic, strong) SecBaseInfo* stSecBaseInfo;
@property (nonatomic, assign) float fRela;


- (void) write: (BaseEncodeStream *)eos;

- (StockRela *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicMessage : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, assign) int32_t iPubTime;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, strong) NSMutableArray* vStockRela;


- (void) write: (BaseEncodeStream *)eos;

- (TopicMessage *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicNews : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, assign) int32_t iPublish;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sAbstract;
@property (nonatomic, copy) NSString* sSource;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, copy) NSString* sUrl;


- (void) write: (BaseEncodeStream *)eos;

- (TopicNews *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicDetail : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, assign) int32_t iTimestamp;
@property (nonatomic, strong) NSMutableArray* vStockRela;
@property (nonatomic, strong) NSMutableArray* vTopicMessage;
@property (nonatomic, strong) NSMutableDictionary* mTempItem;
@property (nonatomic, strong) NSMutableArray* vTopicNews;


- (void) write: (BaseEncodeStream *)eos;

- (TopicDetail *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicListItem : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, assign) int32_t iTimestamp;
@property (nonatomic, strong) NSMutableArray* vStockRela;
@property (nonatomic, strong) TopicMessage* stTopicMessage;


- (void) write: (BaseEncodeStream *)eos;

- (TopicListItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicDetailReq : Message

@property (nonatomic, copy) NSString* sId;


- (void) write: (BaseEncodeStream *)eos;

- (TopicDetailReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicDetailRsp : Message

@property (nonatomic, strong) TopicDetail* stTopicDetail;


- (void) write: (BaseEncodeStream *)eos;

- (TopicDetailRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicListReq : Message

@property (nonatomic, assign) int32_t iStartTime;
@property (nonatomic, assign) int32_t iEndTime;


- (void) write: (BaseEncodeStream *)eos;

- (TopicListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicListRsp : Message

@property (nonatomic, strong) NSMutableArray* stTopicList;
@property (nonatomic, assign) BOOL bHasMore;


- (void) write: (BaseEncodeStream *)eos;

- (TopicListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicMessageListReq : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, assign) int32_t iStartTime;
@property (nonatomic, assign) int32_t iEndTime;


- (void) write: (BaseEncodeStream *)eos;

- (TopicMessageListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicMessageListRsp : Message

@property (nonatomic, strong) NSMutableArray* vTopicMessage;
@property (nonatomic, assign) BOOL bHasMore;


- (void) write: (BaseEncodeStream *)eos;

- (TopicMessageListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicNewsListReq : Message

@property (nonatomic, copy) NSString* sId;
@property (nonatomic, assign) int32_t iEndTime;


- (void) write: (BaseEncodeStream *)eos;

- (TopicNewsListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface TopicNewsListRsp : Message

@property (nonatomic, strong) NSMutableArray* vTopicNews;


- (void) write: (BaseEncodeStream *)eos;

- (TopicNewsListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
