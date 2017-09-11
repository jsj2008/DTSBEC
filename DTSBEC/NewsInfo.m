#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "NewsInfo.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation NewsId
- (id) init
{
    if (self = [super init])
    {
        self.sTime = @"";
        self.sId = @"";
        self.eNewsType = NT_UNKNOWN;
        self.eMarketType = E_MT_NO;
        self.eSecType = E_ST_UNKNOWN;
        self.eDataDbSource = NDS_HS_NEWS;
        self.eNewsTable = E_TL_UNKNOWN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTime != nil)
    {
        [ostream writeString: 0 value: self.sTime];
    }
    if (self.sId != nil)
    {
        [ostream writeString: 1 value: self.sId];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    [ostream writeInt32: 3 value: (int32_t)self.eMarketType];
    [ostream writeInt32: 4 value: (int32_t)self.eSecType];
    [ostream writeInt32: 5 value: (int32_t)self.eDataDbSource];
    [ostream writeInt32: 6 value: (int32_t)self.eNewsTable];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsId *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTime = [istream readStringDef: 0 required: false def: self.sTime];
    self.sId = [istream readStringDef: 1 required: false def: self.sId];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    self.eMarketType = [istream readInt32Def: 3 required: false def: (int32_t)self.eMarketType];
    self.eSecType = [istream readInt32Def: 4 required: false def: (int32_t)self.eSecType];
    self.eDataDbSource = [istream readInt32Def: 5 required: false def: (int32_t)self.eDataDbSource];
    self.eNewsTable = [istream readInt32Def: 6 required: false def: (int32_t)self.eNewsTable];
    
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
    [JsonRoot append:@"sTime" value : [BaseJSON writeString : self.sTime]];
    [JsonRoot append:@"sId" value : [BaseJSON writeString : self.sId]];
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"eMarketType" value : [BaseJSON writeInt32 : (int32_t)self.eMarketType]];
    [JsonRoot append:@"eSecType" value : [BaseJSON writeInt32 : (int32_t)self.eSecType]];
    [JsonRoot append:@"eDataDbSource" value : [BaseJSON writeInt32 : (int32_t)self.eDataDbSource]];
    [JsonRoot append:@"eNewsTable" value : [BaseJSON writeInt32 : (int32_t)self.eNewsTable]];
    return JsonRoot;
}

