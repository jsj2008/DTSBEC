#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Alert.h"
#import "UserPortfolio.h"
#import "Notification.h"
#import "PushStatus.h"
#import "Feed.h"

//////////////////////////////////////////////////////////////
@implementation AlertReq
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
        self.vProSecInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    if (self.vProSecInfo != nil)
    {
        [ostream writeList: 1 value: self.vProSecInfo VAR_TYPE: [THOTH_LIST CREATE: [ProSecInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    self.vProSecInfo = [istream readListDef: 1 required: false def: self.vProSecInfo VAR_TYPE: [THOTH_LIST CREATE: [ProSecInfo class]]];
    
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
    [JsonRoot append:@"vProSecInfo" value : [BaseJSON writeList : self.vProSecInfo VAR_TYPE: [THOTH_LIST CREATE: [ProSecInfo class]]]];
    return JsonRoot;
}

- (AlertReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.vProSecInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vProSecInfo"] required:false def:self.vProSecInfo VAR_TYPE: [THOTH_LIST CREATE: [ProSecInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertRsp
- (id) init
{
    if (self = [super init])
    {
        self.iSetSize = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iSetSize];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iSetSize = [istream readUInt32Def: 0 required: false def: self.iSetSize];
    
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
    [JsonRoot append:@"iSetSize" value : [BaseJSON writeUInt32 : self.iSetSize]];
    return JsonRoot;
}

- (AlertRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iSetSize = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iSetSize"] required:false def:self.iSetSize];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertMessageListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iStart = 0;
        self.iNum = 0;
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
    [ostream writeUInt32: 1 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    [ostream writeUInt32: 3 value: self.iStart];
    [ostream writeUInt32: 4 value: self.iNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertMessageListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iStart = [istream readUInt32Def: 3 required: false def: self.iStart];
    self.iNum = [istream readUInt32Def: 4 required: false def: self.iNum];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iStart" value : [BaseJSON writeUInt32 : self.iStart]];
    [JsonRoot append:@"iNum" value : [BaseJSON writeUInt32 : self.iNum]];
    return JsonRoot;
}

- (AlertMessageListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iStart = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iStart"] required:false def:self.iStart];
    self.iNum = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iNum"] required:false def:self.iNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertMessageListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPushData = [NSMutableArray arrayWithCapacity:0];
        self.iClearTimeStamp = 0;
        self.mClearTimeStamp = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPushData != nil)
    {
        [ostream writeList: 0 value: self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    }
    [ostream writeUInt32: 1 value: self.iClearTimeStamp];
    if (self.mClearTimeStamp != nil)
    {
        [ostream writeMap: 2 value: self.mClearTimeStamp VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_UINT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertMessageListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPushData = [istream readListDef: 0 required: false def: self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    self.iClearTimeStamp = [istream readUInt32Def: 1 required: false def: self.iClearTimeStamp];
    self.mClearTimeStamp = [istream readMapDef: 2 required: false def: self.mClearTimeStamp VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_UINT32 class]]];
    
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
    [JsonRoot append:@"vPushData" value : [BaseJSON writeList : self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]]];
    [JsonRoot append:@"iClearTimeStamp" value : [BaseJSON writeUInt32 : self.iClearTimeStamp]];
    [JsonRoot append:@"mClearTimeStamp" value : [BaseJSON writeMap : self.mClearTimeStamp VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_UINT32 class]]]];
    return JsonRoot;
}

- (AlertMessageListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vPushData = [BaseJSON readListDef:[RootMap objectForKey:@"vPushData"] required:false def:self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    self.iClearTimeStamp = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iClearTimeStamp"] required:false def:self.iClearTimeStamp];
    self.mClearTimeStamp = [BaseJSON readMapDef:[RootMap objectForKey:@"mClearTimeStamp"] required:false def:self.mClearTimeStamp VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_UINT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ClearAlertMessageListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iClassID = 0;
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
    [ostream writeUInt32: 1 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    [ostream writeInt32: 3 value: self.iClassID];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ClearAlertMessageListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iClassID = [istream readInt32Def: 3 required: false def: self.iClassID];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iClassID" value : [BaseJSON writeInt32 : self.iClassID]];
    return JsonRoot;
}

- (ClearAlertMessageListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iClassID = [BaseJSON readInt32Def:[RootMap objectForKey:@"iClassID"] required:false def:self.iClassID];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RecordAlertMsgReq
- (id) init
{
    if (self = [super init])
    {
        self.vPushData = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPushData != nil)
    {
        [ostream writeList: 2 value: self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RecordAlertMsgReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPushData = [istream readListDef: 2 required: false def: self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    
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
    [JsonRoot append:@"vPushData" value : [BaseJSON writeList : self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]]];
    return JsonRoot;
}

- (RecordAlertMsgReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vPushData = [BaseJSON readListDef:[RootMap objectForKey:@"vPushData"] required:false def:self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertMsgClassDesc
- (id) init
{
    if (self = [super init])
    {
        self.iClassID = 0;
        self.sClassName = @"";
        self.sAndroidIconUrl = @"";
        self.sIosIconUrl = @"";
        self.sMsg = @"";
        self.iPushTime = 0;
        self.iNewsPushCount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iClassID];
    if (self.sClassName != nil)
    {
        [ostream writeString: 1 value: self.sClassName];
    }
    if (self.sAndroidIconUrl != nil)
    {
        [ostream writeString: 2 value: self.sAndroidIconUrl];
    }
    if (self.sIosIconUrl != nil)
    {
        [ostream writeString: 3 value: self.sIosIconUrl];
    }
    if (self.sMsg != nil)
    {
        [ostream writeString: 4 value: self.sMsg];
    }
    [ostream writeInt32: 5 value: self.iPushTime];
    [ostream writeInt32: 6 value: self.iNewsPushCount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertMsgClassDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iClassID = [istream readInt32Def: 0 required: false def: self.iClassID];
    self.sClassName = [istream readStringDef: 1 required: false def: self.sClassName];
    self.sAndroidIconUrl = [istream readStringDef: 2 required: false def: self.sAndroidIconUrl];
    self.sIosIconUrl = [istream readStringDef: 3 required: false def: self.sIosIconUrl];
    self.sMsg = [istream readStringDef: 4 required: false def: self.sMsg];
    self.iPushTime = [istream readInt32Def: 5 required: false def: self.iPushTime];
    self.iNewsPushCount = [istream readInt32Def: 6 required: false def: self.iNewsPushCount];
    
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
    [JsonRoot append:@"iClassID" value : [BaseJSON writeInt32 : self.iClassID]];
    [JsonRoot append:@"sClassName" value : [BaseJSON writeString : self.sClassName]];
    [JsonRoot append:@"sAndroidIconUrl" value : [BaseJSON writeString : self.sAndroidIconUrl]];
    [JsonRoot append:@"sIosIconUrl" value : [BaseJSON writeString : self.sIosIconUrl]];
    [JsonRoot append:@"sMsg" value : [BaseJSON writeString : self.sMsg]];
    [JsonRoot append:@"iPushTime" value : [BaseJSON writeInt32 : self.iPushTime]];
    [JsonRoot append:@"iNewsPushCount" value : [BaseJSON writeInt32 : self.iNewsPushCount]];
    return JsonRoot;
}

- (AlertMsgClassDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iClassID = [BaseJSON readInt32Def:[RootMap objectForKey:@"iClassID"] required:false def:self.iClassID];
    self.sClassName = [BaseJSON readStringDef:[RootMap objectForKey:@"sClassName"] required:false def:self.sClassName];
    self.sAndroidIconUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sAndroidIconUrl"] required:false def:self.sAndroidIconUrl];
    self.sIosIconUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sIosIconUrl"] required:false def:self.sIosIconUrl];
    self.sMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsg"] required:false def:self.sMsg];
    self.iPushTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPushTime"] required:false def:self.iPushTime];
    self.iNewsPushCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNewsPushCount"] required:false def:self.iNewsPushCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertMsgClassListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.mEndPushTime = [NSMutableDictionary dictionaryWithCapacity: 0];
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
    [ostream writeUInt32: 1 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    if (self.mEndPushTime != nil)
    {
        [ostream writeMap: 4 value: self.mEndPushTime VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertMsgClassListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.mEndPushTime = [istream readMapDef: 4 required: false def: self.mEndPushTime VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"mEndPushTime" value : [BaseJSON writeMap : self.mEndPushTime VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (AlertMsgClassListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.mEndPushTime = [BaseJSON readMapDef:[RootMap objectForKey:@"mEndPushTime"] required:false def:self.mEndPushTime VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertMsgClassListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vAlertMsgClassDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vAlertMsgClassDesc != nil)
    {
        [ostream writeList: 0 value: self.vAlertMsgClassDesc VAR_TYPE: [THOTH_LIST CREATE: [AlertMsgClassDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertMsgClassListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vAlertMsgClassDesc = [istream readListDef: 0 required: false def: self.vAlertMsgClassDesc VAR_TYPE: [THOTH_LIST CREATE: [AlertMsgClassDesc class]]];
    
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
    [JsonRoot append:@"vAlertMsgClassDesc" value : [BaseJSON writeList : self.vAlertMsgClassDesc VAR_TYPE: [THOTH_LIST CREATE: [AlertMsgClassDesc class]]]];
    return JsonRoot;
}

- (AlertMsgClassListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vAlertMsgClassDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vAlertMsgClassDesc"] required:false def:self.vAlertMsgClassDesc VAR_TYPE: [THOTH_LIST CREATE: [AlertMsgClassDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertMsgClassDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iClassID = 0;
        self.iStart = 0;
        self.iNum = 0;
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
    [ostream writeUInt32: 1 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    [ostream writeInt32: 3 value: self.iClassID];
    [ostream writeInt32: 4 value: self.iStart];
    [ostream writeInt32: 5 value: self.iNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertMsgClassDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iClassID = [istream readInt32Def: 3 required: false def: self.iClassID];
    self.iStart = [istream readInt32Def: 4 required: false def: self.iStart];
    self.iNum = [istream readInt32Def: 5 required: false def: self.iNum];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iClassID" value : [BaseJSON writeInt32 : self.iClassID]];
    [JsonRoot append:@"iStart" value : [BaseJSON writeInt32 : self.iStart]];
    [JsonRoot append:@"iNum" value : [BaseJSON writeInt32 : self.iNum]];
    return JsonRoot;
}

- (AlertMsgClassDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iClassID = [BaseJSON readInt32Def:[RootMap objectForKey:@"iClassID"] required:false def:self.iClassID];
    self.iStart = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStart"] required:false def:self.iStart];
    self.iNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNum"] required:false def:self.iNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertMsgClassDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPushData = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPushData != nil)
    {
        [ostream writeList: 0 value: self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertMsgClassDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPushData = [istream readListDef: 0 required: false def: self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    
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
    [JsonRoot append:@"vPushData" value : [BaseJSON writeList : self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]]];
    return JsonRoot;
}

- (AlertMsgClassDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vPushData = [BaseJSON readListDef:[RootMap objectForKey:@"vPushData"] required:false def:self.vPushData VAR_TYPE: [THOTH_LIST CREATE: [PushData class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertUserInteractionReq
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
        self.iFromAccountId = 0;
        self.sFromUserIcon = @"";
        self.sFromUserName = @"";
        self.sMsgId = @"";
        self.sMsg = @"";
        self.sFeedId = @"";
        self.bVerify = true;
        self.eFeedType = E_FT_ALL;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    [ostream writeUInt32: 1 value: self.iFromAccountId];
    if (self.sFromUserIcon != nil)
    {
        [ostream writeString: 2 value: self.sFromUserIcon];
    }
    if (self.sFromUserName != nil)
    {
        [ostream writeString: 3 value: self.sFromUserName];
    }
    if (self.sMsgId != nil)
    {
        [ostream writeString: 4 value: self.sMsgId];
    }
    if (self.sMsg != nil)
    {
        [ostream writeString: 5 value: self.sMsg];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 7 value: self.sFeedId];
    }
    [ostream writeBoolean: 8 value: self.bVerify];
    [ostream writeInt32: 9 value: (int32_t)self.eFeedType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertUserInteractionReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    self.iFromAccountId = [istream readUInt32Def: 1 required: false def: self.iFromAccountId];
    self.sFromUserIcon = [istream readStringDef: 2 required: false def: self.sFromUserIcon];
    self.sFromUserName = [istream readStringDef: 3 required: false def: self.sFromUserName];
    self.sMsgId = [istream readStringDef: 4 required: false def: self.sMsgId];
    self.sMsg = [istream readStringDef: 5 required: false def: self.sMsg];
    self.sFeedId = [istream readStringDef: 7 required: false def: self.sFeedId];
    self.bVerify = [istream readBooleanDef: 8 required: false def: self.bVerify];
    self.eFeedType = [istream readInt32Def: 9 required: false def: (int32_t)self.eFeedType];
    
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
    [JsonRoot append:@"iFromAccountId" value : [BaseJSON writeUInt32 : self.iFromAccountId]];
    [JsonRoot append:@"sFromUserIcon" value : [BaseJSON writeString : self.sFromUserIcon]];
    [JsonRoot append:@"sFromUserName" value : [BaseJSON writeString : self.sFromUserName]];
    [JsonRoot append:@"sMsgId" value : [BaseJSON writeString : self.sMsgId]];
    [JsonRoot append:@"sMsg" value : [BaseJSON writeString : self.sMsg]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"bVerify" value : [BaseJSON writeBoolean : self.bVerify]];
    [JsonRoot append:@"eFeedType" value : [BaseJSON writeInt32 : (int32_t)self.eFeedType]];
    return JsonRoot;
}

- (AlertUserInteractionReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.iFromAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iFromAccountId"] required:false def:self.iFromAccountId];
    self.sFromUserIcon = [BaseJSON readStringDef:[RootMap objectForKey:@"sFromUserIcon"] required:false def:self.sFromUserIcon];
    self.sFromUserName = [BaseJSON readStringDef:[RootMap objectForKey:@"sFromUserName"] required:false def:self.sFromUserName];
    self.sMsgId = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsgId"] required:false def:self.sMsgId];
    self.sMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsg"] required:false def:self.sMsg];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.bVerify = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bVerify"] required:false def:self.bVerify];
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
@implementation AlertUserInteractionRsp
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

- (AlertUserInteractionRsp *) read: (BaseDecodeStream *)istream
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

- (AlertUserInteractionRsp *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation AlertTgAttitudeReq
- (id) init
{
    if (self = [super init])
    {
        self.stFeedContent = [[FeedContent alloc] init];
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AlertTgAttitudeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFeedContent = (FeedContent*)[istream readMessageDef: 0 required: false def: self.stFeedContent VAR_TYPE: [FeedContent class]];
    
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
    return JsonRoot;
}

- (AlertTgAttitudeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stFeedContent = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFeedContent"] required:false def:self.stFeedContent VAR_TYPE: [FeedContent class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AlertTgAttitudeRsp
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

- (AlertTgAttitudeRsp *) read: (BaseDecodeStream *)istream
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

- (AlertTgAttitudeRsp *) readFromMap : (NSMutableDictionary *) RootMap
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

