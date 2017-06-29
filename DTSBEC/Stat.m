#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Stat.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation BeaconStatData
- (id) init
{
    if (self = [super init])
    {
        self.iTime = 0;
        self.eType = E_BST_PUSH;
        self.sData = @"";
        self.mNumberData = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.eFunc = LOG_STAT;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iTime];
    [ostream writeInt32: 1 value: (int32_t)self.eType];
    if (self.sData != nil)
    {
        [ostream writeString: 2 value: self.sData];
    }
    if (self.mNumberData != nil)
    {
        [ostream writeMap: 3 value: self.mNumberData VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    }
    [ostream writeInt32: 4 value: (int32_t)self.eFunc];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BeaconStatData *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTime = [istream readUInt32Def: 0 required: false def: self.iTime];
    self.eType = [istream readInt32Def: 1 required: false def: (int32_t)self.eType];
    self.sData = [istream readStringDef: 2 required: false def: self.sData];
    self.mNumberData = [istream readMapDef: 3 required: false def: self.mNumberData VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    self.eFunc = [istream readInt32Def: 4 required: false def: (int32_t)self.eFunc];
    
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
    [JsonRoot append:@"iTime" value : [BaseJSON writeUInt32 : self.iTime]];
    [JsonRoot append:@"eType" value : [BaseJSON writeInt32 : (int32_t)self.eType]];
    [JsonRoot append:@"sData" value : [BaseJSON writeString : self.sData]];
    [JsonRoot append:@"mNumberData" value : [BaseJSON writeMap : self.mNumberData VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]]];
    [JsonRoot append:@"eFunc" value : [BaseJSON writeInt32 : (int32_t)self.eFunc]];
    return JsonRoot;
}

- (BeaconStatData *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iTime = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    self.eType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eType"] required:false def:(int32_t)self.eType];
    self.sData = [BaseJSON readStringDef:[RootMap objectForKey:@"sData"] required:false def:self.sData];
    self.mNumberData = [BaseJSON readMapDef:[RootMap objectForKey:@"mNumberData"] required:false def:self.mNumberData VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    self.eFunc = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFunc"] required:false def:(int32_t)self.eFunc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation BeaconStat
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vBeaconStatData = [NSMutableArray arrayWithCapacity:0];
        self.cVersion = 1;
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
    if (self.vBeaconStatData != nil)
    {
        [ostream writeList: 1 value: self.vBeaconStatData VAR_TYPE: [THOTH_LIST CREATE: [BeaconStatData class]]];
    }
    [ostream writeInt8: 2 value: self.cVersion];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BeaconStat *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vBeaconStatData = [istream readListDef: 1 required: false def: self.vBeaconStatData VAR_TYPE: [THOTH_LIST CREATE: [BeaconStatData class]]];
    self.cVersion = [istream readInt8Def: 2 required: false def: self.cVersion];
    
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
    [JsonRoot append:@"vBeaconStatData" value : [BaseJSON writeList : self.vBeaconStatData VAR_TYPE: [THOTH_LIST CREATE: [BeaconStatData class]]]];
    [JsonRoot append:@"cVersion" value : [BaseJSON writeInt8 : self.cVersion]];
    return JsonRoot;
}

- (BeaconStat *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vBeaconStatData = [BaseJSON readListDef:[RootMap objectForKey:@"vBeaconStatData"] required:false def:self.vBeaconStatData VAR_TYPE: [THOTH_LIST CREATE: [BeaconStatData class]]];
    self.cVersion = [BaseJSON readInt8Def:[RootMap objectForKey:@"cVersion"] required:false def:self.cVersion];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FeedBackReq
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
        self.sGuid = @"";
        self.sUA = @"";
        self.sMsg = @"";
        self.sContact = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iAccountId];
    if (self.sGuid != nil)
    {
        [ostream writeString: 1 value: self.sGuid];
    }
    if (self.sUA != nil)
    {
        [ostream writeString: 2 value: self.sUA];
    }
    if (self.sMsg != nil)
    {
        [ostream writeString: 3 value: self.sMsg];
    }
    if (self.sContact != nil)
    {
        [ostream writeString: 4 value: self.sContact];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FeedBackReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readInt32Def: 0 required: false def: self.iAccountId];
    self.sGuid = [istream readStringDef: 1 required: false def: self.sGuid];
    self.sUA = [istream readStringDef: 2 required: false def: self.sUA];
    self.sMsg = [istream readStringDef: 3 required: false def: self.sMsg];
    self.sContact = [istream readStringDef: 4 required: false def: self.sContact];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeInt32 : self.iAccountId]];
    [JsonRoot append:@"sGuid" value : [BaseJSON writeString : self.sGuid]];
    [JsonRoot append:@"sUA" value : [BaseJSON writeString : self.sUA]];
    [JsonRoot append:@"sMsg" value : [BaseJSON writeString : self.sMsg]];
    [JsonRoot append:@"sContact" value : [BaseJSON writeString : self.sContact]];
    return JsonRoot;
}

- (FeedBackReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iAccountId = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.sGuid = [BaseJSON readStringDef:[RootMap objectForKey:@"sGuid"] required:false def:self.sGuid];
    self.sUA = [BaseJSON readStringDef:[RootMap objectForKey:@"sUA"] required:false def:self.sUA];
    self.sMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsg"] required:false def:self.sMsg];
    self.sContact = [BaseJSON readStringDef:[RootMap objectForKey:@"sContact"] required:false def:self.sContact];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

