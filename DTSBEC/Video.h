#ifndef Video_h
#define Video_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

/////////////////////////////////////////////////////////////////
@interface VideoImg : Message

@property (nonatomic, copy) NSString* sType;
@property (nonatomic, copy) NSString* sUrl;


- (void) write: (BaseEncodeStream *)eos;

- (VideoImg *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoTeacher : Message

@property (nonatomic, copy) NSString* sTeacherId;
@property (nonatomic, copy) NSString* sTeacherName;
@property (nonatomic, copy) NSString* sTeacherImg;
@property (nonatomic, copy) NSString* sTeacherDesc;
@property (nonatomic, copy) NSString* sTeacherTags;


- (void) write: (BaseEncodeStream *)eos;

- (VideoTeacher *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoDesc : Message

@property (nonatomic, copy) NSString* sVideoId;
@property (nonatomic, assign) int32_t iType;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, copy) NSString* sDescription;
@property (nonatomic, assign) int32_t iBeginTime;
@property (nonatomic, assign) int32_t iEndTime;
@property (nonatomic, assign) int32_t iLiveState;
@property (nonatomic, copy) NSString* sType;
@property (nonatomic, strong) NSMutableArray* vtVideoImg;
@property (nonatomic, strong) NSMutableArray* vTags;
@property (nonatomic, strong) VideoTeacher* stVideoTeacher;
@property (nonatomic, copy) NSString* sVodId;
@property (nonatomic, copy) NSString* sVodPassWord;
@property (nonatomic, copy) NSString* sWebVodId;
@property (nonatomic, copy) NSString* sWebVodPassWord;
@property (nonatomic, copy) NSString* sLiveId;
@property (nonatomic, copy) NSString* sLivePassWord;
@property (nonatomic, copy) NSString* sWebLiveId;
@property (nonatomic, copy) NSString* sWebLivePassWord;
@property (nonatomic, assign) int32_t iWatchNum;
@property (nonatomic, assign) int32_t iTotalJoinedNum;
@property (nonatomic, assign) int32_t iStatus;


- (void) write: (BaseEncodeStream *)eos;

- (VideoDesc *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoList : Message

@property (nonatomic, strong) NSMutableArray* vtVideoDesc;
@property (nonatomic, copy) NSString* sOpeningVideoId;
@property (nonatomic, copy) NSString* sOpeningVideoPassword;
@property (nonatomic, copy) NSString* sWebOpeningVideoId;
@property (nonatomic, copy) NSString* sWebOpeningVideoPassword;


- (void) write: (BaseEncodeStream *)eos;

- (VideoList *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoClass : Message

@property (nonatomic, copy) NSString* sClassName;
@property (nonatomic, copy) NSString* sClassImgUrl;


- (void) write: (BaseEncodeStream *)eos;

- (VideoClass *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LiveVideoDateReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (LiveVideoDateReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LiveVideoDateRsp : Message

@property (nonatomic, strong) NSMutableArray* vDate;


- (void) write: (BaseEncodeStream *)eos;

- (LiveVideoDateRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LiveVideoListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sDate;


- (void) write: (BaseEncodeStream *)eos;

- (LiveVideoListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LiveVideoListRsp : Message

@property (nonatomic, strong) VideoList* stVideoList;


- (void) write: (BaseEncodeStream *)eos;

- (LiveVideoListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LiveVideoStateReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSMutableArray* vVideoId;


- (void) write: (BaseEncodeStream *)eos;

- (LiveVideoStateReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LiveVideoStateRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mVideoState;


- (void) write: (BaseEncodeStream *)eos;

- (LiveVideoStateRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VodVideoClassListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (VodVideoClassListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VodVideoClassListRsp : Message

@property (nonatomic, strong) NSMutableArray* vtVideoClass;


- (void) write: (BaseEncodeStream *)eos;

- (VodVideoClassListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoFilter : Message

@property (nonatomic, assign) int32_t iFilterType;
@property (nonatomic, copy) NSString* sFilterCondition;


- (void) write: (BaseEncodeStream *)eos;

- (VideoFilter *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VodVideoListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sStartVideoId;
@property (nonatomic, copy) NSString* sEndVideoId;
@property (nonatomic, strong) NSMutableArray* vtFilterCondition;


- (void) write: (BaseEncodeStream *)eos;

- (VodVideoListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VodVideoListRsp : Message

@property (nonatomic, strong) VideoList* stVideoList;
@property (nonatomic, copy) NSString* sNextVideoId;


- (void) write: (BaseEncodeStream *)eos;

- (VodVideoListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoAnswer : Message

@property (nonatomic, copy) NSString* sTeacherName;
@property (nonatomic, copy) NSString* sAnswer;
@property (nonatomic, assign) int32_t iTime;


- (void) write: (BaseEncodeStream *)eos;

- (VideoAnswer *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoQA : Message

@property (nonatomic, copy) NSString* sQuestionId;
@property (nonatomic, copy) NSString* sQuestion;
@property (nonatomic, assign) int32_t iTime;
@property (nonatomic, copy) NSString* sUserName;
@property (nonatomic, strong) NSMutableArray* vtVideoAnswer;


- (void) write: (BaseEncodeStream *)eos;

- (VideoQA *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoQAReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sTeacherId;
@property (nonatomic, copy) NSString* sStartQuestionId;
@property (nonatomic, copy) NSString* sEndQuestionId;


- (void) write: (BaseEncodeStream *)eos;

- (VideoQAReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoQARsp : Message

@property (nonatomic, strong) NSMutableArray* vtVideoQA;
@property (nonatomic, copy) NSString* sNextQuestionId;


- (void) write: (BaseEncodeStream *)eos;

- (VideoQARsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportPlayInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) VideoDesc* stVideoDesc;
@property (nonatomic, copy) NSString* sClientType;


- (void) write: (BaseEncodeStream *)eos;

- (ReportPlayInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportPlayInfoRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (ReportPlayInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface BoutiqueVideoListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (BoutiqueVideoListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface BoutiqueVideoListRsp : Message

@property (nonatomic, strong) VideoList* stVideoList;


- (void) write: (BaseEncodeStream *)eos;

- (BoutiqueVideoListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VodVideoTeacherListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (VodVideoTeacherListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VodVideoTeacherListRsp : Message

@property (nonatomic, strong) NSMutableArray* vtVideoTeacher;


- (void) write: (BaseEncodeStream *)eos;

- (VodVideoTeacherListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VodVideoMonthListReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (VodVideoMonthListReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VodVideoMonthListRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mvMonth;


- (void) write: (BaseEncodeStream *)eos;

- (VodVideoMonthListRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoDescReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sVideoId;
@property (nonatomic, assign) int32_t iType;


- (void) write: (BaseEncodeStream *)eos;

- (VideoDescReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VideoDescRsp : Message

@property (nonatomic, strong) VideoDesc* stVideoDesc;
@property (nonatomic, copy) NSString* sOpeningVideoId;
@property (nonatomic, copy) NSString* sOpeningVideoPassword;
@property (nonatomic, copy) NSString* sWebOpeningVideoId;
@property (nonatomic, copy) NSString* sWebOpeningVideoPassword;


- (void) write: (BaseEncodeStream *)eos;

- (VideoDescRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
