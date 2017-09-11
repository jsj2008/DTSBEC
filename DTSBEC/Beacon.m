#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation UserInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDUA = @"";
        self.sIMEI = @"";
        self.sDeviceTokens = @"";
        self.sPackageName = @"";
        self.iAccountId = 0;
        self.mpDeviceTokens = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.sTag = @"";
        self.iMember = 0;
        self.bHWTokenStatus = true;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeBytes: 0 value: self.vGUID];
    [ostream writeString: 1 value: self.sDUA];
    if (self.sIMEI != nil)
    {
        [ostream writeString: 2 value: self.sIMEI];
    }
    if (self.sDeviceTokens != nil)
    {
        [ostream writeString: 3 value: self.sDeviceTokens];
    }
    if (self.sPackageName != nil)
    {
        [ostream writeString: 4 value: self.sPackageName];
    }
    [ostream writeUInt32: 5 value: self.iAccountId];
    if (self.mpDeviceTokens != nil)
    {
        [ostream writeMap: 6 value: self.mpDeviceTokens VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    }
    if (self.sTag != nil)
    {
        [ostream writeString: 7 value: self.sTag];
    }
    [ostream writeInt32: 8 value: self.iMember];
    [ostream writeBoolean: 9 value: self.bHWTokenStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UserInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vGUID = [istream readBytes: 0 required: true];
    self.sDUA = [istream readString: 1 required: true];
    self.sIMEI = [istream readStringDef: 2 required: false def: self.sIMEI];
    self.sDeviceTokens = [istream readStringDef: 3 required: false def: self.sDeviceTokens];
    self.sPackageName = [istream readStringDef: 4 required: false def: self.sPackageName];
    self.iAccountId = [istream readUInt32Def: 5 required: false def: self.iAccountId];
    self.mpDeviceTokens = [istream readMapDef: 6 required: false def: self.mpDeviceTokens VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    self.sTag = [istream readStringDef: 7 required: false def: self.sTag];
    self.iMember = [istream readInt32Def: 8 required: false def: self.iMember];
    self.bHWTokenStatus = [istream readBooleanDef: 9 required: false def: self.bHWTokenStatus];
    
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
    [JsonRoot append:@"vGUID" value : [BaseJSON writeBytes : self.vGUID]];
    [JsonRoot append:@"sDUA" value : [BaseJSON writeString : self.sDUA]];
    [JsonRoot append:@"sIMEI" value : [BaseJSON writeString : self.sIMEI]];
    [JsonRoot append:@"sDeviceTokens" value : [BaseJSON writeString : self.sDeviceTokens]];
    [JsonRoot append:@"sPackageName" value : [BaseJSON writeString : self.sPackageName]];
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"mpDeviceTokens" value : [BaseJSON writeMap : self.mpDeviceTokens VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]]];
    [JsonRoot append:@"sTag" value : [BaseJSON writeString : self.sTag]];
    [JsonRoot append:@"iMember" value : [BaseJSON writeInt32 : self.iMember]];
    [JsonRoot append:@"bHWTokenStatus" value : [BaseJSON writeBoolean : self.bHWTokenStatus]];
    return JsonRoot;
}

