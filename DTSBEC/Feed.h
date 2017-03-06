#ifndef Feed_h
#define Feed_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Account.h"

typedef NS_ENUM(NSUInteger, E_FEED_ERR_CODE) {
    E_FEED_SUCC = 0,
    E_FEED_NOT_LOGIN = -1,
    E_FEED_CODE_EMPTY = -2,
    E_FEED_USER_NOT_EXIST = -3,
    E_FEED_NO_PRIVI = -4,
    E_FEED_FEED_NOT_EXIST = -5,
    E_FEED_COMMENT_NOT_EXIST = -6,
    E_FEED_GET_LOCK_ERR = -7,
    E_FEED_POFEED_TOO_OFTEN = -8,
    E_FEED_SVR_ERR = -99
};

typedef NS_ENUM(NSUInteger, E_FEED_INVEST_LIST_TYPE) {
    E_FILT_HOT = 0,
    E_FILT_NEWEST = 1
};

typedef NS_ENUM(NSUInteger, E_FEED_USER_RELATION_TYPE) {
    E_FURT_FOLLOWER = 0,
    E_FURT_FANS = 1
};

typedef NS_ENUM(NSUInteger, E_FEED_USER_RELATION_SET_TYPE) {
    E_FURST_FOLLOW = 0,
    E_FURST_CANCEL_FOLLOW = 1
};

typedef NS_ENUM(NSUInteger, E_FEED_TYPE) {
    E_FT_ALL = 0,
    E_FT_STOCK_REVIEW = 1,
    E_FT_INVEST_STOCK = 2,
    E_FT_INVEST_MARKET = 3,
    E_FT_INVEST_MARKET_AND_STOCK = 4
};

typedef NS_ENUM(NSUInteger, E_FEED_SOURCE_TYPE) {
    E_FEED_SOURCE_USER = 0,
    E_FEED_SOURCE_GRAB = 1
};

typedef NS_ENUM(NSUInteger, E_FEED_INVEST_ATTI_TYPE) {
    E_FIAT_NEUTRAL = 0,
    E_FIAT_GOOD = 1,
    E_FIAT_BAD = 2
};

typedef NS_ENUM(NSUInteger, E_FEED_EXTEND_TYPE) {
    E_EXTEND_ALL = 0,
    E_EXTEND_LIKE = 1,
    E_EXTEND_ACCESS = 2
};

typedef NS_ENUM(NSUInteger, E_FEED_GROUP_TYPE) {
    E_FGT_ALL = 0,
    E_FGT_SELF = 1,
    E_FGT_SEC = 2
};

typedef NS_ENUM(NSUInteger, E_FEED_LIST_TYPE) {
    E_FLT_INSERT = 0,
    E_FLT_REMOVE = 1
};

typedef NS_ENUM(NSUInteger, E_SET_FEED_LIST_TYPE) {
    E_SFLT_ACCOUNT = 0,
    E_SFLT_SECCODE = 1
};

/////////////////////////////////////////////////////////////////
@interface FeedUserBaseInfo : Message

@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, assign) int32_t iDynamic;
@property (nonatomic, assign) int32_t iFollower;
@property (nonatomic, assign) int32_t iFans;
@property (nonatomic, copy) NSString* sNickName;
@property (nonatomic, copy) NSString* sFaceUrl;
@property (nonatomic, assign) int32_t iGender;
@property (nonatomic, copy) NSString* sProvince;
@property (nonatomic, copy) NSString* sCity;
@property (nonatomic, copy) NSString* sProfile;
@property (nonatomic, copy) NSString* sVerifyDesc;
@property (nonatomic, assign) E_FEED_USER_TYPE eUserType;
@property (nonatomic, assign) int32_t iInvestNum;
@property (nonatomic, assign) int64_t lInvestTimeStamp;
@property (nonatomic, strong) DtMemberInfo* stMember;


- (void) write: (BaseEncodeStream *)eos;

- (FeedUserBaseInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FeedUserRelation : Message

@property (nonatomic, assign) E_FEED_USER_RELATION_TYPE eFeedUserRelationType;
@property (nonatomic, strong) NSMutableArray* vFeedUserBaseInfo;


- (void) write: (BaseEncodeStream *)eos;

- (FeedUserRelation *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReplyCommentInfo : Message

@property (nonatomic, copy) NSString* sReplyCommentId;
@property (nonatomic, assign) uint32_t iReplyAccountId;
@property (nonatomic, copy) NSString* sReplyNickName;


- (void) write: (BaseEncodeStream *)eos;

- (ReplyCommentInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FeedCommentInfo : Message

@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) uint32_t iPubAccountId;
@property (nonatomic, copy) NSString* sCommentId;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, assign) int32_t iPubTime;
@property (nonatomic, strong) ReplyCommentInfo* stReplyComment;
@property (nonatomic, copy) NSString* sCommentNickName;


- (void) write: (BaseEncodeStream *)eos;

- (FeedCommentInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SecCodeName : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sSecName;


- (void) write: (BaseEncodeStream *)eos;

- (SecCodeName *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FeedContent : Message

@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) uint32_t iPubAccountId;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, assign) int32_t iPubTime;
@property (nonatomic, assign) E_FEED_TYPE eType;
@property (nonatomic, strong) NSMutableArray* vRelateSec;
@property (nonatomic, assign) E_FEED_INVEST_ATTI_TYPE eAttiType;
@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, copy) NSString* sDescription;


