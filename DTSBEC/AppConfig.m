#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "AppConfig.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation GenGuidReq
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

- (GenGuidReq *) read: (BaseDecodeStream *)istream
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

- (GenGuidReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GenGuidRsp
- (id) init
{
    if (self = [super init])
    {
        self.vGuid = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vGuid != nil)
    {
        [ostream writeBytes: 0 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GenGuidRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vGuid = [istream readBytesDef: 0 required: false def: self.vGuid];
    
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
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (GenGuidRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vGuid = [BaseJSON readBytesDef:[RootMap objectForKey:@"vGuid"] required:false def:self.vGuid];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IpInfo
- (id) init
{
    if (self = [super init])
    {
        self.eIPType = E_THOTH_PROXY;
        self.vtIPList = [NSMutableArray arrayWithCapacity:0];
        self.eApnType = E_APN_UNKNOWN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eIPType];
    if (self.vtIPList != nil)
    {
        [ostream writeList: 1 value: self.vtIPList VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eApnType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IpInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eIPType = [istream readInt32Def: 0 required: false def: (int32_t)self.eIPType];
    self.vtIPList = [istream readListDef: 1 required: false def: self.vtIPList VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.eApnType = [istream readInt32Def: 2 required: false def: (int32_t)self.eApnType];
    
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
    [JsonRoot append:@"eIPType" value : [BaseJSON writeInt32 : (int32_t)self.eIPType]];
    [JsonRoot append:@"vtIPList" value : [BaseJSON writeList : self.vtIPList VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"eApnType" value : [BaseJSON writeInt32 : (int32_t)self.eApnType]];
    return JsonRoot;
}

- (IpInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eIPType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eIPType"] required:false def:(int32_t)self.eIPType];
    self.vtIPList = [BaseJSON readListDef:[RootMap objectForKey:@"vtIPList"] required:false def:self.vtIPList VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.eApnType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eApnType"] required:false def:(int32_t)self.eApnType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IpListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vtIPType = [NSMutableArray arrayWithCapacity:0];
        self.eApnType = E_APN_UNKNOWN;
        self.sApn = @"";
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
    if (self.vtIPType != nil)
    {
        [ostream writeList: 1 value: self.vtIPType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eApnType];
    if (self.sApn != nil)
    {
        [ostream writeString: 3 value: self.sApn];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IpListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vtIPType = [istream readListDef: 1 required: false def: self.vtIPType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    self.eApnType = [istream readInt32Def: 2 required: false def: (int32_t)self.eApnType];
    self.sApn = [istream readStringDef: 3 required: false def: self.sApn];
    
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
    [JsonRoot append:@"vtIPType" value : [BaseJSON writeList : self.vtIPType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]]];
    [JsonRoot append:@"eApnType" value : [BaseJSON writeInt32 : (int32_t)self.eApnType]];
    [JsonRoot append:@"sApn" value : [BaseJSON writeString : self.sApn]];
    return JsonRoot;
}

- (IpListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vtIPType = [BaseJSON readListDef:[RootMap objectForKey:@"vtIPType"] required:false def:self.vtIPType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    self.eApnType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eApnType"] required:false def:(int32_t)self.eApnType];
    self.sApn = [BaseJSON readStringDef:[RootMap objectForKey:@"sApn"] required:false def:self.sApn];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IpListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtIpInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtIpInfo != nil)
    {
        [ostream writeList: 0 value: self.vtIpInfo VAR_TYPE: [THOTH_LIST CREATE: [IpInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IpListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtIpInfo = [istream readListDef: 0 required: false def: self.vtIpInfo VAR_TYPE: [THOTH_LIST CREATE: [IpInfo class]]];
    
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
    [JsonRoot append:@"vtIpInfo" value : [BaseJSON writeList : self.vtIpInfo VAR_TYPE: [THOTH_LIST CREATE: [IpInfo class]]]];
    return JsonRoot;
}

- (IpListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtIpInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtIpInfo"] required:false def:self.vtIpInfo VAR_TYPE: [THOTH_LIST CREATE: [IpInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ShareUrlReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.vtShareType = [NSMutableArray arrayWithCapacity:0];
        self.sSecName = @"";
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
    if (self.vtShareType != nil)
    {
        [ostream writeList: 2 value: self.vtShareType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    }
    if (self.sSecName != nil)
    {
        [ostream writeString: 3 value: self.sSecName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ShareUrlReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.vtShareType = [istream readListDef: 2 required: false def: self.vtShareType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    self.sSecName = [istream readStringDef: 3 required: false def: self.sSecName];
    
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
    [JsonRoot append:@"vtShareType" value : [BaseJSON writeList : self.vtShareType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]]];
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    return JsonRoot;
}

- (ShareUrlReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.vtShareType = [BaseJSON readListDef:[RootMap objectForKey:@"vtShareType"] required:false def:self.vtShareType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
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
@implementation ShareUrl
- (id) init
{
    if (self = [super init])
    {
        self.eShareType = E_STOCK_DETAIL;
        self.sUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eShareType];
    if (self.sUrl != nil)
    {
        [ostream writeString: 1 value: self.sUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ShareUrl *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eShareType = [istream readInt32Def: 0 required: false def: (int32_t)self.eShareType];
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
    [JsonRoot append:@"eShareType" value : [BaseJSON writeInt32 : (int32_t)self.eShareType]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    return JsonRoot;
}

- (ShareUrl *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eShareType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eShareType"] required:false def:(int32_t)self.eShareType];
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
@implementation ShareUrlRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtShareUrl = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtShareUrl != nil)
    {
        [ostream writeList: 0 value: self.vtShareUrl VAR_TYPE: [THOTH_LIST CREATE: [ShareUrl class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ShareUrlRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtShareUrl = [istream readListDef: 0 required: false def: self.vtShareUrl VAR_TYPE: [THOTH_LIST CREATE: [ShareUrl class]]];
    
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
    [JsonRoot append:@"vtShareUrl" value : [BaseJSON writeList : self.vtShareUrl VAR_TYPE: [THOTH_LIST CREATE: [ShareUrl class]]]];
    return JsonRoot;
}

- (ShareUrlRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtShareUrl = [BaseJSON readListDef:[RootMap objectForKey:@"vtShareUrl"] required:false def:self.vtShareUrl VAR_TYPE: [THOTH_LIST CREATE: [ShareUrl class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SplashScreenReq
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

- (SplashScreenReq *) read: (BaseDecodeStream *)istream
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

- (SplashScreenReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation SplashScreenRsp
- (id) init
{
    if (self = [super init])
    {
        self.sUrl = @"";
        self.sUpdateTime = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sUrl != nil)
    {
        [ostream writeString: 0 value: self.sUrl];
    }
    if (self.sUpdateTime != nil)
    {
        [ostream writeString: 1 value: self.sUpdateTime];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SplashScreenRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sUrl = [istream readStringDef: 0 required: false def: self.sUrl];
    self.sUpdateTime = [istream readStringDef: 1 required: false def: self.sUpdateTime];
    
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
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"sUpdateTime" value : [BaseJSON writeString : self.sUpdateTime]];
    return JsonRoot;
}

- (SplashScreenRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.sUpdateTime = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpdateTime"] required:false def:self.sUpdateTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IndexDetail
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

- (IndexDetail *) read: (BaseDecodeStream *)istream
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

- (IndexDetail *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation IndexListInfo
- (id) init
{
    if (self = [super init])
    {
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vDtSecCode != nil)
    {
        [ostream writeList: 0 value: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [IndexDetail class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IndexListInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDtSecCode = [istream readListDef: 0 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [IndexDetail class]]];
    
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
    [JsonRoot append:@"vDtSecCode" value : [BaseJSON writeList : self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [IndexDetail class]]]];
    return JsonRoot;
}

- (IndexListInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vDtSecCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtSecCode"] required:false def:self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [IndexDetail class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CommentSwitchInfo
- (id) init
{
    if (self = [super init])
    {
        self.iSwitchOn = 0;
        self.iFirstStartInterval = 0;
        self.iLaterStartInterval = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iSwitchOn];
    [ostream writeInt32: 1 value: self.iFirstStartInterval];
    [ostream writeInt32: 2 value: self.iLaterStartInterval];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommentSwitchInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iSwitchOn = [istream readInt32Def: 0 required: false def: self.iSwitchOn];
    self.iFirstStartInterval = [istream readInt32Def: 1 required: false def: self.iFirstStartInterval];
    self.iLaterStartInterval = [istream readInt32Def: 2 required: false def: self.iLaterStartInterval];
    
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
    [JsonRoot append:@"iSwitchOn" value : [BaseJSON writeInt32 : self.iSwitchOn]];
    [JsonRoot append:@"iFirstStartInterval" value : [BaseJSON writeInt32 : self.iFirstStartInterval]];
    [JsonRoot append:@"iLaterStartInterval" value : [BaseJSON writeInt32 : self.iLaterStartInterval]];
    return JsonRoot;
}

- (CommentSwitchInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iSwitchOn = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSwitchOn"] required:false def:self.iSwitchOn];
    self.iFirstStartInterval = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFirstStartInterval"] required:false def:self.iFirstStartInterval];
    self.iLaterStartInterval = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLaterStartInterval"] required:false def:self.iLaterStartInterval];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SplashScreenInfo
- (id) init
{
    if (self = [super init])
    {
        self.sUrl = @"";
        self.iEffectiveStartTime = 0;
        self.iEffectiveEndTime = 0;
        self.iAttr = 0;
        self.iPriority = 0;
        self.sID = @"";
        self.sSkipUrl = @"";
        self.iSkip = 0;
        self.iStaySecond = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sUrl != nil)
    {
        [ostream writeString: 0 value: self.sUrl];
    }
    [ostream writeInt32: 1 value: self.iEffectiveStartTime];
    [ostream writeInt32: 2 value: self.iEffectiveEndTime];
    [ostream writeInt32: 3 value: self.iAttr];
    [ostream writeInt32: 4 value: self.iPriority];
    if (self.sID != nil)
    {
        [ostream writeString: 5 value: self.sID];
    }
    if (self.sSkipUrl != nil)
    {
        [ostream writeString: 6 value: self.sSkipUrl];
    }
    [ostream writeInt32: 7 value: self.iSkip];
    [ostream writeInt32: 8 value: self.iStaySecond];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SplashScreenInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sUrl = [istream readStringDef: 0 required: false def: self.sUrl];
    self.iEffectiveStartTime = [istream readInt32Def: 1 required: false def: self.iEffectiveStartTime];
    self.iEffectiveEndTime = [istream readInt32Def: 2 required: false def: self.iEffectiveEndTime];
    self.iAttr = [istream readInt32Def: 3 required: false def: self.iAttr];
    self.iPriority = [istream readInt32Def: 4 required: false def: self.iPriority];
    self.sID = [istream readStringDef: 5 required: false def: self.sID];
    self.sSkipUrl = [istream readStringDef: 6 required: false def: self.sSkipUrl];
    self.iSkip = [istream readInt32Def: 7 required: false def: self.iSkip];
    self.iStaySecond = [istream readInt32Def: 8 required: false def: self.iStaySecond];
    
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
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"iEffectiveStartTime" value : [BaseJSON writeInt32 : self.iEffectiveStartTime]];
    [JsonRoot append:@"iEffectiveEndTime" value : [BaseJSON writeInt32 : self.iEffectiveEndTime]];
    [JsonRoot append:@"iAttr" value : [BaseJSON writeInt32 : self.iAttr]];
    [JsonRoot append:@"iPriority" value : [BaseJSON writeInt32 : self.iPriority]];
    [JsonRoot append:@"sID" value : [BaseJSON writeString : self.sID]];
    [JsonRoot append:@"sSkipUrl" value : [BaseJSON writeString : self.sSkipUrl]];
    [JsonRoot append:@"iSkip" value : [BaseJSON writeInt32 : self.iSkip]];
    [JsonRoot append:@"iStaySecond" value : [BaseJSON writeInt32 : self.iStaySecond]];
    return JsonRoot;
}

- (SplashScreenInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.iEffectiveStartTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEffectiveStartTime"] required:false def:self.iEffectiveStartTime];
    self.iEffectiveEndTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEffectiveEndTime"] required:false def:self.iEffectiveEndTime];
    self.iAttr = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAttr"] required:false def:self.iAttr];
    self.iPriority = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPriority"] required:false def:self.iPriority];
    self.sID = [BaseJSON readStringDef:[RootMap objectForKey:@"sID"] required:false def:self.sID];
    self.sSkipUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sSkipUrl"] required:false def:self.sSkipUrl];
    self.iSkip = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSkip"] required:false def:self.iSkip];
    self.iStaySecond = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStaySecond"] required:false def:self.iStaySecond];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SplashScreenList
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [SplashScreenInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SplashScreenList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [SplashScreenInfo class]]];
    
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
    [JsonRoot append:@"vList" value : [BaseJSON writeList : self.vList VAR_TYPE: [THOTH_LIST CREATE: [SplashScreenInfo class]]]];
    return JsonRoot;
}

- (SplashScreenList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vList = [BaseJSON readListDef:[RootMap objectForKey:@"vList"] required:false def:self.vList VAR_TYPE: [THOTH_LIST CREATE: [SplashScreenInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PushSwitchInfo
- (id) init
{
    if (self = [super init])
    {
        self.iSwitchType = 0;
        self.iSwitchState = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iSwitchType];
    [ostream writeInt32: 1 value: self.iSwitchState];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PushSwitchInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iSwitchType = [istream readInt32Def: 0 required: false def: self.iSwitchType];
    self.iSwitchState = [istream readInt32Def: 1 required: false def: self.iSwitchState];
    
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
    [JsonRoot append:@"iSwitchType" value : [BaseJSON writeInt32 : self.iSwitchType]];
    [JsonRoot append:@"iSwitchState" value : [BaseJSON writeInt32 : self.iSwitchState]];
    return JsonRoot;
}

- (PushSwitchInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iSwitchType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSwitchType"] required:false def:self.iSwitchType];
    self.iSwitchState = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSwitchState"] required:false def:self.iSwitchState];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PushSwitchList
- (id) init
{
    if (self = [super init])
    {
        self.vSwitchList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSwitchList != nil)
    {
        [ostream writeList: 0 value: self.vSwitchList VAR_TYPE: [THOTH_LIST CREATE: [PushSwitchInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PushSwitchList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSwitchList = [istream readListDef: 0 required: false def: self.vSwitchList VAR_TYPE: [THOTH_LIST CREATE: [PushSwitchInfo class]]];
    
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
    [JsonRoot append:@"vSwitchList" value : [BaseJSON writeList : self.vSwitchList VAR_TYPE: [THOTH_LIST CREATE: [PushSwitchInfo class]]]];
    return JsonRoot;
}

- (PushSwitchList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vSwitchList = [BaseJSON readListDef:[RootMap objectForKey:@"vSwitchList"] required:false def:self.vSwitchList VAR_TYPE: [THOTH_LIST CREATE: [PushSwitchInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DtActivityInfo
- (id) init
{
    if (self = [super init])
    {
        self.iVersion = 0;
        self.sMsg = @"";
        self.iForceRedDot = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iVersion];
    if (self.sMsg != nil)
    {
        [ostream writeString: 1 value: self.sMsg];
    }
    [ostream writeInt32: 2 value: self.iForceRedDot];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtActivityInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iVersion = [istream readInt32Def: 0 required: false def: self.iVersion];
    self.sMsg = [istream readStringDef: 1 required: false def: self.sMsg];
    self.iForceRedDot = [istream readInt32Def: 2 required: false def: self.iForceRedDot];
    
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
    [JsonRoot append:@"iVersion" value : [BaseJSON writeInt32 : self.iVersion]];
    [JsonRoot append:@"sMsg" value : [BaseJSON writeString : self.sMsg]];
    [JsonRoot append:@"iForceRedDot" value : [BaseJSON writeInt32 : self.iForceRedDot]];
    return JsonRoot;
}

- (DtActivityInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iVersion = [BaseJSON readInt32Def:[RootMap objectForKey:@"iVersion"] required:false def:self.iVersion];
    self.sMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sMsg"] required:false def:self.sMsg];
    self.iForceRedDot = [BaseJSON readInt32Def:[RootMap objectForKey:@"iForceRedDot"] required:false def:self.iForceRedDot];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation NewStockInfo
- (id) init
{
    if (self = [super init])
    {
        self.iNumber = 0;
        self.sDay = @"";
        self.iLotResNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iNumber];
    if (self.sDay != nil)
    {
        [ostream writeString: 1 value: self.sDay];
    }
    [ostream writeInt32: 2 value: self.iLotResNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewStockInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iNumber = [istream readInt32Def: 0 required: false def: self.iNumber];
    self.sDay = [istream readStringDef: 1 required: false def: self.sDay];
    self.iLotResNum = [istream readInt32Def: 2 required: false def: self.iLotResNum];
    
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
    [JsonRoot append:@"iNumber" value : [BaseJSON writeInt32 : self.iNumber]];
    [JsonRoot append:@"sDay" value : [BaseJSON writeString : self.sDay]];
    [JsonRoot append:@"iLotResNum" value : [BaseJSON writeInt32 : self.iLotResNum]];
    return JsonRoot;
}

- (NewStockInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumber"] required:false def:self.iNumber];
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.iLotResNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLotResNum"] required:false def:self.iLotResNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ChargePointInfo
- (id) init
{
    if (self = [super init])
    {
        self.iChargePoint = 0;
        self.iSwitch = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iChargePoint];
    [ostream writeInt32: 1 value: self.iSwitch];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ChargePointInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iChargePoint = [istream readInt32Def: 0 required: false def: self.iChargePoint];
    self.iSwitch = [istream readInt32Def: 1 required: false def: self.iSwitch];
    
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
    [JsonRoot append:@"iChargePoint" value : [BaseJSON writeInt32 : self.iChargePoint]];
    [JsonRoot append:@"iSwitch" value : [BaseJSON writeInt32 : self.iSwitch]];
    return JsonRoot;
}

- (ChargePointInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iChargePoint = [BaseJSON readInt32Def:[RootMap objectForKey:@"iChargePoint"] required:false def:self.iChargePoint];
    self.iSwitch = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSwitch"] required:false def:self.iSwitch];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ChargePointList
- (id) init
{
    if (self = [super init])
    {
        self.vChargeList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vChargeList != nil)
    {
        [ostream writeList: 0 value: self.vChargeList VAR_TYPE: [THOTH_LIST CREATE: [ChargePointInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ChargePointList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vChargeList = [istream readListDef: 0 required: false def: self.vChargeList VAR_TYPE: [THOTH_LIST CREATE: [ChargePointInfo class]]];
    
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
    [JsonRoot append:@"vChargeList" value : [BaseJSON writeList : self.vChargeList VAR_TYPE: [THOTH_LIST CREATE: [ChargePointInfo class]]]];
    return JsonRoot;
}

- (ChargePointList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vChargeList = [BaseJSON readListDef:[RootMap objectForKey:@"vChargeList"] required:false def:self.vChargeList VAR_TYPE: [THOTH_LIST CREATE: [ChargePointInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation EnableServiceSwitch
- (id) init
{
    if (self = [super init])
    {
        self.iSwitch = 1;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iSwitch];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (EnableServiceSwitch *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iSwitch = [istream readInt32Def: 0 required: false def: self.iSwitch];
    
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
    [JsonRoot append:@"iSwitch" value : [BaseJSON writeInt32 : self.iSwitch]];
    return JsonRoot;
}

- (EnableServiceSwitch *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iSwitch = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSwitch"] required:false def:self.iSwitch];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DtPriviBannerItem
- (id) init
{
    if (self = [super init])
    {
        self.iPriviType = 0;
        self.sBannerName = @"";
        self.sBannerDesc = @"";
        self.sBannerUrl = @"";
        self.sSkipUrl = @"";
        self.iStaySecond = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iPriviType];
    if (self.sBannerName != nil)
    {
        [ostream writeString: 1 value: self.sBannerName];
    }
    if (self.sBannerDesc != nil)
    {
        [ostream writeString: 2 value: self.sBannerDesc];
    }
    if (self.sBannerUrl != nil)
    {
        [ostream writeString: 3 value: self.sBannerUrl];
    }
    if (self.sSkipUrl != nil)
    {
        [ostream writeString: 4 value: self.sSkipUrl];
    }
    [ostream writeInt32: 5 value: self.iStaySecond];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtPriviBannerItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iPriviType = [istream readInt32Def: 0 required: false def: self.iPriviType];
    self.sBannerName = [istream readStringDef: 1 required: false def: self.sBannerName];
    self.sBannerDesc = [istream readStringDef: 2 required: false def: self.sBannerDesc];
    self.sBannerUrl = [istream readStringDef: 3 required: false def: self.sBannerUrl];
    self.sSkipUrl = [istream readStringDef: 4 required: false def: self.sSkipUrl];
    self.iStaySecond = [istream readInt32Def: 5 required: false def: self.iStaySecond];
    
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
    [JsonRoot append:@"iPriviType" value : [BaseJSON writeInt32 : self.iPriviType]];
    [JsonRoot append:@"sBannerName" value : [BaseJSON writeString : self.sBannerName]];
    [JsonRoot append:@"sBannerDesc" value : [BaseJSON writeString : self.sBannerDesc]];
    [JsonRoot append:@"sBannerUrl" value : [BaseJSON writeString : self.sBannerUrl]];
    [JsonRoot append:@"sSkipUrl" value : [BaseJSON writeString : self.sSkipUrl]];
    [JsonRoot append:@"iStaySecond" value : [BaseJSON writeInt32 : self.iStaySecond]];
    return JsonRoot;
}

- (DtPriviBannerItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iPriviType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPriviType"] required:false def:self.iPriviType];
    self.sBannerName = [BaseJSON readStringDef:[RootMap objectForKey:@"sBannerName"] required:false def:self.sBannerName];
    self.sBannerDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sBannerDesc"] required:false def:self.sBannerDesc];
    self.sBannerUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sBannerUrl"] required:false def:self.sBannerUrl];
    self.sSkipUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sSkipUrl"] required:false def:self.sSkipUrl];
    self.iStaySecond = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStaySecond"] required:false def:self.iStaySecond];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DtPriviBannerList
- (id) init
{
    if (self = [super init])
    {
        self.mBannerItem = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mBannerItem != nil)
    {
        [ostream writeMap: 0 value: self.mBannerItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_LIST CREATE: [DtPriviBannerItem class]]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtPriviBannerList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mBannerItem = [istream readMapDef: 0 required: false def: self.mBannerItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_LIST CREATE: [DtPriviBannerItem class]]]];
    
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
    [JsonRoot append:@"mBannerItem" value : [BaseJSON writeMap : self.mBannerItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_LIST CREATE: [DtPriviBannerItem class]]]]];
    return JsonRoot;
}

- (DtPriviBannerList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mBannerItem = [BaseJSON readMapDef:[RootMap objectForKey:@"mBannerItem"] required:false def:self.mBannerItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_LIST CREATE: [DtPriviBannerItem class]]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DtOpenBlessingPack
- (id) init
{
    if (self = [super init])
    {
        self.sUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sUrl != nil)
    {
        [ostream writeString: 0 value: self.sUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtOpenBlessingPack *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sUrl = [istream readStringDef: 0 required: false def: self.sUrl];
    
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
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    return JsonRoot;
}

- (DtOpenBlessingPack *) readFromMap : (NSMutableDictionary *) RootMap
{
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
@implementation AccuPointDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDesc = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDesc != nil)
    {
        [ostream writeString: 0 value: self.sDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AccuPointDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDesc = [istream readStringDef: 0 required: false def: self.sDesc];
    
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
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    return JsonRoot;
}

- (AccuPointDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetConfigReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vType = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vType != nil)
    {
        [ostream writeList: 1 value: self.vType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetConfigReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vType = [istream readListDef: 1 required: false def: self.vType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    
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
    [JsonRoot append:@"vType" value : [BaseJSON writeList : self.vType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (GetConfigReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vType = [BaseJSON readListDef:[RootMap objectForKey:@"vType"] required:false def:self.vType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConfigDetail
- (id) init
{
    if (self = [super init])
    {
        self.iType = 0;
        self.vData = [NSData data];
        self.iVersion = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iType];
    if (self.vData != nil)
    {
        [ostream writeBytes: 1 value: self.vData];
    }
    [ostream writeInt32: 2 value: self.iVersion];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConfigDetail *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iType = [istream readInt32Def: 0 required: false def: self.iType];
    self.vData = [istream readBytesDef: 1 required: false def: self.vData];
    self.iVersion = [istream readInt32Def: 2 required: false def: self.iVersion];
    
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
    [JsonRoot append:@"vData" value : [BaseJSON writeBytes : self.vData]];
    [JsonRoot append:@"iVersion" value : [BaseJSON writeInt32 : self.iVersion]];
    return JsonRoot;
}

- (ConfigDetail *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    self.vData = [BaseJSON readBytesDef:[RootMap objectForKey:@"vData"] required:false def:self.vData];
    self.iVersion = [BaseJSON readInt32Def:[RootMap objectForKey:@"iVersion"] required:false def:self.iVersion];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetConfigRsp
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [ConfigDetail class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetConfigRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [ConfigDetail class]]];
    
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
    [JsonRoot append:@"vList" value : [BaseJSON writeList : self.vList VAR_TYPE: [THOTH_LIST CREATE: [ConfigDetail class]]]];
    return JsonRoot;
}

- (GetConfigRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vList = [BaseJSON readListDef:[RootMap objectForKey:@"vList"] required:false def:self.vList VAR_TYPE: [THOTH_LIST CREATE: [ConfigDetail class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportUserInfoReq
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

- (ReportUserInfoReq *) read: (BaseDecodeStream *)istream
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

- (ReportUserInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation ReportUserInfoRsp
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

- (ReportUserInfoRsp *) read: (BaseDecodeStream *)istream
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

- (ReportUserInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation TradingDayReq
- (id) init
{
    if (self = [super init])
    {
        self.sDay = @"";
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TradingDayReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDay = [istream readStringDef: 0 required: false def: self.sDay];
    
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
    return JsonRoot;
}

- (TradingDayReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TradingDayRsp
- (id) init
{
    if (self = [super init])
    {
        self.iTradingDay = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTradingDay];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TradingDayRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTradingDay = [istream readInt32Def: 0 required: false def: self.iTradingDay];
    
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
    [JsonRoot append:@"iTradingDay" value : [BaseJSON writeInt32 : self.iTradingDay]];
    return JsonRoot;
}

- (TradingDayRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iTradingDay = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTradingDay"] required:false def:self.iTradingDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetDtSecListReq
- (id) init
{
    if (self = [super init])
    {
        self.sComeFrom = @"changzheng";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sComeFrom != nil)
    {
        [ostream writeString: 0 value: self.sComeFrom];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetDtSecListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sComeFrom = [istream readStringDef: 0 required: false def: self.sComeFrom];
    
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
    [JsonRoot append:@"sComeFrom" value : [BaseJSON writeString : self.sComeFrom]];
    return JsonRoot;
}

- (GetDtSecListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sComeFrom = [BaseJSON readStringDef:[RootMap objectForKey:@"sComeFrom"] required:false def:self.sComeFrom];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetDtSecListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetDtSecListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDtSecCode = [istream readListDef: 0 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    return JsonRoot;
}

- (GetDtSecListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vDtSecCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtSecCode"] required:false def:self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSyncSwitchReq
- (id) init
{
    if (self = [super init])
    {
        self.sComeFrom = @"changzheng";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sComeFrom != nil)
    {
        [ostream writeString: 0 value: self.sComeFrom];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSyncSwitchReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sComeFrom = [istream readStringDef: 0 required: false def: self.sComeFrom];
    
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
    [JsonRoot append:@"sComeFrom" value : [BaseJSON writeString : self.sComeFrom]];
    return JsonRoot;
}

- (GetSyncSwitchReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sComeFrom = [BaseJSON readStringDef:[RootMap objectForKey:@"sComeFrom"] required:false def:self.sComeFrom];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSyncSwitchRsp
- (id) init
{
    if (self = [super init])
    {
        self.iSwitch = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iSwitch];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSyncSwitchRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iSwitch = [istream readInt32Def: 0 required: false def: self.iSwitch];
    
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
    [JsonRoot append:@"iSwitch" value : [BaseJSON writeInt32 : self.iSwitch]];
    return JsonRoot;
}

- (GetSyncSwitchRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iSwitch = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSwitch"] required:false def:self.iSwitch];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

