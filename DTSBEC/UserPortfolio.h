#ifndef UserPortfolio_h
#define UserPortfolio_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Account.h"

typedef NS_ENUM(NSUInteger, E_PORTFOLIO_RET) {
    E_PR_SUCC = 0,
    E_PR_ERROR = -1,
    E_PR_NO_UPDATE = 1,
    E_PR_CONFLICT = -2
};

/////////////////////////////////////////////////////////////////
@interface CommentInfo : Message

@property (nonatomic, copy) NSString* sComment;
@property (nonatomic, assign) int32_t iCreateTime;
@property (nonatomic, assign) int32_t iUpdateTime;


- (void)write: (BaseEncodeStream *)eos;

- (CommentInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ProSecInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) float fHighPrice;
@property (nonatomic, assign) float fLowPrice;
@property (nonatomic, assign) float fIncreasePer;
@property (nonatomic, assign) float fDecreasesPer;
@property (nonatomic, assign) BOOL bRecvAnnounce;
@property (nonatomic, assign) BOOL bRecvResearch;
@property (nonatomic, assign) BOOL isDel;
@property (nonatomic, assign) int32_t iCreateTime;
@property (nonatomic, assign) int32_t iUpdateTime;
@property (nonatomic, copy) NSString* sName;
@property (nonatomic, assign) BOOL isHold;
@property (nonatomic, strong) CommentInfo* stCommentInfo;
@property (nonatomic, assign) BOOL isAiAlert;


- (void)write: (BaseEncodeStream *)eos;

- (ProSecInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SubjectInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) BOOL isDel;
@property (nonatomic, assign) int32_t iCreateTime;
@property (nonatomic, assign) int32_t iUpdateTime;
@property (nonatomic, copy) NSString* sName;


- (void)write: (BaseEncodeStream *)eos;

- (SubjectInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GroupSecInfo : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) int32_t iUpdateTime;
@property (nonatomic, assign) BOOL isDel;


- (void)write: (BaseEncodeStream *)eos;

- (GroupSecInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GroupInfo : Message

@property (nonatomic, copy) NSString* sGroupName;
@property (nonatomic, assign) BOOL isDel;
@property (nonatomic, assign) int32_t iCreateTime;
@property (nonatomic, assign) int32_t iUpdateTime;
@property (nonatomic, strong) NSArray* vGroupSecInfo;


- (void)write: (BaseEncodeStream *)eos;

- (GroupInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ProSecInfoList : Message

@property (nonatomic, strong) NSArray* vProSecInfo;
@property (nonatomic, strong) NSArray* vSubjectInfo;
@property (nonatomic, assign) int32_t iVersion;
@property (nonatomic, strong) NSArray* vGroupInfo;


- (void)write: (BaseEncodeStream *)eos;

- (ProSecInfoList *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QueryPortfolioReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iVersion;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void)write: (BaseEncodeStream *)eos;

- (QueryPortfolioReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface QueryPortfolioRsp : Message

@property (nonatomic, strong) ProSecInfoList* stProSecInfoList;
@property (nonatomic, assign) uint32_t iAccountId;


- (void)write: (BaseEncodeStream *)eos;

- (QueryPortfolioRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SavePortfolioReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) ProSecInfoList* stProSecInfoList;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void)write: (BaseEncodeStream *)eos;

- (SavePortfolioReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SavePortfolioRsp : Message

@property (nonatomic, assign) int32_t iVersion;


- (void)write: (BaseEncodeStream *)eos;

- (SavePortfolioRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
