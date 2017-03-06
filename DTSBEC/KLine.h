#ifndef KLine_h
#define KLine_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Quote.h"

/////////////////////////////////////////////////////////////////
@interface KLineDateReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_K_LINE_TYPE eKLineType;
@property (nonatomic, assign) int32_t iWantnum;
@property (nonatomic, copy) NSString* sBeginDate;
@property (nonatomic, copy) NSString* sEndDate;


- (void) write: (BaseEncodeStream *)eos;

- (KLineDateReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface KLineDateRsp : Message

@property (nonatomic, strong) NSMutableArray* vKLineDesc;
@property (nonatomic, assign) E_K_LINE_TYPE eKLineType;


- (void) write: (BaseEncodeStream *)eos;

- (KLineDateRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RtMinDesc : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, strong) NSMutableArray* vTrendDesc;
@property (nonatomic, assign) float fPreClose;


- (void) write: (BaseEncodeStream *)eos;

- (RtMinDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RtMinReq : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iNum;
@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) int32_t iMinute;


- (void) write: (BaseEncodeStream *)eos;

- (RtMinReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface RtMinRsp : Message

@property (nonatomic, strong) NSMutableArray* vRtMinDesc;


- (void) write: (BaseEncodeStream *)eos;

- (RtMinRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
