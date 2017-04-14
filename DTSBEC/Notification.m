#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Notification.h"
#import "Beacon.h"
#import "NewsInfo.h"

//////////////////////////////////////////////////////////////
@implementation SecNotify
- (id) init
{
    if (self = [super init])
    {
        self.stSecInfo = [[SecInfo alloc] init];
        self.sNotifyMsg = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stSecInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stSecInfo];
    }
    if (self.sNotifyMsg != nil)
    {
        [ostream writeString: 1 value: self.sNotifyMsg];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNotify *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stSecInfo = (SecInfo*)[istream readMessageDef: 0 required: false def: self.stSecInfo VAR_TYPE: [SecInfo class]];
    self.sNotifyMsg = [istream readStringDef: 1 required: false def: self.sNotifyMsg];
    
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
    [JsonRoot append:@"stSecInfo" value : [BaseJSON writeMessage : self.stSecInfo]];
    [JsonRoot append:@"sNotifyMsg" value : [BaseJSON writeString : self.sNotifyMsg]];
    return JsonRoot;
}

- (SecNotify *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stSecInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecInfo"] required:false def:self.stSecInfo VAR_TYPE: [SecInfo class]];
    self.sNotifyMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sNotifyMsg"] required:false def:self.sNotifyMsg];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewsNotify
- (id) init
{
    if (self = [super init])
    {
        self.sCHNShortName = @"";
        self.sDtSecCode = @"";
        self.sNewsID = @"";
        self.eNewsType = NT_UNKNOWN;
        self.sTitle = @"";
        self.sDtInfoUrl = @"";
        self.sNotifyMsg = @"";
        self.eNotifyNewType = E_NNT_COMMON;
        self.vtTagInfo = [NSMutableArray arrayWithCapacity:0];
        self.sAbstract = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sCHNShortName != nil)
    {
        [ostream writeString: 0 value: self.sCHNShortName];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.sNewsID != nil)
    {
        [ostream writeString: 2 value: self.sNewsID];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eNewsType];
    if (self.sTitle != nil)
    {
        [ostream writeString: 4 value: self.sTitle];
    }
    if (self.sDtInfoUrl != nil)
    {
        [ostream writeString: 5 value: self.sDtInfoUrl];
    }
    if (self.sNotifyMsg != nil)
    {
        [ostream writeString: 6 value: self.sNotifyMsg];
    }
    [ostream writeInt32: 7 value: (int32_t)self.eNotifyNewType];
    if (self.vtTagInfo != nil)
    {
        [ostream writeList: 8 value: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    }
    if (self.sAbstract != nil)
    {
        [ostream writeString: 9 value: self.sAbstract];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsNotify *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sCHNShortName = [istream readStringDef: 0 required: false def: self.sCHNShortName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sNewsID = [istream readStringDef: 2 required: false def: self.sNewsID];
    self.eNewsType = [istream readInt32Def: 3 required: false def: (int32_t)self.eNewsType];
    self.sTitle = [istream readStringDef: 4 required: false def: self.sTitle];
    self.sDtInfoUrl = [istream readStringDef: 5 required: false def: self.sDtInfoUrl];
    self.sNotifyMsg = [istream readStringDef: 6 required: false def: self.sNotifyMsg];
    self.eNotifyNewType = [istream readInt32Def: 7 required: false def: (int32_t)self.eNotifyNewType];
    self.vtTagInfo = [istream readListDef: 8 required: false def: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.sAbstract = [istream readStringDef: 9 required: false def: self.sAbstract];
    
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
    [JsonRoot append:@"sCHNShortName" value : [BaseJSON writeString : self.sCHNShortName]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sNewsID" value : [BaseJSON writeString : self.sNewsID]];
    [JsonRoot append:@"eNewsType" value : [BaseJSON writeInt32 : (int32_t)self.eNewsType]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sDtInfoUrl" value : [BaseJSON writeString : self.sDtInfoUrl]];
    [JsonRoot append:@"sNotifyMsg" value : [BaseJSON writeString : self.sNotifyMsg]];
    [JsonRoot append:@"eNotifyNewType" value : [BaseJSON writeInt32 : (int32_t)self.eNotifyNewType]];
    [JsonRoot append:@"vtTagInfo" value : [BaseJSON writeList : self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]]];
    [JsonRoot append:@"sAbstract" value : [BaseJSON writeString : self.sAbstract]];
    return JsonRoot;
}

- (NewsNotify *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sCHNShortName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCHNShortName"] required:false def:self.sCHNShortName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sNewsID = [BaseJSON readStringDef:[RootMap objectForKey:@"sNewsID"] required:false def:self.sNewsID];
    self.eNewsType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNewsType"] required:false def:(int32_t)self.eNewsType];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sDtInfoUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtInfoUrl"] required:false def:self.sDtInfoUrl];
    self.sNotifyMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sNotifyMsg"] required:false def:self.sNotifyMsg];
    self.eNotifyNewType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eNotifyNewType"] required:false def:(int32_t)self.eNotifyNewType];
    self.vtTagInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtTagInfo"] required:false def:self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.sAbstract = [BaseJSON readStringDef:[RootMap objectForKey:@"sAbstract"] required:false def:self.sAbstract];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ActivityNotify
- (id) init
{
    if (self = [super init])
    {
        self.sTitle = @"";
        self.sUrl = @"";
        self.sMsg = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTitle != nil)
    {
        [ostream writeString: 0 value: self.sTitle];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 1 value: self.sUrl];
    }
    if (self.sMsg != nil)
    {
        [ostream writeString: 2 value: self.sMsg];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ActivityNotify *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTitle = [istream readStringDef: 0 required: false def: self.sTitle];
    self.sUrl = [istream readStringDef: 1 required: false def: self.sUrl];
    self.sMsg = [istream readStringDef: 2 required: false def: self.sMsg];
    
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
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"sMsg" value : [BaseJSON writeString : self.sMsg]];
    return JsonRoot;
}

- (ActivityNotify *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.sMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsg"] required:false def:self.sMsg];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StartPageNotify
- (id) init
{
    if (self = [super init])
    {
        self.sTitle = @"";
        self.sUrl = @"";
        self.iShowTime = 0;
        self.iHeight = 0;
        self.iWidth = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTitle != nil)
    {
        [ostream writeString: 0 value: self.sTitle];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 1 value: self.sUrl];
    }
    [ostream writeInt32: 2 value: self.iShowTime];
    [ostream writeInt32: 3 value: self.iHeight];
    [ostream writeInt32: 4 value: self.iWidth];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StartPageNotify *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTitle = [istream readStringDef: 0 required: false def: self.sTitle];
    self.sUrl = [istream readStringDef: 1 required: false def: self.sUrl];
    self.iShowTime = [istream readInt32Def: 2 required: false def: self.iShowTime];
    self.iHeight = [istream readInt32Def: 3 required: false def: self.iHeight];
    self.iWidth = [istream readInt32Def: 4 required: false def: self.iWidth];
    
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
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"iShowTime" value : [BaseJSON writeInt32 : self.iShowTime]];
    [JsonRoot append:@"iHeight" value : [BaseJSON writeInt32 : self.iHeight]];
    [JsonRoot append:@"iWidth" value : [BaseJSON writeInt32 : self.iWidth]];
    return JsonRoot;
}

- (StartPageNotify *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.iShowTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iShowTime"] required:false def:self.iShowTime];
    self.iHeight = [BaseJSON readInt32Def:[RootMap objectForKey:@"iHeight"] required:false def:self.iHeight];
    self.iWidth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWidth"] required:false def:self.iWidth];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TgAttitudeNotify
- (id) init
{
    if (self = [super init])
    {
        self.sFeedId = @"";
        self.iAccountId = 0;
        self.sUserName = @"";
        self.sIcon = @"";
        self.sNotifyMsg = @"";
        self.bVerify = true;
        self.iFeedType = 0;
        self.iMemberType = 0;
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
    [ostream writeUInt32: 1 value: self.iAccountId];
    if (self.sUserName != nil)
    {
        [ostream writeString: 2 value: self.sUserName];
    }
    if (self.sIcon != nil)
    {
        [ostream writeString: 3 value: self.sIcon];
    }
    if (self.sNotifyMsg != nil)
    {
        [ostream writeString: 4 value: self.sNotifyMsg];
    }
    [ostream writeBoolean: 5 value: self.bVerify];
    [ostream writeInt32: 6 value: self.iFeedType];
    [ostream writeInt32: 7 value: self.iMemberType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TgAttitudeNotify *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sFeedId = [istream readStringDef: 0 required: false def: self.sFeedId];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    self.sUserName = [istream readStringDef: 2 required: false def: self.sUserName];
    self.sIcon = [istream readStringDef: 3 required: false def: self.sIcon];
    self.sNotifyMsg = [istream readStringDef: 4 required: false def: self.sNotifyMsg];
    self.bVerify = [istream readBooleanDef: 5 required: false def: self.bVerify];
    self.iFeedType = [istream readInt32Def: 6 required: false def: self.iFeedType];
    self.iMemberType = [istream readInt32Def: 7 required: false def: self.iMemberType];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"sUserName" value : [BaseJSON writeString : self.sUserName]];
    [JsonRoot append:@"sIcon" value : [BaseJSON writeString : self.sIcon]];
    [JsonRoot append:@"sNotifyMsg" value : [BaseJSON writeString : self.sNotifyMsg]];
    [JsonRoot append:@"bVerify" value : [BaseJSON writeBoolean : self.bVerify]];
    [JsonRoot append:@"iFeedType" value : [BaseJSON writeInt32 : self.iFeedType]];
    [JsonRoot append:@"iMemberType" value : [BaseJSON writeInt32 : self.iMemberType]];
    return JsonRoot;
}

- (TgAttitudeNotify *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.sUserName = [BaseJSON readStringDef:[RootMap objectForKey:@"sUserName"] required:false def:self.sUserName];
    self.sIcon = [BaseJSON readStringDef:[RootMap objectForKey:@"sIcon"] required:false def:self.sIcon];
    self.sNotifyMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sNotifyMsg"] required:false def:self.sNotifyMsg];
    self.bVerify = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bVerify"] required:false def:self.bVerify];
    self.iFeedType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFeedType"] required:false def:self.iFeedType];
    self.iMemberType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMemberType"] required:false def:self.iMemberType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InteractionNotify
- (id) init
{
    if (self = [super init])
    {
        self.sMsgId = @"";
        self.sMsg = @"";
        self.iAccountId = 0;
        self.sIcon = @"";
        self.sUserName = @"";
        self.sFeedId = @"";
        self.bVerify = true;
        self.iFeedType = 0;
        self.iMemberType = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sMsgId != nil)
    {
        [ostream writeString: 0 value: self.sMsgId];
    }
    if (self.sMsg != nil)
    {
        [ostream writeString: 1 value: self.sMsg];
    }
    [ostream writeUInt32: 2 value: self.iAccountId];
    if (self.sIcon != nil)
    {
        [ostream writeString: 3 value: self.sIcon];
    }
    if (self.sUserName != nil)
    {
        [ostream writeString: 4 value: self.sUserName];
    }
    if (self.sFeedId != nil)
    {
        [ostream writeString: 5 value: self.sFeedId];
    }
    [ostream writeBoolean: 6 value: self.bVerify];
    [ostream writeInt32: 7 value: self.iFeedType];
    [ostream writeInt32: 8 value: self.iMemberType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InteractionNotify *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sMsgId = [istream readStringDef: 0 required: false def: self.sMsgId];
    self.sMsg = [istream readStringDef: 1 required: false def: self.sMsg];
    self.iAccountId = [istream readUInt32Def: 2 required: false def: self.iAccountId];
    self.sIcon = [istream readStringDef: 3 required: false def: self.sIcon];
    self.sUserName = [istream readStringDef: 4 required: false def: self.sUserName];
    self.sFeedId = [istream readStringDef: 5 required: false def: self.sFeedId];
    self.bVerify = [istream readBooleanDef: 6 required: false def: self.bVerify];
    self.iFeedType = [istream readInt32Def: 7 required: false def: self.iFeedType];
    self.iMemberType = [istream readInt32Def: 8 required: false def: self.iMemberType];
    
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
    [JsonRoot append:@"sMsgId" value : [BaseJSON writeString : self.sMsgId]];
    [JsonRoot append:@"sMsg" value : [BaseJSON writeString : self.sMsg]];
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"sIcon" value : [BaseJSON writeString : self.sIcon]];
    [JsonRoot append:@"sUserName" value : [BaseJSON writeString : self.sUserName]];
    [JsonRoot append:@"sFeedId" value : [BaseJSON writeString : self.sFeedId]];
    [JsonRoot append:@"bVerify" value : [BaseJSON writeBoolean : self.bVerify]];
    [JsonRoot append:@"iFeedType" value : [BaseJSON writeInt32 : self.iFeedType]];
    [JsonRoot append:@"iMemberType" value : [BaseJSON writeInt32 : self.iMemberType]];
    return JsonRoot;
}

- (InteractionNotify *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sMsgId = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsgId"] required:false def:self.sMsgId];
    self.sMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsg"] required:false def:self.sMsg];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.sIcon = [BaseJSON readStringDef:[RootMap objectForKey:@"sIcon"] required:false def:self.sIcon];
    self.sUserName = [BaseJSON readStringDef:[RootMap objectForKey:@"sUserName"] required:false def:self.sUserName];
    self.sFeedId = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeedId"] required:false def:self.sFeedId];
    self.bVerify = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bVerify"] required:false def:self.bVerify];
    self.iFeedType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFeedType"] required:false def:self.iFeedType];
    self.iMemberType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMemberType"] required:false def:self.iMemberType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PushType
- (id) init
{
    if (self = [super init])
    {
        self.ePushDataType = E_SEC_REMIND;
        self.sBusinessId = @"";
        self.sMsgId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.ePushDataType];
    if (self.sBusinessId != nil)
    {
        [ostream writeString: 1 value: self.sBusinessId];
    }
    if (self.sMsgId != nil)
    {
        [ostream writeString: 2 value: self.sMsgId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PushType *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.ePushDataType = [istream readInt32Def: 0 required: false def: (int32_t)self.ePushDataType];
    self.sBusinessId = [istream readStringDef: 1 required: false def: self.sBusinessId];
    self.sMsgId = [istream readStringDef: 2 required: false def: self.sMsgId];
    
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
    [JsonRoot append:@"ePushDataType" value : [BaseJSON writeInt32 : (int32_t)self.ePushDataType]];
    [JsonRoot append:@"sBusinessId" value : [BaseJSON writeString : self.sBusinessId]];
    [JsonRoot append:@"sMsgId" value : [BaseJSON writeString : self.sMsgId]];
    return JsonRoot;
}

- (PushType *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.ePushDataType = [BaseJSON readInt32Def:[RootMap objectForKey:@"ePushDataType"] required:false def:(int32_t)self.ePushDataType];
    self.sBusinessId = [BaseJSON readStringDef:[RootMap objectForKey:@"sBusinessId"] required:false def:self.sBusinessId];
    self.sMsgId = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsgId"] required:false def:self.sMsgId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PushControlData
- (id) init
{
    if (self = [super init])
    {
        self.iRealPushType = 0;
        self.sAndroidIconUrl = @"";
        self.sIosIconUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRealPushType];
    if (self.sAndroidIconUrl != nil)
    {
        [ostream writeString: 1 value: self.sAndroidIconUrl];
    }
    if (self.sIosIconUrl != nil)
    {
        [ostream writeString: 2 value: self.sIosIconUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PushControlData *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRealPushType = [istream readInt32Def: 0 required: false def: self.iRealPushType];
    self.sAndroidIconUrl = [istream readStringDef: 1 required: false def: self.sAndroidIconUrl];
    self.sIosIconUrl = [istream readStringDef: 2 required: false def: self.sIosIconUrl];
    
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
    [JsonRoot append:@"iRealPushType" value : [BaseJSON writeInt32 : self.iRealPushType]];
    [JsonRoot append:@"sAndroidIconUrl" value : [BaseJSON writeString : self.sAndroidIconUrl]];
    [JsonRoot append:@"sIosIconUrl" value : [BaseJSON writeString : self.sIosIconUrl]];
    return JsonRoot;
}

- (PushControlData *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRealPushType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRealPushType"] required:false def:self.iRealPushType];
    self.sAndroidIconUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sAndroidIconUrl"] required:false def:self.sAndroidIconUrl];
    self.sIosIconUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sIosIconUrl"] required:false def:self.sIosIconUrl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PushData
- (id) init
{
    if (self = [super init])
    {
        self.iPushTime = 0;
        self.iExpireTime = 0;
        self.iStartTime = 0;
        self.sTitle = @"";
        self.eDeviceType = E_PDT_ALL;
        self.sDescription = @"";
        self.iNotifyEffect = 0;
        self.stControl = [[PushControlData alloc] init];
        self.iClassID = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeBytes: 0 value: self.vtData];
    [ostream writeMessage: 1 value: self.stPushType];
    [ostream writeInt32: 2 value: self.iPushTime];
    [ostream writeInt32: 3 value: self.iExpireTime];
    [ostream writeInt32: 4 value: self.iStartTime];
    if (self.sTitle != nil)
    {
        [ostream writeString: 5 value: self.sTitle];
    }
    [ostream writeInt32: 6 value: (int32_t)self.eDeviceType];
    if (self.sDescription != nil)
    {
        [ostream writeString: 7 value: self.sDescription];
    }
    [ostream writeInt32: 9 value: self.iNotifyEffect];
    if (self.stControl != nil)
    {
        [ostream writeMessage: 10 value: self.stControl];
    }
    [ostream writeInt32: 11 value: self.iClassID];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PushData *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtData = [istream readBytes: 0 required: true];
    self.stPushType = (PushType*)[istream readMessage: 1 required: true VAR_TYPE: [PushType class]];
    self.iPushTime = [istream readInt32Def: 2 required: false def: self.iPushTime];
    self.iExpireTime = [istream readInt32Def: 3 required: false def: self.iExpireTime];
    self.iStartTime = [istream readInt32Def: 4 required: false def: self.iStartTime];
    self.sTitle = [istream readStringDef: 5 required: false def: self.sTitle];
    self.eDeviceType = [istream readInt32Def: 6 required: false def: (int32_t)self.eDeviceType];
    self.sDescription = [istream readStringDef: 7 required: false def: self.sDescription];
    self.iNotifyEffect = [istream readInt32Def: 9 required: false def: self.iNotifyEffect];
    self.stControl = (PushControlData*)[istream readMessageDef: 10 required: false def: self.stControl VAR_TYPE: [PushControlData class]];
    self.iClassID = [istream readInt32Def: 11 required: false def: self.iClassID];
    
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
    [JsonRoot append:@"vtData" value : [BaseJSON writeBytes : self.vtData]];
    [JsonRoot append:@"iPushTime" value : [BaseJSON writeInt32 : self.iPushTime]];
    [JsonRoot append:@"iExpireTime" value : [BaseJSON writeInt32 : self.iExpireTime]];
    [JsonRoot append:@"iStartTime" value : [BaseJSON writeInt32 : self.iStartTime]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"eDeviceType" value : [BaseJSON writeInt32 : (int32_t)self.eDeviceType]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"iNotifyEffect" value : [BaseJSON writeInt32 : self.iNotifyEffect]];
    [JsonRoot append:@"stControl" value : [BaseJSON writeMessage : self.stControl]];
    [JsonRoot append:@"iClassID" value : [BaseJSON writeInt32 : self.iClassID]];
    return JsonRoot;
}

- (PushData *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtData = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtData"] required:true def:self.vtData];
    self.iPushTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPushTime"] required:false def:self.iPushTime];
    self.iExpireTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iExpireTime"] required:false def:self.iExpireTime];
    self.iStartTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartTime"] required:false def:self.iStartTime];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.eDeviceType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eDeviceType"] required:false def:(int32_t)self.eDeviceType];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.iNotifyEffect = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNotifyEffect"] required:false def:self.iNotifyEffect];
    self.stControl = [BaseJSON readMessageDef:[RootMap objectForKey:@"stControl"] required:false def:self.stControl VAR_TYPE: [PushControlData class]];
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
@implementation PushReq
- (id) init
{
    if (self = [super init])
    {
        self.ePushIdType = E_PUSH_ACCOUNT_ID;
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.stPushData = [[PushData alloc] init];
        self.eFreqControlType = E_FCT_TYPE_CONTROL;
        self.vTags = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.ePushIdType];
    if (self.vtId != nil)
    {
        [ostream writeList: 1 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.stPushData != nil)
    {
        [ostream writeMessage: 2 value: self.stPushData];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eFreqControlType];
    if (self.vTags != nil)
    {
        [ostream writeList: 4 value: self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PushReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.ePushIdType = [istream readInt32Def: 0 required: false def: (int32_t)self.ePushIdType];
    self.vtId = [istream readListDef: 1 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.stPushData = (PushData*)[istream readMessageDef: 2 required: false def: self.stPushData VAR_TYPE: [PushData class]];
    self.eFreqControlType = [istream readInt32Def: 3 required: false def: (int32_t)self.eFreqControlType];
    self.vTags = [istream readListDef: 4 required: false def: self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"ePushIdType" value : [BaseJSON writeInt32 : (int32_t)self.ePushIdType]];
    [JsonRoot append:@"vtId" value : [BaseJSON writeList : self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"stPushData" value : [BaseJSON writeMessage : self.stPushData]];
    [JsonRoot append:@"eFreqControlType" value : [BaseJSON writeInt32 : (int32_t)self.eFreqControlType]];
    [JsonRoot append:@"vTags" value : [BaseJSON writeList : self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (PushReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.ePushIdType = [BaseJSON readInt32Def:[RootMap objectForKey:@"ePushIdType"] required:false def:(int32_t)self.ePushIdType];
    self.vtId = [BaseJSON readListDef:[RootMap objectForKey:@"vtId"] required:false def:self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.stPushData = [BaseJSON readMessageDef:[RootMap objectForKey:@"stPushData"] required:false def:self.stPushData VAR_TYPE: [PushData class]];
    self.eFreqControlType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFreqControlType"] required:false def:(int32_t)self.eFreqControlType];
    self.vTags = [BaseJSON readListDef:[RootMap objectForKey:@"vTags"] required:false def:self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PushRsp
- (id) init
{
    if (self = [super init])
    {
        self.mpPushResult = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mpPushResult != nil)
    {
        [ostream writeMap: 0 value: self.mpPushResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PushRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mpPushResult = [istream readMapDef: 0 required: false def: self.mpPushResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    
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
    [JsonRoot append:@"mpPushResult" value : [BaseJSON writeMap : self.mpPushResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (PushRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mpPushResult = [BaseJSON readMapDef:[RootMap objectForKey:@"mpPushResult"] required:false def:self.mpPushResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation BroadcastPushReq
- (id) init
{
    if (self = [super init])
    {
        self.stPushData = [[PushData alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stPushData != nil)
    {
        [ostream writeMessage: 0 value: self.stPushData];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BroadcastPushReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stPushData = (PushData*)[istream readMessageDef: 0 required: false def: self.stPushData VAR_TYPE: [PushData class]];
    
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
    [JsonRoot append:@"stPushData" value : [BaseJSON writeMessage : self.stPushData]];
    return JsonRoot;
}

- (BroadcastPushReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stPushData = [BaseJSON readMessageDef:[RootMap objectForKey:@"stPushData"] required:false def:self.stPushData VAR_TYPE: [PushData class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation BroadcastPushRsp
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

- (BroadcastPushRsp *) read: (BaseDecodeStream *)istream
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

- (BroadcastPushRsp *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GroupcastPushReq
- (id) init
{
    if (self = [super init])
    {
        self.stPushData = [[PushData alloc] init];
        self.vTags = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stPushData != nil)
    {
        [ostream writeMessage: 0 value: self.stPushData];
    }
    if (self.vTags != nil)
    {
        [ostream writeList: 1 value: self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GroupcastPushReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stPushData = (PushData*)[istream readMessageDef: 0 required: false def: self.stPushData VAR_TYPE: [PushData class]];
    self.vTags = [istream readListDef: 1 required: false def: self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"stPushData" value : [BaseJSON writeMessage : self.stPushData]];
    [JsonRoot append:@"vTags" value : [BaseJSON writeList : self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GroupcastPushReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stPushData = [BaseJSON readMessageDef:[RootMap objectForKey:@"stPushData"] required:false def:self.stPushData VAR_TYPE: [PushData class]];
    self.vTags = [BaseJSON readListDef:[RootMap objectForKey:@"vTags"] required:false def:self.vTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GroupcastPushRsp
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

- (GroupcastPushRsp *) read: (BaseDecodeStream *)istream
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

- (GroupcastPushRsp *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation QuickPushReq
- (id) init
{
    if (self = [super init])
    {
        self.iId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QuickPushReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iId = [istream readInt32Def: 0 required: false def: self.iId];
    
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
    [JsonRoot append:@"iId" value : [BaseJSON writeInt32 : self.iId]];
    return JsonRoot;
}

- (QuickPushReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iId = [BaseJSON readInt32Def:[RootMap objectForKey:@"iId"] required:false def:self.iId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

