#ifndef InvestSuggestionComm_h
#define InvestSuggestionComm_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

/////////////////////////////////////////////////////////////////
@interface InputBoxDefaultReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iWantNum;


- (void) write: (BaseEncodeStream *)eos;

- (InputBoxDefaultReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InputDefaultItem : Message

@property (nonatomic, copy) NSString* sSentence;


- (void) write: (BaseEncodeStream *)eos;

- (InputDefaultItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InputBoxDefaultRsp : Message

@property (nonatomic, strong) NSMutableArray* vtInputDefaultItem;


- (void) write: (BaseEncodeStream *)eos;

- (InputBoxDefaultRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InputSuggestionReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sQuery;


- (void) write: (BaseEncodeStream *)eos;

- (InputSuggestionReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SuggestionItem : Message

@property (nonatomic, copy) NSString* sSentence;


- (void) write: (BaseEncodeStream *)eos;

- (SuggestionItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InputSuggestionRsp : Message

@property (nonatomic, strong) NSMutableArray* vtSuggestionItem;


- (void) write: (BaseEncodeStream *)eos;

- (InputSuggestionRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