- (NewsId *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTime = [BaseJSON readStringDef:[RootMap objectForKey:@"sTime"] required:false def:self.sTime];
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.eMarketType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eMarketType"] required:false def:(int32_t)self.eMarketType];
    self.eSecType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecType"] required:false def:(int32_t)self.eSecType];
    self.eDataDbSource = [BaseJSON readInt32Def:[RootMap objectForKey:@"eDataDbSource"] required:false def:(int32_t)self.eDataDbSource];
    self.eNewsTable = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsTable"] required:false def:(int32_t)self.eNewsTable];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VideoConfig
- (id) init
{
    if (self = [super init])
    {
        self.sVideoName = @"";
        self.mChannelConfig = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.sImgUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sVideoName != nil)
    {
        [ostream writeString: 0 value: self.sVideoName];
    }
    if (self.mChannelConfig != nil)
    {
        [ostream writeMap: 1 value: self.mChannelConfig VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    }
    if (self.sImgUrl != nil)
    {
        [ostream writeString: 2 value: self.sImgUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoConfig *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sVideoName = [istream readStringDef: 0 required: false def: self.sVideoName];
    self.mChannelConfig = [istream readMapDef: 1 required: false def: self.mChannelConfig VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    self.sImgUrl = [istream readStringDef: 2 required: false def: self.sImgUrl];
    
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
    [JsonRoot append:@"sVideoName" value : [BaseJSON writeString : self.sVideoName]];
    [JsonRoot append:@"mChannelConfig" value : [BaseJSON writeMap : self.mChannelConfig VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]]];
    [JsonRoot append:@"sImgUrl" value : [BaseJSON writeString : self.sImgUrl]];
    return JsonRoot;
}

- (VideoConfig *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sVideoName = [BaseJSON readStringDef:[RootMap objectForKey:@"sVideoName"] required:false def:self.sVideoName];
    self.mChannelConfig = [BaseJSON readMapDef:[RootMap objectForKey:@"mChannelConfig"] required:false def:self.mChannelConfig VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    self.sImgUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sImgUrl"] required:false def:self.sImgUrl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation Label
- (id) init
{
    if (self = [super init])
    {
        self.iType = 0;
        self.iID = 0;
        self.sName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iType];
    [ostream writeInt32: 1 value: self.iID];
    if (self.sName != nil)
    {
        [ostream writeString: 2 value: self.sName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (Label *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iType = [istream readInt32Def: 0 required: false def: self.iType];
    self.iID = [istream readInt32Def: 1 required: false def: self.iID];
    self.sName = [istream readStringDef: 2 required: false def: self.sName];
    
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
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    [JsonRoot append:@"iID" value : [BaseJSON writeInt32 : self.iID]];
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    return JsonRoot;
}

- (Label *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    self.iID = [BaseJSON readInt32Def:[RootMap objectForKey:@"iID"] required:false def:self.iID];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsDesc
- (id) init
{
    if (self = [super init])
    {
        self.sNewsID = @"";
        self.eNewsType = NT_UNKNOWN;
        self.sTitle = @"";
        self.sDescription = @"";
        self.sFrom = @"";
        self.iTime = 0;
        self.sDtSecCode = @"";
        self.vtTagInfo = [NSMutableArray arrayWithCapacity:0];
        self.sContent = @"";
        self.sDtInfoUrl = @"";
        self.iStyleType = 0;
        self.vtRelaStock = [NSMutableArray arrayWithCapacity:0];
        self.iStatus = 0;
        self.sThirdUrl = @"";
        self.iCreateTime = 0;
        self.sSubTypeName = @"";
        self.iPublish = 0;
        self.sImgUrl = @"";
        self.eNewsFlag = E_NF_NORMAL;
        self.iShow = 0;
        self.vVideoConfig = [NSMutableArray arrayWithCapacity:0];
        self.iTopicId = 0;
        self.iAutoID = 0;
        self.vLabel = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sNewsID != nil)
    {
        [ostream writeString: 0 value: self.sNewsID];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    if (self.sTitle != nil)
    {
        [ostream writeString: 2 value: self.sTitle];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 3 value: self.sDescription];
    }
    if (self.sFrom != nil)
    {
        [ostream writeString: 4 value: self.sFrom];
    }
    [ostream writeInt32: 5 value: self.iTime];
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 6 value: self.sDtSecCode];
    }
    if (self.vtTagInfo != nil)
    {
        [ostream writeList: 7 value: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 8 value: self.sContent];
    }
    if (self.sDtInfoUrl != nil)
    {
        [ostream writeString: 9 value: self.sDtInfoUrl];
    }
    [ostream writeInt32: 10 value: self.iStyleType];
    if (self.vtRelaStock != nil)
    {
        [ostream writeList: 11 value: self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    }
    [ostream writeInt32: 12 value: self.iStatus];
    if (self.sThirdUrl != nil)
    {
        [ostream writeString: 13 value: self.sThirdUrl];
    }
    [ostream writeInt32: 14 value: self.iCreateTime];
    if (self.sSubTypeName != nil)
    {
        [ostream writeString: 16 value: self.sSubTypeName];
    }
    [ostream writeInt32: 17 value: self.iPublish];
    if (self.sImgUrl != nil)
    {
        [ostream writeString: 18 value: self.sImgUrl];
    }
    [ostream writeInt32: 19 value: (int32_t)self.eNewsFlag];
    [ostream writeInt32: 20 value: self.iShow];
    if (self.vVideoConfig != nil)
    {
        [ostream writeList: 21 value: self.vVideoConfig VAR_TYPE: [THOTH_LIST CREATE: [VideoConfig class]]];
    }
    [ostream writeInt32: 22 value: self.iTopicId];
    [ostream writeInt64: 23 value: self.iAutoID];
    if (self.vLabel != nil)
    {
        [ostream writeList: 24 value: self.vLabel VAR_TYPE: [THOTH_LIST CREATE: [Label class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sNewsID = [istream readStringDef: 0 required: false def: self.sNewsID];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.sTitle = [istream readStringDef: 2 required: false def: self.sTitle];
    self.sDescription = [istream readStringDef: 3 required: false def: self.sDescription];
    self.sFrom = [istream readStringDef: 4 required: false def: self.sFrom];
    self.iTime = [istream readInt32Def: 5 required: false def: self.iTime];
    self.sDtSecCode = [istream readStringDef: 6 required: false def: self.sDtSecCode];
    self.vtTagInfo = [istream readListDef: 7 required: false def: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.sContent = [istream readStringDef: 8 required: false def: self.sContent];
    self.sDtInfoUrl = [istream readStringDef: 9 required: false def: self.sDtInfoUrl];
    self.iStyleType = [istream readInt32Def: 10 required: false def: self.iStyleType];
    self.vtRelaStock = [istream readListDef: 11 required: false def: self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    self.iStatus = [istream readInt32Def: 12 required: false def: self.iStatus];
    self.sThirdUrl = [istream readStringDef: 13 required: false def: self.sThirdUrl];
    self.iCreateTime = [istream readInt32Def: 14 required: false def: self.iCreateTime];
    self.sSubTypeName = [istream readStringDef: 16 required: false def: self.sSubTypeName];
    self.iPublish = [istream readInt32Def: 17 required: false def: self.iPublish];
    self.sImgUrl = [istream readStringDef: 18 required: false def: self.sImgUrl];
    self.eNewsFlag = [istream readInt32Def: 19 required: false def: (int32_t)self.eNewsFlag];
    self.iShow = [istream readInt32Def: 20 required: false def: self.iShow];
    self.vVideoConfig = [istream readListDef: 21 required: false def: self.vVideoConfig VAR_TYPE: [THOTH_LIST CREATE: [VideoConfig class]]];
    self.iTopicId = [istream readInt32Def: 22 required: false def: self.iTopicId];
    self.iAutoID = [istream readInt64Def: 23 required: false def: self.iAutoID];
    self.vLabel = [istream readListDef: 24 required: false def: self.vLabel VAR_TYPE: [THOTH_LIST CREATE: [Label class]]];
    
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
    [JsonRoot append:@"sNewsID" value : [BaseJSON writeString : self.sNewsID]];
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"sFrom" value : [BaseJSON writeString : self.sFrom]];
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"vtTagInfo" value : [BaseJSON writeList : self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    [JsonRoot append:@"sDtInfoUrl" value : [BaseJSON writeString : self.sDtInfoUrl]];
    [JsonRoot append:@"iStyleType" value : [BaseJSON writeInt32 : self.iStyleType]];
    [JsonRoot append:@"vtRelaStock" value : [BaseJSON writeList : self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"sThirdUrl" value : [BaseJSON writeString : self.sThirdUrl]];
    [JsonRoot append:@"iCreateTime" value : [BaseJSON writeInt32 : self.iCreateTime]];
    [JsonRoot append:@"sSubTypeName" value : [BaseJSON writeString : self.sSubTypeName]];
    [JsonRoot append:@"iPublish" value : [BaseJSON writeInt32 : self.iPublish]];
    [JsonRoot append:@"sImgUrl" value : [BaseJSON writeString : self.sImgUrl]];
    [JsonRoot append:@"eNewsFlag" value : [BaseJSON writeInt32 : (int32_t)self.eNewsFlag]];
    [JsonRoot append:@"iShow" value : [BaseJSON writeInt32 : self.iShow]];
    [JsonRoot append:@"vVideoConfig" value : [BaseJSON writeList : self.vVideoConfig VAR_TYPE: [THOTH_LIST CREATE: [VideoConfig class]]]];
    [JsonRoot append:@"iTopicId" value : [BaseJSON writeInt32 : self.iTopicId]];
    [JsonRoot append:@"iAutoID" value : [BaseJSON writeInt64 : self.iAutoID]];
    [JsonRoot append:@"vLabel" value : [BaseJSON writeList : self.vLabel VAR_TYPE: [THOTH_LIST CREATE: [Label class]]]];
    return JsonRoot;
}

- (NewsDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sNewsID = [BaseJSON readStringDef:[RootMap objectForKey:@"sNewsID"] required:false def:self.sNewsID];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.sFrom = [BaseJSON readStringDef:[RootMap objectForKey:@"sFrom"] required:false def:self.sFrom];
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.vtTagInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtTagInfo"] required:false def:self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
    self.sDtInfoUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtInfoUrl"] required:false def:self.sDtInfoUrl];
    self.iStyleType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStyleType"] required:false def:self.iStyleType];
    self.vtRelaStock = [BaseJSON readListDef:[RootMap objectForKey:@"vtRelaStock"] required:false def:self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.sThirdUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sThirdUrl"] required:false def:self.sThirdUrl];
    self.iCreateTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCreateTime"] required:false def:self.iCreateTime];
    self.sSubTypeName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSubTypeName"] required:false def:self.sSubTypeName];
    self.iPublish = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPublish"] required:false def:self.iPublish];
    self.sImgUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sImgUrl"] required:false def:self.sImgUrl];
    self.eNewsFlag = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsFlag"] required:false def:(int32_t)self.eNewsFlag];
    self.iShow = [BaseJSON readInt32Def:[RootMap objectForKey:@"iShow"] required:false def:self.iShow];
    self.vVideoConfig = [BaseJSON readListDef:[RootMap objectForKey:@"vVideoConfig"] required:false def:self.vVideoConfig VAR_TYPE: [THOTH_LIST CREATE: [VideoConfig class]]];
    self.iTopicId = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTopicId"] required:false def:self.iTopicId];
    self.iAutoID = [BaseJSON readInt64Def:[RootMap objectForKey:@"iAutoID"] required:false def:self.iAutoID];
    self.vLabel = [BaseJSON readListDef:[RootMap objectForKey:@"vLabel"] required:false def:self.vLabel VAR_TYPE: [THOTH_LIST CREATE: [Label class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsList
- (id) init
{
    if (self = [super init])
    {
        self.vNewsDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vNewsDesc = [istream readListDef: 0 required: false def: self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
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
    [JsonRoot append:@"vNewsDesc" value : [BaseJSON writeList : self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    return JsonRoot;
}

- (NewsList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vNewsDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vNewsDesc"] required:false def:self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.sStartId = @"";
        self.sEndId = @"";
        self.eGetSource = E_NGS_MARKET_GET;
        self.eNewsType = NT_UNKNOWN;
        self.bGetFromDb = true;
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
    if (self.sStartId != nil)
    {
        [ostream writeString: 4 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 5 value: self.sEndId];
    }
    [ostream writeInt32: 6 value: (int32_t)self.eGetSource];
    [ostream writeInt32: 7 value: (int32_t)self.eNewsType];
    [ostream writeBoolean: 8 value: self.bGetFromDb];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sStartId = [istream readStringDef: 4 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 5 required: false def: self.sEndId];
    self.eGetSource = [istream readInt32Def: 6 required: false def: (int32_t)self.eGetSource];
    self.eNewsType = [istream readInt32Def: 7 required: false def: (int32_t)self.eNewsType];
    self.bGetFromDb = [istream readBooleanDef: 8 required: false def: self.bGetFromDb];
    
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
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    [JsonRoot append:@"sEndId" value : [BaseJSON writeString : self.sEndId]];
    [JsonRoot append:@"eGetSource" value : [BaseJSON writeInt32 : (int32_t)self.eGetSource]];
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"bGetFromDb" value : [BaseJSON writeBoolean : self.bGetFromDb]];
    return JsonRoot;
}

- (NewsReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    self.sEndId = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndId"] required:false def:self.sEndId];
    self.eGetSource = [BaseJSON readInt32Def:[RootMap objectForKey:@"eGetSource"] required:false def:(int32_t)self.eGetSource];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.bGetFromDb = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bGetFromDb"] required:false def:self.bGetFromDb];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsRsp
- (id) init
{
    if (self = [super init])
    {
        self.stNewsList = [[NewsList alloc] init];
        self.iStatus = 0;
        self.sNextNewsID = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stNewsList != nil)
    {
        [ostream writeMessage: 0 value: self.stNewsList];
    }
    [ostream writeInt32: 1 value: self.iStatus];
    if (self.sNextNewsID != nil)
    {
        [ostream writeString: 2 value: self.sNextNewsID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stNewsList = (NewsList*)[istream readMessageDef: 0 required: false def: self.stNewsList VAR_TYPE: [NewsList class]];
    self.iStatus = [istream readInt32Def: 1 required: false def: self.iStatus];
    self.sNextNewsID = [istream readStringDef: 2 required: false def: self.sNextNewsID];
    
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
    [JsonRoot append:@"stNewsList" value : [BaseJSON writeMessage : self.stNewsList]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"sNextNewsID" value : [BaseJSON writeString : self.sNextNewsID]];
    return JsonRoot;
}

- (NewsRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stNewsList = [BaseJSON readMessageDef:[RootMap objectForKey:@"stNewsList"] required:false def:self.stNewsList VAR_TYPE: [NewsList class]];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.sNextNewsID = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextNewsID"] required:false def:self.sNextNewsID];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sNewsID = @"";
        self.eNewsType = NT_UNKNOWN;
        self.eSecType = E_ST_UNKNOWN;
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
    if (self.sNewsID != nil)
    {
        [ostream writeString: 1 value: self.sNewsID];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    [ostream writeInt32: 3 value: (int32_t)self.eSecType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sNewsID = [istream readStringDef: 1 required: false def: self.sNewsID];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    self.eSecType = [istream readInt32Def: 3 required: false def: (int32_t)self.eSecType];
    
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
    [JsonRoot append:@"sNewsID" value : [BaseJSON writeString : self.sNewsID]];
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"eSecType" value : [BaseJSON writeInt32 : (int32_t)self.eSecType]];
    return JsonRoot;
}

- (NewsContentReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sNewsID = [BaseJSON readStringDef:[RootMap objectForKey:@"sNewsID"] required:false def:self.sNewsID];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.eSecType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecType"] required:false def:(int32_t)self.eSecType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsContentRsp
- (id) init
{
    if (self = [super init])
    {
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeMessage: 0 value: self.stNewsDesc];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stNewsDesc = (NewsDesc*)[istream readMessage: 0 required: true VAR_TYPE: [NewsDesc class]];
    
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
    return JsonRoot;
}

- (NewsContentRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsSimple
- (id) init
{
    if (self = [super init])
    {
        self.sNewsID = @"";
        self.eNewsType = NT_UNKNOWN;
        self.eSecType = E_ST_UNKNOWN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sNewsID != nil)
    {
        [ostream writeString: 0 value: self.sNewsID];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    [ostream writeInt32: 2 value: (int32_t)self.eSecType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsSimple *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sNewsID = [istream readStringDef: 0 required: false def: self.sNewsID];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.eSecType = [istream readInt32Def: 2 required: false def: (int32_t)self.eSecType];
    
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
    [JsonRoot append:@"sNewsID" value : [BaseJSON writeString : self.sNewsID]];
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"eSecType" value : [BaseJSON writeInt32 : (int32_t)self.eSecType]];
    return JsonRoot;
}

- (NewsSimple *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sNewsID = [BaseJSON readStringDef:[RootMap objectForKey:@"sNewsID"] required:false def:self.sNewsID];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.eSecType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecType"] required:false def:(int32_t)self.eSecType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsListReq
- (id) init
{
    if (self = [super init])
    {
        self.vNewsSimple = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vNewsSimple != nil)
    {
        [ostream writeList: 0 value: self.vNewsSimple VAR_TYPE: [THOTH_LIST CREATE: [NewsSimple class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vNewsSimple = [istream readListDef: 0 required: false def: self.vNewsSimple VAR_TYPE: [THOTH_LIST CREATE: [NewsSimple class]]];
    
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
    [JsonRoot append:@"vNewsSimple" value : [BaseJSON writeList : self.vNewsSimple VAR_TYPE: [THOTH_LIST CREATE: [NewsSimple class]]]];
    return JsonRoot;
}

- (NewsListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vNewsSimple = [BaseJSON readListDef:[RootMap objectForKey:@"vNewsSimple"] required:false def:self.vNewsSimple VAR_TYPE: [THOTH_LIST CREATE: [NewsSimple class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsListRsp
- (id) init
{
    if (self = [super init])
    {
        self.mNewsDesc = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mNewsDesc != nil)
    {
        [ostream writeMap: 0 value: self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mNewsDesc = [istream readMapDef: 0 required: false def: self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    
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
    [JsonRoot append:@"mNewsDesc" value : [BaseJSON writeMap : self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]]];
    return JsonRoot;
}

- (NewsListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mNewsDesc = [BaseJSON readMapDef:[RootMap objectForKey:@"mNewsDesc"] required:false def:self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FlashNewsListReq
- (id) init
{
    if (self = [super init])
    {
        self.sStartId = @"";
        self.sEndId = @"";
        self.stUserInfo = [[UserInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStartId != nil)
    {
        [ostream writeString: 0 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 1 value: self.sEndId];
    }
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stUserInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FlashNewsListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStartId = [istream readStringDef: 0 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 1 required: false def: self.sEndId];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 2 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
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
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    [JsonRoot append:@"sEndId" value : [BaseJSON writeString : self.sEndId]];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    return JsonRoot;
}

- (FlashNewsListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    self.sEndId = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndId"] required:false def:self.sEndId];
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
@implementation FlashNewsListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.sNextNewsID = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    if (self.sNextNewsID != nil)
    {
        [ostream writeString: 1 value: self.sNextNewsID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FlashNewsListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [istream readStringDef: 1 required: false def: self.sNextNewsID];
    
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
    [JsonRoot append:@"vtId" value : [BaseJSON writeList : self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    [JsonRoot append:@"sNextNewsID" value : [BaseJSON writeString : self.sNextNewsID]];
    return JsonRoot;
}

- (FlashNewsListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtId = [BaseJSON readListDef:[RootMap objectForKey:@"vtId"] required:false def:self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextNewsID"] required:false def:self.sNextNewsID];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FlashNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FlashNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"vtId" value : [BaseJSON writeList : self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (FlashNewsContentReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtId = [BaseJSON readListDef:[RootMap objectForKey:@"vtId"] required:false def:self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FlashNewsContentRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtNewsDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FlashNewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtNewsDesc = [istream readListDef: 0 required: false def: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
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
    [JsonRoot append:@"vtNewsDesc" value : [BaseJSON writeList : self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    return JsonRoot;
}

- (FlashNewsContentRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtNewsDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vtNewsDesc"] required:false def:self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DiscoveryNewsReq
- (id) init
{
    if (self = [super init])
    {
        self.sStartId = @"";
        self.sEndId = @"";
        self.stUserInfo = [[UserInfo alloc] init];
        self.eNewsFlag = E_NF_NORMAL;
        self.iSupportTop = 0;
        self.iSupportTopic = 0;
        self.eChannelType = E_CT_PUBLIC;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStartId != nil)
    {
        [ostream writeString: 0 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 1 value: self.sEndId];
    }
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stUserInfo];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eNewsFlag];
    [ostream writeInt32: 4 value: self.iSupportTop];
    [ostream writeInt32: 5 value: self.iSupportTopic];
    [ostream writeInt32: 6 value: (int32_t)self.eChannelType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DiscoveryNewsReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStartId = [istream readStringDef: 0 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 1 required: false def: self.sEndId];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 2 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eNewsFlag = [istream readInt32Def: 3 required: false def: (int32_t)self.eNewsFlag];
    self.iSupportTop = [istream readInt32Def: 4 required: false def: self.iSupportTop];
    self.iSupportTopic = [istream readInt32Def: 5 required: false def: self.iSupportTopic];
    self.eChannelType = [istream readInt32Def: 6 required: false def: (int32_t)self.eChannelType];
    
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
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    [JsonRoot append:@"sEndId" value : [BaseJSON writeString : self.sEndId]];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"eNewsFlag" value : [BaseJSON writeInt32 : (int32_t)self.eNewsFlag]];
    [JsonRoot append:@"iSupportTop" value : [BaseJSON writeInt32 : self.iSupportTop]];
    [JsonRoot append:@"iSupportTopic" value : [BaseJSON writeInt32 : self.iSupportTopic]];
    [JsonRoot append:@"eChannelType" value : [BaseJSON writeInt32 : (int32_t)self.eChannelType]];
    return JsonRoot;
}

- (DiscoveryNewsReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    self.sEndId = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndId"] required:false def:self.sEndId];
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eNewsFlag = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsFlag"] required:false def:(int32_t)self.eNewsFlag];
    self.iSupportTop = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSupportTop"] required:false def:self.iSupportTop];
    self.iSupportTopic = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSupportTopic"] required:false def:self.iSupportTopic];
    self.eChannelType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eChannelType"] required:false def:(int32_t)self.eChannelType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DiscoveryNewsIdListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.sNextNewsID = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    if (self.sNextNewsID != nil)
    {
        [ostream writeString: 1 value: self.sNextNewsID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DiscoveryNewsIdListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [istream readStringDef: 1 required: false def: self.sNextNewsID];
    
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
    [JsonRoot append:@"vtId" value : [BaseJSON writeList : self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    [JsonRoot append:@"sNextNewsID" value : [BaseJSON writeString : self.sNextNewsID]];
    return JsonRoot;
}

- (DiscoveryNewsIdListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtId = [BaseJSON readListDef:[RootMap objectForKey:@"vtId"] required:false def:self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextNewsID"] required:false def:self.sNextNewsID];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DiscoveryNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.eChannelType = E_CT_PUBLIC;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eChannelType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DiscoveryNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.eChannelType = [istream readInt32Def: 1 required: false def: (int32_t)self.eChannelType];
    
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
    [JsonRoot append:@"vtId" value : [BaseJSON writeList : self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"eChannelType" value : [BaseJSON writeInt32 : (int32_t)self.eChannelType]];
    return JsonRoot;
}

- (DiscoveryNewsContentReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtId = [BaseJSON readListDef:[RootMap objectForKey:@"vtId"] required:false def:self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.eChannelType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eChannelType"] required:false def:(int32_t)self.eChannelType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DiscoveryNewsContentRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtNewsDesc = [NSMutableArray arrayWithCapacity:0];
        self.sNextNewsID = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    if (self.sNextNewsID != nil)
    {
        [ostream writeString: 1 value: self.sNextNewsID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DiscoveryNewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtNewsDesc = [istream readListDef: 0 required: false def: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [istream readStringDef: 1 required: false def: self.sNextNewsID];
    
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
    [JsonRoot append:@"vtNewsDesc" value : [BaseJSON writeList : self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    [JsonRoot append:@"sNextNewsID" value : [BaseJSON writeString : self.sNextNewsID]];
    return JsonRoot;
}

- (DiscoveryNewsContentRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtNewsDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vtNewsDesc"] required:false def:self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextNewsID"] required:false def:self.sNextNewsID];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecNewsIdListReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eNewsType = NT_UNKNOWN;
        self.sCurNewestId = @"";
        self.bForceUpdate = false;
        self.bGetIncrementRsp = false;
        self.bGetFromDb = true;
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
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    if (self.sCurNewestId != nil)
    {
        [ostream writeString: 2 value: self.sCurNewestId];
    }
    [ostream writeBoolean: 3 value: self.bForceUpdate];
    [ostream writeBoolean: 4 value: self.bGetIncrementRsp];
    [ostream writeBoolean: 5 value: self.bGetFromDb];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNewsIdListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.sCurNewestId = [istream readStringDef: 2 required: false def: self.sCurNewestId];
    self.bForceUpdate = [istream readBooleanDef: 3 required: false def: self.bForceUpdate];
    self.bGetIncrementRsp = [istream readBooleanDef: 4 required: false def: self.bGetIncrementRsp];
    self.bGetFromDb = [istream readBooleanDef: 5 required: false def: self.bGetFromDb];
    
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
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"sCurNewestId" value : [BaseJSON writeString : self.sCurNewestId]];
    [JsonRoot append:@"bForceUpdate" value : [BaseJSON writeBoolean : self.bForceUpdate]];
    [JsonRoot append:@"bGetIncrementRsp" value : [BaseJSON writeBoolean : self.bGetIncrementRsp]];
    [JsonRoot append:@"bGetFromDb" value : [BaseJSON writeBoolean : self.bGetFromDb]];
    return JsonRoot;
}

- (SecNewsIdListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.sCurNewestId = [BaseJSON readStringDef:[RootMap objectForKey:@"sCurNewestId"] required:false def:self.sCurNewestId];
    self.bForceUpdate = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bForceUpdate"] required:false def:self.bForceUpdate];
    self.bGetIncrementRsp = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bGetIncrementRsp"] required:false def:self.bGetIncrementRsp];
    self.bGetFromDb = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bGetFromDb"] required:false def:self.bGetFromDb];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecNewsIdListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNewsIdListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
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
    [JsonRoot append:@"vtId" value : [BaseJSON writeList : self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    return JsonRoot;
}

- (SecNewsIdListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtId = [BaseJSON readListDef:[RootMap objectForKey:@"vtId"] required:false def:self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.eSecType = E_ST_UNKNOWN;
        self.eNewsType = NT_UNKNOWN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eSecType];
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.eSecType = [istream readInt32Def: 1 required: false def: (int32_t)self.eSecType];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    
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
    [JsonRoot append:@"vtId" value : [BaseJSON writeList : self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"eSecType" value : [BaseJSON writeInt32 : (int32_t)self.eSecType]];
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    return JsonRoot;
}

- (SecNewsContentReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtId = [BaseJSON readListDef:[RootMap objectForKey:@"vtId"] required:false def:self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.eSecType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecType"] required:false def:(int32_t)self.eSecType];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecNewsContentRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtNewsDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtNewsDesc = [istream readListDef: 0 required: false def: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
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
    [JsonRoot append:@"vtNewsDesc" value : [BaseJSON writeList : self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    return JsonRoot;
}

- (SecNewsContentRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtNewsDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vtNewsDesc"] required:false def:self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ModifyNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.stNewsId = [[NewsId alloc] init];
        self.bDelete = false;
        self.vtDtSecCode = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stNewsId != nil)
    {
        [ostream writeMessage: 0 value: self.stNewsId];
    }
    [ostream writeBoolean: 1 value: self.bDelete];
    if (self.vtDtSecCode != nil)
    {
        [ostream writeList: 2 value: self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ModifyNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stNewsId = (NewsId*)[istream readMessageDef: 0 required: false def: self.stNewsId VAR_TYPE: [NewsId class]];
    self.bDelete = [istream readBooleanDef: 1 required: false def: self.bDelete];
    self.vtDtSecCode = [istream readListDef: 2 required: false def: self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"stNewsId" value : [BaseJSON writeMessage : self.stNewsId]];
    [JsonRoot append:@"bDelete" value : [BaseJSON writeBoolean : self.bDelete]];
    [JsonRoot append:@"vtDtSecCode" value : [BaseJSON writeList : self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (ModifyNewsContentReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stNewsId = [BaseJSON readMessageDef:[RootMap objectForKey:@"stNewsId"] required:false def:self.stNewsId VAR_TYPE: [NewsId class]];
    self.bDelete = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bDelete"] required:false def:self.bDelete];
    self.vtDtSecCode = [BaseJSON readListDef:[RootMap objectForKey:@"vtDtSecCode"] required:false def:self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUpInfoIdListReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eNewsType = NT_UNKNOWN;
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
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUpInfoIdListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    
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
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    return JsonRoot;
}

- (GetUpInfoIdListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation UpInfoIdList
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eNewsType = NT_UNKNOWN;
        self.mNewsDesc = [NSMutableDictionary dictionaryWithCapacity: 0];
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
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    if (self.mNewsDesc != nil)
    {
        [ostream writeMap: 2 value: self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UpInfoIdList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.mNewsDesc = [istream readMapDef: 2 required: false def: self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    
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
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"mNewsDesc" value : [BaseJSON writeMap : self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]]];
    return JsonRoot;
}

- (UpInfoIdList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.mNewsDesc = [BaseJSON readMapDef:[RootMap objectForKey:@"mNewsDesc"] required:false def:self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SetUpInfoIdListRsp
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

- (SetUpInfoIdListRsp *) read: (BaseDecodeStream *)istream
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

- (SetUpInfoIdListRsp *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation NewsPageReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.eNewsType = NT_UNKNOWN;
        self.sPageNo = @"";
        self.iSupportTop = 0;
        self.iSupportTopic = 0;
        self.eChannelType = E_CT_PUBLIC;
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
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    if (self.sPageNo != nil)
    {
        [ostream writeString: 3 value: self.sPageNo];
    }
    [ostream writeInt32: 4 value: self.iSupportTop];
    [ostream writeInt32: 5 value: self.iSupportTopic];
    [ostream writeInt32: 6 value: (int32_t)self.eChannelType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsPageReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    self.sPageNo = [istream readStringDef: 3 required: false def: self.sPageNo];
    self.iSupportTop = [istream readInt32Def: 4 required: false def: self.iSupportTop];
    self.iSupportTopic = [istream readInt32Def: 5 required: false def: self.iSupportTopic];
    self.eChannelType = [istream readInt32Def: 6 required: false def: (int32_t)self.eChannelType];
    
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
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"sPageNo" value : [BaseJSON writeString : self.sPageNo]];
    [JsonRoot append:@"iSupportTop" value : [BaseJSON writeInt32 : self.iSupportTop]];
    [JsonRoot append:@"iSupportTopic" value : [BaseJSON writeInt32 : self.iSupportTopic]];
    [JsonRoot append:@"eChannelType" value : [BaseJSON writeInt32 : (int32_t)self.eChannelType]];
    return JsonRoot;
}

- (NewsPageReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.sPageNo = [BaseJSON readStringDef:[RootMap objectForKey:@"sPageNo"] required:false def:self.sPageNo];
    self.iSupportTop = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSupportTop"] required:false def:self.iSupportTop];
    self.iSupportTopic = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSupportTopic"] required:false def:self.iSupportTopic];
    self.eChannelType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eChannelType"] required:false def:(int32_t)self.eChannelType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsPageRsp
- (id) init
{
    if (self = [super init])
    {
        self.stNewsList = [[NewsList alloc] init];
        self.iTotalPageNum = 0;
        self.iTotalDataNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stNewsList != nil)
    {
        [ostream writeMessage: 0 value: self.stNewsList];
    }
    [ostream writeInt32: 1 value: self.iTotalPageNum];
    [ostream writeInt32: 2 value: self.iTotalDataNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsPageRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stNewsList = (NewsList*)[istream readMessageDef: 0 required: false def: self.stNewsList VAR_TYPE: [NewsList class]];
    self.iTotalPageNum = [istream readInt32Def: 1 required: false def: self.iTotalPageNum];
    self.iTotalDataNum = [istream readInt32Def: 2 required: false def: self.iTotalDataNum];
    
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
    [JsonRoot append:@"stNewsList" value : [BaseJSON writeMessage : self.stNewsList]];
    [JsonRoot append:@"iTotalPageNum" value : [BaseJSON writeInt32 : self.iTotalPageNum]];
    [JsonRoot append:@"iTotalDataNum" value : [BaseJSON writeInt32 : self.iTotalDataNum]];
    return JsonRoot;
}

- (NewsPageRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stNewsList = [BaseJSON readMessageDef:[RootMap objectForKey:@"stNewsList"] required:false def:self.stNewsList VAR_TYPE: [NewsList class]];
    self.iTotalPageNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalPageNum"] required:false def:self.iTotalPageNum];
    self.iTotalDataNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalDataNum"] required:false def:self.iTotalDataNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionProgress
- (id) init
{
    if (self = [super init])
    {
        self.sDay = @"";
        self.sProgress = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDay != nil)
    {
        [ostream writeString: 0 value: self.sDay];
    }
    if (self.sProgress != nil)
    {
        [ostream writeString: 1 value: self.sProgress];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionProgress *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDay = [istream readStringDef: 0 required: false def: self.sDay];
    self.sProgress = [istream readStringDef: 1 required: false def: self.sProgress];
    
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
    [JsonRoot append:@"sDay" value : [BaseJSON writeString : self.sDay]];
    [JsonRoot append:@"sProgress" value : [BaseJSON writeString : self.sProgress]];
    return JsonRoot;
}

- (AdditionProgress *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.sProgress = [BaseJSON readStringDef:[RootMap objectForKey:@"sProgress"] required:false def:self.sProgress];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionDesc
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sDtSecCode = @"";
        self.sSecCode = @"";
        self.sSecName = @"";
        self.sProcess = @"";
        self.sProcessDate = @"";
        self.fFund = 0;
        self.fCount = 0;
        self.fPrice = 0;
        self.sObject = @"";
        self.sProject = @"";
        self.fLatestPrice = 0;
        self.fDiffRate = 0;
        self.sIndustry = @"";
        self.vProgress = [NSMutableArray arrayWithCapacity:0];
        self.vRelAnnc = [NSMutableArray arrayWithCapacity:0];
        self.fHairCuts = 0;
        self.fFundRate = 0;
        self.fPERatio = 0;
        self.fScore = 0;
        self.fIncrease = 0;
        self.fDeclPrice = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sId != nil)
    {
        [ostream writeString: 0 value: self.sId];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.sSecCode != nil)
    {
        [ostream writeString: 2 value: self.sSecCode];
    }
    if (self.sSecName != nil)
    {
        [ostream writeString: 3 value: self.sSecName];
    }
    if (self.sProcess != nil)
    {
        [ostream writeString: 4 value: self.sProcess];
    }
    if (self.sProcessDate != nil)
    {
        [ostream writeString: 5 value: self.sProcessDate];
    }
    [ostream writeFloat: 6 value: self.fFund];
    [ostream writeFloat: 7 value: self.fCount];
    [ostream writeFloat: 8 value: self.fPrice];
    if (self.sObject != nil)
    {
        [ostream writeString: 9 value: self.sObject];
    }
    if (self.sProject != nil)
    {
        [ostream writeString: 10 value: self.sProject];
    }
    [ostream writeFloat: 11 value: self.fLatestPrice];
    [ostream writeFloat: 12 value: self.fDiffRate];
    if (self.sIndustry != nil)
    {
        [ostream writeString: 13 value: self.sIndustry];
    }
    if (self.vProgress != nil)
    {
        [ostream writeList: 14 value: self.vProgress VAR_TYPE: [THOTH_LIST CREATE: [AdditionProgress class]]];
    }
    if (self.vRelAnnc != nil)
    {
        [ostream writeList: 15 value: self.vRelAnnc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    [ostream writeFloat: 16 value: self.fHairCuts];
    [ostream writeFloat: 17 value: self.fFundRate];
    [ostream writeFloat: 18 value: self.fPERatio];
    [ostream writeFloat: 19 value: self.fScore];
    [ostream writeFloat: 20 value: self.fIncrease];
    [ostream writeFloat: 21 value: self.fDeclPrice];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sSecCode = [istream readStringDef: 2 required: false def: self.sSecCode];
    self.sSecName = [istream readStringDef: 3 required: false def: self.sSecName];
    self.sProcess = [istream readStringDef: 4 required: false def: self.sProcess];
    self.sProcessDate = [istream readStringDef: 5 required: false def: self.sProcessDate];
    self.fFund = [istream readFloatDef: 6 required: false def: self.fFund];
    self.fCount = [istream readFloatDef: 7 required: false def: self.fCount];
    self.fPrice = [istream readFloatDef: 8 required: false def: self.fPrice];
    self.sObject = [istream readStringDef: 9 required: false def: self.sObject];
    self.sProject = [istream readStringDef: 10 required: false def: self.sProject];
    self.fLatestPrice = [istream readFloatDef: 11 required: false def: self.fLatestPrice];
    self.fDiffRate = [istream readFloatDef: 12 required: false def: self.fDiffRate];
    self.sIndustry = [istream readStringDef: 13 required: false def: self.sIndustry];
    self.vProgress = [istream readListDef: 14 required: false def: self.vProgress VAR_TYPE: [THOTH_LIST CREATE: [AdditionProgress class]]];
    self.vRelAnnc = [istream readListDef: 15 required: false def: self.vRelAnnc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.fHairCuts = [istream readFloatDef: 16 required: false def: self.fHairCuts];
    self.fFundRate = [istream readFloatDef: 17 required: false def: self.fFundRate];
    self.fPERatio = [istream readFloatDef: 18 required: false def: self.fPERatio];
    self.fScore = [istream readFloatDef: 19 required: false def: self.fScore];
    self.fIncrease = [istream readFloatDef: 20 required: false def: self.fIncrease];
    self.fDeclPrice = [istream readFloatDef: 21 required: false def: self.fDeclPrice];
    
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
    [JsonRoot append:@"sId" value : [BaseJSON writeString : self.sId]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sSecCode" value : [BaseJSON writeString : self.sSecCode]];
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"sProcess" value : [BaseJSON writeString : self.sProcess]];
    [JsonRoot append:@"sProcessDate" value : [BaseJSON writeString : self.sProcessDate]];
    [JsonRoot append:@"fFund" value : [BaseJSON writeFloat : self.fFund]];
    [JsonRoot append:@"fCount" value : [BaseJSON writeFloat : self.fCount]];
    [JsonRoot append:@"fPrice" value : [BaseJSON writeFloat : self.fPrice]];
    [JsonRoot append:@"sObject" value : [BaseJSON writeString : self.sObject]];
    [JsonRoot append:@"sProject" value : [BaseJSON writeString : self.sProject]];
    [JsonRoot append:@"fLatestPrice" value : [BaseJSON writeFloat : self.fLatestPrice]];
    [JsonRoot append:@"fDiffRate" value : [BaseJSON writeFloat : self.fDiffRate]];
    [JsonRoot append:@"sIndustry" value : [BaseJSON writeString : self.sIndustry]];
    [JsonRoot append:@"vProgress" value : [BaseJSON writeList : self.vProgress VAR_TYPE: [THOTH_LIST CREATE: [AdditionProgress class]]]];
    [JsonRoot append:@"vRelAnnc" value : [BaseJSON writeList : self.vRelAnnc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    [JsonRoot append:@"fHairCuts" value : [BaseJSON writeFloat : self.fHairCuts]];
    [JsonRoot append:@"fFundRate" value : [BaseJSON writeFloat : self.fFundRate]];
    [JsonRoot append:@"fPERatio" value : [BaseJSON writeFloat : self.fPERatio]];
    [JsonRoot append:@"fScore" value : [BaseJSON writeFloat : self.fScore]];
    [JsonRoot append:@"fIncrease" value : [BaseJSON writeFloat : self.fIncrease]];
    [JsonRoot append:@"fDeclPrice" value : [BaseJSON writeFloat : self.fDeclPrice]];
    return JsonRoot;
}

- (AdditionDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecCode"] required:false def:self.sSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sProcess = [BaseJSON readStringDef:[RootMap objectForKey:@"sProcess"] required:false def:self.sProcess];
    self.sProcessDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sProcessDate"] required:false def:self.sProcessDate];
    self.fFund = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFund"] required:false def:self.fFund];
    self.fCount = [BaseJSON readFloatDef:[RootMap objectForKey:@"fCount"] required:false def:self.fCount];
    self.fPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPrice"] required:false def:self.fPrice];
    self.sObject = [BaseJSON readStringDef:[RootMap objectForKey:@"sObject"] required:false def:self.sObject];
    self.sProject = [BaseJSON readStringDef:[RootMap objectForKey:@"sProject"] required:false def:self.sProject];
    self.fLatestPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fLatestPrice"] required:false def:self.fLatestPrice];
    self.fDiffRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fDiffRate"] required:false def:self.fDiffRate];
    self.sIndustry = [BaseJSON readStringDef:[RootMap objectForKey:@"sIndustry"] required:false def:self.sIndustry];
    self.vProgress = [BaseJSON readListDef:[RootMap objectForKey:@"vProgress"] required:false def:self.vProgress VAR_TYPE: [THOTH_LIST CREATE: [AdditionProgress class]]];
    self.vRelAnnc = [BaseJSON readListDef:[RootMap objectForKey:@"vRelAnnc"] required:false def:self.vRelAnnc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.fHairCuts = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHairCuts"] required:false def:self.fHairCuts];
    self.fFundRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFundRate"] required:false def:self.fFundRate];
    self.fPERatio = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPERatio"] required:false def:self.fPERatio];
    self.fScore = [BaseJSON readFloatDef:[RootMap objectForKey:@"fScore"] required:false def:self.fScore];
    self.fIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIncrease"] required:false def:self.fIncrease];
    self.fDeclPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fDeclPrice"] required:false def:self.fDeclPrice];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SearchCondition
- (id) init
{
    if (self = [super init])
    {
        self.eConditionType = CT_DATE;
        self.sTopValue = @"";
        self.sBottomValue = @"";
        self.vValues = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eConditionType];
    if (self.sTopValue != nil)
    {
        [ostream writeString: 1 value: self.sTopValue];
    }
    if (self.sBottomValue != nil)
    {
        [ostream writeString: 2 value: self.sBottomValue];
    }
    if (self.vValues != nil)
    {
        [ostream writeList: 3 value: self.vValues VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SearchCondition *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eConditionType = [istream readInt32Def: 0 required: false def: (int32_t)self.eConditionType];
    self.sTopValue = [istream readStringDef: 1 required: false def: self.sTopValue];
    self.sBottomValue = [istream readStringDef: 2 required: false def: self.sBottomValue];
    self.vValues = [istream readListDef: 3 required: false def: self.vValues VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"eConditionType" value : [BaseJSON writeInt32 : (int32_t)self.eConditionType]];
    [JsonRoot append:@"sTopValue" value : [BaseJSON writeString : self.sTopValue]];
    [JsonRoot append:@"sBottomValue" value : [BaseJSON writeString : self.sBottomValue]];
    [JsonRoot append:@"vValues" value : [BaseJSON writeList : self.vValues VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (SearchCondition *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eConditionType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eConditionType"] required:false def:(int32_t)self.eConditionType];
    self.sTopValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sTopValue"] required:false def:self.sTopValue];
    self.sBottomValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sBottomValue"] required:false def:self.sBottomValue];
    self.vValues = [BaseJSON readListDef:[RootMap objectForKey:@"vValues"] required:false def:self.vValues VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionListReq
- (id) init
{
    if (self = [super init])
    {
        self.sStartId = @"";
        self.sEndId = @"";
        self.stUserInfo = [[UserInfo alloc] init];
        self.vSearchCondition = [NSMutableArray arrayWithCapacity:0];
        self.eSortType = ALST_PUB_DATE;
        self.iStart = 0;
        self.bCountOnly = false;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStartId != nil)
    {
        [ostream writeString: 0 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 1 value: self.sEndId];
    }
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stUserInfo];
    }
    if (self.vSearchCondition != nil)
    {
        [ostream writeList: 3 value: self.vSearchCondition VAR_TYPE: [THOTH_LIST CREATE: [SearchCondition class]]];
    }
    [ostream writeInt32: 4 value: (int32_t)self.eSortType];
    [ostream writeInt32: 6 value: self.iStart];
    [ostream writeBoolean: 7 value: self.bCountOnly];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStartId = [istream readStringDef: 0 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 1 required: false def: self.sEndId];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 2 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vSearchCondition = [istream readListDef: 3 required: false def: self.vSearchCondition VAR_TYPE: [THOTH_LIST CREATE: [SearchCondition class]]];
    self.eSortType = [istream readInt32Def: 4 required: false def: (int32_t)self.eSortType];
    self.iStart = [istream readInt32Def: 6 required: false def: self.iStart];
    self.bCountOnly = [istream readBooleanDef: 7 required: false def: self.bCountOnly];
    
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
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    [JsonRoot append:@"sEndId" value : [BaseJSON writeString : self.sEndId]];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"vSearchCondition" value : [BaseJSON writeList : self.vSearchCondition VAR_TYPE: [THOTH_LIST CREATE: [SearchCondition class]]]];
    [JsonRoot append:@"eSortType" value : [BaseJSON writeInt32 : (int32_t)self.eSortType]];
    [JsonRoot append:@"iStart" value : [BaseJSON writeInt32 : self.iStart]];
    [JsonRoot append:@"bCountOnly" value : [BaseJSON writeBoolean : self.bCountOnly]];
    return JsonRoot;
}

- (AdditionListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    self.sEndId = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndId"] required:false def:self.sEndId];
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vSearchCondition = [BaseJSON readListDef:[RootMap objectForKey:@"vSearchCondition"] required:false def:self.vSearchCondition VAR_TYPE: [THOTH_LIST CREATE: [SearchCondition class]]];
    self.eSortType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSortType"] required:false def:(int32_t)self.eSortType];
    self.iStart = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStart"] required:false def:self.iStart];
    self.bCountOnly = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bCountOnly"] required:false def:self.bCountOnly];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionListRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.vAdditionDesc = [NSMutableArray arrayWithCapacity:0];
        self.sNextId = @"";
        self.iTotalCount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.vAdditionDesc != nil)
    {
        [ostream writeList: 1 value: self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    }
    if (self.sNextId != nil)
    {
        [ostream writeString: 2 value: self.sNextId];
    }
    [ostream writeInt32: 3 value: self.iTotalCount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.vAdditionDesc = [istream readListDef: 1 required: false def: self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    self.sNextId = [istream readStringDef: 2 required: false def: self.sNextId];
    self.iTotalCount = [istream readInt32Def: 3 required: false def: self.iTotalCount];
    
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
    [JsonRoot append:@"vAdditionDesc" value : [BaseJSON writeList : self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]]];
    [JsonRoot append:@"sNextId" value : [BaseJSON writeString : self.sNextId]];
    [JsonRoot append:@"iTotalCount" value : [BaseJSON writeInt32 : self.iTotalCount]];
    return JsonRoot;
}

- (AdditionListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRet = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRet"] required:false def:self.iRet];
    self.vAdditionDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vAdditionDesc"] required:false def:self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    self.sNextId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextId"] required:false def:self.sNextId];
    self.iTotalCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalCount"] required:false def:self.iTotalCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
        self.stUserInfo = [[UserInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vDtSecCode != nil)
    {
        [ostream writeList: 0 value: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stUserInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDtSecCode = [istream readListDef: 0 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 1 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
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
    [JsonRoot append:@"vDtSecCode" value : [BaseJSON writeList : self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    return JsonRoot;
}

- (AdditionDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vDtSecCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtSecCode"] required:false def:self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
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
@implementation AdditionDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.vAdditionDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.vAdditionDesc != nil)
    {
        [ostream writeList: 1 value: self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.vAdditionDesc = [istream readListDef: 1 required: false def: self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    
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
    [JsonRoot append:@"vAdditionDesc" value : [BaseJSON writeList : self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]]];
    return JsonRoot;
}

- (AdditionDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRet = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRet"] required:false def:self.iRet];
    self.vAdditionDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vAdditionDesc"] required:false def:self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FiltedDetail
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.fLiftedCount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sName != nil)
    {
        [ostream writeString: 0 value: self.sName];
    }
    [ostream writeFloat: 1 value: self.fLiftedCount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FiltedDetail *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.fLiftedCount = [istream readFloatDef: 1 required: false def: self.fLiftedCount];
    
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
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"fLiftedCount" value : [BaseJSON writeFloat : self.fLiftedCount]];
    return JsonRoot;
}

- (FiltedDetail *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.fLiftedCount = [BaseJSON readFloatDef:[RootMap objectForKey:@"fLiftedCount"] required:false def:self.fLiftedCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionStockLifted
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sDtSecCode = @"";
        self.sSecCode = @"";
        self.sSecName = @"";
        self.fFund = 0;
        self.fFundRate = 0;
        self.fPriceRate = 0;
        self.sDate = @"";
        self.fClosePrice = 0;
        self.fAdditionPrice = 0;
        self.fLiftedCount = 0;
        self.iLockexMonth = 0;
        self.sIndustry = @"";
        self.fScore = 0;
        self.fPERatio = 0;
        self.sType = @"";
        self.vLiftedDetail = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sId != nil)
    {
        [ostream writeString: 0 value: self.sId];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.sSecCode != nil)
    {
        [ostream writeString: 2 value: self.sSecCode];
    }
    if (self.sSecName != nil)
    {
        [ostream writeString: 3 value: self.sSecName];
    }
    [ostream writeFloat: 4 value: self.fFund];
    [ostream writeFloat: 5 value: self.fFundRate];
    [ostream writeFloat: 6 value: self.fPriceRate];
    if (self.sDate != nil)
    {
        [ostream writeString: 7 value: self.sDate];
    }
    [ostream writeFloat: 8 value: self.fClosePrice];
    [ostream writeFloat: 9 value: self.fAdditionPrice];
    [ostream writeFloat: 10 value: self.fLiftedCount];
    [ostream writeInt32: 11 value: self.iLockexMonth];
    if (self.sIndustry != nil)
    {
        [ostream writeString: 12 value: self.sIndustry];
    }
    [ostream writeFloat: 13 value: self.fScore];
    [ostream writeFloat: 14 value: self.fPERatio];
    if (self.sType != nil)
    {
        [ostream writeString: 15 value: self.sType];
    }
    if (self.vLiftedDetail != nil)
    {
        [ostream writeList: 16 value: self.vLiftedDetail VAR_TYPE: [THOTH_LIST CREATE: [FiltedDetail class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionStockLifted *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sSecCode = [istream readStringDef: 2 required: false def: self.sSecCode];
    self.sSecName = [istream readStringDef: 3 required: false def: self.sSecName];
    self.fFund = [istream readFloatDef: 4 required: false def: self.fFund];
    self.fFundRate = [istream readFloatDef: 5 required: false def: self.fFundRate];
    self.fPriceRate = [istream readFloatDef: 6 required: false def: self.fPriceRate];
    self.sDate = [istream readStringDef: 7 required: false def: self.sDate];
    self.fClosePrice = [istream readFloatDef: 8 required: false def: self.fClosePrice];
    self.fAdditionPrice = [istream readFloatDef: 9 required: false def: self.fAdditionPrice];
    self.fLiftedCount = [istream readFloatDef: 10 required: false def: self.fLiftedCount];
    self.iLockexMonth = [istream readInt32Def: 11 required: false def: self.iLockexMonth];
    self.sIndustry = [istream readStringDef: 12 required: false def: self.sIndustry];
    self.fScore = [istream readFloatDef: 13 required: false def: self.fScore];
    self.fPERatio = [istream readFloatDef: 14 required: false def: self.fPERatio];
    self.sType = [istream readStringDef: 15 required: false def: self.sType];
    self.vLiftedDetail = [istream readListDef: 16 required: false def: self.vLiftedDetail VAR_TYPE: [THOTH_LIST CREATE: [FiltedDetail class]]];
    
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
    [JsonRoot append:@"sId" value : [BaseJSON writeString : self.sId]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sSecCode" value : [BaseJSON writeString : self.sSecCode]];
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"fFund" value : [BaseJSON writeFloat : self.fFund]];
    [JsonRoot append:@"fFundRate" value : [BaseJSON writeFloat : self.fFundRate]];
    [JsonRoot append:@"fPriceRate" value : [BaseJSON writeFloat : self.fPriceRate]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"fClosePrice" value : [BaseJSON writeFloat : self.fClosePrice]];
    [JsonRoot append:@"fAdditionPrice" value : [BaseJSON writeFloat : self.fAdditionPrice]];
    [JsonRoot append:@"fLiftedCount" value : [BaseJSON writeFloat : self.fLiftedCount]];
    [JsonRoot append:@"iLockexMonth" value : [BaseJSON writeInt32 : self.iLockexMonth]];
    [JsonRoot append:@"sIndustry" value : [BaseJSON writeString : self.sIndustry]];
    [JsonRoot append:@"fScore" value : [BaseJSON writeFloat : self.fScore]];
    [JsonRoot append:@"fPERatio" value : [BaseJSON writeFloat : self.fPERatio]];
    [JsonRoot append:@"sType" value : [BaseJSON writeString : self.sType]];
    [JsonRoot append:@"vLiftedDetail" value : [BaseJSON writeList : self.vLiftedDetail VAR_TYPE: [THOTH_LIST CREATE: [FiltedDetail class]]]];
    return JsonRoot;
}

- (AdditionStockLifted *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecCode"] required:false def:self.sSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fFund = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFund"] required:false def:self.fFund];
    self.fFundRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFundRate"] required:false def:self.fFundRate];
    self.fPriceRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPriceRate"] required:false def:self.fPriceRate];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.fClosePrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClosePrice"] required:false def:self.fClosePrice];
    self.fAdditionPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAdditionPrice"] required:false def:self.fAdditionPrice];
    self.fLiftedCount = [BaseJSON readFloatDef:[RootMap objectForKey:@"fLiftedCount"] required:false def:self.fLiftedCount];
    self.iLockexMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLockexMonth"] required:false def:self.iLockexMonth];
    self.sIndustry = [BaseJSON readStringDef:[RootMap objectForKey:@"sIndustry"] required:false def:self.sIndustry];
    self.fScore = [BaseJSON readFloatDef:[RootMap objectForKey:@"fScore"] required:false def:self.fScore];
    self.fPERatio = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPERatio"] required:false def:self.fPERatio];
    self.sType = [BaseJSON readStringDef:[RootMap objectForKey:@"sType"] required:false def:self.sType];
    self.vLiftedDetail = [BaseJSON readListDef:[RootMap objectForKey:@"vLiftedDetail"] required:false def:self.vLiftedDetail VAR_TYPE: [THOTH_LIST CREATE: [FiltedDetail class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionLiftedListReq
- (id) init
{
    if (self = [super init])
    {
        self.iStart = 0;
        self.stUserInfo = [[UserInfo alloc] init];
        self.vSearchCondition = [NSMutableArray arrayWithCapacity:0];
        self.eSortType = LLST_DATE_DESC;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStart];
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stUserInfo];
    }
    if (self.vSearchCondition != nil)
    {
        [ostream writeList: 2 value: self.vSearchCondition VAR_TYPE: [THOTH_LIST CREATE: [SearchCondition class]]];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eSortType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionLiftedListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStart = [istream readInt32Def: 0 required: false def: self.iStart];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 1 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vSearchCondition = [istream readListDef: 2 required: false def: self.vSearchCondition VAR_TYPE: [THOTH_LIST CREATE: [SearchCondition class]]];
    self.eSortType = [istream readInt32Def: 3 required: false def: (int32_t)self.eSortType];
    
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
    [JsonRoot append:@"iStart" value : [BaseJSON writeInt32 : self.iStart]];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"vSearchCondition" value : [BaseJSON writeList : self.vSearchCondition VAR_TYPE: [THOTH_LIST CREATE: [SearchCondition class]]]];
    [JsonRoot append:@"eSortType" value : [BaseJSON writeInt32 : (int32_t)self.eSortType]];
    return JsonRoot;
}

- (AdditionLiftedListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStart = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStart"] required:false def:self.iStart];
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vSearchCondition = [BaseJSON readListDef:[RootMap objectForKey:@"vSearchCondition"] required:false def:self.vSearchCondition VAR_TYPE: [THOTH_LIST CREATE: [SearchCondition class]]];
    self.eSortType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSortType"] required:false def:(int32_t)self.eSortType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionLiftedListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vAdditionStockLifted = [NSMutableArray arrayWithCapacity:0];
        self.sNextId = @"";
        self.iTotalCount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vAdditionStockLifted != nil)
    {
        [ostream writeList: 0 value: self.vAdditionStockLifted VAR_TYPE: [THOTH_LIST CREATE: [AdditionStockLifted class]]];
    }
    if (self.sNextId != nil)
    {
        [ostream writeString: 1 value: self.sNextId];
    }
    [ostream writeInt32: 2 value: self.iTotalCount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionLiftedListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vAdditionStockLifted = [istream readListDef: 0 required: false def: self.vAdditionStockLifted VAR_TYPE: [THOTH_LIST CREATE: [AdditionStockLifted class]]];
    self.sNextId = [istream readStringDef: 1 required: false def: self.sNextId];
    self.iTotalCount = [istream readInt32Def: 2 required: false def: self.iTotalCount];
    
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
    [JsonRoot append:@"vAdditionStockLifted" value : [BaseJSON writeList : self.vAdditionStockLifted VAR_TYPE: [THOTH_LIST CREATE: [AdditionStockLifted class]]]];
    [JsonRoot append:@"sNextId" value : [BaseJSON writeString : self.sNextId]];
    [JsonRoot append:@"iTotalCount" value : [BaseJSON writeInt32 : self.iTotalCount]];
    return JsonRoot;
}

- (AdditionLiftedListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vAdditionStockLifted = [BaseJSON readListDef:[RootMap objectForKey:@"vAdditionStockLifted"] required:false def:self.vAdditionStockLifted VAR_TYPE: [THOTH_LIST CREATE: [AdditionStockLifted class]]];
    self.sNextId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextId"] required:false def:self.sNextId];
    self.iTotalCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalCount"] required:false def:self.iTotalCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionLiftedReq
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sId != nil)
    {
        [ostream writeString: 0 value: self.sId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionLiftedReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    
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
    [JsonRoot append:@"sId" value : [BaseJSON writeString : self.sId]];
    return JsonRoot;
}

- (AdditionLiftedReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AdditionLiftedRsp
- (id) init
{
    if (self = [super init])
    {
        self.stAdditionStockLifted = [[AdditionStockLifted alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stAdditionStockLifted != nil)
    {
        [ostream writeMessage: 0 value: self.stAdditionStockLifted];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionLiftedRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stAdditionStockLifted = (AdditionStockLifted*)[istream readMessageDef: 0 required: false def: self.stAdditionStockLifted VAR_TYPE: [AdditionStockLifted class]];
    
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
    [JsonRoot append:@"stAdditionStockLifted" value : [BaseJSON writeMessage : self.stAdditionStockLifted]];
    return JsonRoot;
}

- (AdditionLiftedRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stAdditionStockLifted = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAdditionStockLifted"] required:false def:self.stAdditionStockLifted VAR_TYPE: [AdditionStockLifted class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetInvestAdvisorListReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetInvestAdvisorListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    
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
    return JsonRoot;
}

- (GetInvestAdvisorListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetInvestAdvisorListRsp
- (id) init
{
    if (self = [super init])
    {
        self.stInvestAdviseInfoList = [[InvestAdviseInfoList alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stInvestAdviseInfoList != nil)
    {
        [ostream writeMessage: 0 value: self.stInvestAdviseInfoList];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetInvestAdvisorListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stInvestAdviseInfoList = (InvestAdviseInfoList*)[istream readMessageDef: 0 required: false def: self.stInvestAdviseInfoList VAR_TYPE: [InvestAdviseInfoList class]];
    
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
    [JsonRoot append:@"stInvestAdviseInfoList" value : [BaseJSON writeMessage : self.stInvestAdviseInfoList]];
    return JsonRoot;
}

- (GetInvestAdvisorListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stInvestAdviseInfoList = [BaseJSON readMessageDef:[RootMap objectForKey:@"stInvestAdviseInfoList"] required:false def:self.stInvestAdviseInfoList VAR_TYPE: [InvestAdviseInfoList class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicSubDir
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.vNewsIdList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sName != nil)
    {
        [ostream writeString: 0 value: self.sName];
    }
    if (self.vNewsIdList != nil)
    {
        [ostream writeList: 1 value: self.vNewsIdList VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicSubDir *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.vNewsIdList = [istream readListDef: 1 required: false def: self.vNewsIdList VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
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
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"vNewsIdList" value : [BaseJSON writeList : self.vNewsIdList VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    return JsonRoot;
}

- (TopicSubDir *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.vNewsIdList = [BaseJSON readListDef:[RootMap objectForKey:@"vNewsIdList"] required:false def:self.vNewsIdList VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicInfo
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sImg = @"";
        self.sDescription = @"";
        self.iCreatetime = 0;
        self.stFaceNews = [[NewsDesc alloc] init];
        self.vTopicSubDir = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sName != nil)
    {
        [ostream writeString: 0 value: self.sName];
    }
    if (self.sImg != nil)
    {
        [ostream writeString: 1 value: self.sImg];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 2 value: self.sDescription];
    }
    [ostream writeInt32: 3 value: self.iCreatetime];
    if (self.stFaceNews != nil)
    {
        [ostream writeMessage: 4 value: self.stFaceNews];
    }
    if (self.vTopicSubDir != nil)
    {
        [ostream writeList: 5 value: self.vTopicSubDir VAR_TYPE: [THOTH_LIST CREATE: [TopicSubDir class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sImg = [istream readStringDef: 1 required: false def: self.sImg];
    self.sDescription = [istream readStringDef: 2 required: false def: self.sDescription];
    self.iCreatetime = [istream readInt32Def: 3 required: false def: self.iCreatetime];
    self.stFaceNews = (NewsDesc*)[istream readMessageDef: 4 required: false def: self.stFaceNews VAR_TYPE: [NewsDesc class]];
    self.vTopicSubDir = [istream readListDef: 5 required: false def: self.vTopicSubDir VAR_TYPE: [THOTH_LIST CREATE: [TopicSubDir class]]];
    
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
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"sImg" value : [BaseJSON writeString : self.sImg]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"iCreatetime" value : [BaseJSON writeInt32 : self.iCreatetime]];
    [JsonRoot append:@"stFaceNews" value : [BaseJSON writeMessage : self.stFaceNews]];
    [JsonRoot append:@"vTopicSubDir" value : [BaseJSON writeList : self.vTopicSubDir VAR_TYPE: [THOTH_LIST CREATE: [TopicSubDir class]]]];
    return JsonRoot;
}

- (TopicInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sImg = [BaseJSON readStringDef:[RootMap objectForKey:@"sImg"] required:false def:self.sImg];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.iCreatetime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCreatetime"] required:false def:self.iCreatetime];
    self.stFaceNews = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFaceNews"] required:false def:self.stFaceNews VAR_TYPE: [NewsDesc class]];
    self.vTopicSubDir = [BaseJSON readListDef:[RootMap objectForKey:@"vTopicSubDir"] required:false def:self.vTopicSubDir VAR_TYPE: [THOTH_LIST CREATE: [TopicSubDir class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.iTopicId = 0;
        self.stUserInfo = [[UserInfo alloc] init];
        self.eChannelType = E_CT_PUBLIC;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTopicId];
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stUserInfo];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eChannelType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTopicId = [istream readInt32Def: 0 required: false def: self.iTopicId];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 1 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eChannelType = [istream readInt32Def: 2 required: false def: (int32_t)self.eChannelType];
    
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
    [JsonRoot append:@"iTopicId" value : [BaseJSON writeInt32 : self.iTopicId]];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"eChannelType" value : [BaseJSON writeInt32 : (int32_t)self.eChannelType]];
    return JsonRoot;
}

- (TopicInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iTopicId = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTopicId"] required:false def:self.iTopicId];
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eChannelType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eChannelType"] required:false def:(int32_t)self.eChannelType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.stTopicInfo = [[TopicInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.stTopicInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stTopicInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.stTopicInfo = (TopicInfo*)[istream readMessageDef: 1 required: false def: self.stTopicInfo VAR_TYPE: [TopicInfo class]];
    
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
    [JsonRoot append:@"stTopicInfo" value : [BaseJSON writeMessage : self.stTopicInfo]];
    return JsonRoot;
}

- (TopicInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRet = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRet"] required:false def:self.iRet];
    self.stTopicInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stTopicInfo"] required:false def:self.stTopicInfo VAR_TYPE: [TopicInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AllTgAttitudeReq
- (id) init
{
    if (self = [super init])
    {
        self.iStartTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStartTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AllTgAttitudeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStartTime = [istream readInt32Def: 0 required: false def: self.iStartTime];
    
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
    [JsonRoot append:@"iStartTime" value : [BaseJSON writeInt32 : self.iStartTime]];
    return JsonRoot;
}

- (AllTgAttitudeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStartTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartTime"] required:false def:self.iStartTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AllTgAttitudeRsp
- (id) init
{
    if (self = [super init])
    {
        self.vNewsDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AllTgAttitudeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vNewsDesc = [istream readListDef: 0 required: false def: self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
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
    [JsonRoot append:@"vNewsDesc" value : [BaseJSON writeList : self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]]];
    return JsonRoot;
}

- (AllTgAttitudeRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vNewsDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vNewsDesc"] required:false def:self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AllNewsIdListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vNewsId = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vNewsId != nil)
    {
        [ostream writeList: 0 value: self.vNewsId VAR_TYPE: [THOTH_LIST CREATE: [NewsId class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AllNewsIdListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vNewsId = [istream readListDef: 0 required: false def: self.vNewsId VAR_TYPE: [THOTH_LIST CREATE: [NewsId class]]];
    
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
    [JsonRoot append:@"vNewsId" value : [BaseJSON writeList : self.vNewsId VAR_TYPE: [THOTH_LIST CREATE: [NewsId class]]]];
    return JsonRoot;
}

- (AllNewsIdListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vNewsId = [BaseJSON readListDef:[RootMap objectForKey:@"vNewsId"] required:false def:self.vNewsId VAR_TYPE: [THOTH_LIST CREATE: [NewsId class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