- (UserInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vGUID = [BaseJSON readBytesDef:[RootMap objectForKey:@"vGUID"] required:true def:self.vGUID];
    self.sDUA = [BaseJSON readStringDef:[RootMap objectForKey:@"sDUA"] required:true def:self.sDUA];
    self.sIMEI = [BaseJSON readStringDef:[RootMap objectForKey:@"sIMEI"] required:false def:self.sIMEI];
    self.sDeviceTokens = [BaseJSON readStringDef:[RootMap objectForKey:@"sDeviceTokens"] required:false def:self.sDeviceTokens];
    self.sPackageName = [BaseJSON readStringDef:[RootMap objectForKey:@"sPackageName"] required:false def:self.sPackageName];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.mpDeviceTokens = [BaseJSON readMapDef:[RootMap objectForKey:@"mpDeviceTokens"] required:false def:self.mpDeviceTokens VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    self.sTag = [BaseJSON readStringDef:[RootMap objectForKey:@"sTag"] required:false def:self.sTag];
    self.iMember = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMember"] required:false def:self.iMember];
    self.bHWTokenStatus = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bHWTokenStatus"] required:false def:self.bHWTokenStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConcInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sCHNShortName = @"";
        self.sConcDesc = @"";
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
    if (self.sCHNShortName != nil)
    {
        [ostream writeString: 1 value: self.sCHNShortName];
    }
    if (self.sConcDesc != nil)
    {
        [ostream writeString: 2 value: self.sConcDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sCHNShortName = [istream readStringDef: 1 required: false def: self.sCHNShortName];
    self.sConcDesc = [istream readStringDef: 2 required: false def: self.sConcDesc];
    
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
    [JsonRoot append:@"sCHNShortName" value : [BaseJSON writeString : self.sCHNShortName]];
    [JsonRoot append:@"sConcDesc" value : [BaseJSON writeString : self.sConcDesc]];
    return JsonRoot;
}

- (ConcInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sCHNShortName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCHNShortName"] required:false def:self.sCHNShortName];
    self.sConcDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sConcDesc"] required:false def:self.sConcDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PlateInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sPlateName = @"";
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
    if (self.sPlateName != nil)
    {
        [ostream writeString: 1 value: self.sPlateName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sPlateName = [istream readStringDef: 1 required: false def: self.sPlateName];
    
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
    [JsonRoot append:@"sPlateName" value : [BaseJSON writeString : self.sPlateName]];
    return JsonRoot;
}

- (PlateInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sPlateName = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateName"] required:false def:self.sPlateName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FundInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sCHNShortName = @"";
        self.sCHNFullName = @"";
        self.sFundDesc = @"";
        self.sFundType = @"";
        self.sFundOrgName = @"";
        self.sInvestType = @"";
        self.sInvestStyle = @"";
        self.sInvestTarget = @"";
        self.sInvestOrient = @"";
        self.sPerformanceBench = @"";
        self.sRiskEarn = @"";
        self.iIsStructFund = 0;
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
    if (self.sCHNShortName != nil)
    {
        [ostream writeString: 1 value: self.sCHNShortName];
    }
    if (self.sCHNFullName != nil)
    {
        [ostream writeString: 2 value: self.sCHNFullName];
    }
    if (self.sFundDesc != nil)
    {
        [ostream writeString: 3 value: self.sFundDesc];
    }
    if (self.sFundType != nil)
    {
        [ostream writeString: 4 value: self.sFundType];
    }
    if (self.sFundOrgName != nil)
    {
        [ostream writeString: 5 value: self.sFundOrgName];
    }
    if (self.sInvestType != nil)
    {
        [ostream writeString: 6 value: self.sInvestType];
    }
    if (self.sInvestStyle != nil)
    {
        [ostream writeString: 7 value: self.sInvestStyle];
    }
    if (self.sInvestTarget != nil)
    {
        [ostream writeString: 8 value: self.sInvestTarget];
    }
    if (self.sInvestOrient != nil)
    {
        [ostream writeString: 9 value: self.sInvestOrient];
    }
    if (self.sPerformanceBench != nil)
    {
        [ostream writeString: 10 value: self.sPerformanceBench];
    }
    if (self.sRiskEarn != nil)
    {
        [ostream writeString: 11 value: self.sRiskEarn];
    }
    [ostream writeInt32: 12 value: self.iIsStructFund];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FundInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sCHNShortName = [istream readStringDef: 1 required: false def: self.sCHNShortName];
    self.sCHNFullName = [istream readStringDef: 2 required: false def: self.sCHNFullName];
    self.sFundDesc = [istream readStringDef: 3 required: false def: self.sFundDesc];
    self.sFundType = [istream readStringDef: 4 required: false def: self.sFundType];
    self.sFundOrgName = [istream readStringDef: 5 required: false def: self.sFundOrgName];
    self.sInvestType = [istream readStringDef: 6 required: false def: self.sInvestType];
    self.sInvestStyle = [istream readStringDef: 7 required: false def: self.sInvestStyle];
    self.sInvestTarget = [istream readStringDef: 8 required: false def: self.sInvestTarget];
    self.sInvestOrient = [istream readStringDef: 9 required: false def: self.sInvestOrient];
    self.sPerformanceBench = [istream readStringDef: 10 required: false def: self.sPerformanceBench];
    self.sRiskEarn = [istream readStringDef: 11 required: false def: self.sRiskEarn];
    self.iIsStructFund = [istream readInt32Def: 12 required: false def: self.iIsStructFund];
    
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
    [JsonRoot append:@"sCHNShortName" value : [BaseJSON writeString : self.sCHNShortName]];
    [JsonRoot append:@"sCHNFullName" value : [BaseJSON writeString : self.sCHNFullName]];
    [JsonRoot append:@"sFundDesc" value : [BaseJSON writeString : self.sFundDesc]];
    [JsonRoot append:@"sFundType" value : [BaseJSON writeString : self.sFundType]];
    [JsonRoot append:@"sFundOrgName" value : [BaseJSON writeString : self.sFundOrgName]];
    [JsonRoot append:@"sInvestType" value : [BaseJSON writeString : self.sInvestType]];
    [JsonRoot append:@"sInvestStyle" value : [BaseJSON writeString : self.sInvestStyle]];
    [JsonRoot append:@"sInvestTarget" value : [BaseJSON writeString : self.sInvestTarget]];
    [JsonRoot append:@"sInvestOrient" value : [BaseJSON writeString : self.sInvestOrient]];
    [JsonRoot append:@"sPerformanceBench" value : [BaseJSON writeString : self.sPerformanceBench]];
    [JsonRoot append:@"sRiskEarn" value : [BaseJSON writeString : self.sRiskEarn]];
    [JsonRoot append:@"iIsStructFund" value : [BaseJSON writeInt32 : self.iIsStructFund]];
    return JsonRoot;
}

- (FundInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sCHNShortName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCHNShortName"] required:false def:self.sCHNShortName];
    self.sCHNFullName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCHNFullName"] required:false def:self.sCHNFullName];
    self.sFundDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sFundDesc"] required:false def:self.sFundDesc];
    self.sFundType = [BaseJSON readStringDef:[RootMap objectForKey:@"sFundType"] required:false def:self.sFundType];
    self.sFundOrgName = [BaseJSON readStringDef:[RootMap objectForKey:@"sFundOrgName"] required:false def:self.sFundOrgName];
    self.sInvestType = [BaseJSON readStringDef:[RootMap objectForKey:@"sInvestType"] required:false def:self.sInvestType];
    self.sInvestStyle = [BaseJSON readStringDef:[RootMap objectForKey:@"sInvestStyle"] required:false def:self.sInvestStyle];
    self.sInvestTarget = [BaseJSON readStringDef:[RootMap objectForKey:@"sInvestTarget"] required:false def:self.sInvestTarget];
    self.sInvestOrient = [BaseJSON readStringDef:[RootMap objectForKey:@"sInvestOrient"] required:false def:self.sInvestOrient];
    self.sPerformanceBench = [BaseJSON readStringDef:[RootMap objectForKey:@"sPerformanceBench"] required:false def:self.sPerformanceBench];
    self.sRiskEarn = [BaseJSON readStringDef:[RootMap objectForKey:@"sRiskEarn"] required:false def:self.sRiskEarn];
    self.iIsStructFund = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIsStructFund"] required:false def:self.iIsStructFund];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecCode
- (id) init
{
    if (self = [super init])
    {
        self.sSecCode = @"";
        self.eMarketType = E_MT_NO;
        self.eSecType = E_ST_UNKNOWN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSecCode != nil)
    {
        [ostream writeString: 0 value: self.sSecCode];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eMarketType];
    [ostream writeInt32: 2 value: (int32_t)self.eSecType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecCode *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecCode = [istream readStringDef: 0 required: false def: self.sSecCode];
    self.eMarketType = [istream readInt32Def: 1 required: false def: (int32_t)self.eMarketType];
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
    [JsonRoot append:@"sSecCode" value : [BaseJSON writeString : self.sSecCode]];
    [JsonRoot append:@"eMarketType" value : [BaseJSON writeInt32 : (int32_t)self.eMarketType]];
    [JsonRoot append:@"eSecType" value : [BaseJSON writeInt32 : (int32_t)self.eSecType]];
    return JsonRoot;
}

- (SecCode *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecCode"] required:false def:self.sSecCode];
    self.eMarketType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eMarketType"] required:false def:(int32_t)self.eMarketType];
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
@implementation SecBaseInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sCHNShortName = @"";
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
    if (self.sCHNShortName != nil)
    {
        [ostream writeString: 1 value: self.sCHNShortName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecBaseInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sCHNShortName = [istream readStringDef: 1 required: false def: self.sCHNShortName];
    
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
    [JsonRoot append:@"sCHNShortName" value : [BaseJSON writeString : self.sCHNShortName]];
    return JsonRoot;
}

- (SecBaseInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sCHNShortName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCHNShortName"] required:false def:self.sCHNShortName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecStatusInfo
- (id) init
{
    if (self = [super init])
    {
        self.iStatus = 0;
        self.sDesc = @"";
        self.sKey = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStatus];
    if (self.sDesc != nil)
    {
        [ostream writeString: 1 value: self.sDesc];
    }
    if (self.sKey != nil)
    {
        [ostream writeString: 2 value: self.sKey];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecStatusInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStatus = [istream readInt32Def: 0 required: false def: self.iStatus];
    self.sDesc = [istream readStringDef: 1 required: false def: self.sDesc];
    self.sKey = [istream readStringDef: 2 required: false def: self.sKey];
    
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
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    [JsonRoot append:@"sKey" value : [BaseJSON writeString : self.sKey]];
    return JsonRoot;
}

- (SecStatusInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.sKey = [BaseJSON readStringDef:[RootMap objectForKey:@"sKey"] required:false def:self.sKey];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecCoordsInfo
- (id) init
{
    if (self = [super init])
    {
        self.sLongitude = @"";
        self.sLatitude = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sLongitude != nil)
    {
        [ostream writeString: 0 value: self.sLongitude];
    }
    if (self.sLatitude != nil)
    {
        [ostream writeString: 1 value: self.sLatitude];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecCoordsInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sLongitude = [istream readStringDef: 0 required: false def: self.sLongitude];
    self.sLatitude = [istream readStringDef: 1 required: false def: self.sLatitude];
    
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
    [JsonRoot append:@"sLongitude" value : [BaseJSON writeString : self.sLongitude]];
    [JsonRoot append:@"sLatitude" value : [BaseJSON writeString : self.sLatitude]];
    return JsonRoot;
}

- (SecCoordsInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sLongitude = [BaseJSON readStringDef:[RootMap objectForKey:@"sLongitude"] required:false def:self.sLongitude];
    self.sLatitude = [BaseJSON readStringDef:[RootMap objectForKey:@"sLatitude"] required:false def:self.sLatitude];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CityInfo
- (id) init
{
    if (self = [super init])
    {
        self.sCityName = @"";
        self.stCoords = [[SecCoordsInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sCityName != nil)
    {
        [ostream writeString: 0 value: self.sCityName];
    }
    if (self.stCoords != nil)
    {
        [ostream writeMessage: 1 value: self.stCoords];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CityInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sCityName = [istream readStringDef: 0 required: false def: self.sCityName];
    self.stCoords = (SecCoordsInfo*)[istream readMessageDef: 1 required: false def: self.stCoords VAR_TYPE: [SecCoordsInfo class]];
    
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
    [JsonRoot append:@"sCityName" value : [BaseJSON writeString : self.sCityName]];
    [JsonRoot append:@"stCoords" value : [BaseJSON writeMessage : self.stCoords]];
    return JsonRoot;
}

- (CityInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sCityName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCityName"] required:false def:self.sCityName];
    self.stCoords = [BaseJSON readMessageDef:[RootMap objectForKey:@"stCoords"] required:false def:self.stCoords VAR_TYPE: [SecCoordsInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sCHNShortName = @"";
        self.stPlateInfo = [[PlateInfo alloc] init];
        self.vConcInfo = [NSMutableArray arrayWithCapacity:0];
        self.mSecAttr = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.vRelateSecInfo = [NSMutableArray arrayWithCapacity:0];
        self.vStatusInfo = [NSMutableArray arrayWithCapacity:0];
        self.vPlateInfo = [NSMutableArray arrayWithCapacity:0];
        self.stSecCoordsInfo = [[SecCoordsInfo alloc] init];
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
    if (self.sCHNShortName != nil)
    {
        [ostream writeString: 1 value: self.sCHNShortName];
    }
    if (self.stPlateInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stPlateInfo];
    }
    if (self.vConcInfo != nil)
    {
        [ostream writeList: 3 value: self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    }
    if (self.mSecAttr != nil)
    {
        [ostream writeMap: 4 value: self.mSecAttr VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    }
    if (self.vRelateSecInfo != nil)
    {
        [ostream writeList: 5 value: self.vRelateSecInfo VAR_TYPE: [THOTH_LIST CREATE: [SecBaseInfo class]]];
    }
    if (self.vStatusInfo != nil)
    {
        [ostream writeList: 6 value: self.vStatusInfo VAR_TYPE: [THOTH_LIST CREATE: [SecStatusInfo class]]];
    }
    if (self.vPlateInfo != nil)
    {
        [ostream writeList: 7 value: self.vPlateInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]];
    }
    if (self.stSecCoordsInfo != nil)
    {
        [ostream writeMessage: 8 value: self.stSecCoordsInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sCHNShortName = [istream readStringDef: 1 required: false def: self.sCHNShortName];
    self.stPlateInfo = (PlateInfo*)[istream readMessageDef: 2 required: false def: self.stPlateInfo VAR_TYPE: [PlateInfo class]];
    self.vConcInfo = [istream readListDef: 3 required: false def: self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    self.mSecAttr = [istream readMapDef: 4 required: false def: self.mSecAttr VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    self.vRelateSecInfo = [istream readListDef: 5 required: false def: self.vRelateSecInfo VAR_TYPE: [THOTH_LIST CREATE: [SecBaseInfo class]]];
    self.vStatusInfo = [istream readListDef: 6 required: false def: self.vStatusInfo VAR_TYPE: [THOTH_LIST CREATE: [SecStatusInfo class]]];
    self.vPlateInfo = [istream readListDef: 7 required: false def: self.vPlateInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]];
    self.stSecCoordsInfo = (SecCoordsInfo*)[istream readMessageDef: 8 required: false def: self.stSecCoordsInfo VAR_TYPE: [SecCoordsInfo class]];
    
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
    [JsonRoot append:@"sCHNShortName" value : [BaseJSON writeString : self.sCHNShortName]];
    [JsonRoot append:@"stPlateInfo" value : [BaseJSON writeMessage : self.stPlateInfo]];
    [JsonRoot append:@"vConcInfo" value : [BaseJSON writeList : self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]]];
    [JsonRoot append:@"mSecAttr" value : [BaseJSON writeMap : self.mSecAttr VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]]];
    [JsonRoot append:@"vRelateSecInfo" value : [BaseJSON writeList : self.vRelateSecInfo VAR_TYPE: [THOTH_LIST CREATE: [SecBaseInfo class]]]];
    [JsonRoot append:@"vStatusInfo" value : [BaseJSON writeList : self.vStatusInfo VAR_TYPE: [THOTH_LIST CREATE: [SecStatusInfo class]]]];
    [JsonRoot append:@"vPlateInfo" value : [BaseJSON writeList : self.vPlateInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]]];
    [JsonRoot append:@"stSecCoordsInfo" value : [BaseJSON writeMessage : self.stSecCoordsInfo]];
    return JsonRoot;
}

- (SecInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sCHNShortName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCHNShortName"] required:false def:self.sCHNShortName];
    self.stPlateInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stPlateInfo"] required:false def:self.stPlateInfo VAR_TYPE: [PlateInfo class]];
    self.vConcInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vConcInfo"] required:false def:self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    self.mSecAttr = [BaseJSON readMapDef:[RootMap objectForKey:@"mSecAttr"] required:false def:self.mSecAttr VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    self.vRelateSecInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vRelateSecInfo"] required:false def:self.vRelateSecInfo VAR_TYPE: [THOTH_LIST CREATE: [SecBaseInfo class]]];
    self.vStatusInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vStatusInfo"] required:false def:self.vStatusInfo VAR_TYPE: [THOTH_LIST CREATE: [SecStatusInfo class]]];
    self.vPlateInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vPlateInfo"] required:false def:self.vPlateInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]];
    self.stSecCoordsInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecCoordsInfo"] required:false def:self.stSecCoordsInfo VAR_TYPE: [SecCoordsInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecAttr
- (id) init
{
    if (self = [super init])
    {
        self.stPlateInfo = [[PlateInfo alloc] init];
        self.mSecAttr = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stPlateInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stPlateInfo];
    }
    if (self.mSecAttr != nil)
    {
        [ostream writeMap: 1 value: self.mSecAttr VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecAttr *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stPlateInfo = (PlateInfo*)[istream readMessageDef: 0 required: false def: self.stPlateInfo VAR_TYPE: [PlateInfo class]];
    self.mSecAttr = [istream readMapDef: 1 required: false def: self.mSecAttr VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"stPlateInfo" value : [BaseJSON writeMessage : self.stPlateInfo]];
    [JsonRoot append:@"mSecAttr" value : [BaseJSON writeMap : self.mSecAttr VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (SecAttr *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stPlateInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stPlateInfo"] required:false def:self.stPlateInfo VAR_TYPE: [PlateInfo class]];
    self.mSecAttr = [BaseJSON readMapDef:[RootMap objectForKey:@"mSecAttr"] required:false def:self.mSecAttr VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecBaseInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vDtSecCode != nil)
    {
        [ostream writeList: 1 value: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecBaseInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtSecCode = [istream readListDef: 1 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"vDtSecCode" value : [BaseJSON writeList : self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (SecBaseInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
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
@implementation SecBaseInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.vSecInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSecInfo != nil)
    {
        [ostream writeList: 0 value: self.vSecInfo VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecBaseInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSecInfo = [istream readListDef: 0 required: false def: self.vSecInfo VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    
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
    [JsonRoot append:@"vSecInfo" value : [BaseJSON writeList : self.vSecInfo VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]]];
    return JsonRoot;
}

- (SecBaseInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vSecInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vSecInfo"] required:false def:self.vSecInfo VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConcBaseInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vDtSecCode != nil)
    {
        [ostream writeList: 1 value: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcBaseInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtSecCode = [istream readListDef: 1 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"vDtSecCode" value : [BaseJSON writeList : self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (ConcBaseInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
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
@implementation ConcBaseInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.vConcInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vConcInfo != nil)
    {
        [ostream writeList: 0 value: self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcBaseInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vConcInfo = [istream readListDef: 0 required: false def: self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    
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
    [JsonRoot append:@"vConcInfo" value : [BaseJSON writeList : self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]]];
    return JsonRoot;
}

- (ConcBaseInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vConcInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vConcInfo"] required:false def:self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConcStockListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stConcInfo = [[ConcInfo alloc] init];
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
    if (self.stConcInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stConcInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcStockListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stConcInfo = (ConcInfo*)[istream readMessageDef: 1 required: false def: self.stConcInfo VAR_TYPE: [ConcInfo class]];
    
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
    [JsonRoot append:@"stConcInfo" value : [BaseJSON writeMessage : self.stConcInfo]];
    return JsonRoot;
}

- (ConcStockListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stConcInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stConcInfo"] required:false def:self.stConcInfo VAR_TYPE: [ConcInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RelateSecInfo
- (id) init
{
    if (self = [super init])
    {
        self.fRelate = 0;
        self.stSecInfo = [[SecInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeFloat: 0 value: self.fRelate];
    if (self.stSecInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stSecInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RelateSecInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.fRelate = [istream readFloatDef: 0 required: false def: self.fRelate];
    self.stSecInfo = (SecInfo*)[istream readMessageDef: 1 required: false def: self.stSecInfo VAR_TYPE: [SecInfo class]];
    
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
    [JsonRoot append:@"fRelate" value : [BaseJSON writeFloat : self.fRelate]];
    [JsonRoot append:@"stSecInfo" value : [BaseJSON writeMessage : self.stSecInfo]];
    return JsonRoot;
}

- (RelateSecInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.fRelate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRelate"] required:false def:self.fRelate];
    self.stSecInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecInfo"] required:false def:self.stSecInfo VAR_TYPE: [SecInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConcStockListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vRelateSecInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vRelateSecInfo != nil)
    {
        [ostream writeList: 0 value: self.vRelateSecInfo VAR_TYPE: [THOTH_LIST CREATE: [RelateSecInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcStockListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vRelateSecInfo = [istream readListDef: 0 required: false def: self.vRelateSecInfo VAR_TYPE: [THOTH_LIST CREATE: [RelateSecInfo class]]];
    
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
    [JsonRoot append:@"vRelateSecInfo" value : [BaseJSON writeList : self.vRelateSecInfo VAR_TYPE: [THOTH_LIST CREATE: [RelateSecInfo class]]]];
    return JsonRoot;
}

- (ConcStockListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vRelateSecInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vRelateSecInfo"] required:false def:self.vRelateSecInfo VAR_TYPE: [THOTH_LIST CREATE: [RelateSecInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FundBaseInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FundBaseInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    
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
    return JsonRoot;
}

- (FundBaseInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
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
@implementation FundBaseInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.stFundInfo = [[FundInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFundInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stFundInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FundBaseInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFundInfo = (FundInfo*)[istream readMessageDef: 0 required: false def: self.stFundInfo VAR_TYPE: [FundInfo class]];
    
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
    [JsonRoot append:@"stFundInfo" value : [BaseJSON writeMessage : self.stFundInfo]];
    return JsonRoot;
}

- (FundBaseInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stFundInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFundInfo"] required:false def:self.stFundInfo VAR_TYPE: [FundInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation Positions
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.lCapital = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDate != nil)
    {
        [ostream writeString: 0 value: self.sDate];
    }
    [ostream writeInt64: 1 value: self.lCapital];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (Positions *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.lCapital = [istream readInt64Def: 1 required: false def: self.lCapital];
    
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
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"lCapital" value : [BaseJSON writeInt64 : self.lCapital]];
    return JsonRoot;
}

- (Positions *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.lCapital = [BaseJSON readInt64Def:[RootMap objectForKey:@"lCapital"] required:false def:self.lCapital];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SeasonOperatingRevenue
- (id) init
{
    if (self = [super init])
    {
        self.eSeasonType = E_ST_FIRST;
        self.fIncome = 0;
        self.fNetProfit = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eSeasonType];
    [ostream writeFloat: 1 value: self.fIncome];
    [ostream writeFloat: 2 value: self.fNetProfit];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SeasonOperatingRevenue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eSeasonType = [istream readInt32Def: 0 required: false def: (int32_t)self.eSeasonType];
    self.fIncome = [istream readFloatDef: 1 required: false def: self.fIncome];
    self.fNetProfit = [istream readFloatDef: 2 required: false def: self.fNetProfit];
    
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
    [JsonRoot append:@"eSeasonType" value : [BaseJSON writeInt32 : (int32_t)self.eSeasonType]];
    [JsonRoot append:@"fIncome" value : [BaseJSON writeFloat : self.fIncome]];
    [JsonRoot append:@"fNetProfit" value : [BaseJSON writeFloat : self.fNetProfit]];
    return JsonRoot;
}

- (SeasonOperatingRevenue *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eSeasonType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSeasonType"] required:false def:(int32_t)self.eSeasonType];
    self.fIncome = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIncome"] required:false def:self.fIncome];
    self.fNetProfit = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNetProfit"] required:false def:self.fNetProfit];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OperatingRevenue
- (id) init
{
    if (self = [super init])
    {
        self.sYear = @"";
        self.fIncome = 0;
        self.fYearOnYear = 0;
        self.vtSeasonOperatingRevenue = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sYear != nil)
    {
        [ostream writeString: 0 value: self.sYear];
    }
    [ostream writeFloat: 1 value: self.fIncome];
    [ostream writeFloat: 2 value: self.fYearOnYear];
    if (self.vtSeasonOperatingRevenue != nil)
    {
        [ostream writeList: 3 value: self.vtSeasonOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [SeasonOperatingRevenue class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OperatingRevenue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sYear = [istream readStringDef: 0 required: false def: self.sYear];
    self.fIncome = [istream readFloatDef: 1 required: false def: self.fIncome];
    self.fYearOnYear = [istream readFloatDef: 2 required: false def: self.fYearOnYear];
    self.vtSeasonOperatingRevenue = [istream readListDef: 3 required: false def: self.vtSeasonOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [SeasonOperatingRevenue class]]];
    
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
    [JsonRoot append:@"sYear" value : [BaseJSON writeString : self.sYear]];
    [JsonRoot append:@"fIncome" value : [BaseJSON writeFloat : self.fIncome]];
    [JsonRoot append:@"fYearOnYear" value : [BaseJSON writeFloat : self.fYearOnYear]];
    [JsonRoot append:@"vtSeasonOperatingRevenue" value : [BaseJSON writeList : self.vtSeasonOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [SeasonOperatingRevenue class]]]];
    return JsonRoot;
}

- (OperatingRevenue *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sYear = [BaseJSON readStringDef:[RootMap objectForKey:@"sYear"] required:false def:self.sYear];
    self.fIncome = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIncome"] required:false def:self.fIncome];
    self.fYearOnYear = [BaseJSON readFloatDef:[RootMap objectForKey:@"fYearOnYear"] required:false def:self.fYearOnYear];
    self.vtSeasonOperatingRevenue = [BaseJSON readListDef:[RootMap objectForKey:@"vtSeasonOperatingRevenue"] required:false def:self.vtSeasonOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [SeasonOperatingRevenue class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation Profit
- (id) init
{
    if (self = [super init])
    {
        self.sYear = @"";
        self.fNetProfit = 0;
        self.fYearOnYear = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sYear != nil)
    {
        [ostream writeString: 0 value: self.sYear];
    }
    [ostream writeFloat: 1 value: self.fNetProfit];
    [ostream writeFloat: 2 value: self.fYearOnYear];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (Profit *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sYear = [istream readStringDef: 0 required: false def: self.sYear];
    self.fNetProfit = [istream readFloatDef: 1 required: false def: self.fNetProfit];
    self.fYearOnYear = [istream readFloatDef: 2 required: false def: self.fYearOnYear];
    
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
    [JsonRoot append:@"sYear" value : [BaseJSON writeString : self.sYear]];
    [JsonRoot append:@"fNetProfit" value : [BaseJSON writeFloat : self.fNetProfit]];
    [JsonRoot append:@"fYearOnYear" value : [BaseJSON writeFloat : self.fYearOnYear]];
    return JsonRoot;
}

- (Profit *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sYear = [BaseJSON readStringDef:[RootMap objectForKey:@"sYear"] required:false def:self.sYear];
    self.fNetProfit = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNetProfit"] required:false def:self.fNetProfit];
    self.fYearOnYear = [BaseJSON readFloatDef:[RootMap objectForKey:@"fYearOnYear"] required:false def:self.fYearOnYear];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation Profitability
- (id) init
{
    if (self = [super init])
    {
        self.sYear = @"";
        self.fEPS = 0;
        self.fROE = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sYear != nil)
    {
        [ostream writeString: 0 value: self.sYear];
    }
    [ostream writeFloat: 1 value: self.fEPS];
    [ostream writeFloat: 2 value: self.fROE];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (Profitability *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sYear = [istream readStringDef: 0 required: false def: self.sYear];
    self.fEPS = [istream readFloatDef: 1 required: false def: self.fEPS];
    self.fROE = [istream readFloatDef: 2 required: false def: self.fROE];
    
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
    [JsonRoot append:@"sYear" value : [BaseJSON writeString : self.sYear]];
    [JsonRoot append:@"fEPS" value : [BaseJSON writeFloat : self.fEPS]];
    [JsonRoot append:@"fROE" value : [BaseJSON writeFloat : self.fROE]];
    return JsonRoot;
}

- (Profitability *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sYear = [BaseJSON readStringDef:[RootMap objectForKey:@"sYear"] required:false def:self.sYear];
    self.fEPS = [BaseJSON readFloatDef:[RootMap objectForKey:@"fEPS"] required:false def:self.fEPS];
    self.fROE = [BaseJSON readFloatDef:[RootMap objectForKey:@"fROE"] required:false def:self.fROE];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FinancePerformance
- (id) init
{
    if (self = [super init])
    {
        self.vOperatingRevenue = [NSMutableArray arrayWithCapacity:0];
        self.sOperatingDesc = @"";
        self.vProfit = [NSMutableArray arrayWithCapacity:0];
        self.sProfitDesc = @"";
        self.vProfitability = [NSMutableArray arrayWithCapacity:0];
        self.sProfitabilityDesc = @"";
        self.eOPUnit = E_FRU_YUAN;
        self.eProfitUnit = E_FRU_YUAN;
        self.eEPSUnit = E_FRU_YUAN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vOperatingRevenue != nil)
    {
        [ostream writeList: 0 value: self.vOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [OperatingRevenue class]]];
    }
    if (self.sOperatingDesc != nil)
    {
        [ostream writeString: 1 value: self.sOperatingDesc];
    }
    if (self.vProfit != nil)
    {
        [ostream writeList: 2 value: self.vProfit VAR_TYPE: [THOTH_LIST CREATE: [Profit class]]];
    }
    if (self.sProfitDesc != nil)
    {
        [ostream writeString: 3 value: self.sProfitDesc];
    }
    if (self.vProfitability != nil)
    {
        [ostream writeList: 4 value: self.vProfitability VAR_TYPE: [THOTH_LIST CREATE: [Profitability class]]];
    }
    if (self.sProfitabilityDesc != nil)
    {
        [ostream writeString: 5 value: self.sProfitabilityDesc];
    }
    [ostream writeInt32: 6 value: (int32_t)self.eOPUnit];
    [ostream writeInt32: 7 value: (int32_t)self.eProfitUnit];
    [ostream writeInt32: 8 value: (int32_t)self.eEPSUnit];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinancePerformance *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vOperatingRevenue = [istream readListDef: 0 required: false def: self.vOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [OperatingRevenue class]]];
    self.sOperatingDesc = [istream readStringDef: 1 required: false def: self.sOperatingDesc];
    self.vProfit = [istream readListDef: 2 required: false def: self.vProfit VAR_TYPE: [THOTH_LIST CREATE: [Profit class]]];
    self.sProfitDesc = [istream readStringDef: 3 required: false def: self.sProfitDesc];
    self.vProfitability = [istream readListDef: 4 required: false def: self.vProfitability VAR_TYPE: [THOTH_LIST CREATE: [Profitability class]]];
    self.sProfitabilityDesc = [istream readStringDef: 5 required: false def: self.sProfitabilityDesc];
    self.eOPUnit = [istream readInt32Def: 6 required: false def: (int32_t)self.eOPUnit];
    self.eProfitUnit = [istream readInt32Def: 7 required: false def: (int32_t)self.eProfitUnit];
    self.eEPSUnit = [istream readInt32Def: 8 required: false def: (int32_t)self.eEPSUnit];
    
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
    [JsonRoot append:@"vOperatingRevenue" value : [BaseJSON writeList : self.vOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [OperatingRevenue class]]]];
    [JsonRoot append:@"sOperatingDesc" value : [BaseJSON writeString : self.sOperatingDesc]];
    [JsonRoot append:@"vProfit" value : [BaseJSON writeList : self.vProfit VAR_TYPE: [THOTH_LIST CREATE: [Profit class]]]];
    [JsonRoot append:@"sProfitDesc" value : [BaseJSON writeString : self.sProfitDesc]];
    [JsonRoot append:@"vProfitability" value : [BaseJSON writeList : self.vProfitability VAR_TYPE: [THOTH_LIST CREATE: [Profitability class]]]];
    [JsonRoot append:@"sProfitabilityDesc" value : [BaseJSON writeString : self.sProfitabilityDesc]];
    [JsonRoot append:@"eOPUnit" value : [BaseJSON writeInt32 : (int32_t)self.eOPUnit]];
    [JsonRoot append:@"eProfitUnit" value : [BaseJSON writeInt32 : (int32_t)self.eProfitUnit]];
    [JsonRoot append:@"eEPSUnit" value : [BaseJSON writeInt32 : (int32_t)self.eEPSUnit]];
    return JsonRoot;
}

- (FinancePerformance *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vOperatingRevenue = [BaseJSON readListDef:[RootMap objectForKey:@"vOperatingRevenue"] required:false def:self.vOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [OperatingRevenue class]]];
    self.sOperatingDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sOperatingDesc"] required:false def:self.sOperatingDesc];
    self.vProfit = [BaseJSON readListDef:[RootMap objectForKey:@"vProfit"] required:false def:self.vProfit VAR_TYPE: [THOTH_LIST CREATE: [Profit class]]];
    self.sProfitDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sProfitDesc"] required:false def:self.sProfitDesc];
    self.vProfitability = [BaseJSON readListDef:[RootMap objectForKey:@"vProfitability"] required:false def:self.vProfitability VAR_TYPE: [THOTH_LIST CREATE: [Profitability class]]];
    self.sProfitabilityDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sProfitabilityDesc"] required:false def:self.sProfitabilityDesc];
    self.eOPUnit = [BaseJSON readInt32Def:[RootMap objectForKey:@"eOPUnit"] required:false def:(int32_t)self.eOPUnit];
    self.eProfitUnit = [BaseJSON readInt32Def:[RootMap objectForKey:@"eProfitUnit"] required:false def:(int32_t)self.eProfitUnit];
    self.eEPSUnit = [BaseJSON readInt32Def:[RootMap objectForKey:@"eEPSUnit"] required:false def:(int32_t)self.eEPSUnit];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FinancialAnalysis
- (id) init
{
    if (self = [super init])
    {
        self.sEPS = @"";
        self.sBVPS = @"";
        self.sPB = @"";
        self.sROE = @"";
        self.sGrossRevenue = @"";
        self.sOperatingProfit = @"";
        self.sNetProfit = @"";
        self.sBusinessRevenueGrowth = @"";
        self.sProfitGrowth = @"";
        self.sNetGrowth = @"";
        self.sTotalAssets = @"";
        self.sTotalLiabilities = @"";
        self.sTotalEquities = @"";
        self.sLEV = @"";
        self.sOperationalCashFlow = @"";
        self.sInvestmentCashFlows = @"";
        self.sFinancingCashFlows = @"";
        self.sUpdateTime = @"";
        self.sNetCF = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sEPS != nil)
    {
        [ostream writeString: 0 value: self.sEPS];
    }
    if (self.sBVPS != nil)
    {
        [ostream writeString: 1 value: self.sBVPS];
    }
    if (self.sPB != nil)
    {
        [ostream writeString: 2 value: self.sPB];
    }
    if (self.sROE != nil)
    {
        [ostream writeString: 3 value: self.sROE];
    }
    if (self.sGrossRevenue != nil)
    {
        [ostream writeString: 4 value: self.sGrossRevenue];
    }
    if (self.sOperatingProfit != nil)
    {
        [ostream writeString: 5 value: self.sOperatingProfit];
    }
    if (self.sNetProfit != nil)
    {
        [ostream writeString: 6 value: self.sNetProfit];
    }
    if (self.sBusinessRevenueGrowth != nil)
    {
        [ostream writeString: 7 value: self.sBusinessRevenueGrowth];
    }
    if (self.sProfitGrowth != nil)
    {
        [ostream writeString: 8 value: self.sProfitGrowth];
    }
    if (self.sNetGrowth != nil)
    {
        [ostream writeString: 9 value: self.sNetGrowth];
    }
    if (self.sTotalAssets != nil)
    {
        [ostream writeString: 10 value: self.sTotalAssets];
    }
    if (self.sTotalLiabilities != nil)
    {
        [ostream writeString: 11 value: self.sTotalLiabilities];
    }
    if (self.sTotalEquities != nil)
    {
        [ostream writeString: 12 value: self.sTotalEquities];
    }
    if (self.sLEV != nil)
    {
        [ostream writeString: 13 value: self.sLEV];
    }
    if (self.sOperationalCashFlow != nil)
    {
        [ostream writeString: 14 value: self.sOperationalCashFlow];
    }
    if (self.sInvestmentCashFlows != nil)
    {
        [ostream writeString: 15 value: self.sInvestmentCashFlows];
    }
    if (self.sFinancingCashFlows != nil)
    {
        [ostream writeString: 16 value: self.sFinancingCashFlows];
    }
    if (self.sUpdateTime != nil)
    {
        [ostream writeString: 17 value: self.sUpdateTime];
    }
    if (self.sNetCF != nil)
    {
        [ostream writeString: 18 value: self.sNetCF];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinancialAnalysis *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sEPS = [istream readStringDef: 0 required: false def: self.sEPS];
    self.sBVPS = [istream readStringDef: 1 required: false def: self.sBVPS];
    self.sPB = [istream readStringDef: 2 required: false def: self.sPB];
    self.sROE = [istream readStringDef: 3 required: false def: self.sROE];
    self.sGrossRevenue = [istream readStringDef: 4 required: false def: self.sGrossRevenue];
    self.sOperatingProfit = [istream readStringDef: 5 required: false def: self.sOperatingProfit];
    self.sNetProfit = [istream readStringDef: 6 required: false def: self.sNetProfit];
    self.sBusinessRevenueGrowth = [istream readStringDef: 7 required: false def: self.sBusinessRevenueGrowth];
    self.sProfitGrowth = [istream readStringDef: 8 required: false def: self.sProfitGrowth];
    self.sNetGrowth = [istream readStringDef: 9 required: false def: self.sNetGrowth];
    self.sTotalAssets = [istream readStringDef: 10 required: false def: self.sTotalAssets];
    self.sTotalLiabilities = [istream readStringDef: 11 required: false def: self.sTotalLiabilities];
    self.sTotalEquities = [istream readStringDef: 12 required: false def: self.sTotalEquities];
    self.sLEV = [istream readStringDef: 13 required: false def: self.sLEV];
    self.sOperationalCashFlow = [istream readStringDef: 14 required: false def: self.sOperationalCashFlow];
    self.sInvestmentCashFlows = [istream readStringDef: 15 required: false def: self.sInvestmentCashFlows];
    self.sFinancingCashFlows = [istream readStringDef: 16 required: false def: self.sFinancingCashFlows];
    self.sUpdateTime = [istream readStringDef: 17 required: false def: self.sUpdateTime];
    self.sNetCF = [istream readStringDef: 18 required: false def: self.sNetCF];
    
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
    [JsonRoot append:@"sEPS" value : [BaseJSON writeString : self.sEPS]];
    [JsonRoot append:@"sBVPS" value : [BaseJSON writeString : self.sBVPS]];
    [JsonRoot append:@"sPB" value : [BaseJSON writeString : self.sPB]];
    [JsonRoot append:@"sROE" value : [BaseJSON writeString : self.sROE]];
    [JsonRoot append:@"sGrossRevenue" value : [BaseJSON writeString : self.sGrossRevenue]];
    [JsonRoot append:@"sOperatingProfit" value : [BaseJSON writeString : self.sOperatingProfit]];
    [JsonRoot append:@"sNetProfit" value : [BaseJSON writeString : self.sNetProfit]];
    [JsonRoot append:@"sBusinessRevenueGrowth" value : [BaseJSON writeString : self.sBusinessRevenueGrowth]];
    [JsonRoot append:@"sProfitGrowth" value : [BaseJSON writeString : self.sProfitGrowth]];
    [JsonRoot append:@"sNetGrowth" value : [BaseJSON writeString : self.sNetGrowth]];
    [JsonRoot append:@"sTotalAssets" value : [BaseJSON writeString : self.sTotalAssets]];
    [JsonRoot append:@"sTotalLiabilities" value : [BaseJSON writeString : self.sTotalLiabilities]];
    [JsonRoot append:@"sTotalEquities" value : [BaseJSON writeString : self.sTotalEquities]];
    [JsonRoot append:@"sLEV" value : [BaseJSON writeString : self.sLEV]];
    [JsonRoot append:@"sOperationalCashFlow" value : [BaseJSON writeString : self.sOperationalCashFlow]];
    [JsonRoot append:@"sInvestmentCashFlows" value : [BaseJSON writeString : self.sInvestmentCashFlows]];
    [JsonRoot append:@"sFinancingCashFlows" value : [BaseJSON writeString : self.sFinancingCashFlows]];
    [JsonRoot append:@"sUpdateTime" value : [BaseJSON writeString : self.sUpdateTime]];
    [JsonRoot append:@"sNetCF" value : [BaseJSON writeString : self.sNetCF]];
    return JsonRoot;
}

- (FinancialAnalysis *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sEPS = [BaseJSON readStringDef:[RootMap objectForKey:@"sEPS"] required:false def:self.sEPS];
    self.sBVPS = [BaseJSON readStringDef:[RootMap objectForKey:@"sBVPS"] required:false def:self.sBVPS];
    self.sPB = [BaseJSON readStringDef:[RootMap objectForKey:@"sPB"] required:false def:self.sPB];
    self.sROE = [BaseJSON readStringDef:[RootMap objectForKey:@"sROE"] required:false def:self.sROE];
    self.sGrossRevenue = [BaseJSON readStringDef:[RootMap objectForKey:@"sGrossRevenue"] required:false def:self.sGrossRevenue];
    self.sOperatingProfit = [BaseJSON readStringDef:[RootMap objectForKey:@"sOperatingProfit"] required:false def:self.sOperatingProfit];
    self.sNetProfit = [BaseJSON readStringDef:[RootMap objectForKey:@"sNetProfit"] required:false def:self.sNetProfit];
    self.sBusinessRevenueGrowth = [BaseJSON readStringDef:[RootMap objectForKey:@"sBusinessRevenueGrowth"] required:false def:self.sBusinessRevenueGrowth];
    self.sProfitGrowth = [BaseJSON readStringDef:[RootMap objectForKey:@"sProfitGrowth"] required:false def:self.sProfitGrowth];
    self.sNetGrowth = [BaseJSON readStringDef:[RootMap objectForKey:@"sNetGrowth"] required:false def:self.sNetGrowth];
    self.sTotalAssets = [BaseJSON readStringDef:[RootMap objectForKey:@"sTotalAssets"] required:false def:self.sTotalAssets];
    self.sTotalLiabilities = [BaseJSON readStringDef:[RootMap objectForKey:@"sTotalLiabilities"] required:false def:self.sTotalLiabilities];
    self.sTotalEquities = [BaseJSON readStringDef:[RootMap objectForKey:@"sTotalEquities"] required:false def:self.sTotalEquities];
    self.sLEV = [BaseJSON readStringDef:[RootMap objectForKey:@"sLEV"] required:false def:self.sLEV];
    self.sOperationalCashFlow = [BaseJSON readStringDef:[RootMap objectForKey:@"sOperationalCashFlow"] required:false def:self.sOperationalCashFlow];
    self.sInvestmentCashFlows = [BaseJSON readStringDef:[RootMap objectForKey:@"sInvestmentCashFlows"] required:false def:self.sInvestmentCashFlows];
    self.sFinancingCashFlows = [BaseJSON readStringDef:[RootMap objectForKey:@"sFinancingCashFlows"] required:false def:self.sFinancingCashFlows];
    self.sUpdateTime = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpdateTime"] required:false def:self.sUpdateTime];
    self.sNetCF = [BaseJSON readStringDef:[RootMap objectForKey:@"sNetCF"] required:false def:self.sNetCF];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FinanceReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinanceReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    
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
    return JsonRoot;
}

- (FinanceReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
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
@implementation FinanceRsp
- (id) init
{
    if (self = [super init])
    {
        self.stFinancePerformance = [[FinancePerformance alloc] init];
        self.stFinancialAnalysis = [[FinancialAnalysis alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFinancePerformance != nil)
    {
        [ostream writeMessage: 0 value: self.stFinancePerformance];
    }
    if (self.stFinancialAnalysis != nil)
    {
        [ostream writeMessage: 1 value: self.stFinancialAnalysis];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinanceRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFinancePerformance = (FinancePerformance*)[istream readMessageDef: 0 required: false def: self.stFinancePerformance VAR_TYPE: [FinancePerformance class]];
    self.stFinancialAnalysis = (FinancialAnalysis*)[istream readMessageDef: 1 required: false def: self.stFinancialAnalysis VAR_TYPE: [FinancialAnalysis class]];
    
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
    [JsonRoot append:@"stFinancePerformance" value : [BaseJSON writeMessage : self.stFinancePerformance]];
    [JsonRoot append:@"stFinancialAnalysis" value : [BaseJSON writeMessage : self.stFinancialAnalysis]];
    return JsonRoot;
}

- (FinanceRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stFinancePerformance = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFinancePerformance"] required:false def:self.stFinancePerformance VAR_TYPE: [FinancePerformance class]];
    self.stFinancialAnalysis = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFinancialAnalysis"] required:false def:self.stFinancialAnalysis VAR_TYPE: [FinancialAnalysis class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CompanyProfile
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sListingDate = @"";
        self.sIssuePrice = @"";
        self.sIssuanceNumber = @"";
        self.sRegion = @"";
        self.sIndustry = @"";
        self.sMainBusiness = @"";
        self.sListedAddr = @"";
        self.sCountry = @"";
        self.sSecCategory = @"";
        self.sTradingUnit = @"";
        self.sTransferType = @"";
        self.sMarketStartDate = @"";
        self.sMarketMakers = @"";
        self.sRegistryLocate = @"";
        self.vController = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sListingDate != nil)
    {
        [ostream writeString: 1 value: self.sListingDate];
    }
    if (self.sIssuePrice != nil)
    {
        [ostream writeString: 2 value: self.sIssuePrice];
    }
    if (self.sIssuanceNumber != nil)
    {
        [ostream writeString: 3 value: self.sIssuanceNumber];
    }
    if (self.sRegion != nil)
    {
        [ostream writeString: 4 value: self.sRegion];
    }
    if (self.sIndustry != nil)
    {
        [ostream writeString: 5 value: self.sIndustry];
    }
    if (self.sMainBusiness != nil)
    {
        [ostream writeString: 6 value: self.sMainBusiness];
    }
    if (self.sListedAddr != nil)
    {
        [ostream writeString: 7 value: self.sListedAddr];
    }
    if (self.sCountry != nil)
    {
        [ostream writeString: 8 value: self.sCountry];
    }
    if (self.sSecCategory != nil)
    {
        [ostream writeString: 9 value: self.sSecCategory];
    }
    if (self.sTradingUnit != nil)
    {
        [ostream writeString: 10 value: self.sTradingUnit];
    }
    if (self.sTransferType != nil)
    {
        [ostream writeString: 11 value: self.sTransferType];
    }
    if (self.sMarketStartDate != nil)
    {
        [ostream writeString: 12 value: self.sMarketStartDate];
    }
    if (self.sMarketMakers != nil)
    {
        [ostream writeString: 13 value: self.sMarketMakers];
    }
    if (self.sRegistryLocate != nil)
    {
        [ostream writeString: 14 value: self.sRegistryLocate];
    }
    if (self.vController != nil)
    {
        [ostream writeList: 15 value: self.vController VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CompanyProfile *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sListingDate = [istream readStringDef: 1 required: false def: self.sListingDate];
    self.sIssuePrice = [istream readStringDef: 2 required: false def: self.sIssuePrice];
    self.sIssuanceNumber = [istream readStringDef: 3 required: false def: self.sIssuanceNumber];
    self.sRegion = [istream readStringDef: 4 required: false def: self.sRegion];
    self.sIndustry = [istream readStringDef: 5 required: false def: self.sIndustry];
    self.sMainBusiness = [istream readStringDef: 6 required: false def: self.sMainBusiness];
    self.sListedAddr = [istream readStringDef: 7 required: false def: self.sListedAddr];
    self.sCountry = [istream readStringDef: 8 required: false def: self.sCountry];
    self.sSecCategory = [istream readStringDef: 9 required: false def: self.sSecCategory];
    self.sTradingUnit = [istream readStringDef: 10 required: false def: self.sTradingUnit];
    self.sTransferType = [istream readStringDef: 11 required: false def: self.sTransferType];
    self.sMarketStartDate = [istream readStringDef: 12 required: false def: self.sMarketStartDate];
    self.sMarketMakers = [istream readStringDef: 13 required: false def: self.sMarketMakers];
    self.sRegistryLocate = [istream readStringDef: 14 required: false def: self.sRegistryLocate];
    self.vController = [istream readListDef: 15 required: false def: self.vController VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"sListingDate" value : [BaseJSON writeString : self.sListingDate]];
    [JsonRoot append:@"sIssuePrice" value : [BaseJSON writeString : self.sIssuePrice]];
    [JsonRoot append:@"sIssuanceNumber" value : [BaseJSON writeString : self.sIssuanceNumber]];
    [JsonRoot append:@"sRegion" value : [BaseJSON writeString : self.sRegion]];
    [JsonRoot append:@"sIndustry" value : [BaseJSON writeString : self.sIndustry]];
    [JsonRoot append:@"sMainBusiness" value : [BaseJSON writeString : self.sMainBusiness]];
    [JsonRoot append:@"sListedAddr" value : [BaseJSON writeString : self.sListedAddr]];
    [JsonRoot append:@"sCountry" value : [BaseJSON writeString : self.sCountry]];
    [JsonRoot append:@"sSecCategory" value : [BaseJSON writeString : self.sSecCategory]];
    [JsonRoot append:@"sTradingUnit" value : [BaseJSON writeString : self.sTradingUnit]];
    [JsonRoot append:@"sTransferType" value : [BaseJSON writeString : self.sTransferType]];
    [JsonRoot append:@"sMarketStartDate" value : [BaseJSON writeString : self.sMarketStartDate]];
    [JsonRoot append:@"sMarketMakers" value : [BaseJSON writeString : self.sMarketMakers]];
    [JsonRoot append:@"sRegistryLocate" value : [BaseJSON writeString : self.sRegistryLocate]];
    [JsonRoot append:@"vController" value : [BaseJSON writeList : self.vController VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (CompanyProfile *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sListingDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sListingDate"] required:false def:self.sListingDate];
    self.sIssuePrice = [BaseJSON readStringDef:[RootMap objectForKey:@"sIssuePrice"] required:false def:self.sIssuePrice];
    self.sIssuanceNumber = [BaseJSON readStringDef:[RootMap objectForKey:@"sIssuanceNumber"] required:false def:self.sIssuanceNumber];
    self.sRegion = [BaseJSON readStringDef:[RootMap objectForKey:@"sRegion"] required:false def:self.sRegion];
    self.sIndustry = [BaseJSON readStringDef:[RootMap objectForKey:@"sIndustry"] required:false def:self.sIndustry];
    self.sMainBusiness = [BaseJSON readStringDef:[RootMap objectForKey:@"sMainBusiness"] required:false def:self.sMainBusiness];
    self.sListedAddr = [BaseJSON readStringDef:[RootMap objectForKey:@"sListedAddr"] required:false def:self.sListedAddr];
    self.sCountry = [BaseJSON readStringDef:[RootMap objectForKey:@"sCountry"] required:false def:self.sCountry];
    self.sSecCategory = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecCategory"] required:false def:self.sSecCategory];
    self.sTradingUnit = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingUnit"] required:false def:self.sTradingUnit];
    self.sTransferType = [BaseJSON readStringDef:[RootMap objectForKey:@"sTransferType"] required:false def:self.sTransferType];
    self.sMarketStartDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sMarketStartDate"] required:false def:self.sMarketStartDate];
    self.sMarketMakers = [BaseJSON readStringDef:[RootMap objectForKey:@"sMarketMakers"] required:false def:self.sMarketMakers];
    self.sRegistryLocate = [BaseJSON readStringDef:[RootMap objectForKey:@"sRegistryLocate"] required:false def:self.sRegistryLocate];
    self.vController = [BaseJSON readListDef:[RootMap objectForKey:@"vController"] required:false def:self.vController VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PrimeOperatingRevenue
- (id) init
{
    if (self = [super init])
    {
        self.sTypeName = @"";
        self.sSalesRevenue = @"";
        self.sRatio = @"";
        self.fRatio = 0;
        self.dSalesRevenue = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTypeName != nil)
    {
        [ostream writeString: 0 value: self.sTypeName];
    }
    if (self.sSalesRevenue != nil)
    {
        [ostream writeString: 1 value: self.sSalesRevenue];
    }
    if (self.sRatio != nil)
    {
        [ostream writeString: 2 value: self.sRatio];
    }
    [ostream writeFloat: 3 value: self.fRatio];
    [ostream writeDouble: 4 value: self.dSalesRevenue];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PrimeOperatingRevenue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTypeName = [istream readStringDef: 0 required: false def: self.sTypeName];
    self.sSalesRevenue = [istream readStringDef: 1 required: false def: self.sSalesRevenue];
    self.sRatio = [istream readStringDef: 2 required: false def: self.sRatio];
    self.fRatio = [istream readFloatDef: 3 required: false def: self.fRatio];
    self.dSalesRevenue = [istream readDoubleDef: 4 required: false def: self.dSalesRevenue];
    
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
    [JsonRoot append:@"sTypeName" value : [BaseJSON writeString : self.sTypeName]];
    [JsonRoot append:@"sSalesRevenue" value : [BaseJSON writeString : self.sSalesRevenue]];
    [JsonRoot append:@"sRatio" value : [BaseJSON writeString : self.sRatio]];
    [JsonRoot append:@"fRatio" value : [BaseJSON writeFloat : self.fRatio]];
    [JsonRoot append:@"dSalesRevenue" value : [BaseJSON writeDouble : self.dSalesRevenue]];
    return JsonRoot;
}

- (PrimeOperatingRevenue *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTypeName = [BaseJSON readStringDef:[RootMap objectForKey:@"sTypeName"] required:false def:self.sTypeName];
    self.sSalesRevenue = [BaseJSON readStringDef:[RootMap objectForKey:@"sSalesRevenue"] required:false def:self.sSalesRevenue];
    self.sRatio = [BaseJSON readStringDef:[RootMap objectForKey:@"sRatio"] required:false def:self.sRatio];
    self.fRatio = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRatio"] required:false def:self.fRatio];
    self.dSalesRevenue = [BaseJSON readDoubleDef:[RootMap objectForKey:@"dSalesRevenue"] required:false def:self.dSalesRevenue];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DividendPayingPlacing
- (id) init
{
    if (self = [super init])
    {
        self.sYear = @"";
        self.sDetail = @"";
        self.sDate = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sYear != nil)
    {
        [ostream writeString: 0 value: self.sYear];
    }
    if (self.sDetail != nil)
    {
        [ostream writeString: 1 value: self.sDetail];
    }
    if (self.sDate != nil)
    {
        [ostream writeString: 2 value: self.sDate];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DividendPayingPlacing *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sYear = [istream readStringDef: 0 required: false def: self.sYear];
    self.sDetail = [istream readStringDef: 1 required: false def: self.sDetail];
    self.sDate = [istream readStringDef: 2 required: false def: self.sDate];
    
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
    [JsonRoot append:@"sYear" value : [BaseJSON writeString : self.sYear]];
    [JsonRoot append:@"sDetail" value : [BaseJSON writeString : self.sDetail]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    return JsonRoot;
}

- (DividendPayingPlacing *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sYear = [BaseJSON readStringDef:[RootMap objectForKey:@"sYear"] required:false def:self.sYear];
    self.sDetail = [BaseJSON readStringDef:[RootMap objectForKey:@"sDetail"] required:false def:self.sDetail];
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
@implementation CapitalStructureDetail
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.iShareholderNumber = 0;
        self.fPerCapitaHoldings = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDate != nil)
    {
        [ostream writeString: 0 value: self.sDate];
    }
    [ostream writeInt32: 1 value: self.iShareholderNumber];
    [ostream writeFloat: 2 value: self.fPerCapitaHoldings];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalStructureDetail *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.iShareholderNumber = [istream readInt32Def: 1 required: false def: self.iShareholderNumber];
    self.fPerCapitaHoldings = [istream readFloatDef: 2 required: false def: self.fPerCapitaHoldings];
    
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
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"iShareholderNumber" value : [BaseJSON writeInt32 : self.iShareholderNumber]];
    [JsonRoot append:@"fPerCapitaHoldings" value : [BaseJSON writeFloat : self.fPerCapitaHoldings]];
    return JsonRoot;
}

- (CapitalStructureDetail *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.iShareholderNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iShareholderNumber"] required:false def:self.iShareholderNumber];
    self.fPerCapitaHoldings = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPerCapitaHoldings"] required:false def:self.fPerCapitaHoldings];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalStructure
- (id) init
{
    if (self = [super init])
    {
        self.sEquity = @"";
        self.sCirculationStock = @"";
        self.sShareholderNumber = @"";
        self.sPerCapitaHoldings = @"";
        self.vCapitalStructureDetail = [NSMutableArray arrayWithCapacity:0];
        self.sDate = @"";
        self.sFloatShare = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sEquity != nil)
    {
        [ostream writeString: 0 value: self.sEquity];
    }
    if (self.sCirculationStock != nil)
    {
        [ostream writeString: 1 value: self.sCirculationStock];
    }
    if (self.sShareholderNumber != nil)
    {
        [ostream writeString: 2 value: self.sShareholderNumber];
    }
    if (self.sPerCapitaHoldings != nil)
    {
        [ostream writeString: 3 value: self.sPerCapitaHoldings];
    }
    if (self.vCapitalStructureDetail != nil)
    {
        [ostream writeList: 4 value: self.vCapitalStructureDetail VAR_TYPE: [THOTH_LIST CREATE: [CapitalStructureDetail class]]];
    }
    if (self.sDate != nil)
    {
        [ostream writeString: 5 value: self.sDate];
    }
    if (self.sFloatShare != nil)
    {
        [ostream writeString: 6 value: self.sFloatShare];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalStructure *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sEquity = [istream readStringDef: 0 required: false def: self.sEquity];
    self.sCirculationStock = [istream readStringDef: 1 required: false def: self.sCirculationStock];
    self.sShareholderNumber = [istream readStringDef: 2 required: false def: self.sShareholderNumber];
    self.sPerCapitaHoldings = [istream readStringDef: 3 required: false def: self.sPerCapitaHoldings];
    self.vCapitalStructureDetail = [istream readListDef: 4 required: false def: self.vCapitalStructureDetail VAR_TYPE: [THOTH_LIST CREATE: [CapitalStructureDetail class]]];
    self.sDate = [istream readStringDef: 5 required: false def: self.sDate];
    self.sFloatShare = [istream readStringDef: 6 required: false def: self.sFloatShare];
    
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
    [JsonRoot append:@"sEquity" value : [BaseJSON writeString : self.sEquity]];
    [JsonRoot append:@"sCirculationStock" value : [BaseJSON writeString : self.sCirculationStock]];
    [JsonRoot append:@"sShareholderNumber" value : [BaseJSON writeString : self.sShareholderNumber]];
    [JsonRoot append:@"sPerCapitaHoldings" value : [BaseJSON writeString : self.sPerCapitaHoldings]];
    [JsonRoot append:@"vCapitalStructureDetail" value : [BaseJSON writeList : self.vCapitalStructureDetail VAR_TYPE: [THOTH_LIST CREATE: [CapitalStructureDetail class]]]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"sFloatShare" value : [BaseJSON writeString : self.sFloatShare]];
    return JsonRoot;
}

- (CapitalStructure *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sEquity = [BaseJSON readStringDef:[RootMap objectForKey:@"sEquity"] required:false def:self.sEquity];
    self.sCirculationStock = [BaseJSON readStringDef:[RootMap objectForKey:@"sCirculationStock"] required:false def:self.sCirculationStock];
    self.sShareholderNumber = [BaseJSON readStringDef:[RootMap objectForKey:@"sShareholderNumber"] required:false def:self.sShareholderNumber];
    self.sPerCapitaHoldings = [BaseJSON readStringDef:[RootMap objectForKey:@"sPerCapitaHoldings"] required:false def:self.sPerCapitaHoldings];
    self.vCapitalStructureDetail = [BaseJSON readListDef:[RootMap objectForKey:@"vCapitalStructureDetail"] required:false def:self.vCapitalStructureDetail VAR_TYPE: [THOTH_LIST CREATE: [CapitalStructureDetail class]]];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.sFloatShare = [BaseJSON readStringDef:[RootMap objectForKey:@"sFloatShare"] required:false def:self.sFloatShare];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopShareholder
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sRatio = @"";
        self.eShareholderChange = SHC_UNCHANGE;
        self.sChangeDetail = @"";
        self.sUniCode = @"";
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
    if (self.sRatio != nil)
    {
        [ostream writeString: 1 value: self.sRatio];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eShareholderChange];
    if (self.sChangeDetail != nil)
    {
        [ostream writeString: 3 value: self.sChangeDetail];
    }
    if (self.sUniCode != nil)
    {
        [ostream writeString: 4 value: self.sUniCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopShareholder *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sRatio = [istream readStringDef: 1 required: false def: self.sRatio];
    self.eShareholderChange = [istream readInt32Def: 2 required: false def: (int32_t)self.eShareholderChange];
    self.sChangeDetail = [istream readStringDef: 3 required: false def: self.sChangeDetail];
    self.sUniCode = [istream readStringDef: 4 required: false def: self.sUniCode];
    
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
    [JsonRoot append:@"sRatio" value : [BaseJSON writeString : self.sRatio]];
    [JsonRoot append:@"eShareholderChange" value : [BaseJSON writeInt32 : (int32_t)self.eShareholderChange]];
    [JsonRoot append:@"sChangeDetail" value : [BaseJSON writeString : self.sChangeDetail]];
    [JsonRoot append:@"sUniCode" value : [BaseJSON writeString : self.sUniCode]];
    return JsonRoot;
}

- (TopShareholder *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sRatio = [BaseJSON readStringDef:[RootMap objectForKey:@"sRatio"] required:false def:self.sRatio];
    self.eShareholderChange = [BaseJSON readInt32Def:[RootMap objectForKey:@"eShareholderChange"] required:false def:(int32_t)self.eShareholderChange];
    self.sChangeDetail = [BaseJSON readStringDef:[RootMap objectForKey:@"sChangeDetail"] required:false def:self.sChangeDetail];
    self.sUniCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sUniCode"] required:false def:self.sUniCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation Fundsholder
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sRatio = @"";
        self.eShareholderChange = SHC_UNCHANGE;
        self.sChangeDetail = @"";
        self.sUniCode = @"";
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
    if (self.sRatio != nil)
    {
        [ostream writeString: 1 value: self.sRatio];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eShareholderChange];
    if (self.sChangeDetail != nil)
    {
        [ostream writeString: 3 value: self.sChangeDetail];
    }
    if (self.sUniCode != nil)
    {
        [ostream writeString: 4 value: self.sUniCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (Fundsholder *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sRatio = [istream readStringDef: 1 required: false def: self.sRatio];
    self.eShareholderChange = [istream readInt32Def: 2 required: false def: (int32_t)self.eShareholderChange];
    self.sChangeDetail = [istream readStringDef: 3 required: false def: self.sChangeDetail];
    self.sUniCode = [istream readStringDef: 4 required: false def: self.sUniCode];
    
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
    [JsonRoot append:@"sRatio" value : [BaseJSON writeString : self.sRatio]];
    [JsonRoot append:@"eShareholderChange" value : [BaseJSON writeInt32 : (int32_t)self.eShareholderChange]];
    [JsonRoot append:@"sChangeDetail" value : [BaseJSON writeString : self.sChangeDetail]];
    [JsonRoot append:@"sUniCode" value : [BaseJSON writeString : self.sUniCode]];
    return JsonRoot;
}

- (Fundsholder *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sRatio = [BaseJSON readStringDef:[RootMap objectForKey:@"sRatio"] required:false def:self.sRatio];
    self.eShareholderChange = [BaseJSON readInt32Def:[RootMap objectForKey:@"eShareholderChange"] required:false def:(int32_t)self.eShareholderChange];
    self.sChangeDetail = [BaseJSON readStringDef:[RootMap objectForKey:@"sChangeDetail"] required:false def:self.sChangeDetail];
    self.sUniCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sUniCode"] required:false def:self.sUniCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SeniorExecutive
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.iAge = 0;
        self.sEdu = @"";
        self.sBusiness = @"";
        self.sTimeofOffice = @"";
        self.fHoldNum = 0;
        self.fPay = 0;
        self.sIntroduce = @"";
        self.sUniCode = @"";
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
    [ostream writeInt32: 1 value: self.iAge];
    if (self.sEdu != nil)
    {
        [ostream writeString: 2 value: self.sEdu];
    }
    if (self.sBusiness != nil)
    {
        [ostream writeString: 3 value: self.sBusiness];
    }
    if (self.sTimeofOffice != nil)
    {
        [ostream writeString: 4 value: self.sTimeofOffice];
    }
    [ostream writeFloat: 5 value: self.fHoldNum];
    [ostream writeFloat: 6 value: self.fPay];
    if (self.sIntroduce != nil)
    {
        [ostream writeString: 7 value: self.sIntroduce];
    }
    if (self.sUniCode != nil)
    {
        [ostream writeString: 8 value: self.sUniCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SeniorExecutive *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.iAge = [istream readInt32Def: 1 required: false def: self.iAge];
    self.sEdu = [istream readStringDef: 2 required: false def: self.sEdu];
    self.sBusiness = [istream readStringDef: 3 required: false def: self.sBusiness];
    self.sTimeofOffice = [istream readStringDef: 4 required: false def: self.sTimeofOffice];
    self.fHoldNum = [istream readFloatDef: 5 required: false def: self.fHoldNum];
    self.fPay = [istream readFloatDef: 6 required: false def: self.fPay];
    self.sIntroduce = [istream readStringDef: 7 required: false def: self.sIntroduce];
    self.sUniCode = [istream readStringDef: 8 required: false def: self.sUniCode];
    
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
    [JsonRoot append:@"iAge" value : [BaseJSON writeInt32 : self.iAge]];
    [JsonRoot append:@"sEdu" value : [BaseJSON writeString : self.sEdu]];
    [JsonRoot append:@"sBusiness" value : [BaseJSON writeString : self.sBusiness]];
    [JsonRoot append:@"sTimeofOffice" value : [BaseJSON writeString : self.sTimeofOffice]];
    [JsonRoot append:@"fHoldNum" value : [BaseJSON writeFloat : self.fHoldNum]];
    [JsonRoot append:@"fPay" value : [BaseJSON writeFloat : self.fPay]];
    [JsonRoot append:@"sIntroduce" value : [BaseJSON writeString : self.sIntroduce]];
    [JsonRoot append:@"sUniCode" value : [BaseJSON writeString : self.sUniCode]];
    return JsonRoot;
}

- (SeniorExecutive *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.iAge = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAge"] required:false def:self.iAge];
    self.sEdu = [BaseJSON readStringDef:[RootMap objectForKey:@"sEdu"] required:false def:self.sEdu];
    self.sBusiness = [BaseJSON readStringDef:[RootMap objectForKey:@"sBusiness"] required:false def:self.sBusiness];
    self.sTimeofOffice = [BaseJSON readStringDef:[RootMap objectForKey:@"sTimeofOffice"] required:false def:self.sTimeofOffice];
    self.fHoldNum = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHoldNum"] required:false def:self.fHoldNum];
    self.fPay = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPay"] required:false def:self.fPay];
    self.sIntroduce = [BaseJSON readStringDef:[RootMap objectForKey:@"sIntroduce"] required:false def:self.sIntroduce];
    self.sUniCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sUniCode"] required:false def:self.sUniCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IndustryCompareItem
- (id) init
{
    if (self = [super init])
    {
        self.iOrder = 0;
        self.sName = @"";
        self.sValue = @"";
        self.iUpdateTime = 0;
        self.sDtSecCode = @"";
        self.dValue = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iOrder];
    if (self.sName != nil)
    {
        [ostream writeString: 1 value: self.sName];
    }
    if (self.sValue != nil)
    {
        [ostream writeString: 2 value: self.sValue];
    }
    [ostream writeInt32: 3 value: self.iUpdateTime];
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 4 value: self.sDtSecCode];
    }
    [ostream writeDouble: 5 value: self.dValue];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IndustryCompareItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iOrder = [istream readInt32Def: 0 required: false def: self.iOrder];
    self.sName = [istream readStringDef: 1 required: false def: self.sName];
    self.sValue = [istream readStringDef: 2 required: false def: self.sValue];
    self.iUpdateTime = [istream readInt32Def: 3 required: false def: self.iUpdateTime];
    self.sDtSecCode = [istream readStringDef: 4 required: false def: self.sDtSecCode];
    self.dValue = [istream readDoubleDef: 5 required: false def: self.dValue];
    
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
    [JsonRoot append:@"iOrder" value : [BaseJSON writeInt32 : self.iOrder]];
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"sValue" value : [BaseJSON writeString : self.sValue]];
    [JsonRoot append:@"iUpdateTime" value : [BaseJSON writeInt32 : self.iUpdateTime]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"dValue" value : [BaseJSON writeDouble : self.dValue]];
    return JsonRoot;
}

- (IndustryCompareItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iOrder = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOrder"] required:false def:self.iOrder];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sValue"] required:false def:self.sValue];
    self.iUpdateTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpdateTime"] required:false def:self.iUpdateTime];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.dValue = [BaseJSON readDoubleDef:[RootMap objectForKey:@"dValue"] required:false def:self.dValue];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IndustryCompare
- (id) init
{
    if (self = [super init])
    {
        self.sCompareType = @"";
        self.sUpdateTime = @"";
        self.vtCompItem = [NSMutableArray arrayWithCapacity:0];
        self.sAAvgValue = @"";
        self.dAAvgValue = 0;
        self.sBAvgValue = @"";
        self.dBAvgValue = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sCompareType != nil)
    {
        [ostream writeString: 0 value: self.sCompareType];
    }
    if (self.sUpdateTime != nil)
    {
        [ostream writeString: 1 value: self.sUpdateTime];
    }
    if (self.vtCompItem != nil)
    {
        [ostream writeList: 2 value: self.vtCompItem VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompareItem class]]];
    }
    if (self.sAAvgValue != nil)
    {
        [ostream writeString: 3 value: self.sAAvgValue];
    }
    [ostream writeDouble: 4 value: self.dAAvgValue];
    if (self.sBAvgValue != nil)
    {
        [ostream writeString: 5 value: self.sBAvgValue];
    }
    [ostream writeDouble: 6 value: self.dBAvgValue];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IndustryCompare *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sCompareType = [istream readStringDef: 0 required: false def: self.sCompareType];
    self.sUpdateTime = [istream readStringDef: 1 required: false def: self.sUpdateTime];
    self.vtCompItem = [istream readListDef: 2 required: false def: self.vtCompItem VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompareItem class]]];
    self.sAAvgValue = [istream readStringDef: 3 required: false def: self.sAAvgValue];
    self.dAAvgValue = [istream readDoubleDef: 4 required: false def: self.dAAvgValue];
    self.sBAvgValue = [istream readStringDef: 5 required: false def: self.sBAvgValue];
    self.dBAvgValue = [istream readDoubleDef: 6 required: false def: self.dBAvgValue];
    
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
    [JsonRoot append:@"sCompareType" value : [BaseJSON writeString : self.sCompareType]];
    [JsonRoot append:@"sUpdateTime" value : [BaseJSON writeString : self.sUpdateTime]];
    [JsonRoot append:@"vtCompItem" value : [BaseJSON writeList : self.vtCompItem VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompareItem class]]]];
    [JsonRoot append:@"sAAvgValue" value : [BaseJSON writeString : self.sAAvgValue]];
    [JsonRoot append:@"dAAvgValue" value : [BaseJSON writeDouble : self.dAAvgValue]];
    [JsonRoot append:@"sBAvgValue" value : [BaseJSON writeString : self.sBAvgValue]];
    [JsonRoot append:@"dBAvgValue" value : [BaseJSON writeDouble : self.dBAvgValue]];
    return JsonRoot;
}

- (IndustryCompare *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sCompareType = [BaseJSON readStringDef:[RootMap objectForKey:@"sCompareType"] required:false def:self.sCompareType];
    self.sUpdateTime = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpdateTime"] required:false def:self.sUpdateTime];
    self.vtCompItem = [BaseJSON readListDef:[RootMap objectForKey:@"vtCompItem"] required:false def:self.vtCompItem VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompareItem class]]];
    self.sAAvgValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sAAvgValue"] required:false def:self.sAAvgValue];
    self.dAAvgValue = [BaseJSON readDoubleDef:[RootMap objectForKey:@"dAAvgValue"] required:false def:self.dAAvgValue];
    self.sBAvgValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sBAvgValue"] required:false def:self.sBAvgValue];
    self.dBAvgValue = [BaseJSON readDoubleDef:[RootMap objectForKey:@"dBAvgValue"] required:false def:self.dBAvgValue];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IndustryCompareList
- (id) init
{
    if (self = [super init])
    {
        self.vIndustryCompare = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vIndustryCompare != nil)
    {
        [ostream writeList: 0 value: self.vIndustryCompare VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompare class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IndustryCompareList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vIndustryCompare = [istream readListDef: 0 required: false def: self.vIndustryCompare VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompare class]]];
    
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
    [JsonRoot append:@"vIndustryCompare" value : [BaseJSON writeList : self.vIndustryCompare VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompare class]]]];
    return JsonRoot;
}

- (IndustryCompareList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vIndustryCompare = [BaseJSON readListDef:[RootMap objectForKey:@"vIndustryCompare"] required:false def:self.vIndustryCompare VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompare class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MainHolderDetail
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.sDateDesc = @"";
        self.fRate = 0;
        self.fPrice = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDate != nil)
    {
        [ostream writeString: 0 value: self.sDate];
    }
    if (self.sDateDesc != nil)
    {
        [ostream writeString: 1 value: self.sDateDesc];
    }
    [ostream writeFloat: 2 value: self.fRate];
    [ostream writeFloat: 3 value: self.fPrice];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MainHolderDetail *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.sDateDesc = [istream readStringDef: 1 required: false def: self.sDateDesc];
    self.fRate = [istream readFloatDef: 2 required: false def: self.fRate];
    self.fPrice = [istream readFloatDef: 3 required: false def: self.fPrice];
    
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
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"sDateDesc" value : [BaseJSON writeString : self.sDateDesc]];
    [JsonRoot append:@"fRate" value : [BaseJSON writeFloat : self.fRate]];
    [JsonRoot append:@"fPrice" value : [BaseJSON writeFloat : self.fPrice]];
    return JsonRoot;
}

- (MainHolderDetail *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.sDateDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDateDesc"] required:false def:self.sDateDesc];
    self.fRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRate"] required:false def:self.fRate];
    self.fPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPrice"] required:false def:self.fPrice];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MainHolder
- (id) init
{
    if (self = [super init])
    {
        self.iHolders = 0;
        self.fTotalCount = 0;
        self.fChange = 0;
        self.fRate = 0;
        self.vtMainHolderDetail = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iHolders];
    [ostream writeFloat: 1 value: self.fTotalCount];
    [ostream writeFloat: 2 value: self.fChange];
    [ostream writeFloat: 3 value: self.fRate];
    if (self.vtMainHolderDetail != nil)
    {
        [ostream writeList: 4 value: self.vtMainHolderDetail VAR_TYPE: [THOTH_LIST CREATE: [MainHolderDetail class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MainHolder *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iHolders = [istream readInt32Def: 0 required: false def: self.iHolders];
    self.fTotalCount = [istream readFloatDef: 1 required: false def: self.fTotalCount];
    self.fChange = [istream readFloatDef: 2 required: false def: self.fChange];
    self.fRate = [istream readFloatDef: 3 required: false def: self.fRate];
    self.vtMainHolderDetail = [istream readListDef: 4 required: false def: self.vtMainHolderDetail VAR_TYPE: [THOTH_LIST CREATE: [MainHolderDetail class]]];
    
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
    [JsonRoot append:@"iHolders" value : [BaseJSON writeInt32 : self.iHolders]];
    [JsonRoot append:@"fTotalCount" value : [BaseJSON writeFloat : self.fTotalCount]];
    [JsonRoot append:@"fChange" value : [BaseJSON writeFloat : self.fChange]];
    [JsonRoot append:@"fRate" value : [BaseJSON writeFloat : self.fRate]];
    [JsonRoot append:@"vtMainHolderDetail" value : [BaseJSON writeList : self.vtMainHolderDetail VAR_TYPE: [THOTH_LIST CREATE: [MainHolderDetail class]]]];
    return JsonRoot;
}

- (MainHolder *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iHolders = [BaseJSON readInt32Def:[RootMap objectForKey:@"iHolders"] required:false def:self.iHolders];
    self.fTotalCount = [BaseJSON readFloatDef:[RootMap objectForKey:@"fTotalCount"] required:false def:self.fTotalCount];
    self.fChange = [BaseJSON readFloatDef:[RootMap objectForKey:@"fChange"] required:false def:self.fChange];
    self.fRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRate"] required:false def:self.fRate];
    self.vtMainHolderDetail = [BaseJSON readListDef:[RootMap objectForKey:@"vtMainHolderDetail"] required:false def:self.vtMainHolderDetail VAR_TYPE: [THOTH_LIST CREATE: [MainHolderDetail class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CompanyDesc
- (id) init
{
    if (self = [super init])
    {
        self.stCompanyProfile = [[CompanyProfile alloc] init];
        self.vPrimeOperatingRevenue = [NSMutableArray arrayWithCapacity:0];
        self.vDividendPayingPlacing = [NSMutableArray arrayWithCapacity:0];
        self.stCapitalStructure = [[CapitalStructure alloc] init];
        self.vTopShareholder = [NSMutableArray arrayWithCapacity:0];
        self.vFundsholder = [NSMutableArray arrayWithCapacity:0];
        self.vConcInfo = [NSMutableArray arrayWithCapacity:0];
        self.sTopShareholderDate = @"";
        self.sFundsholderDate = @"";
        self.vPlateInfo = [NSMutableArray arrayWithCapacity:0];
        self.vtSExecutive = [NSMutableArray arrayWithCapacity:0];
        self.vtIndustryCompare = [NSMutableArray arrayWithCapacity:0];
        self.stMainHolder = [[MainHolder alloc] init];
        self.vTopHolder = [NSMutableArray arrayWithCapacity:0];
        self.sTopHolderDate = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stCompanyProfile != nil)
    {
        [ostream writeMessage: 0 value: self.stCompanyProfile];
    }
    if (self.vPrimeOperatingRevenue != nil)
    {
        [ostream writeList: 1 value: self.vPrimeOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [PrimeOperatingRevenue class]]];
    }
    if (self.vDividendPayingPlacing != nil)
    {
        [ostream writeList: 2 value: self.vDividendPayingPlacing VAR_TYPE: [THOTH_LIST CREATE: [DividendPayingPlacing class]]];
    }
    if (self.stCapitalStructure != nil)
    {
        [ostream writeMessage: 3 value: self.stCapitalStructure];
    }
    if (self.vTopShareholder != nil)
    {
        [ostream writeList: 4 value: self.vTopShareholder VAR_TYPE: [THOTH_LIST CREATE: [TopShareholder class]]];
    }
    if (self.vFundsholder != nil)
    {
        [ostream writeList: 5 value: self.vFundsholder VAR_TYPE: [THOTH_LIST CREATE: [Fundsholder class]]];
    }
    if (self.vConcInfo != nil)
    {
        [ostream writeList: 6 value: self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    }
    if (self.sTopShareholderDate != nil)
    {
        [ostream writeString: 7 value: self.sTopShareholderDate];
    }
    if (self.sFundsholderDate != nil)
    {
        [ostream writeString: 8 value: self.sFundsholderDate];
    }
    if (self.vPlateInfo != nil)
    {
        [ostream writeList: 9 value: self.vPlateInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]];
    }
    if (self.vtSExecutive != nil)
    {
        [ostream writeList: 10 value: self.vtSExecutive VAR_TYPE: [THOTH_LIST CREATE: [SeniorExecutive class]]];
    }
    if (self.vtIndustryCompare != nil)
    {
        [ostream writeList: 11 value: self.vtIndustryCompare VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompare class]]];
    }
    if (self.stMainHolder != nil)
    {
        [ostream writeMessage: 12 value: self.stMainHolder];
    }
    if (self.vTopHolder != nil)
    {
        [ostream writeList: 13 value: self.vTopHolder VAR_TYPE: [THOTH_LIST CREATE: [TopShareholder class]]];
    }
    if (self.sTopHolderDate != nil)
    {
        [ostream writeString: 14 value: self.sTopHolderDate];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CompanyDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stCompanyProfile = (CompanyProfile*)[istream readMessageDef: 0 required: false def: self.stCompanyProfile VAR_TYPE: [CompanyProfile class]];
    self.vPrimeOperatingRevenue = [istream readListDef: 1 required: false def: self.vPrimeOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [PrimeOperatingRevenue class]]];
    self.vDividendPayingPlacing = [istream readListDef: 2 required: false def: self.vDividendPayingPlacing VAR_TYPE: [THOTH_LIST CREATE: [DividendPayingPlacing class]]];
    self.stCapitalStructure = (CapitalStructure*)[istream readMessageDef: 3 required: false def: self.stCapitalStructure VAR_TYPE: [CapitalStructure class]];
    self.vTopShareholder = [istream readListDef: 4 required: false def: self.vTopShareholder VAR_TYPE: [THOTH_LIST CREATE: [TopShareholder class]]];
    self.vFundsholder = [istream readListDef: 5 required: false def: self.vFundsholder VAR_TYPE: [THOTH_LIST CREATE: [Fundsholder class]]];
    self.vConcInfo = [istream readListDef: 6 required: false def: self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    self.sTopShareholderDate = [istream readStringDef: 7 required: false def: self.sTopShareholderDate];
    self.sFundsholderDate = [istream readStringDef: 8 required: false def: self.sFundsholderDate];
    self.vPlateInfo = [istream readListDef: 9 required: false def: self.vPlateInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]];
    self.vtSExecutive = [istream readListDef: 10 required: false def: self.vtSExecutive VAR_TYPE: [THOTH_LIST CREATE: [SeniorExecutive class]]];
    self.vtIndustryCompare = [istream readListDef: 11 required: false def: self.vtIndustryCompare VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompare class]]];
    self.stMainHolder = (MainHolder*)[istream readMessageDef: 12 required: false def: self.stMainHolder VAR_TYPE: [MainHolder class]];
    self.vTopHolder = [istream readListDef: 13 required: false def: self.vTopHolder VAR_TYPE: [THOTH_LIST CREATE: [TopShareholder class]]];
    self.sTopHolderDate = [istream readStringDef: 14 required: false def: self.sTopHolderDate];
    
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
    [JsonRoot append:@"stCompanyProfile" value : [BaseJSON writeMessage : self.stCompanyProfile]];
    [JsonRoot append:@"vPrimeOperatingRevenue" value : [BaseJSON writeList : self.vPrimeOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [PrimeOperatingRevenue class]]]];
    [JsonRoot append:@"vDividendPayingPlacing" value : [BaseJSON writeList : self.vDividendPayingPlacing VAR_TYPE: [THOTH_LIST CREATE: [DividendPayingPlacing class]]]];
    [JsonRoot append:@"stCapitalStructure" value : [BaseJSON writeMessage : self.stCapitalStructure]];
    [JsonRoot append:@"vTopShareholder" value : [BaseJSON writeList : self.vTopShareholder VAR_TYPE: [THOTH_LIST CREATE: [TopShareholder class]]]];
    [JsonRoot append:@"vFundsholder" value : [BaseJSON writeList : self.vFundsholder VAR_TYPE: [THOTH_LIST CREATE: [Fundsholder class]]]];
    [JsonRoot append:@"vConcInfo" value : [BaseJSON writeList : self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]]];
    [JsonRoot append:@"sTopShareholderDate" value : [BaseJSON writeString : self.sTopShareholderDate]];
    [JsonRoot append:@"sFundsholderDate" value : [BaseJSON writeString : self.sFundsholderDate]];
    [JsonRoot append:@"vPlateInfo" value : [BaseJSON writeList : self.vPlateInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]]];
    [JsonRoot append:@"vtSExecutive" value : [BaseJSON writeList : self.vtSExecutive VAR_TYPE: [THOTH_LIST CREATE: [SeniorExecutive class]]]];
    [JsonRoot append:@"vtIndustryCompare" value : [BaseJSON writeList : self.vtIndustryCompare VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompare class]]]];
    [JsonRoot append:@"stMainHolder" value : [BaseJSON writeMessage : self.stMainHolder]];
    [JsonRoot append:@"vTopHolder" value : [BaseJSON writeList : self.vTopHolder VAR_TYPE: [THOTH_LIST CREATE: [TopShareholder class]]]];
    [JsonRoot append:@"sTopHolderDate" value : [BaseJSON writeString : self.sTopHolderDate]];
    return JsonRoot;
}

- (CompanyDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stCompanyProfile = [BaseJSON readMessageDef:[RootMap objectForKey:@"stCompanyProfile"] required:false def:self.stCompanyProfile VAR_TYPE: [CompanyProfile class]];
    self.vPrimeOperatingRevenue = [BaseJSON readListDef:[RootMap objectForKey:@"vPrimeOperatingRevenue"] required:false def:self.vPrimeOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [PrimeOperatingRevenue class]]];
    self.vDividendPayingPlacing = [BaseJSON readListDef:[RootMap objectForKey:@"vDividendPayingPlacing"] required:false def:self.vDividendPayingPlacing VAR_TYPE: [THOTH_LIST CREATE: [DividendPayingPlacing class]]];
    self.stCapitalStructure = [BaseJSON readMessageDef:[RootMap objectForKey:@"stCapitalStructure"] required:false def:self.stCapitalStructure VAR_TYPE: [CapitalStructure class]];
    self.vTopShareholder = [BaseJSON readListDef:[RootMap objectForKey:@"vTopShareholder"] required:false def:self.vTopShareholder VAR_TYPE: [THOTH_LIST CREATE: [TopShareholder class]]];
    self.vFundsholder = [BaseJSON readListDef:[RootMap objectForKey:@"vFundsholder"] required:false def:self.vFundsholder VAR_TYPE: [THOTH_LIST CREATE: [Fundsholder class]]];
    self.vConcInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vConcInfo"] required:false def:self.vConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    self.sTopShareholderDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sTopShareholderDate"] required:false def:self.sTopShareholderDate];
    self.sFundsholderDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sFundsholderDate"] required:false def:self.sFundsholderDate];
    self.vPlateInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vPlateInfo"] required:false def:self.vPlateInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]];
    self.vtSExecutive = [BaseJSON readListDef:[RootMap objectForKey:@"vtSExecutive"] required:false def:self.vtSExecutive VAR_TYPE: [THOTH_LIST CREATE: [SeniorExecutive class]]];
    self.vtIndustryCompare = [BaseJSON readListDef:[RootMap objectForKey:@"vtIndustryCompare"] required:false def:self.vtIndustryCompare VAR_TYPE: [THOTH_LIST CREATE: [IndustryCompare class]]];
    self.stMainHolder = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMainHolder"] required:false def:self.stMainHolder VAR_TYPE: [MainHolder class]];
    self.vTopHolder = [BaseJSON readListDef:[RootMap objectForKey:@"vTopHolder"] required:false def:self.vTopHolder VAR_TYPE: [THOTH_LIST CREATE: [TopShareholder class]]];
    self.sTopHolderDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sTopHolderDate"] required:false def:self.sTopHolderDate];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CompanyReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CompanyReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    
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
    return JsonRoot;
}

- (CompanyReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
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
@implementation CompanyRsp
- (id) init
{
    if (self = [super init])
    {
        self.stCompanyDesc = [[CompanyDesc alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stCompanyDesc != nil)
    {
        [ostream writeMessage: 0 value: self.stCompanyDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CompanyRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stCompanyDesc = (CompanyDesc*)[istream readMessageDef: 0 required: false def: self.stCompanyDesc VAR_TYPE: [CompanyDesc class]];
    
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
    [JsonRoot append:@"stCompanyDesc" value : [BaseJSON writeMessage : self.stCompanyDesc]];
    return JsonRoot;
}

- (CompanyRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stCompanyDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stCompanyDesc"] required:false def:self.stCompanyDesc VAR_TYPE: [CompanyDesc class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecUpdowns
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.sWeekUd = @"";
        self.sMonthUd = @"";
        self.sThreeMonthUd = @"";
        self.sHalfYearUd = @"";
        self.sYearUd = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSecName != nil)
    {
        [ostream writeString: 0 value: self.sSecName];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.sWeekUd != nil)
    {
        [ostream writeString: 2 value: self.sWeekUd];
    }
    if (self.sMonthUd != nil)
    {
        [ostream writeString: 3 value: self.sMonthUd];
    }
    if (self.sThreeMonthUd != nil)
    {
        [ostream writeString: 4 value: self.sThreeMonthUd];
    }
    if (self.sHalfYearUd != nil)
    {
        [ostream writeString: 5 value: self.sHalfYearUd];
    }
    if (self.sYearUd != nil)
    {
        [ostream writeString: 6 value: self.sYearUd];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecUpdowns *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sWeekUd = [istream readStringDef: 2 required: false def: self.sWeekUd];
    self.sMonthUd = [istream readStringDef: 3 required: false def: self.sMonthUd];
    self.sThreeMonthUd = [istream readStringDef: 4 required: false def: self.sThreeMonthUd];
    self.sHalfYearUd = [istream readStringDef: 5 required: false def: self.sHalfYearUd];
    self.sYearUd = [istream readStringDef: 6 required: false def: self.sYearUd];
    
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
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sWeekUd" value : [BaseJSON writeString : self.sWeekUd]];
    [JsonRoot append:@"sMonthUd" value : [BaseJSON writeString : self.sMonthUd]];
    [JsonRoot append:@"sThreeMonthUd" value : [BaseJSON writeString : self.sThreeMonthUd]];
    [JsonRoot append:@"sHalfYearUd" value : [BaseJSON writeString : self.sHalfYearUd]];
    [JsonRoot append:@"sYearUd" value : [BaseJSON writeString : self.sYearUd]];
    return JsonRoot;
}

- (SecUpdowns *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sWeekUd = [BaseJSON readStringDef:[RootMap objectForKey:@"sWeekUd"] required:false def:self.sWeekUd];
    self.sMonthUd = [BaseJSON readStringDef:[RootMap objectForKey:@"sMonthUd"] required:false def:self.sMonthUd];
    self.sThreeMonthUd = [BaseJSON readStringDef:[RootMap objectForKey:@"sThreeMonthUd"] required:false def:self.sThreeMonthUd];
    self.sHalfYearUd = [BaseJSON readStringDef:[RootMap objectForKey:@"sHalfYearUd"] required:false def:self.sHalfYearUd];
    self.sYearUd = [BaseJSON readStringDef:[RootMap objectForKey:@"sYearUd"] required:false def:self.sYearUd];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StocksUpdownsReq
- (id) init
{
    if (self = [super init])
    {
        self.vtDtSecCode = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtDtSecCode != nil)
    {
        [ostream writeList: 0 value: self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StocksUpdownsReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtDtSecCode = [istream readListDef: 0 required: false def: self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"vtDtSecCode" value : [BaseJSON writeList : self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (StocksUpdownsReq *) readFromMap : (NSMutableDictionary *) RootMap
{
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
@implementation StocksUpdownsRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtSecUpdowns = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtSecUpdowns != nil)
    {
        [ostream writeList: 0 value: self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StocksUpdownsRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtSecUpdowns = [istream readListDef: 0 required: false def: self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"vtSecUpdowns" value : [BaseJSON writeList : self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (StocksUpdownsRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtSecUpdowns = [BaseJSON readListDef:[RootMap objectForKey:@"vtSecUpdowns"] required:false def:self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RelateStocksUpdownsReq
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

- (RelateStocksUpdownsReq *) read: (BaseDecodeStream *)istream
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

- (RelateStocksUpdownsReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation RelateStocksUpdownsRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtSecUpdowns = [NSMutableArray arrayWithCapacity:0];
        self.iUpdateTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtSecUpdowns != nil)
    {
        [ostream writeList: 0 value: self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [SecUpdowns class]]];
    }
    [ostream writeInt32: 1 value: self.iUpdateTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RelateStocksUpdownsRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtSecUpdowns = [istream readListDef: 0 required: false def: self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [SecUpdowns class]]];
    self.iUpdateTime = [istream readInt32Def: 1 required: false def: self.iUpdateTime];
    
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
    [JsonRoot append:@"vtSecUpdowns" value : [BaseJSON writeList : self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [SecUpdowns class]]]];
    [JsonRoot append:@"iUpdateTime" value : [BaseJSON writeInt32 : self.iUpdateTime]];
    return JsonRoot;
}

- (RelateStocksUpdownsRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtSecUpdowns = [BaseJSON readListDef:[RootMap objectForKey:@"vtSecUpdowns"] required:false def:self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [SecUpdowns class]]];
    self.iUpdateTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpdateTime"] required:false def:self.iUpdateTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RelateStocksSimpleFinanceAnalysisReq
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

- (RelateStocksSimpleFinanceAnalysisReq *) read: (BaseDecodeStream *)istream
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

- (RelateStocksSimpleFinanceAnalysisReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation SimpleFinancialAnalysis
- (id) init
{
    if (self = [super init])
    {
        self.sStockName = @"";
        self.sDtSecCode = @"";
        self.sROE = @"";
        self.sGrossRevenue = @"";
        self.sNetProfit = @"";
        self.fNAPS = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStockName != nil)
    {
        [ostream writeString: 0 value: self.sStockName];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.sROE != nil)
    {
        [ostream writeString: 2 value: self.sROE];
    }
    if (self.sGrossRevenue != nil)
    {
        [ostream writeString: 3 value: self.sGrossRevenue];
    }
    if (self.sNetProfit != nil)
    {
        [ostream writeString: 4 value: self.sNetProfit];
    }
    [ostream writeFloat: 5 value: self.fNAPS];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SimpleFinancialAnalysis *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStockName = [istream readStringDef: 0 required: false def: self.sStockName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sROE = [istream readStringDef: 2 required: false def: self.sROE];
    self.sGrossRevenue = [istream readStringDef: 3 required: false def: self.sGrossRevenue];
    self.sNetProfit = [istream readStringDef: 4 required: false def: self.sNetProfit];
    self.fNAPS = [istream readFloatDef: 5 required: false def: self.fNAPS];
    
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
    [JsonRoot append:@"sStockName" value : [BaseJSON writeString : self.sStockName]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sROE" value : [BaseJSON writeString : self.sROE]];
    [JsonRoot append:@"sGrossRevenue" value : [BaseJSON writeString : self.sGrossRevenue]];
    [JsonRoot append:@"sNetProfit" value : [BaseJSON writeString : self.sNetProfit]];
    [JsonRoot append:@"fNAPS" value : [BaseJSON writeFloat : self.fNAPS]];
    return JsonRoot;
}

- (SimpleFinancialAnalysis *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sStockName = [BaseJSON readStringDef:[RootMap objectForKey:@"sStockName"] required:false def:self.sStockName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sROE = [BaseJSON readStringDef:[RootMap objectForKey:@"sROE"] required:false def:self.sROE];
    self.sGrossRevenue = [BaseJSON readStringDef:[RootMap objectForKey:@"sGrossRevenue"] required:false def:self.sGrossRevenue];
    self.sNetProfit = [BaseJSON readStringDef:[RootMap objectForKey:@"sNetProfit"] required:false def:self.sNetProfit];
    self.fNAPS = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNAPS"] required:false def:self.fNAPS];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RelateStocksSimpleFinanceAnalysisRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtFinancialAnalysis = [NSMutableArray arrayWithCapacity:0];
        self.iUpdateTime = 0;
        self.sPlatePb = @"";
        self.sPlatePe = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtFinancialAnalysis != nil)
    {
        [ostream writeList: 0 value: self.vtFinancialAnalysis VAR_TYPE: [THOTH_LIST CREATE: [SimpleFinancialAnalysis class]]];
    }
    [ostream writeInt32: 1 value: self.iUpdateTime];
    if (self.sPlatePb != nil)
    {
        [ostream writeString: 2 value: self.sPlatePb];
    }
    if (self.sPlatePe != nil)
    {
        [ostream writeString: 3 value: self.sPlatePe];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RelateStocksSimpleFinanceAnalysisRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtFinancialAnalysis = [istream readListDef: 0 required: false def: self.vtFinancialAnalysis VAR_TYPE: [THOTH_LIST CREATE: [SimpleFinancialAnalysis class]]];
    self.iUpdateTime = [istream readInt32Def: 1 required: false def: self.iUpdateTime];
    self.sPlatePb = [istream readStringDef: 2 required: false def: self.sPlatePb];
    self.sPlatePe = [istream readStringDef: 3 required: false def: self.sPlatePe];
    
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
    [JsonRoot append:@"vtFinancialAnalysis" value : [BaseJSON writeList : self.vtFinancialAnalysis VAR_TYPE: [THOTH_LIST CREATE: [SimpleFinancialAnalysis class]]]];
    [JsonRoot append:@"iUpdateTime" value : [BaseJSON writeInt32 : self.iUpdateTime]];
    [JsonRoot append:@"sPlatePb" value : [BaseJSON writeString : self.sPlatePb]];
    [JsonRoot append:@"sPlatePe" value : [BaseJSON writeString : self.sPlatePe]];
    return JsonRoot;
}

- (RelateStocksSimpleFinanceAnalysisRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtFinancialAnalysis = [BaseJSON readListDef:[RootMap objectForKey:@"vtFinancialAnalysis"] required:false def:self.vtFinancialAnalysis VAR_TYPE: [THOTH_LIST CREATE: [SimpleFinancialAnalysis class]]];
    self.iUpdateTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpdateTime"] required:false def:self.iUpdateTime];
    self.sPlatePb = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlatePb"] required:false def:self.sPlatePb];
    self.sPlatePe = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlatePe"] required:false def:self.sPlatePe];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TagInfo
- (id) init
{
    if (self = [super init])
    {
        self.sTagName = @"";
        self.eTagType = E_TT_COMMON;
        self.eAttiType = ATT_NULL;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTagName != nil)
    {
        [ostream writeString: 0 value: self.sTagName];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eTagType];
    [ostream writeInt32: 2 value: (int32_t)self.eAttiType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TagInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTagName = [istream readStringDef: 0 required: false def: self.sTagName];
    self.eTagType = [istream readInt32Def: 1 required: false def: (int32_t)self.eTagType];
    self.eAttiType = [istream readInt32Def: 2 required: false def: (int32_t)self.eAttiType];
    
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
    [JsonRoot append:@"sTagName" value : [BaseJSON writeString : self.sTagName]];
    [JsonRoot append:@"eTagType" value : [BaseJSON writeInt32 : (int32_t)self.eTagType]];
    [JsonRoot append:@"eAttiType" value : [BaseJSON writeInt32 : (int32_t)self.eAttiType]];
    return JsonRoot;
}

- (TagInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTagName = [BaseJSON readStringDef:[RootMap objectForKey:@"sTagName"] required:false def:self.sTagName];
    self.eTagType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eTagType"] required:false def:(int32_t)self.eTagType];
    self.eAttiType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eAttiType"] required:false def:(int32_t)self.eAttiType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecValuation
- (id) init
{
    if (self = [super init])
    {
        self.sStockName = @"";
        self.sDtSecCode = @"";
        self.sMarketValue = @"";
        self.sPe = @"";
        self.sPb = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStockName != nil)
    {
        [ostream writeString: 0 value: self.sStockName];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.sMarketValue != nil)
    {
        [ostream writeString: 2 value: self.sMarketValue];
    }
    if (self.sPe != nil)
    {
        [ostream writeString: 3 value: self.sPe];
    }
    if (self.sPb != nil)
    {
        [ostream writeString: 4 value: self.sPb];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecValuation *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStockName = [istream readStringDef: 0 required: false def: self.sStockName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sMarketValue = [istream readStringDef: 2 required: false def: self.sMarketValue];
    self.sPe = [istream readStringDef: 3 required: false def: self.sPe];
    self.sPb = [istream readStringDef: 4 required: false def: self.sPb];
    
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
    [JsonRoot append:@"sStockName" value : [BaseJSON writeString : self.sStockName]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sMarketValue" value : [BaseJSON writeString : self.sMarketValue]];
    [JsonRoot append:@"sPe" value : [BaseJSON writeString : self.sPe]];
    [JsonRoot append:@"sPb" value : [BaseJSON writeString : self.sPb]];
    return JsonRoot;
}

- (SecValuation *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sStockName = [BaseJSON readStringDef:[RootMap objectForKey:@"sStockName"] required:false def:self.sStockName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sMarketValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sMarketValue"] required:false def:self.sMarketValue];
    self.sPe = [BaseJSON readStringDef:[RootMap objectForKey:@"sPe"] required:false def:self.sPe];
    self.sPb = [BaseJSON readStringDef:[RootMap objectForKey:@"sPb"] required:false def:self.sPb];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RelaSecValuationReq
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

- (RelaSecValuationReq *) read: (BaseDecodeStream *)istream
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

- (RelaSecValuationReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation RelaSecValuationRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtSecValuation = [NSMutableArray arrayWithCapacity:0];
        self.sPeDesc = @"";
        self.sPbDesc = @"";
        self.iUpdateTime = 0;
        self.sPlatePb = @"";
        self.sPlatePe = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtSecValuation != nil)
    {
        [ostream writeList: 0 value: self.vtSecValuation VAR_TYPE: [THOTH_LIST CREATE: [SecValuation class]]];
    }
    if (self.sPeDesc != nil)
    {
        [ostream writeString: 1 value: self.sPeDesc];
    }
    if (self.sPbDesc != nil)
    {
        [ostream writeString: 2 value: self.sPbDesc];
    }
    [ostream writeInt32: 3 value: self.iUpdateTime];
    if (self.sPlatePb != nil)
    {
        [ostream writeString: 4 value: self.sPlatePb];
    }
    if (self.sPlatePe != nil)
    {
        [ostream writeString: 5 value: self.sPlatePe];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RelaSecValuationRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtSecValuation = [istream readListDef: 0 required: false def: self.vtSecValuation VAR_TYPE: [THOTH_LIST CREATE: [SecValuation class]]];
    self.sPeDesc = [istream readStringDef: 1 required: false def: self.sPeDesc];
    self.sPbDesc = [istream readStringDef: 2 required: false def: self.sPbDesc];
    self.iUpdateTime = [istream readInt32Def: 3 required: false def: self.iUpdateTime];
    self.sPlatePb = [istream readStringDef: 4 required: false def: self.sPlatePb];
    self.sPlatePe = [istream readStringDef: 5 required: false def: self.sPlatePe];
    
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
    [JsonRoot append:@"vtSecValuation" value : [BaseJSON writeList : self.vtSecValuation VAR_TYPE: [THOTH_LIST CREATE: [SecValuation class]]]];
    [JsonRoot append:@"sPeDesc" value : [BaseJSON writeString : self.sPeDesc]];
    [JsonRoot append:@"sPbDesc" value : [BaseJSON writeString : self.sPbDesc]];
    [JsonRoot append:@"iUpdateTime" value : [BaseJSON writeInt32 : self.iUpdateTime]];
    [JsonRoot append:@"sPlatePb" value : [BaseJSON writeString : self.sPlatePb]];
    [JsonRoot append:@"sPlatePe" value : [BaseJSON writeString : self.sPlatePe]];
    return JsonRoot;
}

- (RelaSecValuationRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtSecValuation = [BaseJSON readListDef:[RootMap objectForKey:@"vtSecValuation"] required:false def:self.vtSecValuation VAR_TYPE: [THOTH_LIST CREATE: [SecValuation class]]];
    self.sPeDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sPeDesc"] required:false def:self.sPeDesc];
    self.sPbDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sPbDesc"] required:false def:self.sPbDesc];
    self.iUpdateTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpdateTime"] required:false def:self.iUpdateTime];
    self.sPlatePb = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlatePb"] required:false def:self.sPlatePb];
    self.sPlatePe = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlatePe"] required:false def:self.sPlatePe];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OrgRate
- (id) init
{
    if (self = [super init])
    {
        self.sOrgName = @"";
        self.iRate = 0;
        self.sChange = @"";
        self.sTargetPrice = @"";
        self.iDate = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sOrgName != nil)
    {
        [ostream writeString: 0 value: self.sOrgName];
    }
    [ostream writeInt32: 1 value: self.iRate];
    if (self.sChange != nil)
    {
        [ostream writeString: 2 value: self.sChange];
    }
    if (self.sTargetPrice != nil)
    {
        [ostream writeString: 3 value: self.sTargetPrice];
    }
    [ostream writeInt32: 4 value: self.iDate];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OrgRate *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sOrgName = [istream readStringDef: 0 required: false def: self.sOrgName];
    self.iRate = [istream readInt32Def: 1 required: false def: self.iRate];
    self.sChange = [istream readStringDef: 2 required: false def: self.sChange];
    self.sTargetPrice = [istream readStringDef: 3 required: false def: self.sTargetPrice];
    self.iDate = [istream readInt32Def: 4 required: false def: self.iDate];
    
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
    [JsonRoot append:@"sOrgName" value : [BaseJSON writeString : self.sOrgName]];
    [JsonRoot append:@"iRate" value : [BaseJSON writeInt32 : self.iRate]];
    [JsonRoot append:@"sChange" value : [BaseJSON writeString : self.sChange]];
    [JsonRoot append:@"sTargetPrice" value : [BaseJSON writeString : self.sTargetPrice]];
    [JsonRoot append:@"iDate" value : [BaseJSON writeInt32 : self.iDate]];
    return JsonRoot;
}

- (OrgRate *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sOrgName = [BaseJSON readStringDef:[RootMap objectForKey:@"sOrgName"] required:false def:self.sOrgName];
    self.iRate = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRate"] required:false def:self.iRate];
    self.sChange = [BaseJSON readStringDef:[RootMap objectForKey:@"sChange"] required:false def:self.sChange];
    self.sTargetPrice = [BaseJSON readStringDef:[RootMap objectForKey:@"sTargetPrice"] required:false def:self.sTargetPrice];
    self.iDate = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDate"] required:false def:self.iDate];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecRateReq
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

- (SecRateReq *) read: (BaseDecodeStream *)istream
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

- (SecRateReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation SecRateRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtOrgRate = [NSMutableArray arrayWithCapacity:0];
        self.sDesc = @"";
        self.fRate = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtOrgRate != nil)
    {
        [ostream writeList: 0 value: self.vtOrgRate VAR_TYPE: [THOTH_LIST CREATE: [OrgRate class]]];
    }
    if (self.sDesc != nil)
    {
        [ostream writeString: 1 value: self.sDesc];
    }
    [ostream writeFloat: 2 value: self.fRate];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecRateRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtOrgRate = [istream readListDef: 0 required: false def: self.vtOrgRate VAR_TYPE: [THOTH_LIST CREATE: [OrgRate class]]];
    self.sDesc = [istream readStringDef: 1 required: false def: self.sDesc];
    self.fRate = [istream readFloatDef: 2 required: false def: self.fRate];
    
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
    [JsonRoot append:@"vtOrgRate" value : [BaseJSON writeList : self.vtOrgRate VAR_TYPE: [THOTH_LIST CREATE: [OrgRate class]]]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    [JsonRoot append:@"fRate" value : [BaseJSON writeFloat : self.fRate]];
    return JsonRoot;
}

- (SecRateRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtOrgRate = [BaseJSON readListDef:[RootMap objectForKey:@"vtOrgRate"] required:false def:self.vtOrgRate VAR_TYPE: [THOTH_LIST CREATE: [OrgRate class]]];
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.fRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRate"] required:false def:self.fRate];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation UserInfoCache
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iUpdateTime = 0;
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
    [ostream writeInt32: 1 value: self.iUpdateTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UserInfoCache *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iUpdateTime = [istream readInt32Def: 1 required: false def: self.iUpdateTime];
    
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
    [JsonRoot append:@"iUpdateTime" value : [BaseJSON writeInt32 : self.iUpdateTime]];
    return JsonRoot;
}

- (UserInfoCache *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iUpdateTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpdateTime"] required:false def:self.iUpdateTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisMonthQuotaInfo
- (id) init
{
    if (self = [super init])
    {
        self.iYear = 0;
        self.fRisePct = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iYear];
    [ostream writeFloat: 1 value: self.fRisePct];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisMonthQuotaInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iYear = [istream readInt32Def: 0 required: false def: self.iYear];
    self.fRisePct = [istream readFloatDef: 1 required: false def: self.fRisePct];
    
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
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"fRisePct" value : [BaseJSON writeFloat : self.fRisePct]];
    return JsonRoot;
}

- (SecHisMonthQuotaInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.fRisePct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRisePct"] required:false def:self.fRisePct];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisAvgRiseQuotaInfo
- (id) init
{
    if (self = [super init])
    {
        self.iMonth = 0;
        self.fRisePct = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iMonth];
    [ostream writeFloat: 1 value: self.fRisePct];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisAvgRiseQuotaInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iMonth = [istream readInt32Def: 0 required: false def: self.iMonth];
    self.fRisePct = [istream readFloatDef: 1 required: false def: self.fRisePct];
    
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
    [JsonRoot append:@"iMonth" value : [BaseJSON writeInt32 : self.iMonth]];
    [JsonRoot append:@"fRisePct" value : [BaseJSON writeFloat : self.fRisePct]];
    return JsonRoot;
}

- (SecHisAvgRiseQuotaInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonth"] required:false def:self.iMonth];
    self.fRisePct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRisePct"] required:false def:self.fRisePct];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisAvgRiseChanceQuotaInfo
- (id) init
{
    if (self = [super init])
    {
        self.iMonth = 0;
        self.fRiseChance = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iMonth];
    [ostream writeFloat: 1 value: self.fRiseChance];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisAvgRiseChanceQuotaInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iMonth = [istream readInt32Def: 0 required: false def: self.iMonth];
    self.fRiseChance = [istream readFloatDef: 1 required: false def: self.fRiseChance];
    
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
    [JsonRoot append:@"iMonth" value : [BaseJSON writeInt32 : self.iMonth]];
    [JsonRoot append:@"fRiseChance" value : [BaseJSON writeFloat : self.fRiseChance]];
    return JsonRoot;
}

- (SecHisAvgRiseChanceQuotaInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonth"] required:false def:self.iMonth];
    self.fRiseChance = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRiseChance"] required:false def:self.fRiseChance];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisMonthQuota
- (id) init
{
    if (self = [super init])
    {
        self.vMonthInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vMonthInfo != nil)
    {
        [ostream writeList: 0 value: self.vMonthInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisMonthQuotaInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisMonthQuota *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vMonthInfo = [istream readListDef: 0 required: false def: self.vMonthInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisMonthQuotaInfo class]]];
    
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
    [JsonRoot append:@"vMonthInfo" value : [BaseJSON writeList : self.vMonthInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisMonthQuotaInfo class]]]];
    return JsonRoot;
}

- (SecHisMonthQuota *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vMonthInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vMonthInfo"] required:false def:self.vMonthInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisMonthQuotaInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisSingalQuota
- (id) init
{
    if (self = [super init])
    {
        self.sDesc = @"";
        self.vInfo = [NSMutableArray arrayWithCapacity:0];
        self.sSelectName = @"";
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
    if (self.vInfo != nil)
    {
        [ostream writeList: 1 value: self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisMonthQuotaInfo class]]];
    }
    if (self.sSelectName != nil)
    {
        [ostream writeString: 2 value: self.sSelectName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisSingalQuota *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDesc = [istream readStringDef: 0 required: false def: self.sDesc];
    self.vInfo = [istream readListDef: 1 required: false def: self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisMonthQuotaInfo class]]];
    self.sSelectName = [istream readStringDef: 2 required: false def: self.sSelectName];
    
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
    [JsonRoot append:@"vInfo" value : [BaseJSON writeList : self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisMonthQuotaInfo class]]]];
    [JsonRoot append:@"sSelectName" value : [BaseJSON writeString : self.sSelectName]];
    return JsonRoot;
}

- (SecHisSingalQuota *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.vInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vInfo"] required:false def:self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisMonthQuotaInfo class]]];
    self.sSelectName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSelectName"] required:false def:self.sSelectName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecLHHisQuota
- (id) init
{
    if (self = [super init])
    {
        self.sMainTitle = @"";
        self.vQuota = [NSMutableArray arrayWithCapacity:0];
        self.sBannerUrl = @"";
        self.sBannerDesc = @"";
        self.iType = 0;
        self.sBannerSkipUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sMainTitle != nil)
    {
        [ostream writeString: 0 value: self.sMainTitle];
    }
    if (self.vQuota != nil)
    {
        [ostream writeList: 1 value: self.vQuota VAR_TYPE: [THOTH_LIST CREATE: [SecHisSingalQuota class]]];
    }
    if (self.sBannerUrl != nil)
    {
        [ostream writeString: 2 value: self.sBannerUrl];
    }
    if (self.sBannerDesc != nil)
    {
        [ostream writeString: 3 value: self.sBannerDesc];
    }
    [ostream writeInt32: 4 value: self.iType];
    if (self.sBannerSkipUrl != nil)
    {
        [ostream writeString: 5 value: self.sBannerSkipUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecLHHisQuota *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sMainTitle = [istream readStringDef: 0 required: false def: self.sMainTitle];
    self.vQuota = [istream readListDef: 1 required: false def: self.vQuota VAR_TYPE: [THOTH_LIST CREATE: [SecHisSingalQuota class]]];
    self.sBannerUrl = [istream readStringDef: 2 required: false def: self.sBannerUrl];
    self.sBannerDesc = [istream readStringDef: 3 required: false def: self.sBannerDesc];
    self.iType = [istream readInt32Def: 4 required: false def: self.iType];
    self.sBannerSkipUrl = [istream readStringDef: 5 required: false def: self.sBannerSkipUrl];
    
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
    [JsonRoot append:@"sMainTitle" value : [BaseJSON writeString : self.sMainTitle]];
    [JsonRoot append:@"vQuota" value : [BaseJSON writeList : self.vQuota VAR_TYPE: [THOTH_LIST CREATE: [SecHisSingalQuota class]]]];
    [JsonRoot append:@"sBannerUrl" value : [BaseJSON writeString : self.sBannerUrl]];
    [JsonRoot append:@"sBannerDesc" value : [BaseJSON writeString : self.sBannerDesc]];
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    [JsonRoot append:@"sBannerSkipUrl" value : [BaseJSON writeString : self.sBannerSkipUrl]];
    return JsonRoot;
}

- (SecLHHisQuota *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sMainTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sMainTitle"] required:false def:self.sMainTitle];
    self.vQuota = [BaseJSON readListDef:[RootMap objectForKey:@"vQuota"] required:false def:self.vQuota VAR_TYPE: [THOTH_LIST CREATE: [SecHisSingalQuota class]]];
    self.sBannerUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sBannerUrl"] required:false def:self.sBannerUrl];
    self.sBannerDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sBannerDesc"] required:false def:self.sBannerDesc];
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    self.sBannerSkipUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sBannerSkipUrl"] required:false def:self.sBannerSkipUrl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisAvgRiseQuota
- (id) init
{
    if (self = [super init])
    {
        self.vAvgRiseInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vAvgRiseInfo != nil)
    {
        [ostream writeList: 0 value: self.vAvgRiseInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisAvgRiseQuotaInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisAvgRiseQuota *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vAvgRiseInfo = [istream readListDef: 0 required: false def: self.vAvgRiseInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisAvgRiseQuotaInfo class]]];
    
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
    [JsonRoot append:@"vAvgRiseInfo" value : [BaseJSON writeList : self.vAvgRiseInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisAvgRiseQuotaInfo class]]]];
    return JsonRoot;
}

- (SecHisAvgRiseQuota *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vAvgRiseInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vAvgRiseInfo"] required:false def:self.vAvgRiseInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisAvgRiseQuotaInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisAvgRiseChanceQuota
- (id) init
{
    if (self = [super init])
    {
        self.vAvgRiseChanceInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vAvgRiseChanceInfo != nil)
    {
        [ostream writeList: 0 value: self.vAvgRiseChanceInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisAvgRiseChanceQuotaInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisAvgRiseChanceQuota *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vAvgRiseChanceInfo = [istream readListDef: 0 required: false def: self.vAvgRiseChanceInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisAvgRiseChanceQuotaInfo class]]];
    
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
    [JsonRoot append:@"vAvgRiseChanceInfo" value : [BaseJSON writeList : self.vAvgRiseChanceInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisAvgRiseChanceQuotaInfo class]]]];
    return JsonRoot;
}

- (SecHisAvgRiseChanceQuota *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vAvgRiseChanceInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vAvgRiseChanceInfo"] required:false def:self.vAvgRiseChanceInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisAvgRiseChanceQuotaInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecHistoryReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iYear = 0;
        self.iMonth = 0;
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
    [ostream writeInt32: 1 value: self.iYear];
    [ostream writeInt32: 2 value: self.iMonth];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecHistoryReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iYear = [istream readInt32Def: 1 required: false def: self.iYear];
    self.iMonth = [istream readInt32Def: 2 required: false def: self.iMonth];
    
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
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iMonth" value : [BaseJSON writeInt32 : self.iMonth]];
    return JsonRoot;
}

- (GetSecHistoryReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonth"] required:false def:self.iMonth];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecHistoryRsp
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.iYear = 0;
        self.iMonth = 0;
        self.stMonthQuota = [[SecHisMonthQuota alloc] init];
        self.stAvgRiseQuota = [[SecHisAvgRiseQuota alloc] init];
        self.stAvgRiseChanceQuota = [[SecHisAvgRiseChanceQuota alloc] init];
        self.stLHQuota = [[SecLHHisQuota alloc] init];
        self.vSubjectQuota = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSecName != nil)
    {
        [ostream writeString: 0 value: self.sSecName];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    [ostream writeInt32: 2 value: self.iYear];
    [ostream writeInt32: 3 value: self.iMonth];
    if (self.stMonthQuota != nil)
    {
        [ostream writeMessage: 4 value: self.stMonthQuota];
    }
    if (self.stAvgRiseQuota != nil)
    {
        [ostream writeMessage: 5 value: self.stAvgRiseQuota];
    }
    if (self.stAvgRiseChanceQuota != nil)
    {
        [ostream writeMessage: 6 value: self.stAvgRiseChanceQuota];
    }
    if (self.stLHQuota != nil)
    {
        [ostream writeMessage: 7 value: self.stLHQuota];
    }
    if (self.vSubjectQuota != nil)
    {
        [ostream writeList: 8 value: self.vSubjectQuota VAR_TYPE: [THOTH_LIST CREATE: [SecLHHisQuota class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecHistoryRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.iYear = [istream readInt32Def: 2 required: false def: self.iYear];
    self.iMonth = [istream readInt32Def: 3 required: false def: self.iMonth];
    self.stMonthQuota = (SecHisMonthQuota*)[istream readMessageDef: 4 required: false def: self.stMonthQuota VAR_TYPE: [SecHisMonthQuota class]];
    self.stAvgRiseQuota = (SecHisAvgRiseQuota*)[istream readMessageDef: 5 required: false def: self.stAvgRiseQuota VAR_TYPE: [SecHisAvgRiseQuota class]];
    self.stAvgRiseChanceQuota = (SecHisAvgRiseChanceQuota*)[istream readMessageDef: 6 required: false def: self.stAvgRiseChanceQuota VAR_TYPE: [SecHisAvgRiseChanceQuota class]];
    self.stLHQuota = (SecLHHisQuota*)[istream readMessageDef: 7 required: false def: self.stLHQuota VAR_TYPE: [SecLHHisQuota class]];
    self.vSubjectQuota = [istream readListDef: 8 required: false def: self.vSubjectQuota VAR_TYPE: [THOTH_LIST CREATE: [SecLHHisQuota class]]];
    
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
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iMonth" value : [BaseJSON writeInt32 : self.iMonth]];
    [JsonRoot append:@"stMonthQuota" value : [BaseJSON writeMessage : self.stMonthQuota]];
    [JsonRoot append:@"stAvgRiseQuota" value : [BaseJSON writeMessage : self.stAvgRiseQuota]];
    [JsonRoot append:@"stAvgRiseChanceQuota" value : [BaseJSON writeMessage : self.stAvgRiseChanceQuota]];
    [JsonRoot append:@"stLHQuota" value : [BaseJSON writeMessage : self.stLHQuota]];
    [JsonRoot append:@"vSubjectQuota" value : [BaseJSON writeList : self.vSubjectQuota VAR_TYPE: [THOTH_LIST CREATE: [SecLHHisQuota class]]]];
    return JsonRoot;
}

- (GetSecHistoryRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonth"] required:false def:self.iMonth];
    self.stMonthQuota = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMonthQuota"] required:false def:self.stMonthQuota VAR_TYPE: [SecHisMonthQuota class]];
    self.stAvgRiseQuota = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAvgRiseQuota"] required:false def:self.stAvgRiseQuota VAR_TYPE: [SecHisAvgRiseQuota class]];
    self.stAvgRiseChanceQuota = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAvgRiseChanceQuota"] required:false def:self.stAvgRiseChanceQuota VAR_TYPE: [SecHisAvgRiseChanceQuota class]];
    self.stLHQuota = [BaseJSON readMessageDef:[RootMap objectForKey:@"stLHQuota"] required:false def:self.stLHQuota VAR_TYPE: [SecLHHisQuota class]];
    self.vSubjectQuota = [BaseJSON readListDef:[RootMap objectForKey:@"vSubjectQuota"] required:false def:self.vSubjectQuota VAR_TYPE: [THOTH_LIST CREATE: [SecLHHisQuota class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisWeekQuotaInfo
- (id) init
{
    if (self = [super init])
    {
        self.iWeek = 0;
        self.fAvgUpPct = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iWeek];
    [ostream writeFloat: 1 value: self.fAvgUpPct];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisWeekQuotaInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iWeek = [istream readInt32Def: 0 required: false def: self.iWeek];
    self.fAvgUpPct = [istream readFloatDef: 1 required: false def: self.fAvgUpPct];
    
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
    [JsonRoot append:@"iWeek" value : [BaseJSON writeInt32 : self.iWeek]];
    [JsonRoot append:@"fAvgUpPct" value : [BaseJSON writeFloat : self.fAvgUpPct]];
    return JsonRoot;
}

- (SecHisWeekQuotaInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iWeek = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWeek"] required:false def:self.iWeek];
    self.fAvgUpPct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAvgUpPct"] required:false def:self.fAvgUpPct];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecHisWeekQuota
- (id) init
{
    if (self = [super init])
    {
        self.vWeekInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vWeekInfo != nil)
    {
        [ostream writeList: 0 value: self.vWeekInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisWeekQuotaInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecHisWeekQuota *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vWeekInfo = [istream readListDef: 0 required: false def: self.vWeekInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisWeekQuotaInfo class]]];
    
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
    [JsonRoot append:@"vWeekInfo" value : [BaseJSON writeList : self.vWeekInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisWeekQuotaInfo class]]]];
    return JsonRoot;
}

- (SecHisWeekQuota *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vWeekInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vWeekInfo"] required:false def:self.vWeekInfo VAR_TYPE: [THOTH_LIST CREATE: [SecHisWeekQuotaInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecWeekHistoryReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iYear = 0;
        self.iWeek = 0;
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
    [ostream writeInt32: 1 value: self.iYear];
    [ostream writeInt32: 2 value: self.iWeek];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecWeekHistoryReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iYear = [istream readInt32Def: 1 required: false def: self.iYear];
    self.iWeek = [istream readInt32Def: 2 required: false def: self.iWeek];
    
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
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iWeek" value : [BaseJSON writeInt32 : self.iWeek]];
    return JsonRoot;
}

- (GetSecWeekHistoryReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iWeek = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWeek"] required:false def:self.iWeek];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecWeekHistoryRsp
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.stWeekQuota = [[SecHisWeekQuota alloc] init];
        self.iYear = 0;
        self.iWeek = 0;
        self.fAvgUpPct = 0;
        self.fAvgUpChancePct = 0;
        self.iYearNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSecName != nil)
    {
        [ostream writeString: 0 value: self.sSecName];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.stWeekQuota != nil)
    {
        [ostream writeMessage: 2 value: self.stWeekQuota];
    }
    [ostream writeInt32: 3 value: self.iYear];
    [ostream writeInt32: 4 value: self.iWeek];
    [ostream writeFloat: 5 value: self.fAvgUpPct];
    [ostream writeFloat: 6 value: self.fAvgUpChancePct];
    [ostream writeInt32: 7 value: self.iYearNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecWeekHistoryRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.stWeekQuota = (SecHisWeekQuota*)[istream readMessageDef: 2 required: false def: self.stWeekQuota VAR_TYPE: [SecHisWeekQuota class]];
    self.iYear = [istream readInt32Def: 3 required: false def: self.iYear];
    self.iWeek = [istream readInt32Def: 4 required: false def: self.iWeek];
    self.fAvgUpPct = [istream readFloatDef: 5 required: false def: self.fAvgUpPct];
    self.fAvgUpChancePct = [istream readFloatDef: 6 required: false def: self.fAvgUpChancePct];
    self.iYearNum = [istream readInt32Def: 7 required: false def: self.iYearNum];
    
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
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"stWeekQuota" value : [BaseJSON writeMessage : self.stWeekQuota]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iWeek" value : [BaseJSON writeInt32 : self.iWeek]];
    [JsonRoot append:@"fAvgUpPct" value : [BaseJSON writeFloat : self.fAvgUpPct]];
    [JsonRoot append:@"fAvgUpChancePct" value : [BaseJSON writeFloat : self.fAvgUpChancePct]];
    [JsonRoot append:@"iYearNum" value : [BaseJSON writeInt32 : self.iYearNum]];
    return JsonRoot;
}

- (GetSecWeekHistoryRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.stWeekQuota = [BaseJSON readMessageDef:[RootMap objectForKey:@"stWeekQuota"] required:false def:self.stWeekQuota VAR_TYPE: [SecHisWeekQuota class]];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iWeek = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWeek"] required:false def:self.iWeek];
    self.fAvgUpPct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAvgUpPct"] required:false def:self.fAvgUpPct];
    self.fAvgUpChancePct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAvgUpChancePct"] required:false def:self.fAvgUpChancePct];
    self.iYearNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYearNum"] required:false def:self.iYearNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecPeriodHistoryReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iYear = 0;
        self.sTradingDay = @"";
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
    [ostream writeInt32: 1 value: self.iYear];
    if (self.sTradingDay != nil)
    {
        [ostream writeString: 2 value: self.sTradingDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecPeriodHistoryReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iYear = [istream readInt32Def: 1 required: false def: self.iYear];
    self.sTradingDay = [istream readStringDef: 2 required: false def: self.sTradingDay];
    
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
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    return JsonRoot;
}

- (GetSecPeriodHistoryReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.sTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingDay"] required:false def:self.sTradingDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecPeriodHistoryRsp
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.fRisePct = 0;
        self.fRiseChance = 0;
        self.stMonthQuota = [[SecHisMonthQuota alloc] init];
        self.sTradingDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSecName != nil)
    {
        [ostream writeString: 0 value: self.sSecName];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    [ostream writeFloat: 2 value: self.fRisePct];
    [ostream writeFloat: 3 value: self.fRiseChance];
    if (self.stMonthQuota != nil)
    {
        [ostream writeMessage: 4 value: self.stMonthQuota];
    }
    if (self.sTradingDay != nil)
    {
        [ostream writeString: 5 value: self.sTradingDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecPeriodHistoryRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.fRisePct = [istream readFloatDef: 2 required: false def: self.fRisePct];
    self.fRiseChance = [istream readFloatDef: 3 required: false def: self.fRiseChance];
    self.stMonthQuota = (SecHisMonthQuota*)[istream readMessageDef: 4 required: false def: self.stMonthQuota VAR_TYPE: [SecHisMonthQuota class]];
    self.sTradingDay = [istream readStringDef: 5 required: false def: self.sTradingDay];
    
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
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"fRisePct" value : [BaseJSON writeFloat : self.fRisePct]];
    [JsonRoot append:@"fRiseChance" value : [BaseJSON writeFloat : self.fRiseChance]];
    [JsonRoot append:@"stMonthQuota" value : [BaseJSON writeMessage : self.stMonthQuota]];
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    return JsonRoot;
}

- (GetSecPeriodHistoryRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.fRisePct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRisePct"] required:false def:self.fRisePct];
    self.fRiseChance = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRiseChance"] required:false def:self.fRiseChance];
    self.stMonthQuota = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMonthQuota"] required:false def:self.stMonthQuota VAR_TYPE: [SecHisMonthQuota class]];
    self.sTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingDay"] required:false def:self.sTradingDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecMonthTopUpReq
- (id) init
{
    if (self = [super init])
    {
        self.iYear = 0;
        self.iMonth = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iYear];
    [ostream writeInt32: 1 value: self.iMonth];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecMonthTopUpReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iYear = [istream readInt32Def: 0 required: false def: self.iYear];
    self.iMonth = [istream readInt32Def: 1 required: false def: self.iMonth];
    
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
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iMonth" value : [BaseJSON writeInt32 : self.iMonth]];
    return JsonRoot;
}

- (GetSecMonthTopUpReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonth"] required:false def:self.iMonth];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation HisTopSecItem
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.iTotalYear = 0;
        self.iUpYear = 0;
        self.fRisePct = 0;
        self.fRiseChance = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSecName != nil)
    {
        [ostream writeString: 0 value: self.sSecName];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    [ostream writeInt32: 2 value: self.iTotalYear];
    [ostream writeInt32: 3 value: self.iUpYear];
    [ostream writeFloat: 4 value: self.fRisePct];
    [ostream writeFloat: 5 value: self.fRiseChance];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (HisTopSecItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.iTotalYear = [istream readInt32Def: 2 required: false def: self.iTotalYear];
    self.iUpYear = [istream readInt32Def: 3 required: false def: self.iUpYear];
    self.fRisePct = [istream readFloatDef: 4 required: false def: self.fRisePct];
    self.fRiseChance = [istream readFloatDef: 5 required: false def: self.fRiseChance];
    
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
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"iTotalYear" value : [BaseJSON writeInt32 : self.iTotalYear]];
    [JsonRoot append:@"iUpYear" value : [BaseJSON writeInt32 : self.iUpYear]];
    [JsonRoot append:@"fRisePct" value : [BaseJSON writeFloat : self.fRisePct]];
    [JsonRoot append:@"fRiseChance" value : [BaseJSON writeFloat : self.fRiseChance]];
    return JsonRoot;
}

- (HisTopSecItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iTotalYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalYear"] required:false def:self.iTotalYear];
    self.iUpYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpYear"] required:false def:self.iUpYear];
    self.fRisePct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRisePct"] required:false def:self.fRisePct];
    self.fRiseChance = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRiseChance"] required:false def:self.fRiseChance];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecMonthTopUpRsp
- (id) init
{
    if (self = [super init])
    {
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.iYear = 0;
        self.iMonth = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vItem != nil)
    {
        [ostream writeList: 0 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    }
    [ostream writeInt32: 1 value: self.iYear];
    [ostream writeInt32: 2 value: self.iMonth];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecMonthTopUpRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vItem = [istream readListDef: 0 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    self.iYear = [istream readInt32Def: 1 required: false def: self.iYear];
    self.iMonth = [istream readInt32Def: 2 required: false def: self.iMonth];
    
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
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iMonth" value : [BaseJSON writeInt32 : self.iMonth]];
    return JsonRoot;
}

- (GetSecMonthTopUpRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonth"] required:false def:self.iMonth];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPlateMonthTopReq
- (id) init
{
    if (self = [super init])
    {
        self.sPlateCode = @"";
        self.iYear = 0;
        self.iMonth = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPlateCode != nil)
    {
        [ostream writeString: 0 value: self.sPlateCode];
    }
    [ostream writeInt32: 1 value: self.iYear];
    [ostream writeInt32: 2 value: self.iMonth];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPlateMonthTopReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPlateCode = [istream readStringDef: 0 required: false def: self.sPlateCode];
    self.iYear = [istream readInt32Def: 1 required: false def: self.iYear];
    self.iMonth = [istream readInt32Def: 2 required: false def: self.iMonth];
    
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
    [JsonRoot append:@"sPlateCode" value : [BaseJSON writeString : self.sPlateCode]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iMonth" value : [BaseJSON writeInt32 : self.iMonth]];
    return JsonRoot;
}

- (GetPlateMonthTopReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sPlateCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateCode"] required:false def:self.sPlateCode];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonth"] required:false def:self.iMonth];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPlateMonthTopRsp
- (id) init
{
    if (self = [super init])
    {
        self.sPlateCode = @"";
        self.sPlateName = @"";
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.iYear = 0;
        self.iMonth = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPlateCode != nil)
    {
        [ostream writeString: 0 value: self.sPlateCode];
    }
    if (self.sPlateName != nil)
    {
        [ostream writeString: 1 value: self.sPlateName];
    }
    if (self.vItem != nil)
    {
        [ostream writeList: 2 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    }
    [ostream writeInt32: 3 value: self.iYear];
    [ostream writeInt32: 4 value: self.iMonth];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPlateMonthTopRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPlateCode = [istream readStringDef: 0 required: false def: self.sPlateCode];
    self.sPlateName = [istream readStringDef: 1 required: false def: self.sPlateName];
    self.vItem = [istream readListDef: 2 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    self.iYear = [istream readInt32Def: 3 required: false def: self.iYear];
    self.iMonth = [istream readInt32Def: 4 required: false def: self.iMonth];
    
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
    [JsonRoot append:@"sPlateCode" value : [BaseJSON writeString : self.sPlateCode]];
    [JsonRoot append:@"sPlateName" value : [BaseJSON writeString : self.sPlateName]];
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iMonth" value : [BaseJSON writeInt32 : self.iMonth]];
    return JsonRoot;
}

- (GetPlateMonthTopRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sPlateCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateCode"] required:false def:self.sPlateCode];
    self.sPlateName = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateName"] required:false def:self.sPlateName];
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iMonth = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonth"] required:false def:self.iMonth];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPlateWeekTopReq
- (id) init
{
    if (self = [super init])
    {
        self.sPlateCode = @"";
        self.iYear = 0;
        self.iWeekDay = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPlateCode != nil)
    {
        [ostream writeString: 0 value: self.sPlateCode];
    }
    [ostream writeInt32: 1 value: self.iYear];
    [ostream writeInt32: 2 value: self.iWeekDay];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPlateWeekTopReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPlateCode = [istream readStringDef: 0 required: false def: self.sPlateCode];
    self.iYear = [istream readInt32Def: 1 required: false def: self.iYear];
    self.iWeekDay = [istream readInt32Def: 2 required: false def: self.iWeekDay];
    
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
    [JsonRoot append:@"sPlateCode" value : [BaseJSON writeString : self.sPlateCode]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iWeekDay" value : [BaseJSON writeInt32 : self.iWeekDay]];
    return JsonRoot;
}

- (GetPlateWeekTopReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sPlateCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateCode"] required:false def:self.sPlateCode];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iWeekDay = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWeekDay"] required:false def:self.iWeekDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPlateWeekTopRsp
- (id) init
{
    if (self = [super init])
    {
        self.sPlateCode = @"";
        self.sPlateName = @"";
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.iYear = 0;
        self.iWeekDay = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPlateCode != nil)
    {
        [ostream writeString: 0 value: self.sPlateCode];
    }
    if (self.sPlateName != nil)
    {
        [ostream writeString: 1 value: self.sPlateName];
    }
    if (self.vItem != nil)
    {
        [ostream writeList: 2 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    }
    [ostream writeInt32: 3 value: self.iYear];
    [ostream writeInt32: 4 value: self.iWeekDay];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPlateWeekTopRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPlateCode = [istream readStringDef: 0 required: false def: self.sPlateCode];
    self.sPlateName = [istream readStringDef: 1 required: false def: self.sPlateName];
    self.vItem = [istream readListDef: 2 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    self.iYear = [istream readInt32Def: 3 required: false def: self.iYear];
    self.iWeekDay = [istream readInt32Def: 4 required: false def: self.iWeekDay];
    
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
    [JsonRoot append:@"sPlateCode" value : [BaseJSON writeString : self.sPlateCode]];
    [JsonRoot append:@"sPlateName" value : [BaseJSON writeString : self.sPlateName]];
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"iWeekDay" value : [BaseJSON writeInt32 : self.iWeekDay]];
    return JsonRoot;
}

- (GetPlateWeekTopRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sPlateCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateCode"] required:false def:self.sPlateCode];
    self.sPlateName = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateName"] required:false def:self.sPlateName];
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.iWeekDay = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWeekDay"] required:false def:self.iWeekDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPlatePeriodTopReq
- (id) init
{
    if (self = [super init])
    {
        self.sPlateCode = @"";
        self.iYear = 0;
        self.sTradingDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPlateCode != nil)
    {
        [ostream writeString: 0 value: self.sPlateCode];
    }
    [ostream writeInt32: 1 value: self.iYear];
    if (self.sTradingDay != nil)
    {
        [ostream writeString: 2 value: self.sTradingDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPlatePeriodTopReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPlateCode = [istream readStringDef: 0 required: false def: self.sPlateCode];
    self.iYear = [istream readInt32Def: 1 required: false def: self.iYear];
    self.sTradingDay = [istream readStringDef: 2 required: false def: self.sTradingDay];
    
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
    [JsonRoot append:@"sPlateCode" value : [BaseJSON writeString : self.sPlateCode]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    return JsonRoot;
}

- (GetPlatePeriodTopReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sPlateCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateCode"] required:false def:self.sPlateCode];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.sTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingDay"] required:false def:self.sTradingDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPlatePeriodTopRsp
- (id) init
{
    if (self = [super init])
    {
        self.sPlateCode = @"";
        self.sPlateName = @"";
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.iYear = 0;
        self.sTradingDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPlateCode != nil)
    {
        [ostream writeString: 0 value: self.sPlateCode];
    }
    if (self.sPlateName != nil)
    {
        [ostream writeString: 1 value: self.sPlateName];
    }
    if (self.vItem != nil)
    {
        [ostream writeList: 2 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    }
    [ostream writeInt32: 3 value: self.iYear];
    if (self.sTradingDay != nil)
    {
        [ostream writeString: 4 value: self.sTradingDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPlatePeriodTopRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPlateCode = [istream readStringDef: 0 required: false def: self.sPlateCode];
    self.sPlateName = [istream readStringDef: 1 required: false def: self.sPlateName];
    self.vItem = [istream readListDef: 2 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    self.iYear = [istream readInt32Def: 3 required: false def: self.iYear];
    self.sTradingDay = [istream readStringDef: 4 required: false def: self.sTradingDay];
    
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
    [JsonRoot append:@"sPlateCode" value : [BaseJSON writeString : self.sPlateCode]];
    [JsonRoot append:@"sPlateName" value : [BaseJSON writeString : self.sPlateName]];
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]]];
    [JsonRoot append:@"iYear" value : [BaseJSON writeInt32 : self.iYear]];
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    return JsonRoot;
}

- (GetPlatePeriodTopRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sPlateCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateCode"] required:false def:self.sPlateCode];
    self.sPlateName = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateName"] required:false def:self.sPlateName];
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [HisTopSecItem class]]];
    self.iYear = [BaseJSON readInt32Def:[RootMap objectForKey:@"iYear"] required:false def:self.iYear];
    self.sTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingDay"] required:false def:self.sTradingDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RelatedNews
- (id) init
{
    if (self = [super init])
    {
        self.sNewsId = @"";
        self.sTitle = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sNewsId != nil)
    {
        [ostream writeString: 0 value: self.sNewsId];
    }
    if (self.sTitle != nil)
    {
        [ostream writeString: 1 value: self.sTitle];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RelatedNews *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sNewsId = [istream readStringDef: 0 required: false def: self.sNewsId];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    
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
    [JsonRoot append:@"sNewsId" value : [BaseJSON writeString : self.sNewsId]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    return JsonRoot;
}

- (RelatedNews *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sNewsId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNewsId"] required:false def:self.sNewsId];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RelatedSecurity
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sCode = @"";
        self.sDtCode = @"";
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
    if (self.sCode != nil)
    {
        [ostream writeString: 1 value: self.sCode];
    }
    if (self.sDtCode != nil)
    {
        [ostream writeString: 2 value: self.sDtCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RelatedSecurity *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sCode = [istream readStringDef: 1 required: false def: self.sCode];
    self.sDtCode = [istream readStringDef: 2 required: false def: self.sDtCode];
    
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
    [JsonRoot append:@"sCode" value : [BaseJSON writeString : self.sCode]];
    [JsonRoot append:@"sDtCode" value : [BaseJSON writeString : self.sDtCode]];
    return JsonRoot;
}

- (RelatedSecurity *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sCode"] required:false def:self.sCode];
    self.sDtCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtCode"] required:false def:self.sDtCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetNewsRelationInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sNewsId = @"";
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
    if (self.sNewsId != nil)
    {
        [ostream writeString: 1 value: self.sNewsId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetNewsRelationInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sNewsId = [istream readStringDef: 1 required: false def: self.sNewsId];
    
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
    [JsonRoot append:@"sNewsId" value : [BaseJSON writeString : self.sNewsId]];
    return JsonRoot;
}

- (GetNewsRelationInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sNewsId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNewsId"] required:false def:self.sNewsId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetNewsRelationInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.sNewsId = @"";
        self.vRelatedNews = [NSMutableArray arrayWithCapacity:0];
        self.vRelatedPlates = [NSMutableArray arrayWithCapacity:0];
        self.vRelatedStocks = [NSMutableArray arrayWithCapacity:0];
        self.vRelatedTags = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sNewsId != nil)
    {
        [ostream writeString: 0 value: self.sNewsId];
    }
    if (self.vRelatedNews != nil)
    {
        [ostream writeList: 1 value: self.vRelatedNews VAR_TYPE: [THOTH_LIST CREATE: [RelatedNews class]]];
    }
    if (self.vRelatedPlates != nil)
    {
        [ostream writeList: 2 value: self.vRelatedPlates VAR_TYPE: [THOTH_LIST CREATE: [RelatedSecurity class]]];
    }
    if (self.vRelatedStocks != nil)
    {
        [ostream writeList: 3 value: self.vRelatedStocks VAR_TYPE: [THOTH_LIST CREATE: [RelatedSecurity class]]];
    }
    if (self.vRelatedTags != nil)
    {
        [ostream writeList: 4 value: self.vRelatedTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetNewsRelationInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sNewsId = [istream readStringDef: 0 required: false def: self.sNewsId];
    self.vRelatedNews = [istream readListDef: 1 required: false def: self.vRelatedNews VAR_TYPE: [THOTH_LIST CREATE: [RelatedNews class]]];
    self.vRelatedPlates = [istream readListDef: 2 required: false def: self.vRelatedPlates VAR_TYPE: [THOTH_LIST CREATE: [RelatedSecurity class]]];
    self.vRelatedStocks = [istream readListDef: 3 required: false def: self.vRelatedStocks VAR_TYPE: [THOTH_LIST CREATE: [RelatedSecurity class]]];
    self.vRelatedTags = [istream readListDef: 4 required: false def: self.vRelatedTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"sNewsId" value : [BaseJSON writeString : self.sNewsId]];
    [JsonRoot append:@"vRelatedNews" value : [BaseJSON writeList : self.vRelatedNews VAR_TYPE: [THOTH_LIST CREATE: [RelatedNews class]]]];
    [JsonRoot append:@"vRelatedPlates" value : [BaseJSON writeList : self.vRelatedPlates VAR_TYPE: [THOTH_LIST CREATE: [RelatedSecurity class]]]];
    [JsonRoot append:@"vRelatedStocks" value : [BaseJSON writeList : self.vRelatedStocks VAR_TYPE: [THOTH_LIST CREATE: [RelatedSecurity class]]]];
    [JsonRoot append:@"vRelatedTags" value : [BaseJSON writeList : self.vRelatedTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetNewsRelationInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sNewsId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNewsId"] required:false def:self.sNewsId];
    self.vRelatedNews = [BaseJSON readListDef:[RootMap objectForKey:@"vRelatedNews"] required:false def:self.vRelatedNews VAR_TYPE: [THOTH_LIST CREATE: [RelatedNews class]]];
    self.vRelatedPlates = [BaseJSON readListDef:[RootMap objectForKey:@"vRelatedPlates"] required:false def:self.vRelatedPlates VAR_TYPE: [THOTH_LIST CREATE: [RelatedSecurity class]]];
    self.vRelatedStocks = [BaseJSON readListDef:[RootMap objectForKey:@"vRelatedStocks"] required:false def:self.vRelatedStocks VAR_TYPE: [THOTH_LIST CREATE: [RelatedSecurity class]]];
    self.vRelatedTags = [BaseJSON readListDef:[RootMap objectForKey:@"vRelatedTags"] required:false def:self.vRelatedTags VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InvestAdvisor
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sOrgName = @"";
        self.sFaceUrl = @"";
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
    if (self.sOrgName != nil)
    {
        [ostream writeString: 1 value: self.sOrgName];
    }
    if (self.sFaceUrl != nil)
    {
        [ostream writeString: 2 value: self.sFaceUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InvestAdvisor *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sOrgName = [istream readStringDef: 1 required: false def: self.sOrgName];
    self.sFaceUrl = [istream readStringDef: 2 required: false def: self.sFaceUrl];
    
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
    [JsonRoot append:@"sOrgName" value : [BaseJSON writeString : self.sOrgName]];
    [JsonRoot append:@"sFaceUrl" value : [BaseJSON writeString : self.sFaceUrl]];
    return JsonRoot;
}

- (InvestAdvisor *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sOrgName = [BaseJSON readStringDef:[RootMap objectForKey:@"sOrgName"] required:false def:self.sOrgName];
    self.sFaceUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sFaceUrl"] required:false def:self.sFaceUrl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InvestAdviseInfo
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sQuestion = @"";
        self.sAnwser = @"";
        self.stInvestAdvisor = [[InvestAdvisor alloc] init];
        self.iUpdateTime = 0;
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
    if (self.sQuestion != nil)
    {
        [ostream writeString: 1 value: self.sQuestion];
    }
    if (self.sAnwser != nil)
    {
        [ostream writeString: 2 value: self.sAnwser];
    }
    if (self.stInvestAdvisor != nil)
    {
        [ostream writeMessage: 3 value: self.stInvestAdvisor];
    }
    [ostream writeInt32: 4 value: self.iUpdateTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InvestAdviseInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sQuestion = [istream readStringDef: 1 required: false def: self.sQuestion];
    self.sAnwser = [istream readStringDef: 2 required: false def: self.sAnwser];
    self.stInvestAdvisor = (InvestAdvisor*)[istream readMessageDef: 3 required: false def: self.stInvestAdvisor VAR_TYPE: [InvestAdvisor class]];
    self.iUpdateTime = [istream readInt32Def: 4 required: false def: self.iUpdateTime];
    
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
    [JsonRoot append:@"sQuestion" value : [BaseJSON writeString : self.sQuestion]];
    [JsonRoot append:@"sAnwser" value : [BaseJSON writeString : self.sAnwser]];
    [JsonRoot append:@"stInvestAdvisor" value : [BaseJSON writeMessage : self.stInvestAdvisor]];
    [JsonRoot append:@"iUpdateTime" value : [BaseJSON writeInt32 : self.iUpdateTime]];
    return JsonRoot;
}

- (InvestAdviseInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sQuestion = [BaseJSON readStringDef:[RootMap objectForKey:@"sQuestion"] required:false def:self.sQuestion];
    self.sAnwser = [BaseJSON readStringDef:[RootMap objectForKey:@"sAnwser"] required:false def:self.sAnwser];
    self.stInvestAdvisor = [BaseJSON readMessageDef:[RootMap objectForKey:@"stInvestAdvisor"] required:false def:self.stInvestAdvisor VAR_TYPE: [InvestAdvisor class]];
    self.iUpdateTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpdateTime"] required:false def:self.iUpdateTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InvestAdviseInfoList
- (id) init
{
    if (self = [super init])
    {
        self.vInvestAdviseInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vInvestAdviseInfo != nil)
    {
        [ostream writeList: 0 value: self.vInvestAdviseInfo VAR_TYPE: [THOTH_LIST CREATE: [InvestAdviseInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InvestAdviseInfoList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vInvestAdviseInfo = [istream readListDef: 0 required: false def: self.vInvestAdviseInfo VAR_TYPE: [THOTH_LIST CREATE: [InvestAdviseInfo class]]];
    
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
    [JsonRoot append:@"vInvestAdviseInfo" value : [BaseJSON writeList : self.vInvestAdviseInfo VAR_TYPE: [THOTH_LIST CREATE: [InvestAdviseInfo class]]]];
    return JsonRoot;
}

- (InvestAdviseInfoList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vInvestAdviseInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vInvestAdviseInfo"] required:false def:self.vInvestAdviseInfo VAR_TYPE: [THOTH_LIST CREATE: [InvestAdviseInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DtSecStatItem
- (id) init
{
    if (self = [super init])
    {
        self.sTradingDay = @"";
        self.sTitle = @"";
        self.sContent = @"";
        self.sImgUrl = @"";
        self.iUpdateTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTradingDay != nil)
    {
        [ostream writeString: 0 value: self.sTradingDay];
    }
    if (self.sTitle != nil)
    {
        [ostream writeString: 1 value: self.sTitle];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 2 value: self.sContent];
    }
    if (self.sImgUrl != nil)
    {
        [ostream writeString: 3 value: self.sImgUrl];
    }
    [ostream writeInt32: 4 value: self.iUpdateTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtSecStatItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTradingDay = [istream readStringDef: 0 required: false def: self.sTradingDay];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    self.sContent = [istream readStringDef: 2 required: false def: self.sContent];
    self.sImgUrl = [istream readStringDef: 3 required: false def: self.sImgUrl];
    self.iUpdateTime = [istream readInt32Def: 4 required: false def: self.iUpdateTime];
    
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
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    [JsonRoot append:@"sImgUrl" value : [BaseJSON writeString : self.sImgUrl]];
    [JsonRoot append:@"iUpdateTime" value : [BaseJSON writeInt32 : self.iUpdateTime]];
    return JsonRoot;
}

- (DtSecStatItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingDay"] required:false def:self.sTradingDay];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
    self.sImgUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sImgUrl"] required:false def:self.sImgUrl];
    self.iUpdateTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpdateTime"] required:false def:self.iUpdateTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecStatListReq
- (id) init
{
    if (self = [super init])
    {
        self.iStart = 0;
        self.iWantNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStart];
    [ostream writeInt32: 1 value: self.iWantNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecStatListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStart = [istream readInt32Def: 0 required: false def: self.iStart];
    self.iWantNum = [istream readInt32Def: 1 required: false def: self.iWantNum];
    
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
    [JsonRoot append:@"iWantNum" value : [BaseJSON writeInt32 : self.iWantNum]];
    return JsonRoot;
}

- (GetSecStatListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStart = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStart"] required:false def:self.iStart];
    self.iWantNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantNum"] required:false def:self.iWantNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecStatListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vItem != nil)
    {
        [ostream writeList: 0 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtSecStatItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecStatListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vItem = [istream readListDef: 0 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtSecStatItem class]]];
    
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
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtSecStatItem class]]]];
    return JsonRoot;
}

- (GetSecStatListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtSecStatItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

