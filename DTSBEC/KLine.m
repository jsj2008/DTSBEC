#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "KLine.h"
#import "Quote.h"

//////////////////////////////////////////////////////////////
@implementation KLineDateReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eKLineType = E_KLT_5_MIN;
        self.iWantnum = 0;
        self.sBeginDate = @"";
        self.sEndDate = @"";
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
    [ostream writeInt32: 1 value: (int32_t)self.eKLineType];
    [ostream writeInt32: 2 value: self.iWantnum];
    if (self.sBeginDate != nil)
    {
        [ostream writeString: 3 value: self.sBeginDate];
    }
    if (self.sEndDate != nil)
    {
        [ostream writeString: 4 value: self.sEndDate];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (KLineDateReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eKLineType = [istream readInt32Def: 1 required: false def: (int32_t)self.eKLineType];
    self.iWantnum = [istream readInt32Def: 2 required: false def: self.iWantnum];
    self.sBeginDate = [istream readStringDef: 3 required: false def: self.sBeginDate];
    self.sEndDate = [istream readStringDef: 4 required: false def: self.sEndDate];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eKLineType" value : [BaseJSON writeInt32 : (int32_t)self.eKLineType]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    [JsonRoot append:@"sBeginDate" value : [BaseJSON writeString : self.sBeginDate]];
    [JsonRoot append:@"sEndDate" value : [BaseJSON writeString : self.sEndDate]];
    return JsonRoot;
}

- (KLineDateReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eKLineType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eKLineType"] required:false def:(int32_t)self.eKLineType];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
    self.sBeginDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sBeginDate"] required:false def:self.sBeginDate];
    self.sEndDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndDate"] required:false def:self.sEndDate];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation KLineDateRsp
- (id) init
{
    if (self = [super init])
    {
        self.vKLineDesc = [NSMutableArray arrayWithCapacity:0];
        self.eKLineType = E_KLT_5_MIN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vKLineDesc != nil)
    {
        [ostream writeList: 0 value: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eKLineType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (KLineDateRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vKLineDesc = [istream readListDef: 0 required: false def: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.eKLineType = [istream readInt32Def: 1 required: false def: (int32_t)self.eKLineType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vKLineDesc" value : [BaseJSON writeList : self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]]];
    [JsonRoot append:@"eKLineType" value : [BaseJSON writeInt32 : (int32_t)self.eKLineType]];
    return JsonRoot;
}

- (KLineDateRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vKLineDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vKLineDesc"] required:false def:self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.eKLineType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eKLineType"] required:false def:(int32_t)self.eKLineType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RtMinDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.vTrendDesc = [NSMutableArray arrayWithCapacity:0];
        self.fPreClose = 0;
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
    if (self.vTrendDesc != nil)
    {
        [ostream writeList: 1 value: self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    }
    [ostream writeFloat: 2 value: self.fPreClose];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RtMinDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.vTrendDesc = [istream readListDef: 1 required: false def: self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    self.fPreClose = [istream readFloatDef: 2 required: false def: self.fPreClose];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vTrendDesc" value : [BaseJSON writeList : self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]]];
    [JsonRoot append:@"fPreClose" value : [BaseJSON writeFloat : self.fPreClose]];
    return JsonRoot;
}

- (RtMinDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.vTrendDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vTrendDesc"] required:false def:self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    self.fPreClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPreClose"] required:false def:self.fPreClose];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RtMinReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iNum = 1;
        self.sDate = @"";
        self.iMinute = 0;
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
    [ostream writeInt32: 1 value: self.iNum];
    if (self.sDate != nil)
    {
        [ostream writeString: 2 value: self.sDate];
    }
    [ostream writeInt32: 3 value: self.iMinute];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RtMinReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iNum = [istream readInt32Def: 1 required: false def: self.iNum];
    self.sDate = [istream readStringDef: 2 required: false def: self.sDate];
    self.iMinute = [istream readInt32Def: 3 required: false def: self.iMinute];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iNum" value : [BaseJSON writeInt32 : self.iNum]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"iMinute" value : [BaseJSON writeInt32 : self.iMinute]];
    return JsonRoot;
}

- (RtMinReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNum"] required:false def:self.iNum];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.iMinute = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMinute"] required:false def:self.iMinute];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RtMinRsp
- (id) init
{
    if (self = [super init])
    {
        self.vRtMinDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vRtMinDesc != nil)
    {
        [ostream writeList: 0 value: self.vRtMinDesc VAR_TYPE: [THOTH_LIST CREATE: [RtMinDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RtMinRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vRtMinDesc = [istream readListDef: 0 required: false def: self.vRtMinDesc VAR_TYPE: [THOTH_LIST CREATE: [RtMinDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vRtMinDesc" value : [BaseJSON writeList : self.vRtMinDesc VAR_TYPE: [THOTH_LIST CREATE: [RtMinDesc class]]]];
    return JsonRoot;
}

- (RtMinRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vRtMinDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vRtMinDesc"] required:false def:self.vRtMinDesc VAR_TYPE: [THOTH_LIST CREATE: [RtMinDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

