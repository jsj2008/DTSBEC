#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "AIConsultStock.h"

//////////////////////////////////////////////////////////////
@implementation STRank
- (id) init
{
    if (self = [super init])
    {
        self.iRank = 0;
        self.iDtNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRank];
    [ostream writeInt32: 1 value: self.iDtNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STRank *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRank = [istream readInt32Def: 0 required: false def: self.iRank];
    self.iDtNum = [istream readInt32Def: 1 required: false def: self.iDtNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iRank" value : [BaseJSON writeInt32 : self.iRank]];
    [JsonRoot append:@"iDtNum" value : [BaseJSON writeInt32 : self.iDtNum]];
    return JsonRoot;
}

- (STRank *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRank = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRank"] required:false def:self.iRank];
    self.iDtNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDtNum"] required:false def:self.iDtNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STTrendPredict
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sDate = @"";
        self.vtClose = [NSMutableArray arrayWithCapacity:0];
        self.fScore = 0;
        self.sDesc = @"";
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
    if (self.sDate != nil)
    {
        [ostream writeString: 1 value: self.sDate];
    }
    if (self.vtClose != nil)
    {
        [ostream writeList: 2 value: self.vtClose VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    }
    [ostream writeFloat: 3 value: self.fScore];
    if (self.sDesc != nil)
    {
        [ostream writeString: 4 value: self.sDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STTrendPredict *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sDate = [istream readStringDef: 1 required: false def: self.sDate];
    self.vtClose = [istream readListDef: 2 required: false def: self.vtClose VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.fScore = [istream readFloatDef: 3 required: false def: self.fScore];
    self.sDesc = [istream readStringDef: 4 required: false def: self.sDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"vtClose" value : [BaseJSON writeList : self.vtClose VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]]];
    [JsonRoot append:@"fScore" value : [BaseJSON writeFloat : self.fScore]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    return JsonRoot;
}

- (STTrendPredict *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.vtClose = [BaseJSON readListDef:[RootMap objectForKey:@"vtClose"] required:false def:self.vtClose VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.fScore = [BaseJSON readFloatDef:[RootMap objectForKey:@"fScore"] required:false def:self.fScore];
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
@implementation STPopuIndex
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.iIndexVal = 0;
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
    [ostream writeInt32: 1 value: self.iIndexVal];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STPopuIndex *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.iIndexVal = [istream readInt32Def: 1 required: false def: self.iIndexVal];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iIndexVal" value : [BaseJSON writeInt32 : self.iIndexVal]];
    return JsonRoot;
}

- (STPopuIndex *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.iIndexVal = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndexVal"] required:false def:self.iIndexVal];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STPopularity
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.vtPopuIndex = [NSMutableArray arrayWithCapacity:0];
        self.sPopularityDesc = @"";
        self.fVal = 0;
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
    if (self.vtPopuIndex != nil)
    {
        [ostream writeList: 1 value: self.vtPopuIndex VAR_TYPE: [THOTH_LIST CREATE: [STPopuIndex class]]];
    }
    if (self.sPopularityDesc != nil)
    {
        [ostream writeString: 2 value: self.sPopularityDesc];
    }
    [ostream writeFloat: 3 value: self.fVal];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STPopularity *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.vtPopuIndex = [istream readListDef: 1 required: false def: self.vtPopuIndex VAR_TYPE: [THOTH_LIST CREATE: [STPopuIndex class]]];
    self.sPopularityDesc = [istream readStringDef: 2 required: false def: self.sPopularityDesc];
    self.fVal = [istream readFloatDef: 3 required: false def: self.fVal];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vtPopuIndex" value : [BaseJSON writeList : self.vtPopuIndex VAR_TYPE: [THOTH_LIST CREATE: [STPopuIndex class]]]];
    [JsonRoot append:@"sPopularityDesc" value : [BaseJSON writeString : self.sPopularityDesc]];
    [JsonRoot append:@"fVal" value : [BaseJSON writeFloat : self.fVal]];
    return JsonRoot;
}

- (STPopularity *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.vtPopuIndex = [BaseJSON readListDef:[RootMap objectForKey:@"vtPopuIndex"] required:false def:self.vtPopuIndex VAR_TYPE: [THOTH_LIST CREATE: [STPopuIndex class]]];
    self.sPopularityDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sPopularityDesc"] required:false def:self.sPopularityDesc];
    self.fVal = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVal"] required:false def:self.fVal];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STAnno
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.vtPositiveDate = [NSMutableArray arrayWithCapacity:0];
        self.vtNegativeDate = [NSMutableArray arrayWithCapacity:0];
        self.sAnnoDesc = @"";
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
    if (self.vtPositiveDate != nil)
    {
        [ostream writeList: 1 value: self.vtPositiveDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.vtNegativeDate != nil)
    {
        [ostream writeList: 2 value: self.vtNegativeDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.sAnnoDesc != nil)
    {
        [ostream writeString: 3 value: self.sAnnoDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STAnno *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.vtPositiveDate = [istream readListDef: 1 required: false def: self.vtPositiveDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.vtNegativeDate = [istream readListDef: 2 required: false def: self.vtNegativeDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sAnnoDesc = [istream readStringDef: 3 required: false def: self.sAnnoDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vtPositiveDate" value : [BaseJSON writeList : self.vtPositiveDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"vtNegativeDate" value : [BaseJSON writeList : self.vtNegativeDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"sAnnoDesc" value : [BaseJSON writeString : self.sAnnoDesc]];
    return JsonRoot;
}

- (STAnno *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.vtPositiveDate = [BaseJSON readListDef:[RootMap objectForKey:@"vtPositiveDate"] required:false def:self.vtPositiveDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.vtNegativeDate = [BaseJSON readListDef:[RootMap objectForKey:@"vtNegativeDate"] required:false def:self.vtNegativeDate VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sAnnoDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sAnnoDesc"] required:false def:self.sAnnoDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STInsRes
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fVal = 0;
        self.iIndustryRank = 0;
        self.iIndDtNum = 0;
        self.fIndInsResAvg = 0;
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
    [ostream writeFloat: 1 value: self.fVal];
    [ostream writeInt32: 2 value: self.iIndustryRank];
    [ostream writeInt32: 3 value: self.iIndDtNum];
    [ostream writeFloat: 4 value: self.fIndInsResAvg];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STInsRes *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fVal = [istream readFloatDef: 1 required: false def: self.fVal];
    self.iIndustryRank = [istream readInt32Def: 2 required: false def: self.iIndustryRank];
    self.iIndDtNum = [istream readInt32Def: 3 required: false def: self.iIndDtNum];
    self.fIndInsResAvg = [istream readFloatDef: 4 required: false def: self.fIndInsResAvg];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fVal" value : [BaseJSON writeFloat : self.fVal]];
    [JsonRoot append:@"iIndustryRank" value : [BaseJSON writeInt32 : self.iIndustryRank]];
    [JsonRoot append:@"iIndDtNum" value : [BaseJSON writeInt32 : self.iIndDtNum]];
    [JsonRoot append:@"fIndInsResAvg" value : [BaseJSON writeFloat : self.fIndInsResAvg]];
    return JsonRoot;
}

- (STInsRes *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.fVal = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVal"] required:false def:self.fVal];
    self.iIndustryRank = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndustryRank"] required:false def:self.iIndustryRank];
    self.iIndDtNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndDtNum"] required:false def:self.iIndDtNum];
    self.fIndInsResAvg = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIndInsResAvg"] required:false def:self.fIndInsResAvg];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STMainCap
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fVal = 0;
        self.iIndustryRank = 0;
        self.iIndDtNum = 0;
        self.sMainCapDesc = @"";
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
    [ostream writeFloat: 1 value: self.fVal];
    [ostream writeInt32: 2 value: self.iIndustryRank];
    [ostream writeInt32: 3 value: self.iIndDtNum];
    if (self.sMainCapDesc != nil)
    {
        [ostream writeString: 4 value: self.sMainCapDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STMainCap *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fVal = [istream readFloatDef: 1 required: false def: self.fVal];
    self.iIndustryRank = [istream readInt32Def: 2 required: false def: self.iIndustryRank];
    self.iIndDtNum = [istream readInt32Def: 3 required: false def: self.iIndDtNum];
    self.sMainCapDesc = [istream readStringDef: 4 required: false def: self.sMainCapDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fVal" value : [BaseJSON writeFloat : self.fVal]];
    [JsonRoot append:@"iIndustryRank" value : [BaseJSON writeInt32 : self.iIndustryRank]];
    [JsonRoot append:@"iIndDtNum" value : [BaseJSON writeInt32 : self.iIndDtNum]];
    [JsonRoot append:@"sMainCapDesc" value : [BaseJSON writeString : self.sMainCapDesc]];
    return JsonRoot;
}

- (STMainCap *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.fVal = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVal"] required:false def:self.fVal];
    self.iIndustryRank = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndustryRank"] required:false def:self.iIndustryRank];
    self.iIndDtNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndDtNum"] required:false def:self.iIndDtNum];
    self.sMainCapDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sMainCapDesc"] required:false def:self.sMainCapDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STLHDateNet
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.fNetBuy = 0;
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
    [ostream writeFloat: 1 value: self.fNetBuy];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STLHDateNet *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.fNetBuy = [istream readFloatDef: 1 required: false def: self.fNetBuy];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fNetBuy" value : [BaseJSON writeFloat : self.fNetBuy]];
    return JsonRoot;
}

- (STLHDateNet *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.fNetBuy = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNetBuy"] required:false def:self.fNetBuy];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STLongHu
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fVal = 0;
        self.fSumNetBuy = 0;
        self.vtDateNet = [NSMutableArray arrayWithCapacity:0];
        self.iIndustryRank = 0;
        self.iIndDtNum = 0;
        self.sLongHuDesc = @"";
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
    [ostream writeFloat: 1 value: self.fVal];
    [ostream writeFloat: 2 value: self.fSumNetBuy];
    if (self.vtDateNet != nil)
    {
        [ostream writeList: 3 value: self.vtDateNet VAR_TYPE: [THOTH_LIST CREATE: [STLHDateNet class]]];
    }
    [ostream writeInt32: 4 value: self.iIndustryRank];
    [ostream writeInt32: 5 value: self.iIndDtNum];
    if (self.sLongHuDesc != nil)
    {
        [ostream writeString: 6 value: self.sLongHuDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STLongHu *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fVal = [istream readFloatDef: 1 required: false def: self.fVal];
    self.fSumNetBuy = [istream readFloatDef: 2 required: false def: self.fSumNetBuy];
    self.vtDateNet = [istream readListDef: 3 required: false def: self.vtDateNet VAR_TYPE: [THOTH_LIST CREATE: [STLHDateNet class]]];
    self.iIndustryRank = [istream readInt32Def: 4 required: false def: self.iIndustryRank];
    self.iIndDtNum = [istream readInt32Def: 5 required: false def: self.iIndDtNum];
    self.sLongHuDesc = [istream readStringDef: 6 required: false def: self.sLongHuDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fVal" value : [BaseJSON writeFloat : self.fVal]];
    [JsonRoot append:@"fSumNetBuy" value : [BaseJSON writeFloat : self.fSumNetBuy]];
    [JsonRoot append:@"vtDateNet" value : [BaseJSON writeList : self.vtDateNet VAR_TYPE: [THOTH_LIST CREATE: [STLHDateNet class]]]];
    [JsonRoot append:@"iIndustryRank" value : [BaseJSON writeInt32 : self.iIndustryRank]];
    [JsonRoot append:@"iIndDtNum" value : [BaseJSON writeInt32 : self.iIndDtNum]];
    [JsonRoot append:@"sLongHuDesc" value : [BaseJSON writeString : self.sLongHuDesc]];
    return JsonRoot;
}

- (STLongHu *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.fVal = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVal"] required:false def:self.fVal];
    self.fSumNetBuy = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSumNetBuy"] required:false def:self.fSumNetBuy];
    self.vtDateNet = [BaseJSON readListDef:[RootMap objectForKey:@"vtDateNet"] required:false def:self.vtDateNet VAR_TYPE: [THOTH_LIST CREATE: [STLHDateNet class]]];
    self.iIndustryRank = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndustryRank"] required:false def:self.iIndustryRank];
    self.iIndDtNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndDtNum"] required:false def:self.iIndDtNum];
    self.sLongHuDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sLongHuDesc"] required:false def:self.sLongHuDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STMTBuy
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.fBuy = 0;
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
    [ostream writeFloat: 1 value: self.fBuy];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STMTBuy *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.fBuy = [istream readFloatDef: 1 required: false def: self.fBuy];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fBuy" value : [BaseJSON writeFloat : self.fBuy]];
    return JsonRoot;
}

- (STMTBuy *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.fBuy = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuy"] required:false def:self.fBuy];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STMarginTrade
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fVal = 0;
        self.vtMTBuy = [NSMutableArray arrayWithCapacity:0];
        self.iIndustryRank = 0;
        self.iIndDtNum = 0;
        self.sMarginTradeDesc = @"";
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
    [ostream writeFloat: 1 value: self.fVal];
    if (self.vtMTBuy != nil)
    {
        [ostream writeList: 2 value: self.vtMTBuy VAR_TYPE: [THOTH_LIST CREATE: [STMTBuy class]]];
    }
    [ostream writeInt32: 3 value: self.iIndustryRank];
    [ostream writeInt32: 4 value: self.iIndDtNum];
    if (self.sMarginTradeDesc != nil)
    {
        [ostream writeString: 5 value: self.sMarginTradeDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STMarginTrade *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fVal = [istream readFloatDef: 1 required: false def: self.fVal];
    self.vtMTBuy = [istream readListDef: 2 required: false def: self.vtMTBuy VAR_TYPE: [THOTH_LIST CREATE: [STMTBuy class]]];
    self.iIndustryRank = [istream readInt32Def: 3 required: false def: self.iIndustryRank];
    self.iIndDtNum = [istream readInt32Def: 4 required: false def: self.iIndDtNum];
    self.sMarginTradeDesc = [istream readStringDef: 5 required: false def: self.sMarginTradeDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fVal" value : [BaseJSON writeFloat : self.fVal]];
    [JsonRoot append:@"vtMTBuy" value : [BaseJSON writeList : self.vtMTBuy VAR_TYPE: [THOTH_LIST CREATE: [STMTBuy class]]]];
    [JsonRoot append:@"iIndustryRank" value : [BaseJSON writeInt32 : self.iIndustryRank]];
    [JsonRoot append:@"iIndDtNum" value : [BaseJSON writeInt32 : self.iIndDtNum]];
    [JsonRoot append:@"sMarginTradeDesc" value : [BaseJSON writeString : self.sMarginTradeDesc]];
    return JsonRoot;
}

- (STMarginTrade *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.fVal = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVal"] required:false def:self.fVal];
    self.vtMTBuy = [BaseJSON readListDef:[RootMap objectForKey:@"vtMTBuy"] required:false def:self.vtMTBuy VAR_TYPE: [THOTH_LIST CREATE: [STMTBuy class]]];
    self.iIndustryRank = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndustryRank"] required:false def:self.iIndustryRank];
    self.iIndDtNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndDtNum"] required:false def:self.iIndDtNum];
    self.sMarginTradeDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sMarginTradeDesc"] required:false def:self.sMarginTradeDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STDateValue
- (id) init
{
    if (self = [super init])
    {
        self.sYearMonth = @"";
        self.fValue = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sYearMonth != nil)
    {
        [ostream writeString: 0 value: self.sYearMonth];
    }
    [ostream writeFloat: 1 value: self.fValue];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STDateValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sYearMonth = [istream readStringDef: 0 required: false def: self.sYearMonth];
    self.fValue = [istream readFloatDef: 1 required: false def: self.fValue];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sYearMonth" value : [BaseJSON writeString : self.sYearMonth]];
    [JsonRoot append:@"fValue" value : [BaseJSON writeFloat : self.fValue]];
    return JsonRoot;
}

- (STDateValue *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sYearMonth = [BaseJSON readStringDef:[RootMap objectForKey:@"sYearMonth"] required:false def:self.sYearMonth];
    self.fValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fValue"] required:false def:self.fValue];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STFinDate
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fVal = 0;
        self.vtDateValue = [NSMutableArray arrayWithCapacity:0];
        self.vtDateValueAvg = [NSMutableArray arrayWithCapacity:0];
        self.stIndSTRank = [[STRank alloc] init];
        self.sFinanceDesc = @"";
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
    [ostream writeFloat: 1 value: self.fVal];
    if (self.vtDateValue != nil)
    {
        [ostream writeList: 2 value: self.vtDateValue VAR_TYPE: [THOTH_LIST CREATE: [STDateValue class]]];
    }
    if (self.vtDateValueAvg != nil)
    {
        [ostream writeList: 3 value: self.vtDateValueAvg VAR_TYPE: [THOTH_LIST CREATE: [STDateValue class]]];
    }
    if (self.stIndSTRank != nil)
    {
        [ostream writeMessage: 4 value: self.stIndSTRank];
    }
    if (self.sFinanceDesc != nil)
    {
        [ostream writeString: 5 value: self.sFinanceDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STFinDate *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fVal = [istream readFloatDef: 1 required: false def: self.fVal];
    self.vtDateValue = [istream readListDef: 2 required: false def: self.vtDateValue VAR_TYPE: [THOTH_LIST CREATE: [STDateValue class]]];
    self.vtDateValueAvg = [istream readListDef: 3 required: false def: self.vtDateValueAvg VAR_TYPE: [THOTH_LIST CREATE: [STDateValue class]]];
    self.stIndSTRank = (STRank*)[istream readMessageDef: 4 required: false def: self.stIndSTRank VAR_TYPE: [STRank class]];
    self.sFinanceDesc = [istream readStringDef: 5 required: false def: self.sFinanceDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fVal" value : [BaseJSON writeFloat : self.fVal]];
    [JsonRoot append:@"vtDateValue" value : [BaseJSON writeList : self.vtDateValue VAR_TYPE: [THOTH_LIST CREATE: [STDateValue class]]]];
    [JsonRoot append:@"vtDateValueAvg" value : [BaseJSON writeList : self.vtDateValueAvg VAR_TYPE: [THOTH_LIST CREATE: [STDateValue class]]]];
    [JsonRoot append:@"stIndSTRank" value : [BaseJSON writeMessage : self.stIndSTRank]];
    [JsonRoot append:@"sFinanceDesc" value : [BaseJSON writeString : self.sFinanceDesc]];
    return JsonRoot;
}

- (STFinDate *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.fVal = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVal"] required:false def:self.fVal];
    self.vtDateValue = [BaseJSON readListDef:[RootMap objectForKey:@"vtDateValue"] required:false def:self.vtDateValue VAR_TYPE: [THOTH_LIST CREATE: [STDateValue class]]];
    self.vtDateValueAvg = [BaseJSON readListDef:[RootMap objectForKey:@"vtDateValueAvg"] required:false def:self.vtDateValueAvg VAR_TYPE: [THOTH_LIST CREATE: [STDateValue class]]];
    self.stIndSTRank = [BaseJSON readMessageDef:[RootMap objectForKey:@"stIndSTRank"] required:false def:self.stIndSTRank VAR_TYPE: [STRank class]];
    self.sFinanceDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sFinanceDesc"] required:false def:self.sFinanceDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation STConsult
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fVal = 0;
        self.stIndSTRank = [[STRank alloc] init];
        self.stAllDtSTRank = [[STRank alloc] init];
        self.sConsultDesc = @"";
        self.mpDateNum = [NSMutableDictionary dictionaryWithCapacity: 0];
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
    [ostream writeFloat: 1 value: self.fVal];
    if (self.stIndSTRank != nil)
    {
        [ostream writeMessage: 2 value: self.stIndSTRank];
    }
    if (self.stAllDtSTRank != nil)
    {
        [ostream writeMessage: 3 value: self.stAllDtSTRank];
    }
    if (self.sConsultDesc != nil)
    {
        [ostream writeString: 4 value: self.sConsultDesc];
    }
    if (self.mpDateNum != nil)
    {
        [ostream writeMap: 5 value: self.mpDateNum VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (STConsult *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fVal = [istream readFloatDef: 1 required: false def: self.fVal];
    self.stIndSTRank = (STRank*)[istream readMessageDef: 2 required: false def: self.stIndSTRank VAR_TYPE: [STRank class]];
    self.stAllDtSTRank = (STRank*)[istream readMessageDef: 3 required: false def: self.stAllDtSTRank VAR_TYPE: [STRank class]];
    self.sConsultDesc = [istream readStringDef: 4 required: false def: self.sConsultDesc];
    self.mpDateNum = [istream readMapDef: 5 required: false def: self.mpDateNum VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fVal" value : [BaseJSON writeFloat : self.fVal]];
    [JsonRoot append:@"stIndSTRank" value : [BaseJSON writeMessage : self.stIndSTRank]];
    [JsonRoot append:@"stAllDtSTRank" value : [BaseJSON writeMessage : self.stAllDtSTRank]];
    [JsonRoot append:@"sConsultDesc" value : [BaseJSON writeString : self.sConsultDesc]];
    [JsonRoot append:@"mpDateNum" value : [BaseJSON writeMap : self.mpDateNum VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (STConsult *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.fVal = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVal"] required:false def:self.fVal];
    self.stIndSTRank = [BaseJSON readMessageDef:[RootMap objectForKey:@"stIndSTRank"] required:false def:self.stIndSTRank VAR_TYPE: [STRank class]];
    self.stAllDtSTRank = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAllDtSTRank"] required:false def:self.stAllDtSTRank VAR_TYPE: [STRank class]];
    self.sConsultDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sConsultDesc"] required:false def:self.sConsultDesc];
    self.mpDateNum = [BaseJSON readMapDef:[RootMap objectForKey:@"mpDateNum"] required:false def:self.mpDateNum VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConsultReq
- (id) init
{
    if (self = [super init])
    {
        self.vtDtSecCode = [NSMutableArray arrayWithCapacity:0];
        self.vGuid = [NSData data];
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
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 1 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConsultReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtDtSecCode = [istream readListDef: 0 required: false def: self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.vGuid = [istream readBytesDef: 1 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (ConsultReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtDtSecCode = [BaseJSON readListDef:[RootMap objectForKey:@"vtDtSecCode"] required:false def:self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
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
@implementation TrendPredictRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtTrendPredict = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtTrendPredict != nil)
    {
        [ostream writeList: 0 value: self.vtTrendPredict VAR_TYPE: [THOTH_LIST CREATE: [STTrendPredict class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TrendPredictRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtTrendPredict = [istream readListDef: 0 required: false def: self.vtTrendPredict VAR_TYPE: [THOTH_LIST CREATE: [STTrendPredict class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtTrendPredict" value : [BaseJSON writeList : self.vtTrendPredict VAR_TYPE: [THOTH_LIST CREATE: [STTrendPredict class]]]];
    return JsonRoot;
}

- (TrendPredictRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtTrendPredict = [BaseJSON readListDef:[RootMap objectForKey:@"vtTrendPredict"] required:false def:self.vtTrendPredict VAR_TYPE: [THOTH_LIST CREATE: [STTrendPredict class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PopularityRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtPopularity = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtPopularity != nil)
    {
        [ostream writeList: 0 value: self.vtPopularity VAR_TYPE: [THOTH_LIST CREATE: [STPopularity class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PopularityRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtPopularity = [istream readListDef: 0 required: false def: self.vtPopularity VAR_TYPE: [THOTH_LIST CREATE: [STPopularity class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtPopularity" value : [BaseJSON writeList : self.vtPopularity VAR_TYPE: [THOTH_LIST CREATE: [STPopularity class]]]];
    return JsonRoot;
}

- (PopularityRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtPopularity = [BaseJSON readListDef:[RootMap objectForKey:@"vtPopularity"] required:false def:self.vtPopularity VAR_TYPE: [THOTH_LIST CREATE: [STPopularity class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AnnoRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtAnno = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtAnno != nil)
    {
        [ostream writeList: 0 value: self.vtAnno VAR_TYPE: [THOTH_LIST CREATE: [STAnno class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AnnoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtAnno = [istream readListDef: 0 required: false def: self.vtAnno VAR_TYPE: [THOTH_LIST CREATE: [STAnno class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtAnno" value : [BaseJSON writeList : self.vtAnno VAR_TYPE: [THOTH_LIST CREATE: [STAnno class]]]];
    return JsonRoot;
}

- (AnnoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtAnno = [BaseJSON readListDef:[RootMap objectForKey:@"vtAnno"] required:false def:self.vtAnno VAR_TYPE: [THOTH_LIST CREATE: [STAnno class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InsResRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtInsRes = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtInsRes != nil)
    {
        [ostream writeList: 0 value: self.vtInsRes VAR_TYPE: [THOTH_LIST CREATE: [STInsRes class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InsResRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtInsRes = [istream readListDef: 0 required: false def: self.vtInsRes VAR_TYPE: [THOTH_LIST CREATE: [STInsRes class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtInsRes" value : [BaseJSON writeList : self.vtInsRes VAR_TYPE: [THOTH_LIST CREATE: [STInsRes class]]]];
    return JsonRoot;
}

- (InsResRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtInsRes = [BaseJSON readListDef:[RootMap objectForKey:@"vtInsRes"] required:false def:self.vtInsRes VAR_TYPE: [THOTH_LIST CREATE: [STInsRes class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MainCapRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtMainCap = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtMainCap != nil)
    {
        [ostream writeList: 0 value: self.vtMainCap VAR_TYPE: [THOTH_LIST CREATE: [STMainCap class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MainCapRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtMainCap = [istream readListDef: 0 required: false def: self.vtMainCap VAR_TYPE: [THOTH_LIST CREATE: [STMainCap class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtMainCap" value : [BaseJSON writeList : self.vtMainCap VAR_TYPE: [THOTH_LIST CREATE: [STMainCap class]]]];
    return JsonRoot;
}

- (MainCapRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtMainCap = [BaseJSON readListDef:[RootMap objectForKey:@"vtMainCap"] required:false def:self.vtMainCap VAR_TYPE: [THOTH_LIST CREATE: [STMainCap class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LongHuRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtLongHu = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtLongHu != nil)
    {
        [ostream writeList: 0 value: self.vtLongHu VAR_TYPE: [THOTH_LIST CREATE: [STLongHu class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LongHuRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtLongHu = [istream readListDef: 0 required: false def: self.vtLongHu VAR_TYPE: [THOTH_LIST CREATE: [STLongHu class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtLongHu" value : [BaseJSON writeList : self.vtLongHu VAR_TYPE: [THOTH_LIST CREATE: [STLongHu class]]]];
    return JsonRoot;
}

- (LongHuRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtLongHu = [BaseJSON readListDef:[RootMap objectForKey:@"vtLongHu"] required:false def:self.vtLongHu VAR_TYPE: [THOTH_LIST CREATE: [STLongHu class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarTraRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtMarginTrade = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtMarginTrade != nil)
    {
        [ostream writeList: 0 value: self.vtMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [STMarginTrade class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarTraRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtMarginTrade = [istream readListDef: 0 required: false def: self.vtMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [STMarginTrade class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtMarginTrade" value : [BaseJSON writeList : self.vtMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [STMarginTrade class]]]];
    return JsonRoot;
}

- (MarTraRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtMarginTrade = [BaseJSON readListDef:[RootMap objectForKey:@"vtMarginTrade"] required:false def:self.vtMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [STMarginTrade class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FinDataInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eFinType = E_FIN_INCOME;
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
    [ostream writeInt32: 1 value: (int32_t)self.eFinType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinDataInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eFinType = [istream readInt32Def: 1 required: false def: (int32_t)self.eFinType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eFinType" value : [BaseJSON writeInt32 : (int32_t)self.eFinType]];
    return JsonRoot;
}

- (FinDataInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eFinType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFinType"] required:false def:(int32_t)self.eFinType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FinDataRst
- (id) init
{
    if (self = [super init])
    {
        self.stFinDate = [[STFinDate alloc] init];
        self.eFinType = E_FIN_INCOME;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFinDate != nil)
    {
        [ostream writeMessage: 0 value: self.stFinDate];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eFinType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinDataRst *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFinDate = (STFinDate*)[istream readMessageDef: 0 required: false def: self.stFinDate VAR_TYPE: [STFinDate class]];
    self.eFinType = [istream readInt32Def: 1 required: false def: (int32_t)self.eFinType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stFinDate" value : [BaseJSON writeMessage : self.stFinDate]];
    [JsonRoot append:@"eFinType" value : [BaseJSON writeInt32 : (int32_t)self.eFinType]];
    return JsonRoot;
}

- (FinDataRst *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stFinDate = [BaseJSON readMessageDef:[RootMap objectForKey:@"stFinDate"] required:false def:self.stFinDate VAR_TYPE: [STFinDate class]];
    self.eFinType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eFinType"] required:false def:(int32_t)self.eFinType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FinDataReq
- (id) init
{
    if (self = [super init])
    {
        self.vtFinDateInfo = [NSMutableArray arrayWithCapacity:0];
        self.vGuid = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtFinDateInfo != nil)
    {
        [ostream writeList: 0 value: self.vtFinDateInfo VAR_TYPE: [THOTH_LIST CREATE: [FinDataInfo class]]];
    }
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 1 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinDataReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtFinDateInfo = [istream readListDef: 0 required: false def: self.vtFinDateInfo VAR_TYPE: [THOTH_LIST CREATE: [FinDataInfo class]]];
    self.vGuid = [istream readBytesDef: 1 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtFinDateInfo" value : [BaseJSON writeList : self.vtFinDateInfo VAR_TYPE: [THOTH_LIST CREATE: [FinDataInfo class]]]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (FinDataReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtFinDateInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtFinDateInfo"] required:false def:self.vtFinDateInfo VAR_TYPE: [THOTH_LIST CREATE: [FinDataInfo class]]];
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
@implementation FinDataRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtFinDateRst = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtFinDateRst != nil)
    {
        [ostream writeList: 0 value: self.vtFinDateRst VAR_TYPE: [THOTH_LIST CREATE: [FinDataRst class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinDataRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtFinDateRst = [istream readListDef: 0 required: false def: self.vtFinDateRst VAR_TYPE: [THOTH_LIST CREATE: [FinDataRst class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtFinDateRst" value : [BaseJSON writeList : self.vtFinDateRst VAR_TYPE: [THOTH_LIST CREATE: [FinDataRst class]]]];
    return JsonRoot;
}

- (FinDataRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtFinDateRst = [BaseJSON readListDef:[RootMap objectForKey:@"vtFinDateRst"] required:false def:self.vtFinDateRst VAR_TYPE: [THOTH_LIST CREATE: [FinDataRst class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConsultRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtConsult = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtConsult != nil)
    {
        [ostream writeList: 0 value: self.vtConsult VAR_TYPE: [THOTH_LIST CREATE: [STConsult class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConsultRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtConsult = [istream readListDef: 0 required: false def: self.vtConsult VAR_TYPE: [THOTH_LIST CREATE: [STConsult class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtConsult" value : [BaseJSON writeList : self.vtConsult VAR_TYPE: [THOTH_LIST CREATE: [STConsult class]]]];
    return JsonRoot;
}

- (ConsultRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtConsult = [BaseJSON readListDef:[RootMap objectForKey:@"vtConsult"] required:false def:self.vtConsult VAR_TYPE: [THOTH_LIST CREATE: [STConsult class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ScoreDesc
- (id) init
{
    if (self = [super init])
    {
        self.iScore = 0;
        self.sScoreDesc = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iScore];
    if (self.sScoreDesc != nil)
    {
        [ostream writeString: 1 value: self.sScoreDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ScoreDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iScore = [istream readInt32Def: 0 required: false def: self.iScore];
    self.sScoreDesc = [istream readStringDef: 1 required: false def: self.sScoreDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iScore" value : [BaseJSON writeInt32 : self.iScore]];
    [JsonRoot append:@"sScoreDesc" value : [BaseJSON writeString : self.sScoreDesc]];
    return JsonRoot;
}

- (ScoreDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iScore = [BaseJSON readInt32Def:[RootMap objectForKey:@"iScore"] required:false def:self.iScore];
    self.sScoreDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sScoreDesc"] required:false def:self.sScoreDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConsultScore
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.stRiseScoreDesc = [[ScoreDesc alloc] init];
        self.stMktHotScoreDesc = [[ScoreDesc alloc] init];
        self.stMainScoreDesc = [[ScoreDesc alloc] init];
        self.stTrendScoreDesc = [[ScoreDesc alloc] init];
        self.stValueScoreDesc = [[ScoreDesc alloc] init];
        self.stConsultScoreDesc = [[ScoreDesc alloc] init];
        self.fVal = 0;
        self.sScoreDesc = @"";
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
    if (self.stRiseScoreDesc != nil)
    {
        [ostream writeMessage: 1 value: self.stRiseScoreDesc];
    }
    if (self.stMktHotScoreDesc != nil)
    {
        [ostream writeMessage: 2 value: self.stMktHotScoreDesc];
    }
    if (self.stMainScoreDesc != nil)
    {
        [ostream writeMessage: 3 value: self.stMainScoreDesc];
    }
    if (self.stTrendScoreDesc != nil)
    {
        [ostream writeMessage: 4 value: self.stTrendScoreDesc];
    }
    if (self.stValueScoreDesc != nil)
    {
        [ostream writeMessage: 5 value: self.stValueScoreDesc];
    }
    if (self.stConsultScoreDesc != nil)
    {
        [ostream writeMessage: 6 value: self.stConsultScoreDesc];
    }
    [ostream writeFloat: 7 value: self.fVal];
    if (self.sScoreDesc != nil)
    {
        [ostream writeString: 8 value: self.sScoreDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConsultScore *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.stRiseScoreDesc = (ScoreDesc*)[istream readMessageDef: 1 required: false def: self.stRiseScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stMktHotScoreDesc = (ScoreDesc*)[istream readMessageDef: 2 required: false def: self.stMktHotScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stMainScoreDesc = (ScoreDesc*)[istream readMessageDef: 3 required: false def: self.stMainScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stTrendScoreDesc = (ScoreDesc*)[istream readMessageDef: 4 required: false def: self.stTrendScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stValueScoreDesc = (ScoreDesc*)[istream readMessageDef: 5 required: false def: self.stValueScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stConsultScoreDesc = (ScoreDesc*)[istream readMessageDef: 6 required: false def: self.stConsultScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.fVal = [istream readFloatDef: 7 required: false def: self.fVal];
    self.sScoreDesc = [istream readStringDef: 8 required: false def: self.sScoreDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"stRiseScoreDesc" value : [BaseJSON writeMessage : self.stRiseScoreDesc]];
    [JsonRoot append:@"stMktHotScoreDesc" value : [BaseJSON writeMessage : self.stMktHotScoreDesc]];
    [JsonRoot append:@"stMainScoreDesc" value : [BaseJSON writeMessage : self.stMainScoreDesc]];
    [JsonRoot append:@"stTrendScoreDesc" value : [BaseJSON writeMessage : self.stTrendScoreDesc]];
    [JsonRoot append:@"stValueScoreDesc" value : [BaseJSON writeMessage : self.stValueScoreDesc]];
    [JsonRoot append:@"stConsultScoreDesc" value : [BaseJSON writeMessage : self.stConsultScoreDesc]];
    [JsonRoot append:@"fVal" value : [BaseJSON writeFloat : self.fVal]];
    [JsonRoot append:@"sScoreDesc" value : [BaseJSON writeString : self.sScoreDesc]];
    return JsonRoot;
}

- (ConsultScore *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.stRiseScoreDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stRiseScoreDesc"] required:false def:self.stRiseScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stMktHotScoreDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMktHotScoreDesc"] required:false def:self.stMktHotScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stMainScoreDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMainScoreDesc"] required:false def:self.stMainScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stTrendScoreDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stTrendScoreDesc"] required:false def:self.stTrendScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stValueScoreDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stValueScoreDesc"] required:false def:self.stValueScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.stConsultScoreDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stConsultScoreDesc"] required:false def:self.stConsultScoreDesc VAR_TYPE: [ScoreDesc class]];
    self.fVal = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVal"] required:false def:self.fVal];
    self.sScoreDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sScoreDesc"] required:false def:self.sScoreDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConsultScoreRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtConsultScore = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtConsultScore != nil)
    {
        [ostream writeList: 0 value: self.vtConsultScore VAR_TYPE: [THOTH_LIST CREATE: [ConsultScore class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConsultScoreRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtConsultScore = [istream readListDef: 0 required: false def: self.vtConsultScore VAR_TYPE: [THOTH_LIST CREATE: [ConsultScore class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtConsultScore" value : [BaseJSON writeList : self.vtConsultScore VAR_TYPE: [THOTH_LIST CREATE: [ConsultScore class]]]];
    return JsonRoot;
}

- (ConsultScoreRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtConsultScore = [BaseJSON readListDef:[RootMap objectForKey:@"vtConsultScore"] required:false def:self.vtConsultScore VAR_TYPE: [THOTH_LIST CREATE: [ConsultScore class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

