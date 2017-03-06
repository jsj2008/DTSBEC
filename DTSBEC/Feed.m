#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Feed.h"
#import "Account.h"

//////////////////////////////////////////////////////////////
@implementation FeedUserBaseInfo
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
        self.iDynamic = 0;
        self.iFollower = 0;
        self.iFans = 0;
        self.sNickName = @"";
        self.sFaceUrl = @"";
        self.iGender = 0;
        self.sProvince = @"";
        self.sCity = @"";
        self.sProfile = @"";
        self.sVerifyDesc = @"";
        self.eUserType = E_FEED_USER_NORMAL;
        self.iInvestNum = 0;
        self.lInvestTimeStamp = 0;
        self.stMember = [[DtMemberInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    [ostream writeInt32: 1 value: self.iDynamic];
    [ostream writeInt32: 2 value: self.iFollower];
    [ostream writeInt32: 3 value: self.iFans];
    if (self.sNickName != nil)
    {
        [ostream writeString: 4 value: self.sNickName];
    }
    if (self.sFaceUrl != nil)
    {
        [ostream writeString: 5 value: self.sFaceUrl];
    }
    [ostream writeInt32: 6 value: self.iGender];
    if (self.sProvince != nil)
    {
        [ostream writeString: 7 value: self.sProvince];
    }
    if (self.sCity != nil)
    {
        [ostream writeString: 8 value: self.sCity];
    }
    if (self.sProfile != nil)
    {
        [ostream writeString: 9 value: self.sProfile];
    }
    if (self.sVerifyDesc != nil)
    {
        [ostream writeString: 10 value: self.sVerifyDesc];
    }
    [ostream writeInt32: 11 value: (int32_t)self.eUserType];
    [ostream writeInt32: 12 value: self.iInvestNum];
    [ostream writeInt64: 13 value: self.lInvestTimeStamp];
    if (self.stMember != nil)
    {
        [ostream writeMessage: 14 value: self.stMember];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedUserBaseInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    self.iDynamic = [istream readInt32Def: 1 required: false def: self.iDynamic];
    self.iFollower = [istream readInt32Def: 2 required: false def: self.iFollower];
    self.iFans = [istream readInt32Def: 3 required: false def: self.iFans];
    self.sNickName = [istream readStringDef: 4 required: false def: self.sNickName];
    self.sFaceUrl = [istream readStringDef: 5 required: false def: self.sFaceUrl];
    self.iGender = [istream readInt32Def: 6 required: false def: self.iGender];
    self.sProvince = [istream readStringDef: 7 required: false def: self.sProvince];
    self.sCity = [istream readStringDef: 8 required: false def: self.sCity];
    self.sProfile = [istream readStringDef: 9 required: false def: self.sProfile];
    self.sVerifyDesc = [istream readStringDef: 10 required: false def: self.sVerifyDesc];
    self.eUserType = [istream readInt32Def: 11 required: false def: (int32_t)self.eUserType];
    self.iInvestNum = [istream readInt32Def: 12 required: false def: self.iInvestNum];
    self.lInvestTimeStamp = [istream readInt64Def: 13 required: false def: self.lInvestTimeStamp];
    self.stMember = (DtMemberInfo*)[istream readMessageDef: 14 required: false def: self.stMember VAR_TYPE: [DtMemberInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"iDynamic" value : [BaseJSON writeInt32 : self.iDynamic]];
    [JsonRoot append:@"iFollower" value : [BaseJSON writeInt32 : self.iFollower]];
    [JsonRoot append:@"iFans" value : [BaseJSON writeInt32 : self.iFans]];
    [JsonRoot append:@"sNickName" value : [BaseJSON writeString : self.sNickName]];
    [JsonRoot append:@"sFaceUrl" value : [BaseJSON writeString : self.sFaceUrl]];
    [JsonRoot append:@"iGender" value : [BaseJSON writeInt32 : self.iGender]];
    [JsonRoot append:@"sProvince" value : [BaseJSON writeString : self.sProvince]];
    [JsonRoot append:@"sCity" value : [BaseJSON writeString : self.sCity]];
    [JsonRoot append:@"sProfile" value : [BaseJSON writeString : self.sProfile]];
    [JsonRoot append:@"sVerifyDesc" value : [BaseJSON writeString : self.sVerifyDesc]];
    [JsonRoot append:@"eUserType" value : [BaseJSON writeInt32 : (int32_t)self.eUserType]];
    [JsonRoot append:@"iInvestNum" value : [BaseJSON writeInt32 : self.iInvestNum]];
    [JsonRoot append:@"lInvestTimeStamp" value : [BaseJSON writeInt64 : self.lInvestTimeStamp]];
    [JsonRoot append:@"stMember" value : [BaseJSON writeMessage : self.stMember]];
    return JsonRoot;
}

- (FeedUserBaseInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.iDynamic = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDynamic"] required:false def:self.iDynamic];
    self.iFollower = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFollower"] required:false def:self.iFollower];
    self.iFans = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFans"] required:false def:self.iFans];
    self.sNickName = [BaseJSON readStringDef:[RootMap objectForKey:@"sNickName"] required:false def:self.sNickName];
    self.sFaceUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sFaceUrl"] required:false def:self.sFaceUrl];
    self.iGender = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGender"] required:false def:self.iGender];
    self.sProvince = [BaseJSON readStringDef:[RootMap objectForKey:@"sProvince"] required:false def:self.sProvince];
    self.sCity = [BaseJSON readStringDef:[RootMap objectForKey:@"sCity"] required:false def:self.sCity];
    self.sProfile = [BaseJSON readStringDef:[RootMap objectForKey:@"sProfile"] required:false def:self.sProfile];
    self.sVerifyDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sVerifyDesc"] required:false def:self.sVerifyDesc];
    self.eUserType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eUserType"] required:false def:(int32_t)self.eUserType];
    self.iInvestNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iInvestNum"] required:false def:self.iInvestNum];
    self.lInvestTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lInvestTimeStamp"] required:false def:self.lInvestTimeStamp];
    self.stMember = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMember"] required:false def:self.stMember VAR_TYPE: [DtMemberInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FeedUserRelation
- (id) init
{
    if (self = [super init])
    {
        self.eFeedUserRelationType = E_FURT_FOLLOWER;
        self.vFeedUserBaseInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eFeedUserRelationType];
    if (self.vFeedUserBaseInfo != nil)
    {
        [ostream writeList: 1 value: self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedUserRelation *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eFeedUserRelationType = [istream readInt32Def: 0 required: false def: (int32_t)self.eFeedUserRelationType];
    self.vFeedUserBaseInfo = [istream readListDef: 1 required: false def: self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"eFeedUserRelationType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedUserRelationType]];
    [JsonRoot append:@"vFeedUserBaseInfo" value : [BaseJSON writeList : self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]]];
    return JsonRoot;
}

- (FeedUserRelation *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eFeedUserRelationType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedUserRelationType"] required:false def:(int32_t)self.eFeedUserRelationType];
    self.vFeedUserBaseInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vFeedUserBaseInfo"] required:false def:self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReplyCommentInfo
- (id) init
{
    if (self = [super init])
    {
        self.sReplyCommentId = @"";
        self.iReplyAccountId = 0;
        self.sReplyNickName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sReplyCommentId != nil)
    {
        [ostream writeString: 0 value: self.sReplyCommentId];
    }
    [ostream writeUInt32: 1 value: self.iReplyAccountId];
    if (self.sReplyNickName != nil)
    {
        [ostream writeString: 2 value: self.sReplyNickName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReplyCommentInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sReplyCommentId = [istream readStringDef: 0 required: false def: self.sReplyCommentId];
    self.iReplyAccountId = [istream readUInt32Def: 1 required: false def: self.iReplyAccountId];
    self.sReplyNickName = [istream readStringDef: 2 required: false def: self.sReplyNickName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sReplyCommentId" value : [BaseJSON writeString : self.sReplyCommentId]];
    [JsonRoot append:@"iReplyAccountId" value : [BaseJSON writeUInt32 : self.iReplyAccountId]];
    [JsonRoot append:@"sReplyNickName" value : [BaseJSON writeString : self.sReplyNickName]];
    return JsonRoot;
}

- (ReplyCommentInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sReplyCommentId = [BaseJSON readStringDef:[RootMap objectForKey:@"sReplyCommentId"] required:false def:self.sReplyCommentId];
    self.iReplyAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iReplyAccountId"] required:false def:self.iReplyAccountId];
    self.sReplyNickName = [BaseJSON readStringDef:[RootMap objectForKey:@"sReplyNickName"] required:false def:self.sReplyNickName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FeedCommentInfo
- (id) init
{
    if (self = [super init])
    {
        self.sFeedId = @"";
        self.iPubAccountId = 0;
        self.sCommentId = @"";
        self.sContent = @"";
        self.iPubTime = 0;
        self.stReplyComment = [[ReplyCommentInfo alloc] init];
        self.sCommentNickName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sFeedId != nil)
    {
        [ostream writeString: 0 value: self.sFeedId];
    }
    [ostream writeUInt32: 1 value: self.iPubAccountId];
    if (self.sCommentId != nil)
    {
        [ostream writeString: 2 value: self.sCommentId];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 3 value: self.sContent];
    }
    [ostream writeInt32: 4 value: self.iPubTime];
    if (self.stReplyComment != nil)
    {
        [ostream writeMessage: 5 value: self.stReplyComment];
    }
    if (self.sCommentNickName != nil)
    {
        [ostream writeString: 6 value: self.sCommentNickName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedCommentInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sFeedId = [istream readStringDef: 0 required: false def: self.sFeedId];
    self.iPubAccountId = [istream readUInt32Def: 1 required: false def: self.iPubAccountId];
    self.sCommentId = [istream readStringDef: 2 required: false def: self.sCommentId];
    self.sContent = [istream readStringDef: 3 required: false def: self.sContent];
    self.iPubTime = [istream readInt32Def: 4 required: false def: self.iPubTime];
    self.stReplyComment = (ReplyCommentInfo*)[istream readMessageDef: 5 required: false def: self.stReplyComment VAR_TYPE: [ReplyCommentInfo class]];
    self.sCommentNickName = [istream readStringDef: 6 required: false def: self.sCommentNickName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"iPubAccountId" value : [BaseJSON writeUInt32 : self.iPubAccountId]];
    [JsonRoot append:@"sCommentId" value : [BaseJSON writeString : self.sCommentId]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    [JsonRoot append:@"iPubTime" value : [BaseJSON writeInt32 : self.iPubTime]];
    [JsonRoot append:@"stReplyComment" value : [BaseJSON writeMessage : self.stReplyComment]];
    [JsonRoot append:@"sCommentNickName" value : [BaseJSON writeString : self.sCommentNickName]];
    return JsonRoot;
}

- (FeedCommentInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.iPubAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iPubAccountId"] required:false def:self.iPubAccountId];
    self.sCommentId = [BaseJSON readStringDef:[RootMap objectForKey:@"sCommentId"] required:false def:self.sCommentId];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
    self.iPubTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPubTime"] required:false def:self.iPubTime];
    self.stReplyComment = [BaseJSON readMessageDef:[RootMap objectForKey:@"stReplyComment"] required:false def:self.stReplyComment VAR_TYPE: [ReplyCommentInfo class]];
    self.sCommentNickName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCommentNickName"] required:false def:self.sCommentNickName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecCodeName
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 0 value: self.sDtSecCode];
    }
    if (self.sSecName != nil)
    {
        [ostream writeString: 1 value: self.sSecName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecCodeName *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    return JsonRoot;
}

- (SecCodeName *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FeedContent
- (id) init
{
    if (self = [super init])
    {
        self.sFeedId = @"";
        self.iPubAccountId = 0;
        self.sTitle = @"";
        self.sContent = @"";
        self.iPubTime = 0;
        self.eType = E_FT_STOCK_REVIEW;
        self.vRelateSec = [NSMutableArray arrayWithCapacity:0];
        self.eAttiType = E_FIAT_NEUTRAL;
        self.sUrl = @"";
        self.sDescription = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sFeedId != nil)
    {
        [ostream writeString: 0 value: self.sFeedId];
    }
    [ostream writeUInt32: 1 value: self.iPubAccountId];
    if (self.sTitle != nil)
    {
        [ostream writeString: 2 value: self.sTitle];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 3 value: self.sContent];
    }
    [ostream writeInt32: 4 value: self.iPubTime];
    [ostream writeInt32: 5 value: (int32_t)self.eType];
    if (self.vRelateSec != nil)
    {
        [ostream writeList: 6 value: self.vRelateSec VAR_TYPE: [THOTH_LIST CREATE: [SecCodeName class]]];
    }
    [ostream writeInt32: 7 value: (int32_t)self.eAttiType];
    if (self.sUrl != nil)
    {
        [ostream writeString: 8 value: self.sUrl];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 9 value: self.sDescription];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedContent *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sFeedId = [istream readStringDef: 0 required: false def: self.sFeedId];
    self.iPubAccountId = [istream readUInt32Def: 1 required: false def: self.iPubAccountId];
    self.sTitle = [istream readStringDef: 2 required: false def: self.sTitle];
    self.sContent = [istream readStringDef: 3 required: false def: self.sContent];
    self.iPubTime = [istream readInt32Def: 4 required: false def: self.iPubTime];
    self.eType = [istream readInt32Def: 5 required: false def: (int32_t)self.eType];
    self.vRelateSec = [istream readListDef: 6 required: false def: self.vRelateSec VAR_TYPE: [THOTH_LIST CREATE: [SecCodeName class]]];
    self.eAttiType = [istream readInt32Def: 7 required: false def: (int32_t)self.eAttiType];
    self.sUrl = [istream readStringDef: 8 required: false def: self.sUrl];
    self.sDescription = [istream readStringDef: 9 required: false def: self.sDescription];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"iPubAccountId" value : [BaseJSON writeUInt32 : self.iPubAccountId]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    [JsonRoot append:@"iPubTime" value : [BaseJSON writeInt32 : self.iPubTime]];
    [JsonRoot append:@"eType" value : [BaseJSON writeInt32 : (int32_t)self.eType]];
    [JsonRoot append:@"vRelateSec" value : [BaseJSON writeList : self.vRelateSec VAR_TYPE: [THOTH_LIST CREATE: [SecCodeName class]]]];
    [JsonRoot append:@"eAttiType" value : [BaseJSON writeInt32 : (int32_t)self.eAttiType]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    return JsonRoot;
}

- (FeedContent *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.iPubAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iPubAccountId"] required:false def:self.iPubAccountId];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
    self.iPubTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPubTime"] required:false def:self.iPubTime];
    self.eType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eType"] required:false def:(int32_t)self.eType];
    self.vRelateSec = [BaseJSON readListDef:[RootMap objectForKey:@"vRelateSec"] required:false def:self.vRelateSec VAR_TYPE: [THOTH_LIST CREATE: [SecCodeName class]]];
    self.eAttiType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eAttiType"] required:false def:(int32_t)self.eAttiType];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FeedExtendInfo
- (id) init
{
    if (self = [super init])
    {
        self.iTotalCommentSize = 0;
        self.iLikeSize = 0;
        self.iAccessCount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTotalCommentSize];
    [ostream writeInt32: 1 value: self.iLikeSize];
    [ostream writeInt32: 2 value: self.iAccessCount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedExtendInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTotalCommentSize = [istream readInt32Def: 0 required: false def: self.iTotalCommentSize];
    self.iLikeSize = [istream readInt32Def: 1 required: false def: self.iLikeSize];
    self.iAccessCount = [istream readInt32Def: 2 required: false def: self.iAccessCount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iTotalCommentSize" value : [BaseJSON writeInt32 : self.iTotalCommentSize]];
    [JsonRoot append:@"iLikeSize" value : [BaseJSON writeInt32 : self.iLikeSize]];
    [JsonRoot append:@"iAccessCount" value : [BaseJSON writeInt32 : self.iAccessCount]];
    return JsonRoot;
}

- (FeedExtendInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iTotalCommentSize = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalCommentSize"] required:false def:self.iTotalCommentSize];
    self.iLikeSize = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLikeSize"] required:false def:self.iLikeSize];
    self.iAccessCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAccessCount"] required:false def:self.iAccessCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FeedCommentInfoList
- (id) init
{
    if (self = [super init])
    {
        self.vCommentList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vCommentList != nil)
    {
        [ostream writeList: 0 value: self.vCommentList VAR_TYPE: [THOTH_LIST CREATE: [FeedCommentInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedCommentInfoList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vCommentList = [istream readListDef: 0 required: false def: self.vCommentList VAR_TYPE: [THOTH_LIST CREATE: [FeedCommentInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vCommentList" value : [BaseJSON writeList : self.vCommentList VAR_TYPE: [THOTH_LIST CREATE: [FeedCommentInfo class]]]];
    return JsonRoot;
}

- (FeedCommentInfoList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vCommentList = [BaseJSON readListDef:[RootMap objectForKey:@"vCommentList"] required:false def:self.vCommentList VAR_TYPE: [THOTH_LIST CREATE: [FeedCommentInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FeedItem
- (id) init
{
    if (self = [super init])
    {
        self.stFeedContent = [[FeedContent alloc] init];
        self.stFeedExtendInfo = [[FeedExtendInfo alloc] init];
        self.stFeedCommentInfoList = [[FeedCommentInfoList alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFeedContent != nil)
    {
        [ostream writeMessage: 0 value: self.stFeedContent];
    }
    if (self.stFeedExtendInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stFeedExtendInfo];
    }
    if (self.stFeedCommentInfoList != nil)
    {
        [ostream writeMessage: 2 value: self.stFeedCommentInfoList];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFeedContent = (FeedContent*)[istream readMessageDef: 0 required: false def: self.stFeedContent VAR_TYPE: [FeedContent class]];
    self.stFeedExtendInfo = (FeedExtendInfo*)[istream readMessageDef: 1 required: false def: self.stFeedExtendInfo VAR_TYPE: [FeedExtendInfo class]];
    self.stFeedCommentInfoList = (FeedCommentInfoList*)[istream readMessageDef: 2 required: false def: self.stFeedCommentInfoList VAR_TYPE: [FeedCommentInfoList class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stFeedContent" value : [BaseJSON writeMessage : self.stFeedContent]];
    [JsonRoot append:@"stFeedExtendInfo" value : [BaseJSON writeMessage : self.stFeedExtendInfo]];
    [JsonRoot append:@"stFeedCommentInfoList" value : [BaseJSON writeMessage : self.stFeedCommentInfoList]];
    return JsonRoot;
}

- (FeedItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stFeedContent = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFeedContent"] required:false def:self.stFeedContent VAR_TYPE: [FeedContent class]];
    self.stFeedExtendInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFeedExtendInfo"] required:false def:self.stFeedExtendInfo VAR_TYPE: [FeedExtendInfo class]];
    self.stFeedCommentInfoList = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFeedCommentInfoList"] required:false def:self.stFeedCommentInfoList VAR_TYPE: [FeedCommentInfoList class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetCommentInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sFeedId = @"";
        self.iDirection = 0;
        self.sStartId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 1 value: self.sFeedId];
    }
    [ostream writeInt32: 2 value: self.iDirection];
    if (self.sStartId != nil)
    {
        [ostream writeString: 3 value: self.sStartId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetCommentInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [istream readStringDef: 1 required: false def: self.sFeedId];
    self.iDirection = [istream readInt32Def: 2 required: false def: self.iDirection];
    self.sStartId = [istream readStringDef: 3 required: false def: self.sStartId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"iDirection" value : [BaseJSON writeInt32 : self.iDirection]];
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    return JsonRoot;
}

- (GetCommentInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.iDirection = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDirection"] required:false def:self.iDirection];
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetCommentInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.vCommentList = [NSMutableArray arrayWithCapacity:0];
        self.mFeedUserBaseInfo = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.iStatus = 0;
        self.iTotal = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vCommentList != nil)
    {
        [ostream writeList: 0 value: self.vCommentList VAR_TYPE: [THOTH_LIST CREATE: [FeedCommentInfo class]]];
    }
    if (self.mFeedUserBaseInfo != nil)
    {
        [ostream writeMap: 1 value: self.mFeedUserBaseInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [FeedUserBaseInfo class]]];
    }
    [ostream writeInt32: 2 value: self.iStatus];
    [ostream writeInt32: 3 value: self.iTotal];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetCommentInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vCommentList = [istream readListDef: 0 required: false def: self.vCommentList VAR_TYPE: [THOTH_LIST CREATE: [FeedCommentInfo class]]];
    self.mFeedUserBaseInfo = [istream readMapDef: 1 required: false def: self.mFeedUserBaseInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [FeedUserBaseInfo class]]];
    self.iStatus = [istream readInt32Def: 2 required: false def: self.iStatus];
    self.iTotal = [istream readInt32Def: 3 required: false def: self.iTotal];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vCommentList" value : [BaseJSON writeList : self.vCommentList VAR_TYPE: [THOTH_LIST CREATE: [FeedCommentInfo class]]]];
    [JsonRoot append:@"mFeedUserBaseInfo" value : [BaseJSON writeMap : self.mFeedUserBaseInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [FeedUserBaseInfo class]]]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"iTotal" value : [BaseJSON writeInt32 : self.iTotal]];
    return JsonRoot;
}

- (GetCommentInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vCommentList = [BaseJSON readListDef:[RootMap objectForKey:@"vCommentList"] required:false def:self.vCommentList VAR_TYPE: [THOTH_LIST CREATE: [FeedCommentInfo class]]];
    self.mFeedUserBaseInfo = [BaseJSON readMapDef:[RootMap objectForKey:@"mFeedUserBaseInfo"] required:false def:self.mFeedUserBaseInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [FeedUserBaseInfo class]]];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.iTotal = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotal"] required:false def:self.iTotal];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PoCommentReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sFeedId = @"";
        self.sContent = @"";
        self.stReplyComment = [[ReplyCommentInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sCommentNickName = @"";
        self.sClientCommentId = @"";
        self.eFeedType = E_FT_STOCK_REVIEW;
        self.sCommentId = @"";
        self.eFeedSourceType = E_FEED_SOURCE_USER;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 1 value: self.sFeedId];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 2 value: self.sContent];
    }
    if (self.stReplyComment != nil)
    {
        [ostream writeMessage: 3 value: self.stReplyComment];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 4 value: self.stAccountTicket];
    }
    if (self.sCommentNickName != nil)
    {
        [ostream writeString: 5 value: self.sCommentNickName];
    }
    if (self.sClientCommentId != nil)
    {
        [ostream writeString: 6 value: self.sClientCommentId];
    }
    [ostream writeInt32: 7 value: (int32_t)self.eFeedType];
    if (self.sCommentId != nil)
    {
        [ostream writeString: 8 value: self.sCommentId];
    }
    [ostream writeInt32: 9 value: (int32_t)self.eFeedSourceType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PoCommentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [istream readStringDef: 1 required: false def: self.sFeedId];
    self.sContent = [istream readStringDef: 2 required: false def: self.sContent];
    self.stReplyComment = (ReplyCommentInfo*)[istream readMessageDef: 3 required: false def: self.stReplyComment VAR_TYPE: [ReplyCommentInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 4 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sCommentNickName = [istream readStringDef: 5 required: false def: self.sCommentNickName];
    self.sClientCommentId = [istream readStringDef: 6 required: false def: self.sClientCommentId];
    self.eFeedType = [istream readInt32Def: 7 required: false def: (int32_t)self.eFeedType];
    self.sCommentId = [istream readStringDef: 8 required: false def: self.sCommentId];
    self.eFeedSourceType = [istream readInt32Def: 9 required: false def: (int32_t)self.eFeedSourceType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    [JsonRoot append:@"stReplyComment" value : [BaseJSON writeMessage : self.stReplyComment]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"sCommentNickName" value : [BaseJSON writeString : self.sCommentNickName]];
    [JsonRoot append:@"sClientCommentId" value : [BaseJSON writeString : self.sClientCommentId]];
    [JsonRoot append:@"eFeedType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedType]];
    [JsonRoot append:@"sCommentId" value : [BaseJSON writeString : self.sCommentId]];
    [JsonRoot append:@"eFeedSourceType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedSourceType]];
    return JsonRoot;
}

- (PoCommentReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
    self.stReplyComment = [BaseJSON readMessageDef:[RootMap objectForKey:@"stReplyComment"] required:false def:self.stReplyComment VAR_TYPE: [ReplyCommentInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sCommentNickName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCommentNickName"] required:false def:self.sCommentNickName];
    self.sClientCommentId = [BaseJSON readStringDef:[RootMap objectForKey:@"sClientCommentId"] required:false def:self.sClientCommentId];
    self.eFeedType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedType"] required:false def:(int32_t)self.eFeedType];
    self.sCommentId = [BaseJSON readStringDef:[RootMap objectForKey:@"sCommentId"] required:false def:self.sCommentId];
    self.eFeedSourceType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedSourceType"] required:false def:(int32_t)self.eFeedSourceType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PoCommentRsp
- (id) init
{
    if (self = [super init])
    {
        self.sCommentId = @"";
        self.sClientCommentId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sCommentId != nil)
    {
        [ostream writeString: 1 value: self.sCommentId];
    }
    if (self.sClientCommentId != nil)
    {
        [ostream writeString: 2 value: self.sClientCommentId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PoCommentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sCommentId = [istream readStringDef: 1 required: false def: self.sCommentId];
    self.sClientCommentId = [istream readStringDef: 2 required: false def: self.sClientCommentId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sCommentId" value : [BaseJSON writeString : self.sCommentId]];
    [JsonRoot append:@"sClientCommentId" value : [BaseJSON writeString : self.sClientCommentId]];
    return JsonRoot;
}

- (PoCommentRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sCommentId = [BaseJSON readStringDef:[RootMap objectForKey:@"sCommentId"] required:false def:self.sCommentId];
    self.sClientCommentId = [BaseJSON readStringDef:[RootMap objectForKey:@"sClientCommentId"] required:false def:self.sClientCommentId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetFeedUserInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iOtherAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    [ostream writeUInt32: 2 value: self.iOtherAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetFeedUserInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iOtherAccountId = [istream readUInt32Def: 2 required: false def: self.iOtherAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iOtherAccountId" value : [BaseJSON writeUInt32 : self.iOtherAccountId]];
    return JsonRoot;
}

- (GetFeedUserInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iOtherAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iOtherAccountId"] required:false def:self.iOtherAccountId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetFeedUserInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.stFeedUserBaseInfo = [[FeedUserBaseInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFeedUserBaseInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stFeedUserBaseInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetFeedUserInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFeedUserBaseInfo = (FeedUserBaseInfo*)[istream readMessageDef: 0 required: false def: self.stFeedUserBaseInfo VAR_TYPE: [FeedUserBaseInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stFeedUserBaseInfo" value : [BaseJSON writeMessage : self.stFeedUserBaseInfo]];
    return JsonRoot;
}

- (GetFeedUserInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stFeedUserBaseInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFeedUserBaseInfo"] required:false def:self.stFeedUserBaseInfo VAR_TYPE: [FeedUserBaseInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserRelationReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eFeedUserRelationType = E_FURT_FOLLOWER;
        self.iDirection = 0;
        self.sStartId = @"";
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iOtherAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eFeedUserRelationType];
    [ostream writeInt32: 2 value: self.iDirection];
    if (self.sStartId != nil)
    {
        [ostream writeString: 3 value: self.sStartId];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 4 value: self.stAccountTicket];
    }
    [ostream writeUInt32: 5 value: self.iOtherAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserRelationReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eFeedUserRelationType = [istream readInt32Def: 1 required: false def: (int32_t)self.eFeedUserRelationType];
    self.iDirection = [istream readInt32Def: 2 required: false def: self.iDirection];
    self.sStartId = [istream readStringDef: 3 required: false def: self.sStartId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 4 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iOtherAccountId = [istream readUInt32Def: 5 required: false def: self.iOtherAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"eFeedUserRelationType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedUserRelationType]];
    [JsonRoot append:@"iDirection" value : [BaseJSON writeInt32 : self.iDirection]];
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iOtherAccountId" value : [BaseJSON writeUInt32 : self.iOtherAccountId]];
    return JsonRoot;
}

- (GetUserRelationReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eFeedUserRelationType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedUserRelationType"] required:false def:(int32_t)self.eFeedUserRelationType];
    self.iDirection = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDirection"] required:false def:self.iDirection];
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iOtherAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iOtherAccountId"] required:false def:self.iOtherAccountId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserRelationRsp
- (id) init
{
    if (self = [super init])
    {
        self.stFeedUserRelation = [[FeedUserRelation alloc] init];
        self.mRelation = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.iStatus = 0;
        self.sNextStartId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFeedUserRelation != nil)
    {
        [ostream writeMessage: 0 value: self.stFeedUserRelation];
    }
    if (self.mRelation != nil)
    {
        [ostream writeMap: 1 value: self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    }
    [ostream writeInt32: 2 value: self.iStatus];
    if (self.sNextStartId != nil)
    {
        [ostream writeString: 3 value: self.sNextStartId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserRelationRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFeedUserRelation = (FeedUserRelation*)[istream readMessageDef: 0 required: false def: self.stFeedUserRelation VAR_TYPE: [FeedUserRelation class]];
    self.mRelation = [istream readMapDef: 1 required: false def: self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    self.iStatus = [istream readInt32Def: 2 required: false def: self.iStatus];
    self.sNextStartId = [istream readStringDef: 3 required: false def: self.sNextStartId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stFeedUserRelation" value : [BaseJSON writeMessage : self.stFeedUserRelation]];
    [JsonRoot append:@"mRelation" value : [BaseJSON writeMap : self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"sNextStartId" value : [BaseJSON writeString : self.sNextStartId]];
    return JsonRoot;
}

- (GetUserRelationRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stFeedUserRelation = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFeedUserRelation"] required:false def:self.stFeedUserRelation VAR_TYPE: [FeedUserRelation class]];
    self.mRelation = [BaseJSON readMapDef:[RootMap objectForKey:@"mRelation"] required:false def:self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.sNextStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextStartId"] required:false def:self.sNextStartId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetRelationBatchReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.vAccountId = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    if (self.vAccountId != nil)
    {
        [ostream writeList: 2 value: self.vAccountId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_UINT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetRelationBatchReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.vAccountId = [istream readListDef: 2 required: false def: self.vAccountId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_UINT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"vAccountId" value : [BaseJSON writeList : self.vAccountId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_UINT32 class]]]];
    return JsonRoot;
}

- (GetRelationBatchReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.vAccountId = [BaseJSON readListDef:[RootMap objectForKey:@"vAccountId"] required:false def:self.vAccountId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_UINT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetRelationBatchRsp
- (id) init
{
    if (self = [super init])
    {
        self.mRelation = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mRelation != nil)
    {
        [ostream writeMap: 0 value: self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetRelationBatchRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mRelation = [istream readMapDef: 0 required: false def: self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mRelation" value : [BaseJSON writeMap : self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (GetRelationBatchRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mRelation = [BaseJSON readMapDef:[RootMap objectForKey:@"mRelation"] required:false def:self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SetUserRelationReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eSetType = E_FURST_FOLLOW;
        self.iDstAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eSetType];
    [ostream writeUInt32: 2 value: self.iDstAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 3 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SetUserRelationReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eSetType = [istream readInt32Def: 1 required: false def: (int32_t)self.eSetType];
    self.iDstAccountId = [istream readUInt32Def: 2 required: false def: self.iDstAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 3 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"eSetType" value : [BaseJSON writeInt32 : (int32_t)self.eSetType]];
    [JsonRoot append:@"iDstAccountId" value : [BaseJSON writeUInt32 : self.iDstAccountId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    return JsonRoot;
}

- (SetUserRelationReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eSetType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSetType"] required:false def:(int32_t)self.eSetType];
    self.iDstAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iDstAccountId"] required:false def:self.iDstAccountId];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SetUserRelationRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRetCode = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRetCode];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SetUserRelationRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRetCode = [istream readInt32Def: 0 required: false def: self.iRetCode];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iRetCode" value : [BaseJSON writeInt32 : self.iRetCode]];
    return JsonRoot;
}

- (SetUserRelationRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRetCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRetCode"] required:false def:self.iRetCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetFeedListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eFeedGroupType = E_FGT_ALL;
        self.iDirection = 0;
        self.sStartFeedId = @"";
        self.sDtSecCode = @"";
        self.eSelfType = E_FT_ALL;
        self.iOtherAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eFeedGroupType];
    [ostream writeInt32: 2 value: self.iDirection];
    if (self.sStartFeedId != nil)
    {
        [ostream writeString: 3 value: self.sStartFeedId];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 4 value: self.sDtSecCode];
    }
    [ostream writeInt32: 5 value: (int32_t)self.eSelfType];
    [ostream writeUInt32: 6 value: self.iOtherAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetFeedListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eFeedGroupType = [istream readInt32Def: 1 required: false def: (int32_t)self.eFeedGroupType];
    self.iDirection = [istream readInt32Def: 2 required: false def: self.iDirection];
    self.sStartFeedId = [istream readStringDef: 3 required: false def: self.sStartFeedId];
    self.sDtSecCode = [istream readStringDef: 4 required: false def: self.sDtSecCode];
    self.eSelfType = [istream readInt32Def: 5 required: false def: (int32_t)self.eSelfType];
    self.iOtherAccountId = [istream readUInt32Def: 6 required: false def: self.iOtherAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"eFeedGroupType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedGroupType]];
    [JsonRoot append:@"iDirection" value : [BaseJSON writeInt32 : self.iDirection]];
    [JsonRoot append:@"sStartFeedId" value : [BaseJSON writeString : self.sStartFeedId]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"eSelfType" value : [BaseJSON writeInt32 : (int32_t)self.eSelfType]];
    [JsonRoot append:@"iOtherAccountId" value : [BaseJSON writeUInt32 : self.iOtherAccountId]];
    return JsonRoot;
}

- (GetFeedListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eFeedGroupType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedGroupType"] required:false def:(int32_t)self.eFeedGroupType];
    self.iDirection = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDirection"] required:false def:self.iDirection];
    self.sStartFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartFeedId"] required:false def:self.sStartFeedId];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eSelfType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSelfType"] required:false def:(int32_t)self.eSelfType];
    self.iOtherAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iOtherAccountId"] required:false def:self.iOtherAccountId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetFeedListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vFeedItem = [NSMutableArray arrayWithCapacity:0];
        self.mFeedUserBaseInfo = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.iStatus = 0;
        self.iTotal = 0;
        self.vTopFeedItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vFeedItem != nil)
    {
        [ostream writeList: 0 value: self.vFeedItem VAR_TYPE: [THOTH_LIST CREATE: [FeedItem class]]];
    }
    if (self.mFeedUserBaseInfo != nil)
    {
        [ostream writeMap: 1 value: self.mFeedUserBaseInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [FeedUserBaseInfo class]]];
    }
    [ostream writeInt32: 2 value: self.iStatus];
    [ostream writeInt32: 3 value: self.iTotal];
    if (self.vTopFeedItem != nil)
    {
        [ostream writeList: 4 value: self.vTopFeedItem VAR_TYPE: [THOTH_LIST CREATE: [FeedItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetFeedListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vFeedItem = [istream readListDef: 0 required: false def: self.vFeedItem VAR_TYPE: [THOTH_LIST CREATE: [FeedItem class]]];
    self.mFeedUserBaseInfo = [istream readMapDef: 1 required: false def: self.mFeedUserBaseInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [FeedUserBaseInfo class]]];
    self.iStatus = [istream readInt32Def: 2 required: false def: self.iStatus];
    self.iTotal = [istream readInt32Def: 3 required: false def: self.iTotal];
    self.vTopFeedItem = [istream readListDef: 4 required: false def: self.vTopFeedItem VAR_TYPE: [THOTH_LIST CREATE: [FeedItem class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vFeedItem" value : [BaseJSON writeList : self.vFeedItem VAR_TYPE: [THOTH_LIST CREATE: [FeedItem class]]]];
    [JsonRoot append:@"mFeedUserBaseInfo" value : [BaseJSON writeMap : self.mFeedUserBaseInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [FeedUserBaseInfo class]]]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"iTotal" value : [BaseJSON writeInt32 : self.iTotal]];
    [JsonRoot append:@"vTopFeedItem" value : [BaseJSON writeList : self.vTopFeedItem VAR_TYPE: [THOTH_LIST CREATE: [FeedItem class]]]];
    return JsonRoot;
}

- (GetFeedListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vFeedItem = [BaseJSON readListDef:[RootMap objectForKey:@"vFeedItem"] required:false def:self.vFeedItem VAR_TYPE: [THOTH_LIST CREATE: [FeedItem class]]];
    self.mFeedUserBaseInfo = [BaseJSON readMapDef:[RootMap objectForKey:@"mFeedUserBaseInfo"] required:false def:self.mFeedUserBaseInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [FeedUserBaseInfo class]]];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.iTotal = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotal"] required:false def:self.iTotal];
    self.vTopFeedItem = [BaseJSON readListDef:[RootMap objectForKey:@"vTopFeedItem"] required:false def:self.vTopFeedItem VAR_TYPE: [THOTH_LIST CREATE: [FeedItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SetFeedListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sFeedId = @"";
        self.eFeedListType = E_FLT_INSERT;
        self.sKey = @"";
        self.eSetFeedListType = E_SFLT_ACCOUNT;
        self.eFeedType = E_FT_STOCK_REVIEW;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 1 value: self.sFeedId];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eFeedListType];
    if (self.sKey != nil)
    {
        [ostream writeString: 3 value: self.sKey];
    }
    [ostream writeInt32: 4 value: (int32_t)self.eSetFeedListType];
    [ostream writeInt32: 5 value: (int32_t)self.eFeedType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SetFeedListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [istream readStringDef: 1 required: false def: self.sFeedId];
    self.eFeedListType = [istream readInt32Def: 2 required: false def: (int32_t)self.eFeedListType];
    self.sKey = [istream readStringDef: 3 required: false def: self.sKey];
    self.eSetFeedListType = [istream readInt32Def: 4 required: false def: (int32_t)self.eSetFeedListType];
    self.eFeedType = [istream readInt32Def: 5 required: false def: (int32_t)self.eFeedType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"eFeedListType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedListType]];
    [JsonRoot append:@"sKey" value : [BaseJSON writeString : self.sKey]];
    [JsonRoot append:@"eSetFeedListType" value : [BaseJSON writeInt32 : (int32_t)self.eSetFeedListType]];
    [JsonRoot append:@"eFeedType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedType]];
    return JsonRoot;
}

- (SetFeedListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.eFeedListType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedListType"] required:false def:(int32_t)self.eFeedListType];
    self.sKey = [BaseJSON readStringDef:[RootMap objectForKey:@"sKey"] required:false def:self.sKey];
    self.eSetFeedListType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSetFeedListType"] required:false def:(int32_t)self.eSetFeedListType];
    self.eFeedType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedType"] required:false def:(int32_t)self.eFeedType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SetFeedListRsp
- (id) init
{
    if (self = [super init])
    {
        self.iTotalSize = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTotalSize];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SetFeedListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTotalSize = [istream readInt32Def: 0 required: false def: self.iTotalSize];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iTotalSize" value : [BaseJSON writeInt32 : self.iTotalSize]];
    return JsonRoot;
}

- (SetFeedListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iTotalSize = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalSize"] required:false def:self.iTotalSize];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PoFeedReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sTitle = @"";
        self.sContent = @"";
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.vRelateSec = [NSMutableArray arrayWithCapacity:0];
        self.eType = E_FT_STOCK_REVIEW;
        self.eAttiType = E_FIAT_NEUTRAL;
        self.sDescription = @"";
        self.sClientFeedId = @"";
        self.sFeedId = @"";
        self.iPubTime = -1;
        self.eFeedSourceType = E_FEED_SOURCE_USER;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.sTitle != nil)
    {
        [ostream writeString: 1 value: self.sTitle];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 2 value: self.sContent];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 3 value: self.stAccountTicket];
    }
    if (self.vRelateSec != nil)
    {
        [ostream writeList: 4 value: self.vRelateSec VAR_TYPE: [THOTH_LIST CREATE: [SecCodeName class]]];
    }
    [ostream writeInt32: 5 value: (int32_t)self.eType];
    [ostream writeInt32: 6 value: (int32_t)self.eAttiType];
    if (self.sDescription != nil)
    {
        [ostream writeString: 7 value: self.sDescription];
    }
    if (self.sClientFeedId != nil)
    {
        [ostream writeString: 8 value: self.sClientFeedId];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 9 value: self.sFeedId];
    }
    [ostream writeInt32: 10 value: self.iPubTime];
    [ostream writeInt32: 11 value: (int32_t)self.eFeedSourceType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PoFeedReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    self.sContent = [istream readStringDef: 2 required: false def: self.sContent];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 3 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.vRelateSec = [istream readListDef: 4 required: false def: self.vRelateSec VAR_TYPE: [THOTH_LIST CREATE: [SecCodeName class]]];
    self.eType = [istream readInt32Def: 5 required: false def: (int32_t)self.eType];
    self.eAttiType = [istream readInt32Def: 6 required: false def: (int32_t)self.eAttiType];
    self.sDescription = [istream readStringDef: 7 required: false def: self.sDescription];
    self.sClientFeedId = [istream readStringDef: 8 required: false def: self.sClientFeedId];
    self.sFeedId = [istream readStringDef: 9 required: false def: self.sFeedId];
    self.iPubTime = [istream readInt32Def: 10 required: false def: self.iPubTime];
    self.eFeedSourceType = [istream readInt32Def: 11 required: false def: (int32_t)self.eFeedSourceType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"vRelateSec" value : [BaseJSON writeList : self.vRelateSec VAR_TYPE: [THOTH_LIST CREATE: [SecCodeName class]]]];
    [JsonRoot append:@"eType" value : [BaseJSON writeInt32 : (int32_t)self.eType]];
    [JsonRoot append:@"eAttiType" value : [BaseJSON writeInt32 : (int32_t)self.eAttiType]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"sClientFeedId" value : [BaseJSON writeString : self.sClientFeedId]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"iPubTime" value : [BaseJSON writeInt32 : self.iPubTime]];
    [JsonRoot append:@"eFeedSourceType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedSourceType]];
    return JsonRoot;
}

- (PoFeedReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.vRelateSec = [BaseJSON readListDef:[RootMap objectForKey:@"vRelateSec"] required:false def:self.vRelateSec VAR_TYPE: [THOTH_LIST CREATE: [SecCodeName class]]];
    self.eType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eType"] required:false def:(int32_t)self.eType];
    self.eAttiType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eAttiType"] required:false def:(int32_t)self.eAttiType];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.sClientFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sClientFeedId"] required:false def:self.sClientFeedId];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.iPubTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPubTime"] required:false def:self.iPubTime];
    self.eFeedSourceType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedSourceType"] required:false def:(int32_t)self.eFeedSourceType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PoFeedRsp
- (id) init
{
    if (self = [super init])
    {
        self.sFeedId = @"";
        self.sClientFeedId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sFeedId != nil)
    {
        [ostream writeString: 1 value: self.sFeedId];
    }
    if (self.sClientFeedId != nil)
    {
        [ostream writeString: 2 value: self.sClientFeedId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PoFeedRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sFeedId = [istream readStringDef: 1 required: false def: self.sFeedId];
    self.sClientFeedId = [istream readStringDef: 2 required: false def: self.sClientFeedId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"sClientFeedId" value : [BaseJSON writeString : self.sClientFeedId]];
    return JsonRoot;
}

- (PoFeedRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.sClientFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sClientFeedId"] required:false def:self.sClientFeedId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DelFeedReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sFeedId = @"";
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sDtSecCode = @"";
        self.eSetFeedListType = E_SFLT_ACCOUNT;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 1 value: self.sFeedId];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 3 value: self.sDtSecCode];
    }
    [ostream writeInt32: 4 value: (int32_t)self.eSetFeedListType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DelFeedReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [istream readStringDef: 1 required: false def: self.sFeedId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sDtSecCode = [istream readStringDef: 3 required: false def: self.sDtSecCode];
    self.eSetFeedListType = [istream readInt32Def: 4 required: false def: (int32_t)self.eSetFeedListType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"eSetFeedListType" value : [BaseJSON writeInt32 : (int32_t)self.eSetFeedListType]];
    return JsonRoot;
}

- (DelFeedReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eSetFeedListType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSetFeedListType"] required:false def:(int32_t)self.eSetFeedListType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DelCommentReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sCommentId = @"";
        self.sFeedId = @"";
        self.stAccountTicket = [[AccountTicket alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.sCommentId != nil)
    {
        [ostream writeString: 1 value: self.sCommentId];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 2 value: self.sFeedId];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 3 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DelCommentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sCommentId = [istream readStringDef: 1 required: false def: self.sCommentId];
    self.sFeedId = [istream readStringDef: 2 required: false def: self.sFeedId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 3 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"sCommentId" value : [BaseJSON writeString : self.sCommentId]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    return JsonRoot;
}

- (DelCommentReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sCommentId = [BaseJSON readStringDef:[RootMap objectForKey:@"sCommentId"] required:false def:self.sCommentId];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserRelationListReq
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
        self.eFeedUserRelationType = E_FURT_FOLLOWER;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    [ostream writeInt32: 1 value: (int32_t)self.eFeedUserRelationType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserRelationListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    self.eFeedUserRelationType = [istream readInt32Def: 1 required: false def: (int32_t)self.eFeedUserRelationType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"eFeedUserRelationType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedUserRelationType]];
    return JsonRoot;
}

- (GetUserRelationListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.eFeedUserRelationType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedUserRelationType"] required:false def:(int32_t)self.eFeedUserRelationType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserRelationListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vAccountId = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vAccountId != nil)
    {
        [ostream writeList: 0 value: self.vAccountId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_UINT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserRelationListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vAccountId = [istream readListDef: 0 required: false def: self.vAccountId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_UINT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vAccountId" value : [BaseJSON writeList : self.vAccountId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_UINT32 class]]]];
    return JsonRoot;
}

- (GetUserRelationListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vAccountId = [BaseJSON readListDef:[RootMap objectForKey:@"vAccountId"] required:false def:self.vAccountId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_UINT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LikeReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sFeedId = @"";
        self.isAdd = true;
        self.eFeedType = E_FT_STOCK_REVIEW;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 2 value: self.sFeedId];
    }
    [ostream writeBoolean: 3 value: self.isAdd];
    [ostream writeInt32: 4 value: (int32_t)self.eFeedType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LikeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sFeedId = [istream readStringDef: 2 required: false def: self.sFeedId];
    self.isAdd = [istream readBooleanDef: 3 required: false def: self.isAdd];
    self.eFeedType = [istream readInt32Def: 4 required: false def: (int32_t)self.eFeedType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"isAdd" value : [BaseJSON writeBoolean : self.isAdd]];
    [JsonRoot append:@"eFeedType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedType]];
    return JsonRoot;
}

- (LikeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.isAdd = [BaseJSON readBooleanDef:[RootMap objectForKey:@"isAdd"] required:false def:self.isAdd];
    self.eFeedType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedType"] required:false def:(int32_t)self.eFeedType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LikeRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LikeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iRet" value : [BaseJSON writeInt32 : self.iRet]];
    return JsonRoot;
}

- (LikeRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRet = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRet"] required:false def:self.iRet];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetFeedReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sFeedId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 2 value: self.sFeedId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetFeedReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sFeedId = [istream readStringDef: 2 required: false def: self.sFeedId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    return JsonRoot;
}

- (GetFeedReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetFeedRsp
- (id) init
{
    if (self = [super init])
    {
        self.stFeedItem = [[FeedItem alloc] init];
        self.stFeedUserBaseInfo = [[FeedUserBaseInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFeedItem != nil)
    {
        [ostream writeMessage: 0 value: self.stFeedItem];
    }
    if (self.stFeedUserBaseInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stFeedUserBaseInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetFeedRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFeedItem = (FeedItem*)[istream readMessageDef: 0 required: false def: self.stFeedItem VAR_TYPE: [FeedItem class]];
    self.stFeedUserBaseInfo = (FeedUserBaseInfo*)[istream readMessageDef: 1 required: false def: self.stFeedUserBaseInfo VAR_TYPE: [FeedUserBaseInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stFeedItem" value : [BaseJSON writeMessage : self.stFeedItem]];
    [JsonRoot append:@"stFeedUserBaseInfo" value : [BaseJSON writeMessage : self.stFeedUserBaseInfo]];
    return JsonRoot;
}

- (GetFeedRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stFeedItem = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFeedItem"] required:false def:self.stFeedItem VAR_TYPE: [FeedItem class]];
    self.stFeedUserBaseInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFeedUserBaseInfo"] required:false def:self.stFeedUserBaseInfo VAR_TYPE: [FeedUserBaseInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DoAccessCountReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sFeedId = @"";
        self.eType = E_FT_STOCK_REVIEW;
        self.sFeedTitle = @"";
        self.iPubAccountId = 0;
        self.sPubNickName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 1 value: self.sFeedId];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eType];
    if (self.sFeedTitle != nil)
    {
        [ostream writeString: 3 value: self.sFeedTitle];
    }
    [ostream writeUInt32: 4 value: self.iPubAccountId];
    if (self.sPubNickName != nil)
    {
        [ostream writeString: 5 value: self.sPubNickName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DoAccessCountReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [istream readStringDef: 1 required: false def: self.sFeedId];
    self.eType = [istream readInt32Def: 2 required: false def: (int32_t)self.eType];
    self.sFeedTitle = [istream readStringDef: 3 required: false def: self.sFeedTitle];
    self.iPubAccountId = [istream readUInt32Def: 4 required: false def: self.iPubAccountId];
    self.sPubNickName = [istream readStringDef: 5 required: false def: self.sPubNickName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"eType" value : [BaseJSON writeInt32 : (int32_t)self.eType]];
    [JsonRoot append:@"sFeedTitle" value : [BaseJSON writeString : self.sFeedTitle]];
    [JsonRoot append:@"iPubAccountId" value : [BaseJSON writeUInt32 : self.iPubAccountId]];
    [JsonRoot append:@"sPubNickName" value : [BaseJSON writeString : self.sPubNickName]];
    return JsonRoot;
}

- (DoAccessCountReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.eType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eType"] required:false def:(int32_t)self.eType];
    self.sFeedTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedTitle"] required:false def:self.sFeedTitle];
    self.iPubAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iPubAccountId"] required:false def:self.iPubAccountId];
    self.sPubNickName = [BaseJSON readStringDef:[RootMap objectForKey:@"sPubNickName"] required:false def:self.sPubNickName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdjustFeedListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.eSetFeedListType = E_SFLT_ACCOUNT;
        self.eFeedType = E_FT_ALL;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eSetFeedListType];
    [ostream writeInt32: 3 value: (int32_t)self.eFeedType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdjustFeedListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.eSetFeedListType = [istream readInt32Def: 2 required: false def: (int32_t)self.eSetFeedListType];
    self.eFeedType = [istream readInt32Def: 3 required: false def: (int32_t)self.eFeedType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"eSetFeedListType" value : [BaseJSON writeInt32 : (int32_t)self.eSetFeedListType]];
    [JsonRoot append:@"eFeedType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedType]];
    return JsonRoot;
}

- (AdjustFeedListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eSetFeedListType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSetFeedListType"] required:false def:(int32_t)self.eSetFeedListType];
    self.eFeedType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFeedType"] required:false def:(int32_t)self.eFeedType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InitFeedExtendReq
- (id) init
{
    if (self = [super init])
    {
        self.sFeedId = @"";
        self.eType = E_EXTEND_ALL;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sFeedId != nil)
    {
        [ostream writeString: 0 value: self.sFeedId];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InitFeedExtendReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sFeedId = [istream readStringDef: 0 required: false def: self.sFeedId];
    self.eType = [istream readInt32Def: 1 required: false def: (int32_t)self.eType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"eType" value : [BaseJSON writeInt32 : (int32_t)self.eType]];
    return JsonRoot;
}

- (InitFeedExtendReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.eType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eType"] required:false def:(int32_t)self.eType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InitFeedExtendRsp
- (id) init
{
    if (self = [super init])
    {
        self.iLikeInitNumber = 0;
        self.iAccessInitNumber = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iLikeInitNumber];
    [ostream writeInt32: 1 value: self.iAccessInitNumber];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InitFeedExtendRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iLikeInitNumber = [istream readInt32Def: 0 required: false def: self.iLikeInitNumber];
    self.iAccessInitNumber = [istream readInt32Def: 1 required: false def: self.iAccessInitNumber];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iLikeInitNumber" value : [BaseJSON writeInt32 : self.iLikeInitNumber]];
    [JsonRoot append:@"iAccessInitNumber" value : [BaseJSON writeInt32 : self.iAccessInitNumber]];
    return JsonRoot;
}

- (InitFeedExtendRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iLikeInitNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLikeInitNumber"] required:false def:self.iLikeInitNumber];
    self.iAccessInitNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAccessInitNumber"] required:false def:self.iAccessInitNumber];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DelFeedCommentListReq
- (id) init
{
    if (self = [super init])
    {
        self.sFeedId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sFeedId != nil)
    {
        [ostream writeString: 0 value: self.sFeedId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DelFeedCommentListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sFeedId = [istream readStringDef: 0 required: false def: self.sFeedId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    return JsonRoot;
}

- (DelFeedCommentListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetInvestRecommendReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetInvestRecommendReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    return JsonRoot;
}

- (GetInvestRecommendReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetInvestRecommendRsp
- (id) init
{
    if (self = [super init])
    {
        self.vFeedUserBaseInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vFeedUserBaseInfo != nil)
    {
        [ostream writeList: 0 value: self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetInvestRecommendRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vFeedUserBaseInfo = [istream readListDef: 0 required: false def: self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vFeedUserBaseInfo" value : [BaseJSON writeList : self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]]];
    return JsonRoot;
}

- (GetInvestRecommendRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vFeedUserBaseInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vFeedUserBaseInfo"] required:false def:self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FeedInvestListHead
- (id) init
{
    if (self = [super init])
    {
        self.iListType = 0;
        self.sListName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iListType];
    if (self.sListName != nil)
    {
        [ostream writeString: 1 value: self.sListName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedInvestListHead *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iListType = [istream readInt32Def: 0 required: false def: self.iListType];
    self.sListName = [istream readStringDef: 1 required: false def: self.sListName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iListType" value : [BaseJSON writeInt32 : self.iListType]];
    [JsonRoot append:@"sListName" value : [BaseJSON writeString : self.sListName]];
    return JsonRoot;
}

- (FeedInvestListHead *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iListType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iListType"] required:false def:self.iListType];
    self.sListName = [BaseJSON readStringDef:[RootMap objectForKey:@"sListName"] required:false def:self.sListName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetInvestListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eListType = E_FILT_HOT;
        self.iDirection = 0;
        self.sStartId = @"";
        self.bGetListConf = false;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUserInfo];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eListType];
    [ostream writeInt32: 2 value: self.iDirection];
    if (self.sStartId != nil)
    {
        [ostream writeString: 3 value: self.sStartId];
    }
    [ostream writeBoolean: 4 value: self.bGetListConf];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetInvestListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eListType = [istream readInt32Def: 1 required: false def: (int32_t)self.eListType];
    self.iDirection = [istream readInt32Def: 2 required: false def: self.iDirection];
    self.sStartId = [istream readStringDef: 3 required: false def: self.sStartId];
    self.bGetListConf = [istream readBooleanDef: 4 required: false def: self.bGetListConf];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"eListType" value : [BaseJSON writeInt32 : (int32_t)self.eListType]];
    [JsonRoot append:@"iDirection" value : [BaseJSON writeInt32 : self.iDirection]];
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    [JsonRoot append:@"bGetListConf" value : [BaseJSON writeBoolean : self.bGetListConf]];
    return JsonRoot;
}

- (GetInvestListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eListType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eListType"] required:false def:(int32_t)self.eListType];
    self.iDirection = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDirection"] required:false def:self.iDirection];
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    self.bGetListConf = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bGetListConf"] required:false def:self.bGetListConf];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetInvestListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vFeedUserBaseInfo = [NSMutableArray arrayWithCapacity:0];
        self.mRelation = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.iStatus = 0;
        self.sNextStartId = @"";
        self.vHead = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vFeedUserBaseInfo != nil)
    {
        [ostream writeList: 1 value: self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    }
    if (self.mRelation != nil)
    {
        [ostream writeMap: 2 value: self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    }
    [ostream writeInt32: 3 value: self.iStatus];
    if (self.sNextStartId != nil)
    {
        [ostream writeString: 4 value: self.sNextStartId];
    }
    if (self.vHead != nil)
    {
        [ostream writeList: 5 value: self.vHead VAR_TYPE: [THOTH_LIST CREATE: [FeedInvestListHead class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetInvestListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vFeedUserBaseInfo = [istream readListDef: 1 required: false def: self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    self.mRelation = [istream readMapDef: 2 required: false def: self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    self.iStatus = [istream readInt32Def: 3 required: false def: self.iStatus];
    self.sNextStartId = [istream readStringDef: 4 required: false def: self.sNextStartId];
    self.vHead = [istream readListDef: 5 required: false def: self.vHead VAR_TYPE: [THOTH_LIST CREATE: [FeedInvestListHead class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vFeedUserBaseInfo" value : [BaseJSON writeList : self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]]];
    [JsonRoot append:@"mRelation" value : [BaseJSON writeMap : self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"sNextStartId" value : [BaseJSON writeString : self.sNextStartId]];
    [JsonRoot append:@"vHead" value : [BaseJSON writeList : self.vHead VAR_TYPE: [THOTH_LIST CREATE: [FeedInvestListHead class]]]];
    return JsonRoot;
}

- (GetInvestListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vFeedUserBaseInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vFeedUserBaseInfo"] required:false def:self.vFeedUserBaseInfo VAR_TYPE: [THOTH_LIST CREATE: [FeedUserBaseInfo class]]];
    self.mRelation = [BaseJSON readMapDef:[RootMap objectForKey:@"mRelation"] required:false def:self.mRelation VAR_TYPE: [THOTH_MAP CREATE: [THOTH_UINT32 class] VT: [THOTH_INT32 class]]];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.sNextStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextStartId"] required:false def:self.sNextStartId];
    self.vHead = [BaseJSON readListDef:[RootMap objectForKey:@"vHead"] required:false def:self.vHead VAR_TYPE: [THOTH_LIST CREATE: [FeedInvestListHead class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