- (void) write: (BaseEncodeStream *)eos;

- (FeedContent *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FeedExtendInfo : Message

@property (nonatomic, assign) int32_t iTotalCommentSize;
@property (nonatomic, assign) int32_t iLikeSize;
@property (nonatomic, assign) int32_t iAccessCount;


- (void) write: (BaseEncodeStream *)eos;

- (FeedExtendInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FeedCommentInfoList : Message

@property (nonatomic, strong) NSMutableArray* vCommentList;


- (void) write: (BaseEncodeStream *)eos;

- (FeedCommentInfoList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FeedItem : Message

@property (nonatomic, strong) FeedContent* stFeedContent;
@property (nonatomic, strong) FeedExtendInfo* stFeedExtendInfo;
@property (nonatomic, strong) FeedCommentInfoList* stFeedCommentInfoList;


- (void) write: (BaseEncodeStream *)eos;

- (FeedItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetCommentInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) int32_t iDirection;
@property (nonatomic, copy) NSString* sStartId;


- (void) write: (BaseEncodeStream *)eos;

- (GetCommentInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetCommentInfoRsp : Message

@property (nonatomic, strong) NSMutableArray* vCommentList;
@property (nonatomic, strong) NSMutableDictionary* mFeedUserBaseInfo;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, assign) int32_t iTotal;


- (void) write: (BaseEncodeStream *)eos;

- (GetCommentInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PoCommentReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, strong) ReplyCommentInfo* stReplyComment;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sCommentNickName;
@property (nonatomic, copy) NSString* sClientCommentId;
@property (nonatomic, assign) E_FEED_TYPE eFeedType;
@property (nonatomic, copy) NSString* sCommentId;
@property (nonatomic, assign) E_FEED_SOURCE_TYPE eFeedSourceType;


- (void) write: (BaseEncodeStream *)eos;

- (PoCommentReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PoCommentRsp : Message

@property (nonatomic, copy) NSString* sCommentId;
@property (nonatomic, copy) NSString* sClientCommentId;


- (void) write: (BaseEncodeStream *)eos;

- (PoCommentRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetFeedUserInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) uint32_t iOtherAccountId;


- (void) write: (BaseEncodeStream *)eos;

- (GetFeedUserInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetFeedUserInfoRsp : Message

@property (nonatomic, strong) FeedUserBaseInfo* stFeedUserBaseInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetFeedUserInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserRelationReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_FEED_USER_RELATION_TYPE eFeedUserRelationType;
@property (nonatomic, assign) int32_t iDirection;
@property (nonatomic, copy) NSString* sStartId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) uint32_t iOtherAccountId;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserRelationReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserRelationRsp : Message

@property (nonatomic, strong) FeedUserRelation* stFeedUserRelation;
@property (nonatomic, strong) NSMutableDictionary* mRelation;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, copy) NSString* sNextStartId;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserRelationRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetRelationBatchReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) NSMutableArray* vAccountId;


- (void) write: (BaseEncodeStream *)eos;

- (GetRelationBatchReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetRelationBatchRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mRelation;


- (void) write: (BaseEncodeStream *)eos;

- (GetRelationBatchRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SetUserRelationReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_FEED_USER_RELATION_SET_TYPE eSetType;
@property (nonatomic, assign) uint32_t iDstAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void) write: (BaseEncodeStream *)eos;

- (SetUserRelationReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SetUserRelationRsp : Message

@property (nonatomic, assign) int32_t iRetCode;


- (void) write: (BaseEncodeStream *)eos;

- (SetUserRelationRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetFeedListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_FEED_GROUP_TYPE eFeedGroupType;
@property (nonatomic, assign) int32_t iDirection;
@property (nonatomic, copy) NSString* sStartFeedId;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_FEED_TYPE eSelfType;
@property (nonatomic, assign) uint32_t iOtherAccountId;


- (void) write: (BaseEncodeStream *)eos;

- (GetFeedListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetFeedListRsp : Message

@property (nonatomic, strong) NSMutableArray* vFeedItem;
@property (nonatomic, strong) NSMutableDictionary* mFeedUserBaseInfo;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, assign) int32_t iTotal;
@property (nonatomic, strong) NSMutableArray* vTopFeedItem;


- (void) write: (BaseEncodeStream *)eos;

- (GetFeedListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SetFeedListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) E_FEED_LIST_TYPE eFeedListType;
@property (nonatomic, copy) NSString* sKey;
@property (nonatomic, assign) E_SET_FEED_LIST_TYPE eSetFeedListType;
@property (nonatomic, assign) E_FEED_TYPE eFeedType;


- (void) write: (BaseEncodeStream *)eos;

- (SetFeedListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SetFeedListRsp : Message

@property (nonatomic, assign) int32_t iTotalSize;


- (void) write: (BaseEncodeStream *)eos;

- (SetFeedListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PoFeedReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) NSMutableArray* vRelateSec;
@property (nonatomic, assign) E_FEED_TYPE eType;
@property (nonatomic, assign) E_FEED_INVEST_ATTI_TYPE eAttiType;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, copy) NSString* sClientFeedId;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) int32_t iPubTime;
@property (nonatomic, assign) E_FEED_SOURCE_TYPE eFeedSourceType;


- (void) write: (BaseEncodeStream *)eos;

- (PoFeedReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface PoFeedRsp : Message

@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, copy) NSString* sClientFeedId;


- (void) write: (BaseEncodeStream *)eos;

- (PoFeedRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DelFeedReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_SET_FEED_LIST_TYPE eSetFeedListType;


- (void) write: (BaseEncodeStream *)eos;

- (DelFeedReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DelCommentReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sCommentId;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void) write: (BaseEncodeStream *)eos;

- (DelCommentReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserRelationListReq : Message

@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, assign) E_FEED_USER_RELATION_TYPE eFeedUserRelationType;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserRelationListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserRelationListRsp : Message

@property (nonatomic, strong) NSMutableArray* vAccountId;


- (void) write: (BaseEncodeStream *)eos;

- (GetUserRelationListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LikeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) BOOL isAdd;
@property (nonatomic, assign) E_FEED_TYPE eFeedType;


- (void) write: (BaseEncodeStream *)eos;

- (LikeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LikeRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (LikeRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetFeedReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sFeedId;


- (void) write: (BaseEncodeStream *)eos;

- (GetFeedReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetFeedRsp : Message

@property (nonatomic, strong) FeedItem* stFeedItem;
@property (nonatomic, strong) FeedUserBaseInfo* stFeedUserBaseInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetFeedRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DoAccessCountReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) E_FEED_TYPE eType;
@property (nonatomic, copy) NSString* sFeedTitle;
@property (nonatomic, assign) uint32_t iPubAccountId;
@property (nonatomic, copy) NSString* sPubNickName;


- (void) write: (BaseEncodeStream *)eos;

- (DoAccessCountReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AdjustFeedListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, assign) E_SET_FEED_LIST_TYPE eSetFeedListType;
@property (nonatomic, assign) E_FEED_TYPE eFeedType;


- (void) write: (BaseEncodeStream *)eos;

- (AdjustFeedListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InitFeedExtendReq : Message

@property (nonatomic, copy) NSString* sFeedId;
@property (nonatomic, assign) E_FEED_EXTEND_TYPE eType;


- (void) write: (BaseEncodeStream *)eos;

- (InitFeedExtendReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface InitFeedExtendRsp : Message

@property (nonatomic, assign) int32_t iLikeInitNumber;
@property (nonatomic, assign) int32_t iAccessInitNumber;


- (void) write: (BaseEncodeStream *)eos;

- (InitFeedExtendRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface DelFeedCommentListReq : Message

@property (nonatomic, copy) NSString* sFeedId;


- (void) write: (BaseEncodeStream *)eos;

- (DelFeedCommentListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetInvestRecommendReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetInvestRecommendReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetInvestRecommendRsp : Message

@property (nonatomic, strong) NSMutableArray* vFeedUserBaseInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetInvestRecommendRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FeedInvestListHead : Message

@property (nonatomic, assign) int32_t iListType;
@property (nonatomic, copy) NSString* sListName;


- (void) write: (BaseEncodeStream *)eos;

- (FeedInvestListHead *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetInvestListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_FEED_INVEST_LIST_TYPE eListType;
@property (nonatomic, assign) int32_t iDirection;
@property (nonatomic, copy) NSString* sStartId;
@property (nonatomic, assign) BOOL bGetListConf;


- (void) write: (BaseEncodeStream *)eos;

- (GetInvestListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetInvestListRsp : Message

@property (nonatomic, strong) NSMutableArray* vFeedUserBaseInfo;
@property (nonatomic, strong) NSMutableDictionary* mRelation;
@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, copy) NSString* sNextStartId;
@property (nonatomic, strong) NSMutableArray* vHead;


- (void) write: (BaseEncodeStream *)eos;

- (GetInvestListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
