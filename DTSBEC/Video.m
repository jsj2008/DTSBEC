#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Video.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation VideoImg
- (id) init
{
    if (self = [super init])
    {
        self.sType = @"";
        self.sUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sType != nil)
    {
        [ostream writeString: 0 value: self.sType];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 1 value: self.sUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoImg *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sType = [istream readStringDef: 0 required: false def: self.sType];
    self.sUrl = [istream readStringDef: 1 required: false def: self.sUrl];
    
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
    [JsonRoot append:@"sType" value : [BaseJSON writeString : self.sType]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    return JsonRoot;
}

- (VideoImg *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sType = [BaseJSON readStringDef:[RootMap objectForKey:@"sType"] required:false def:self.sType];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoTeacher
- (id) init
{
    if (self = [super init])
    {
        self.sTeacherId = @"";
        self.sTeacherName = @"";
        self.sTeacherImg = @"";
        self.sTeacherDesc = @"";
        self.sTeacherTags = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTeacherId != nil)
    {
        [ostream writeString: 0 value: self.sTeacherId];
    }
    if (self.sTeacherName != nil)
    {
        [ostream writeString: 1 value: self.sTeacherName];
    }
    if (self.sTeacherImg != nil)
    {
        [ostream writeString: 2 value: self.sTeacherImg];
    }
    if (self.sTeacherDesc != nil)
    {
        [ostream writeString: 3 value: self.sTeacherDesc];
    }
    if (self.sTeacherTags != nil)
    {
        [ostream writeString: 4 value: self.sTeacherTags];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoTeacher *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTeacherId = [istream readStringDef: 0 required: false def: self.sTeacherId];
    self.sTeacherName = [istream readStringDef: 1 required: false def: self.sTeacherName];
    self.sTeacherImg = [istream readStringDef: 2 required: false def: self.sTeacherImg];
    self.sTeacherDesc = [istream readStringDef: 3 required: false def: self.sTeacherDesc];
    self.sTeacherTags = [istream readStringDef: 4 required: false def: self.sTeacherTags];
    
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
    [JsonRoot append:@"sTeacherId" value : [BaseJSON writeString : self.sTeacherId]];
    [JsonRoot append:@"sTeacherName" value : [BaseJSON writeString : self.sTeacherName]];
    [JsonRoot append:@"sTeacherImg" value : [BaseJSON writeString : self.sTeacherImg]];
    [JsonRoot append:@"sTeacherDesc" value : [BaseJSON writeString : self.sTeacherDesc]];
    [JsonRoot append:@"sTeacherTags" value : [BaseJSON writeString : self.sTeacherTags]];
    return JsonRoot;
}

- (VideoTeacher *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTeacherId = [BaseJSON readStringDef:[RootMap objectForKey:@"sTeacherId"] required:false def:self.sTeacherId];
    self.sTeacherName = [BaseJSON readStringDef:[RootMap objectForKey:@"sTeacherName"] required:false def:self.sTeacherName];
    self.sTeacherImg = [BaseJSON readStringDef:[RootMap objectForKey:@"sTeacherImg"] required:false def:self.sTeacherImg];
    self.sTeacherDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sTeacherDesc"] required:false def:self.sTeacherDesc];
    self.sTeacherTags = [BaseJSON readStringDef:[RootMap objectForKey:@"sTeacherTags"] required:false def:self.sTeacherTags];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoDesc
- (id) init
{
    if (self = [super init])
    {
        self.sVideoId = @"";
        self.iType = 0;
        self.sTitle = @"";
        self.sDescription = @"";
        self.iBeginTime = 0;
        self.iEndTime = 0;
        self.iLiveState = 0;
        self.sType = @"";
        self.vtVideoImg = [NSMutableArray arrayWithCapacity:0];
        self.vTags = [NSMutableArray arrayWithCapacity:0];
        self.stVideoTeacher = [[VideoTeacher alloc] init];
        self.sVodId = @"";
        self.sVodPassWord = @"";
        self.sWebVodId = @"";
        self.sWebVodPassWord = @"";
        self.sLiveId = @"";
        self.sLivePassWord = @"";
        self.sWebLiveId = @"";
        self.sWebLivePassWord = @"";
        self.iWatchNum = 0;
        self.iTotalJoinedNum = 0;
        self.iStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sVideoId != nil)
    {
        [ostream writeString: 0 value: self.sVideoId];
    }
    [ostream writeInt32: 1 value: self.iType];
    if (self.sTitle != nil)
    {
        [ostream writeString: 2 value: self.sTitle];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 3 value: self.sDescription];
    }
    [ostream writeInt32: 4 value: self.iBeginTime];
    [ostream writeInt32: 5 value: self.iEndTime];
    [ostream writeInt32: 6 value: self.iLiveState];
    if (self.sType != nil)
    {
        [ostream writeString: 7 value: self.sType];
    }
    if (self.vtVideoImg != nil)
    {
        [ostream writeList: 8 value: self.vtVideoImg VAR_TYPE: [THOTH_LIST CREATE: [VideoImg class]]];
    }
    if (self.vTags != nil)
    {
        [ostream writeList: 9 value: self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.stVideoTeacher != nil)
    {
        [ostream writeMessage: 10 value: self.stVideoTeacher];
    }
    if (self.sVodId != nil)
    {
        [ostream writeString: 11 value: self.sVodId];
    }
    if (self.sVodPassWord != nil)
    {
        [ostream writeString: 12 value: self.sVodPassWord];
    }
    if (self.sWebVodId != nil)
    {
        [ostream writeString: 13 value: self.sWebVodId];
    }
    if (self.sWebVodPassWord != nil)
    {
        [ostream writeString: 14 value: self.sWebVodPassWord];
    }
    if (self.sLiveId != nil)
    {
        [ostream writeString: 15 value: self.sLiveId];
    }
    if (self.sLivePassWord != nil)
    {
        [ostream writeString: 16 value: self.sLivePassWord];
    }
    if (self.sWebLiveId != nil)
    {
        [ostream writeString: 17 value: self.sWebLiveId];
    }
    if (self.sWebLivePassWord != nil)
    {
        [ostream writeString: 18 value: self.sWebLivePassWord];
    }
    [ostream writeInt32: 19 value: self.iWatchNum];
    [ostream writeInt32: 20 value: self.iTotalJoinedNum];
    [ostream writeInt32: 21 value: self.iStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sVideoId = [istream readStringDef: 0 required: false def: self.sVideoId];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    self.sTitle = [istream readStringDef: 2 required: false def: self.sTitle];
    self.sDescription = [istream readStringDef: 3 required: false def: self.sDescription];
    self.iBeginTime = [istream readInt32Def: 4 required: false def: self.iBeginTime];
    self.iEndTime = [istream readInt32Def: 5 required: false def: self.iEndTime];
    self.iLiveState = [istream readInt32Def: 6 required: false def: self.iLiveState];
    self.sType = [istream readStringDef: 7 required: false def: self.sType];
    self.vtVideoImg = [istream readListDef: 8 required: false def: self.vtVideoImg VAR_TYPE: [THOTH_LIST CREATE: [VideoImg class]]];
    self.vTags = [istream readListDef: 9 required: false def: self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.stVideoTeacher = (VideoTeacher*)[istream readMessageDef: 10 required: false def: self.stVideoTeacher VAR_TYPE: [VideoTeacher class]];
    self.sVodId = [istream readStringDef: 11 required: false def: self.sVodId];
    self.sVodPassWord = [istream readStringDef: 12 required: false def: self.sVodPassWord];
    self.sWebVodId = [istream readStringDef: 13 required: false def: self.sWebVodId];
    self.sWebVodPassWord = [istream readStringDef: 14 required: false def: self.sWebVodPassWord];
    self.sLiveId = [istream readStringDef: 15 required: false def: self.sLiveId];
    self.sLivePassWord = [istream readStringDef: 16 required: false def: self.sLivePassWord];
    self.sWebLiveId = [istream readStringDef: 17 required: false def: self.sWebLiveId];
    self.sWebLivePassWord = [istream readStringDef: 18 required: false def: self.sWebLivePassWord];
    self.iWatchNum = [istream readInt32Def: 19 required: false def: self.iWatchNum];
    self.iTotalJoinedNum = [istream readInt32Def: 20 required: false def: self.iTotalJoinedNum];
    self.iStatus = [istream readInt32Def: 21 required: false def: self.iStatus];
    
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
    [JsonRoot append:@"sVideoId" value : [BaseJSON writeString : self.sVideoId]];
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"iBeginTime" value : [BaseJSON writeInt32 : self.iBeginTime]];
    [JsonRoot append:@"iEndTime" value : [BaseJSON writeInt32 : self.iEndTime]];
    [JsonRoot append:@"iLiveState" value : [BaseJSON writeInt32 : self.iLiveState]];
    [JsonRoot append:@"sType" value : [BaseJSON writeString : self.sType]];
    [JsonRoot append:@"vtVideoImg" value : [BaseJSON writeList : self.vtVideoImg VAR_TYPE: [THOTH_LIST CREATE: [VideoImg class]]]];
    [JsonRoot append:@"vTags" value : [BaseJSON writeList : self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"stVideoTeacher" value : [BaseJSON writeMessage : self.stVideoTeacher]];
    [JsonRoot append:@"sVodId" value : [BaseJSON writeString : self.sVodId]];
    [JsonRoot append:@"sVodPassWord" value : [BaseJSON writeString : self.sVodPassWord]];
    [JsonRoot append:@"sWebVodId" value : [BaseJSON writeString : self.sWebVodId]];
    [JsonRoot append:@"sWebVodPassWord" value : [BaseJSON writeString : self.sWebVodPassWord]];
    [JsonRoot append:@"sLiveId" value : [BaseJSON writeString : self.sLiveId]];
    [JsonRoot append:@"sLivePassWord" value : [BaseJSON writeString : self.sLivePassWord]];
    [JsonRoot append:@"sWebLiveId" value : [BaseJSON writeString : self.sWebLiveId]];
    [JsonRoot append:@"sWebLivePassWord" value : [BaseJSON writeString : self.sWebLivePassWord]];
    [JsonRoot append:@"iWatchNum" value : [BaseJSON writeInt32 : self.iWatchNum]];
    [JsonRoot append:@"iTotalJoinedNum" value : [BaseJSON writeInt32 : self.iTotalJoinedNum]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    return JsonRoot;
}

- (VideoDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sVideoId"] required:false def:self.sVideoId];
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.iBeginTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iBeginTime"] required:false def:self.iBeginTime];
    self.iEndTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEndTime"] required:false def:self.iEndTime];
    self.iLiveState = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLiveState"] required:false def:self.iLiveState];
    self.sType = [BaseJSON readStringDef:[RootMap objectForKey:@"sType"] required:false def:self.sType];
    self.vtVideoImg = [BaseJSON readListDef:[RootMap objectForKey:@"vtVideoImg"] required:false def:self.vtVideoImg VAR_TYPE: [THOTH_LIST CREATE: [VideoImg class]]];
    self.vTags = [BaseJSON readListDef:[RootMap objectForKey:@"vTags"] required:false def:self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.stVideoTeacher = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVideoTeacher"] required:false def:self.stVideoTeacher VAR_TYPE: [VideoTeacher class]];
    self.sVodId = [BaseJSON readStringDef:[RootMap objectForKey:@"sVodId"] required:false def:self.sVodId];
    self.sVodPassWord = [BaseJSON readStringDef:[RootMap objectForKey:@"sVodPassWord"] required:false def:self.sVodPassWord];
    self.sWebVodId = [BaseJSON readStringDef:[RootMap objectForKey:@"sWebVodId"] required:false def:self.sWebVodId];
    self.sWebVodPassWord = [BaseJSON readStringDef:[RootMap objectForKey:@"sWebVodPassWord"] required:false def:self.sWebVodPassWord];
    self.sLiveId = [BaseJSON readStringDef:[RootMap objectForKey:@"sLiveId"] required:false def:self.sLiveId];
    self.sLivePassWord = [BaseJSON readStringDef:[RootMap objectForKey:@"sLivePassWord"] required:false def:self.sLivePassWord];
    self.sWebLiveId = [BaseJSON readStringDef:[RootMap objectForKey:@"sWebLiveId"] required:false def:self.sWebLiveId];
    self.sWebLivePassWord = [BaseJSON readStringDef:[RootMap objectForKey:@"sWebLivePassWord"] required:false def:self.sWebLivePassWord];
    self.iWatchNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWatchNum"] required:false def:self.iWatchNum];
    self.iTotalJoinedNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalJoinedNum"] required:false def:self.iTotalJoinedNum];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoList
- (id) init
{
    if (self = [super init])
    {
        self.vtVideoDesc = [NSMutableArray arrayWithCapacity:0];
        self.sOpeningVideoId = @"";
        self.sOpeningVideoPassword = @"";
        self.sWebOpeningVideoId = @"";
        self.sWebOpeningVideoPassword = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtVideoDesc != nil)
    {
        [ostream writeList: 0 value: self.vtVideoDesc VAR_TYPE: [THOTH_LIST CREATE: [VideoDesc class]]];
    }
    if (self.sOpeningVideoId != nil)
    {
        [ostream writeString: 1 value: self.sOpeningVideoId];
    }
    if (self.sOpeningVideoPassword != nil)
    {
        [ostream writeString: 2 value: self.sOpeningVideoPassword];
    }
    if (self.sWebOpeningVideoId != nil)
    {
        [ostream writeString: 3 value: self.sWebOpeningVideoId];
    }
    if (self.sWebOpeningVideoPassword != nil)
    {
        [ostream writeString: 4 value: self.sWebOpeningVideoPassword];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtVideoDesc = [istream readListDef: 0 required: false def: self.vtVideoDesc VAR_TYPE: [THOTH_LIST CREATE: [VideoDesc class]]];
    self.sOpeningVideoId = [istream readStringDef: 1 required: false def: self.sOpeningVideoId];
    self.sOpeningVideoPassword = [istream readStringDef: 2 required: false def: self.sOpeningVideoPassword];
    self.sWebOpeningVideoId = [istream readStringDef: 3 required: false def: self.sWebOpeningVideoId];
    self.sWebOpeningVideoPassword = [istream readStringDef: 4 required: false def: self.sWebOpeningVideoPassword];
    
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
    [JsonRoot append:@"vtVideoDesc" value : [BaseJSON writeList : self.vtVideoDesc VAR_TYPE: [THOTH_LIST CREATE: [VideoDesc class]]]];
    [JsonRoot append:@"sOpeningVideoId" value : [BaseJSON writeString : self.sOpeningVideoId]];
    [JsonRoot append:@"sOpeningVideoPassword" value : [BaseJSON writeString : self.sOpeningVideoPassword]];
    [JsonRoot append:@"sWebOpeningVideoId" value : [BaseJSON writeString : self.sWebOpeningVideoId]];
    [JsonRoot append:@"sWebOpeningVideoPassword" value : [BaseJSON writeString : self.sWebOpeningVideoPassword]];
    return JsonRoot;
}

- (VideoList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtVideoDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vtVideoDesc"] required:false def:self.vtVideoDesc VAR_TYPE: [THOTH_LIST CREATE: [VideoDesc class]]];
    self.sOpeningVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpeningVideoId"] required:false def:self.sOpeningVideoId];
    self.sOpeningVideoPassword = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpeningVideoPassword"] required:false def:self.sOpeningVideoPassword];
    self.sWebOpeningVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sWebOpeningVideoId"] required:false def:self.sWebOpeningVideoId];
    self.sWebOpeningVideoPassword = [BaseJSON readStringDef:[RootMap objectForKey:@"sWebOpeningVideoPassword"] required:false def:self.sWebOpeningVideoPassword];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoClass
- (id) init
{
    if (self = [super init])
    {
        self.sClassName = @"";
        self.sClassImgUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sClassName != nil)
    {
        [ostream writeString: 0 value: self.sClassName];
    }
    if (self.sClassImgUrl != nil)
    {
        [ostream writeString: 1 value: self.sClassImgUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoClass *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sClassName = [istream readStringDef: 0 required: false def: self.sClassName];
    self.sClassImgUrl = [istream readStringDef: 1 required: false def: self.sClassImgUrl];
    
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
    [JsonRoot append:@"sClassName" value : [BaseJSON writeString : self.sClassName]];
    [JsonRoot append:@"sClassImgUrl" value : [BaseJSON writeString : self.sClassImgUrl]];
    return JsonRoot;
}

- (VideoClass *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sClassName = [BaseJSON readStringDef:[RootMap objectForKey:@"sClassName"] required:false def:self.sClassName];
    self.sClassImgUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sClassImgUrl"] required:false def:self.sClassImgUrl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LiveVideoDateReq
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

- (LiveVideoDateReq *) read: (BaseDecodeStream *)istream
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

- (LiveVideoDateReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation LiveVideoDateRsp
- (id) init
{
    if (self = [super init])
    {
        self.vDate = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vDate != nil)
    {
        [ostream writeList: 0 value: self.vDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LiveVideoDateRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDate = [istream readListDef: 0 required: false def: self.vDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"vDate" value : [BaseJSON writeList : self.vDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (LiveVideoDateRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vDate = [BaseJSON readListDef:[RootMap objectForKey:@"vDate"] required:false def:self.vDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LiveVideoListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDate = @"";
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
    if (self.sDate != nil)
    {
        [ostream writeString: 1 value: self.sDate];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LiveVideoListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDate = [istream readStringDef: 1 required: false def: self.sDate];
    
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
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    return JsonRoot;
}

- (LiveVideoListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LiveVideoListRsp
- (id) init
{
    if (self = [super init])
    {
        self.stVideoList = [[VideoList alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stVideoList != nil)
    {
        [ostream writeMessage: 0 value: self.stVideoList];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LiveVideoListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stVideoList = (VideoList*)[istream readMessageDef: 0 required: false def: self.stVideoList VAR_TYPE: [VideoList class]];
    
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
    [JsonRoot append:@"stVideoList" value : [BaseJSON writeMessage : self.stVideoList]];
    return JsonRoot;
}

- (LiveVideoListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stVideoList = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVideoList"] required:false def:self.stVideoList VAR_TYPE: [VideoList class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LiveVideoStateReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vVideoId = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vVideoId != nil)
    {
        [ostream writeList: 1 value: self.vVideoId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LiveVideoStateReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vVideoId = [istream readListDef: 1 required: false def: self.vVideoId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"vVideoId" value : [BaseJSON writeList : self.vVideoId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (LiveVideoStateReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vVideoId = [BaseJSON readListDef:[RootMap objectForKey:@"vVideoId"] required:false def:self.vVideoId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LiveVideoStateRsp
- (id) init
{
    if (self = [super init])
    {
        self.mVideoState = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mVideoState != nil)
    {
        [ostream writeMap: 0 value: self.mVideoState VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LiveVideoStateRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mVideoState = [istream readMapDef: 0 required: false def: self.mVideoState VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    
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
    [JsonRoot append:@"mVideoState" value : [BaseJSON writeMap : self.mVideoState VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (LiveVideoStateRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mVideoState = [BaseJSON readMapDef:[RootMap objectForKey:@"mVideoState"] required:false def:self.mVideoState VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VodVideoClassListReq
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

- (VodVideoClassListReq *) read: (BaseDecodeStream *)istream
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

- (VodVideoClassListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation VodVideoClassListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtVideoClass = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtVideoClass != nil)
    {
        [ostream writeList: 0 value: self.vtVideoClass VAR_TYPE: [THOTH_LIST CREATE: [VideoClass class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VodVideoClassListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtVideoClass = [istream readListDef: 0 required: false def: self.vtVideoClass VAR_TYPE: [THOTH_LIST CREATE: [VideoClass class]]];
    
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
    [JsonRoot append:@"vtVideoClass" value : [BaseJSON writeList : self.vtVideoClass VAR_TYPE: [THOTH_LIST CREATE: [VideoClass class]]]];
    return JsonRoot;
}

- (VodVideoClassListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtVideoClass = [BaseJSON readListDef:[RootMap objectForKey:@"vtVideoClass"] required:false def:self.vtVideoClass VAR_TYPE: [THOTH_LIST CREATE: [VideoClass class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoFilter
- (id) init
{
    if (self = [super init])
    {
        self.iFilterType = 0;
        self.sFilterCondition = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iFilterType];
    if (self.sFilterCondition != nil)
    {
        [ostream writeString: 1 value: self.sFilterCondition];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoFilter *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iFilterType = [istream readInt32Def: 0 required: false def: self.iFilterType];
    self.sFilterCondition = [istream readStringDef: 1 required: false def: self.sFilterCondition];
    
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
    [JsonRoot append:@"iFilterType" value : [BaseJSON writeInt32 : self.iFilterType]];
    [JsonRoot append:@"sFilterCondition" value : [BaseJSON writeString : self.sFilterCondition]];
    return JsonRoot;
}

- (VideoFilter *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iFilterType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFilterType"] required:false def:self.iFilterType];
    self.sFilterCondition = [BaseJSON readStringDef:[RootMap objectForKey:@"sFilterCondition"] required:false def:self.sFilterCondition];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VodVideoListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sStartVideoId = @"";
        self.sEndVideoId = @"";
        self.vtFilterCondition = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sStartVideoId != nil)
    {
        [ostream writeString: 1 value: self.sStartVideoId];
    }
    if (self.sEndVideoId != nil)
    {
        [ostream writeString: 2 value: self.sEndVideoId];
    }
    if (self.vtFilterCondition != nil)
    {
        [ostream writeList: 3 value: self.vtFilterCondition VAR_TYPE: [THOTH_LIST CREATE: [VideoFilter class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VodVideoListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sStartVideoId = [istream readStringDef: 1 required: false def: self.sStartVideoId];
    self.sEndVideoId = [istream readStringDef: 2 required: false def: self.sEndVideoId];
    self.vtFilterCondition = [istream readListDef: 3 required: false def: self.vtFilterCondition VAR_TYPE: [THOTH_LIST CREATE: [VideoFilter class]]];
    
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
    [JsonRoot append:@"sStartVideoId" value : [BaseJSON writeString : self.sStartVideoId]];
    [JsonRoot append:@"sEndVideoId" value : [BaseJSON writeString : self.sEndVideoId]];
    [JsonRoot append:@"vtFilterCondition" value : [BaseJSON writeList : self.vtFilterCondition VAR_TYPE: [THOTH_LIST CREATE: [VideoFilter class]]]];
    return JsonRoot;
}

- (VodVideoListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sStartVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartVideoId"] required:false def:self.sStartVideoId];
    self.sEndVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndVideoId"] required:false def:self.sEndVideoId];
    self.vtFilterCondition = [BaseJSON readListDef:[RootMap objectForKey:@"vtFilterCondition"] required:false def:self.vtFilterCondition VAR_TYPE: [THOTH_LIST CREATE: [VideoFilter class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VodVideoListRsp
- (id) init
{
    if (self = [super init])
    {
        self.stVideoList = [[VideoList alloc] init];
        self.sNextVideoId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stVideoList != nil)
    {
        [ostream writeMessage: 0 value: self.stVideoList];
    }
    if (self.sNextVideoId != nil)
    {
        [ostream writeString: 1 value: self.sNextVideoId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VodVideoListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stVideoList = (VideoList*)[istream readMessageDef: 0 required: false def: self.stVideoList VAR_TYPE: [VideoList class]];
    self.sNextVideoId = [istream readStringDef: 1 required: false def: self.sNextVideoId];
    
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
    [JsonRoot append:@"stVideoList" value : [BaseJSON writeMessage : self.stVideoList]];
    [JsonRoot append:@"sNextVideoId" value : [BaseJSON writeString : self.sNextVideoId]];
    return JsonRoot;
}

- (VodVideoListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stVideoList = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVideoList"] required:false def:self.stVideoList VAR_TYPE: [VideoList class]];
    self.sNextVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextVideoId"] required:false def:self.sNextVideoId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoAnswer
- (id) init
{
    if (self = [super init])
    {
        self.sTeacherName = @"";
        self.sAnswer = @"";
        self.iTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTeacherName != nil)
    {
        [ostream writeString: 0 value: self.sTeacherName];
    }
    if (self.sAnswer != nil)
    {
        [ostream writeString: 1 value: self.sAnswer];
    }
    [ostream writeInt32: 2 value: self.iTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoAnswer *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTeacherName = [istream readStringDef: 0 required: false def: self.sTeacherName];
    self.sAnswer = [istream readStringDef: 1 required: false def: self.sAnswer];
    self.iTime = [istream readInt32Def: 2 required: false def: self.iTime];
    
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
    [JsonRoot append:@"sTeacherName" value : [BaseJSON writeString : self.sTeacherName]];
    [JsonRoot append:@"sAnswer" value : [BaseJSON writeString : self.sAnswer]];
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    return JsonRoot;
}

- (VideoAnswer *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTeacherName = [BaseJSON readStringDef:[RootMap objectForKey:@"sTeacherName"] required:false def:self.sTeacherName];
    self.sAnswer = [BaseJSON readStringDef:[RootMap objectForKey:@"sAnswer"] required:false def:self.sAnswer];
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoQA
- (id) init
{
    if (self = [super init])
    {
        self.sQuestionId = @"";
        self.sQuestion = @"";
        self.iTime = 0;
        self.sUserName = @"";
        self.vtVideoAnswer = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sQuestionId != nil)
    {
        [ostream writeString: 0 value: self.sQuestionId];
    }
    if (self.sQuestion != nil)
    {
        [ostream writeString: 1 value: self.sQuestion];
    }
    [ostream writeInt32: 2 value: self.iTime];
    if (self.sUserName != nil)
    {
        [ostream writeString: 3 value: self.sUserName];
    }
    if (self.vtVideoAnswer != nil)
    {
        [ostream writeList: 4 value: self.vtVideoAnswer VAR_TYPE: [THOTH_LIST CREATE: [VideoAnswer class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoQA *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sQuestionId = [istream readStringDef: 0 required: false def: self.sQuestionId];
    self.sQuestion = [istream readStringDef: 1 required: false def: self.sQuestion];
    self.iTime = [istream readInt32Def: 2 required: false def: self.iTime];
    self.sUserName = [istream readStringDef: 3 required: false def: self.sUserName];
    self.vtVideoAnswer = [istream readListDef: 4 required: false def: self.vtVideoAnswer VAR_TYPE: [THOTH_LIST CREATE: [VideoAnswer class]]];
    
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
    [JsonRoot append:@"sQuestionId" value : [BaseJSON writeString : self.sQuestionId]];
    [JsonRoot append:@"sQuestion" value : [BaseJSON writeString : self.sQuestion]];
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    [JsonRoot append:@"sUserName" value : [BaseJSON writeString : self.sUserName]];
    [JsonRoot append:@"vtVideoAnswer" value : [BaseJSON writeList : self.vtVideoAnswer VAR_TYPE: [THOTH_LIST CREATE: [VideoAnswer class]]]];
    return JsonRoot;
}

- (VideoQA *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sQuestionId = [BaseJSON readStringDef:[RootMap objectForKey:@"sQuestionId"] required:false def:self.sQuestionId];
    self.sQuestion = [BaseJSON readStringDef:[RootMap objectForKey:@"sQuestion"] required:false def:self.sQuestion];
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    self.sUserName = [BaseJSON readStringDef:[RootMap objectForKey:@"sUserName"] required:false def:self.sUserName];
    self.vtVideoAnswer = [BaseJSON readListDef:[RootMap objectForKey:@"vtVideoAnswer"] required:false def:self.vtVideoAnswer VAR_TYPE: [THOTH_LIST CREATE: [VideoAnswer class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoQAReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sTeacherId = @"";
        self.sStartQuestionId = @"";
        self.sEndQuestionId = @"";
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
    if (self.sTeacherId != nil)
    {
        [ostream writeString: 1 value: self.sTeacherId];
    }
    if (self.sStartQuestionId != nil)
    {
        [ostream writeString: 2 value: self.sStartQuestionId];
    }
    if (self.sEndQuestionId != nil)
    {
        [ostream writeString: 3 value: self.sEndQuestionId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoQAReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sTeacherId = [istream readStringDef: 1 required: false def: self.sTeacherId];
    self.sStartQuestionId = [istream readStringDef: 2 required: false def: self.sStartQuestionId];
    self.sEndQuestionId = [istream readStringDef: 3 required: false def: self.sEndQuestionId];
    
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
    [JsonRoot append:@"sTeacherId" value : [BaseJSON writeString : self.sTeacherId]];
    [JsonRoot append:@"sStartQuestionId" value : [BaseJSON writeString : self.sStartQuestionId]];
    [JsonRoot append:@"sEndQuestionId" value : [BaseJSON writeString : self.sEndQuestionId]];
    return JsonRoot;
}

- (VideoQAReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sTeacherId = [BaseJSON readStringDef:[RootMap objectForKey:@"sTeacherId"] required:false def:self.sTeacherId];
    self.sStartQuestionId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartQuestionId"] required:false def:self.sStartQuestionId];
    self.sEndQuestionId = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndQuestionId"] required:false def:self.sEndQuestionId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoQARsp
- (id) init
{
    if (self = [super init])
    {
        self.vtVideoQA = [NSMutableArray arrayWithCapacity:0];
        self.sNextQuestionId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtVideoQA != nil)
    {
        [ostream writeList: 0 value: self.vtVideoQA VAR_TYPE: [THOTH_LIST CREATE: [VideoQA class]]];
    }
    if (self.sNextQuestionId != nil)
    {
        [ostream writeString: 1 value: self.sNextQuestionId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoQARsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtVideoQA = [istream readListDef: 0 required: false def: self.vtVideoQA VAR_TYPE: [THOTH_LIST CREATE: [VideoQA class]]];
    self.sNextQuestionId = [istream readStringDef: 1 required: false def: self.sNextQuestionId];
    
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
    [JsonRoot append:@"vtVideoQA" value : [BaseJSON writeList : self.vtVideoQA VAR_TYPE: [THOTH_LIST CREATE: [VideoQA class]]]];
    [JsonRoot append:@"sNextQuestionId" value : [BaseJSON writeString : self.sNextQuestionId]];
    return JsonRoot;
}

- (VideoQARsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtVideoQA = [BaseJSON readListDef:[RootMap objectForKey:@"vtVideoQA"] required:false def:self.vtVideoQA VAR_TYPE: [THOTH_LIST CREATE: [VideoQA class]]];
    self.sNextQuestionId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextQuestionId"] required:false def:self.sNextQuestionId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportPlayInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stVideoDesc = [[VideoDesc alloc] init];
        self.sClientType = @"";
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
    if (self.stVideoDesc != nil)
    {
        [ostream writeMessage: 1 value: self.stVideoDesc];
    }
    if (self.sClientType != nil)
    {
        [ostream writeString: 3 value: self.sClientType];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportPlayInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stVideoDesc = (VideoDesc*)[istream readMessageDef: 1 required: false def: self.stVideoDesc VAR_TYPE: [VideoDesc class]];
    self.sClientType = [istream readStringDef: 3 required: false def: self.sClientType];
    
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
    [JsonRoot append:@"stVideoDesc" value : [BaseJSON writeMessage : self.stVideoDesc]];
    [JsonRoot append:@"sClientType" value : [BaseJSON writeString : self.sClientType]];
    return JsonRoot;
}

- (ReportPlayInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stVideoDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVideoDesc"] required:false def:self.stVideoDesc VAR_TYPE: [VideoDesc class]];
    self.sClientType = [BaseJSON readStringDef:[RootMap objectForKey:@"sClientType"] required:false def:self.sClientType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportPlayInfoRsp
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

- (ReportPlayInfoRsp *) read: (BaseDecodeStream *)istream
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

- (ReportPlayInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation BoutiqueVideoListReq
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

- (BoutiqueVideoListReq *) read: (BaseDecodeStream *)istream
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

- (BoutiqueVideoListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation BoutiqueVideoListRsp
- (id) init
{
    if (self = [super init])
    {
        self.stVideoList = [[VideoList alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stVideoList != nil)
    {
        [ostream writeMessage: 0 value: self.stVideoList];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BoutiqueVideoListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stVideoList = (VideoList*)[istream readMessageDef: 0 required: false def: self.stVideoList VAR_TYPE: [VideoList class]];
    
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
    [JsonRoot append:@"stVideoList" value : [BaseJSON writeMessage : self.stVideoList]];
    return JsonRoot;
}

- (BoutiqueVideoListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stVideoList = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVideoList"] required:false def:self.stVideoList VAR_TYPE: [VideoList class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VodVideoTeacherListReq
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

- (VodVideoTeacherListReq *) read: (BaseDecodeStream *)istream
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

- (VodVideoTeacherListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation VodVideoTeacherListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtVideoTeacher = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtVideoTeacher != nil)
    {
        [ostream writeList: 0 value: self.vtVideoTeacher VAR_TYPE: [THOTH_LIST CREATE: [VideoTeacher class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VodVideoTeacherListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtVideoTeacher = [istream readListDef: 0 required: false def: self.vtVideoTeacher VAR_TYPE: [THOTH_LIST CREATE: [VideoTeacher class]]];
    
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
    [JsonRoot append:@"vtVideoTeacher" value : [BaseJSON writeList : self.vtVideoTeacher VAR_TYPE: [THOTH_LIST CREATE: [VideoTeacher class]]]];
    return JsonRoot;
}

- (VodVideoTeacherListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtVideoTeacher = [BaseJSON readListDef:[RootMap objectForKey:@"vtVideoTeacher"] required:false def:self.vtVideoTeacher VAR_TYPE: [THOTH_LIST CREATE: [VideoTeacher class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VodVideoMonthListReq
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

- (VodVideoMonthListReq *) read: (BaseDecodeStream *)istream
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

- (VodVideoMonthListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation VodVideoMonthListRsp
- (id) init
{
    if (self = [super init])
    {
        self.mvMonth = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mvMonth != nil)
    {
        [ostream writeMap: 0 value: self.mvMonth VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VodVideoMonthListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mvMonth = [istream readMapDef: 0 required: false def: self.mvMonth VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    
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
    [JsonRoot append:@"mvMonth" value : [BaseJSON writeMap : self.mvMonth VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]]];
    return JsonRoot;
}

- (VodVideoMonthListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mvMonth = [BaseJSON readMapDef:[RootMap objectForKey:@"mvMonth"] required:false def:self.mvMonth VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoDescReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sVideoId = @"";
        self.iType = 0;
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
    if (self.sVideoId != nil)
    {
        [ostream writeString: 1 value: self.sVideoId];
    }
    [ostream writeInt32: 2 value: self.iType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoDescReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sVideoId = [istream readStringDef: 1 required: false def: self.sVideoId];
    self.iType = [istream readInt32Def: 2 required: false def: self.iType];
    
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
    [JsonRoot append:@"sVideoId" value : [BaseJSON writeString : self.sVideoId]];
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    return JsonRoot;
}

- (VideoDescReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sVideoId"] required:false def:self.sVideoId];
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoDescRsp
- (id) init
{
    if (self = [super init])
    {
        self.stVideoDesc = [[VideoDesc alloc] init];
        self.sOpeningVideoId = @"";
        self.sOpeningVideoPassword = @"";
        self.sWebOpeningVideoId = @"";
        self.sWebOpeningVideoPassword = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stVideoDesc != nil)
    {
        [ostream writeMessage: 0 value: self.stVideoDesc];
    }
    if (self.sOpeningVideoId != nil)
    {
        [ostream writeString: 1 value: self.sOpeningVideoId];
    }
    if (self.sOpeningVideoPassword != nil)
    {
        [ostream writeString: 2 value: self.sOpeningVideoPassword];
    }
    if (self.sWebOpeningVideoId != nil)
    {
        [ostream writeString: 3 value: self.sWebOpeningVideoId];
    }
    if (self.sWebOpeningVideoPassword != nil)
    {
        [ostream writeString: 4 value: self.sWebOpeningVideoPassword];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoDescRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stVideoDesc = (VideoDesc*)[istream readMessageDef: 0 required: false def: self.stVideoDesc VAR_TYPE: [VideoDesc class]];
    self.sOpeningVideoId = [istream readStringDef: 1 required: false def: self.sOpeningVideoId];
    self.sOpeningVideoPassword = [istream readStringDef: 2 required: false def: self.sOpeningVideoPassword];
    self.sWebOpeningVideoId = [istream readStringDef: 3 required: false def: self.sWebOpeningVideoId];
    self.sWebOpeningVideoPassword = [istream readStringDef: 4 required: false def: self.sWebOpeningVideoPassword];
    
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
    [JsonRoot append:@"stVideoDesc" value : [BaseJSON writeMessage : self.stVideoDesc]];
    [JsonRoot append:@"sOpeningVideoId" value : [BaseJSON writeString : self.sOpeningVideoId]];
    [JsonRoot append:@"sOpeningVideoPassword" value : [BaseJSON writeString : self.sOpeningVideoPassword]];
    [JsonRoot append:@"sWebOpeningVideoId" value : [BaseJSON writeString : self.sWebOpeningVideoId]];
    [JsonRoot append:@"sWebOpeningVideoPassword" value : [BaseJSON writeString : self.sWebOpeningVideoPassword]];
    return JsonRoot;
}

- (VideoDescRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stVideoDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVideoDesc"] required:false def:self.stVideoDesc VAR_TYPE: [VideoDesc class]];
    self.sOpeningVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpeningVideoId"] required:false def:self.sOpeningVideoId];
    self.sOpeningVideoPassword = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpeningVideoPassword"] required:false def:self.sOpeningVideoPassword];
    self.sWebOpeningVideoId = [BaseJSON readStringDef:[RootMap objectForKey:@"sWebOpeningVideoId"] required:false def:self.sWebOpeningVideoId];
    self.sWebOpeningVideoPassword = [BaseJSON readStringDef:[RootMap objectForKey:@"sWebOpeningVideoPassword"] required:false def:self.sWebOpeningVideoPassword];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

