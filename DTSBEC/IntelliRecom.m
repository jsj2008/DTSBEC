#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "IntelliRecom.h"
#import "Beacon.h"
#import "NewsInfo.h"

//////////////////////////////////////////////////////////////
@implementation RecomItem
- (id) init
{
    if (self = [super init])
    {
        self.eRecomType = E_RT_NEWS;
        self.sKey = @"";
        self.vData = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eRecomType];
    if (self.sKey != nil)
    {
        [ostream writeString: 1 value: self.sKey];
    }
    if (self.vData != nil)
    {
        [ostream writeBytes: 2 value: self.vData];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RecomItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eRecomType = [istream readInt32Def: 0 required: false def: (int32_t)self.eRecomType];
    self.sKey = [istream readStringDef: 1 required: false def: self.sKey];
    self.vData = [istream readBytesDef: 2 required: false def: self.vData];
    
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
    [JsonRoot append:@"eRecomType" value : [BaseJSON writeInt32 : (int32_t)self.eRecomType]];
    [JsonRoot append:@"sKey" value : [BaseJSON writeString : self.sKey]];
    [JsonRoot append:@"vData" value : [BaseJSON writeBytes : self.vData]];
    return JsonRoot;
}

- (RecomItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eRecomType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eRecomType"] required:false def:(int32_t)self.eRecomType];
    self.sKey = [BaseJSON readStringDef:[RootMap objectForKey:@"sKey"] required:false def:self.sKey];
    self.vData = [BaseJSON readBytesDef:[RootMap objectForKey:@"vData"] required:false def:self.vData];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportReadReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stRecomItem = [[RecomItem alloc] init];
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
    if (self.stRecomItem != nil)
    {
        [ostream writeMessage: 1 value: self.stRecomItem];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportReadReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stRecomItem = (RecomItem*)[istream readMessageDef: 1 required: false def: self.stRecomItem VAR_TYPE: [RecomItem class]];
    
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
    [JsonRoot append:@"stRecomItem" value : [BaseJSON writeMessage : self.stRecomItem]];
    return JsonRoot;
}

- (ReportReadReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stRecomItem = [BaseJSON readMessageDef:[RootMap objectForKey:@"stRecomItem"] required:false def:self.stRecomItem VAR_TYPE: [RecomItem class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RecomListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iCount = 0;
        self.vKeys = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeInt32: 1 value: self.iCount];
    if (self.vKeys != nil)
    {
        [ostream writeList: 2 value: self.vKeys VAR_TYPE: [THOTH_LIST CREATE: [RecomItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RecomListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iCount = [istream readInt32Def: 1 required: false def: self.iCount];
    self.vKeys = [istream readListDef: 2 required: false def: self.vKeys VAR_TYPE: [THOTH_LIST CREATE: [RecomItem class]]];
    
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
    [JsonRoot append:@"iCount" value : [BaseJSON writeInt32 : self.iCount]];
    [JsonRoot append:@"vKeys" value : [BaseJSON writeList : self.vKeys VAR_TYPE: [THOTH_LIST CREATE: [RecomItem class]]]];
    return JsonRoot;
}

- (RecomListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCount"] required:false def:self.iCount];
    self.vKeys = [BaseJSON readListDef:[RootMap objectForKey:@"vKeys"] required:false def:self.vKeys VAR_TYPE: [THOTH_LIST CREATE: [RecomItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RecomListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vRecomItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vRecomItem != nil)
    {
        [ostream writeList: 0 value: self.vRecomItem VAR_TYPE: [THOTH_LIST CREATE: [RecomItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RecomListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vRecomItem = [istream readListDef: 0 required: false def: self.vRecomItem VAR_TYPE: [THOTH_LIST CREATE: [RecomItem class]]];
    
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
    [JsonRoot append:@"vRecomItem" value : [BaseJSON writeList : self.vRecomItem VAR_TYPE: [THOTH_LIST CREATE: [RecomItem class]]]];
    return JsonRoot;
}

- (RecomListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vRecomItem = [BaseJSON readListDef:[RootMap objectForKey:@"vRecomItem"] required:false def:self.vRecomItem VAR_TYPE: [THOTH_LIST CREATE: [RecomItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

