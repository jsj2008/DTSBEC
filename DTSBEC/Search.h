#ifndef Search_h
#define Search_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, E_SEARCH_MATCH_TYPE) {
    E_SMT_EXACT_MATCH = 1,
    E_SMT_FUZZY_MATCH = 2
};

/////////////////////////////////////////////////////////////////
@interface CommonSearchReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sUserInputStr;
@property (nonatomic, assign) E_SEARCH_MATCH_TYPE eSearchMatchType;


- (void)write: (BaseEncodeStream *)eos;

- (CommonSearchReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecResult : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, strong) NSArray* vtSecInfoResultItem;


- (void)write: (BaseEncodeStream *)eos;

- (SecResult *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PlateResult : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, strong) NSArray* vtPlateResultItem;


- (void)write: (BaseEncodeStream *)eos;

- (PlateResult *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConceptResult : Message

@property (nonatomic, assign) int32_t iRet;
@property (nonatomic, strong) NSArray* vtConcInfo;


- (void)write: (BaseEncodeStream *)eos;

- (ConceptResult *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CommonSearchRsp : Message

@property (nonatomic, copy) NSString* sShowOrder;
@property (nonatomic, strong) SecResult* stSecResult;
@property (nonatomic, strong) PlateResult* stPlateResult;
@property (nonatomic, strong) ConceptResult* stConceptResult;


- (void)write: (BaseEncodeStream *)eos;

- (CommonSearchRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
