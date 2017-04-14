#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Singal.h"
#import "Beacon.h"
#import "Account.h"
#import "Quote.h"

//////////////////////////////////////////////////////////////
@implementation IntelliStock
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.fSelectedPrice = 0;
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
    [ostream writeFloat: 2 value: self.fSelectedPrice];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliStock *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.fSelectedPrice = [istream readFloatDef: 2 required: false def: self.fSelectedPrice];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fSelectedPrice" value : [BaseJSON writeFloat : self.fSelectedPrice]];
    return JsonRoot;
}

- (IntelliStock *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fSelectedPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSelectedPrice"] required:false def:self.fSelectedPrice];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IncomeResult
- (id) init
{
    if (self = [super init])
    {
        self.iDay = 0;
        self.fAvgIncrease = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iDay];
    [ostream writeFloat: 1 value: self.fAvgIncrease];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IncomeResult *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iDay = [istream readInt32Def: 0 required: false def: self.iDay];
    self.fAvgIncrease = [istream readFloatDef: 1 required: false def: self.fAvgIncrease];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iDay" value : [BaseJSON writeInt32 : self.iDay]];
    [JsonRoot append:@"fAvgIncrease" value : [BaseJSON writeFloat : self.fAvgIncrease]];
    return JsonRoot;
}

- (IncomeResult *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iDay = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDay"] required:false def:self.iDay];
    self.fAvgIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAvgIncrease"] required:false def:self.fAvgIncrease];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliPickStock
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sTitle = @"";
        self.eBackgroundType = E_IBT_TECH;
        self.vtTagInfo = [NSMutableArray arrayWithCapacity:0];
        self.vtIntelliStock = [NSMutableArray arrayWithCapacity:0];
        self.sUrl = @"";
        self.sDate = @"";
        self.sDescription = @"";
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
    if (self.sTitle != nil)
    {
        [ostream writeString: 1 value: self.sTitle];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eBackgroundType];
    if (self.vtTagInfo != nil)
    {
        [ostream writeList: 3 value: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    }
    if (self.vtIntelliStock != nil)
    {
        [ostream writeList: 4 value: self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 5 value: self.sUrl];
    }
    if (self.sDate != nil)
    {
        [ostream writeString: 6 value: self.sDate];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 7 value: self.sDescription];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStock *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    self.eBackgroundType = [istream readInt32Def: 2 required: false def: (int32_t)self.eBackgroundType];
    self.vtTagInfo = [istream readListDef: 3 required: false def: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.vtIntelliStock = [istream readListDef: 4 required: false def: self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    self.sUrl = [istream readStringDef: 5 required: false def: self.sUrl];
    self.sDate = [istream readStringDef: 6 required: false def: self.sDate];
    self.sDescription = [istream readStringDef: 7 required: false def: self.sDescription];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"eBackgroundType" value : [BaseJSON writeInt32 : (int32_t)self.eBackgroundType]];
    [JsonRoot append:@"vtTagInfo" value : [BaseJSON writeList : self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]]];
    [JsonRoot append:@"vtIntelliStock" value : [BaseJSON writeList : self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    return JsonRoot;
}

- (IntelliPickStock *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.eBackgroundType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eBackgroundType"] required:false def:(int32_t)self.eBackgroundType];
    self.vtTagInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtTagInfo"] required:false def:self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.vtIntelliStock = [BaseJSON readListDef:[RootMap objectForKey:@"vtIntelliStock"] required:false def:self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliPickStockEx
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sTitle = @"";
        self.eBackgroundType = E_IBT_TECH;
        self.vtTagInfo = [NSMutableArray arrayWithCapacity:0];
        self.vtIntelliStock = [NSMutableArray arrayWithCapacity:0];
        self.sUrl = @"";
        self.sDate = @"";
        self.sDescription = @"";
        self.iHoldingPeriod = 0;
        self.fAvgIncrease = 0;
        self.fMorrowAvgIncrease = 0;
        self.sSource = @"";
        self.vIncomeResult = [NSMutableArray arrayWithCapacity:0];
        self.fSuccPrecent = 0;
        self.fAnnualizedReturn = 0;
        self.sUpBanner = @"";
        self.sDownBanner = @"";
        self.fWeekIncrease = 0;
        self.fTodayIncrease = 0;
        self.fMaxSuccPercent = 0;
        self.iMaxSuccHoldingPeriod = 0;
        self.fWeekIncreaseEx = 0;
        self.bNew = true;
        self.fMaxRetAvgIncrease = 0;
        self.sMaxRetUpBanner = @"";
        self.iSubscriptionsCount = 0;
        self.sSubscriptionsCount = @"";
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
    if (self.sTitle != nil)
    {
        [ostream writeString: 1 value: self.sTitle];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eBackgroundType];
    if (self.vtTagInfo != nil)
    {
        [ostream writeList: 3 value: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    }
    if (self.vtIntelliStock != nil)
    {
        [ostream writeList: 4 value: self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 5 value: self.sUrl];
    }
    if (self.sDate != nil)
    {
        [ostream writeString: 6 value: self.sDate];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 7 value: self.sDescription];
    }
    [ostream writeInt32: 8 value: self.iHoldingPeriod];
    [ostream writeFloat: 9 value: self.fAvgIncrease];
    [ostream writeFloat: 10 value: self.fMorrowAvgIncrease];
    if (self.sSource != nil)
    {
        [ostream writeString: 11 value: self.sSource];
    }
    if (self.vIncomeResult != nil)
    {
        [ostream writeList: 12 value: self.vIncomeResult VAR_TYPE: [THOTH_LIST CREATE: [IncomeResult class]]];
    }
    [ostream writeFloat: 13 value: self.fSuccPrecent];
    [ostream writeFloat: 14 value: self.fAnnualizedReturn];
    if (self.sUpBanner != nil)
    {
        [ostream writeString: 15 value: self.sUpBanner];
    }
    if (self.sDownBanner != nil)
    {
        [ostream writeString: 16 value: self.sDownBanner];
    }
    [ostream writeFloat: 17 value: self.fWeekIncrease];
    [ostream writeFloat: 18 value: self.fTodayIncrease];
    [ostream writeFloat: 19 value: self.fMaxSuccPercent];
    [ostream writeInt32: 20 value: self.iMaxSuccHoldingPeriod];
    [ostream writeFloat: 21 value: self.fWeekIncreaseEx];
    [ostream writeBoolean: 22 value: self.bNew];
    [ostream writeFloat: 23 value: self.fMaxRetAvgIncrease];
    if (self.sMaxRetUpBanner != nil)
    {
        [ostream writeString: 24 value: self.sMaxRetUpBanner];
    }
    [ostream writeInt32: 25 value: self.iSubscriptionsCount];
    if (self.sSubscriptionsCount != nil)
    {
        [ostream writeString: 26 value: self.sSubscriptionsCount];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStockEx *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    self.eBackgroundType = [istream readInt32Def: 2 required: false def: (int32_t)self.eBackgroundType];
    self.vtTagInfo = [istream readListDef: 3 required: false def: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.vtIntelliStock = [istream readListDef: 4 required: false def: self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    self.sUrl = [istream readStringDef: 5 required: false def: self.sUrl];
    self.sDate = [istream readStringDef: 6 required: false def: self.sDate];
    self.sDescription = [istream readStringDef: 7 required: false def: self.sDescription];
    self.iHoldingPeriod = [istream readInt32Def: 8 required: false def: self.iHoldingPeriod];
    self.fAvgIncrease = [istream readFloatDef: 9 required: false def: self.fAvgIncrease];
    self.fMorrowAvgIncrease = [istream readFloatDef: 10 required: false def: self.fMorrowAvgIncrease];
    self.sSource = [istream readStringDef: 11 required: false def: self.sSource];
    self.vIncomeResult = [istream readListDef: 12 required: false def: self.vIncomeResult VAR_TYPE: [THOTH_LIST CREATE: [IncomeResult class]]];
    self.fSuccPrecent = [istream readFloatDef: 13 required: false def: self.fSuccPrecent];
    self.fAnnualizedReturn = [istream readFloatDef: 14 required: false def: self.fAnnualizedReturn];
    self.sUpBanner = [istream readStringDef: 15 required: false def: self.sUpBanner];
    self.sDownBanner = [istream readStringDef: 16 required: false def: self.sDownBanner];
    self.fWeekIncrease = [istream readFloatDef: 17 required: false def: self.fWeekIncrease];
    self.fTodayIncrease = [istream readFloatDef: 18 required: false def: self.fTodayIncrease];
    self.fMaxSuccPercent = [istream readFloatDef: 19 required: false def: self.fMaxSuccPercent];
    self.iMaxSuccHoldingPeriod = [istream readInt32Def: 20 required: false def: self.iMaxSuccHoldingPeriod];
    self.fWeekIncreaseEx = [istream readFloatDef: 21 required: false def: self.fWeekIncreaseEx];
    self.bNew = [istream readBooleanDef: 22 required: false def: self.bNew];
    self.fMaxRetAvgIncrease = [istream readFloatDef: 23 required: false def: self.fMaxRetAvgIncrease];
    self.sMaxRetUpBanner = [istream readStringDef: 24 required: false def: self.sMaxRetUpBanner];
    self.iSubscriptionsCount = [istream readInt32Def: 25 required: false def: self.iSubscriptionsCount];
    self.sSubscriptionsCount = [istream readStringDef: 26 required: false def: self.sSubscriptionsCount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"eBackgroundType" value : [BaseJSON writeInt32 : (int32_t)self.eBackgroundType]];
    [JsonRoot append:@"vtTagInfo" value : [BaseJSON writeList : self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]]];
    [JsonRoot append:@"vtIntelliStock" value : [BaseJSON writeList : self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"iHoldingPeriod" value : [BaseJSON writeInt32 : self.iHoldingPeriod]];
    [JsonRoot append:@"fAvgIncrease" value : [BaseJSON writeFloat : self.fAvgIncrease]];
    [JsonRoot append:@"fMorrowAvgIncrease" value : [BaseJSON writeFloat : self.fMorrowAvgIncrease]];
    [JsonRoot append:@"sSource" value : [BaseJSON writeString : self.sSource]];
    [JsonRoot append:@"vIncomeResult" value : [BaseJSON writeList : self.vIncomeResult VAR_TYPE: [THOTH_LIST CREATE: [IncomeResult class]]]];
    [JsonRoot append:@"fSuccPrecent" value : [BaseJSON writeFloat : self.fSuccPrecent]];
    [JsonRoot append:@"fAnnualizedReturn" value : [BaseJSON writeFloat : self.fAnnualizedReturn]];
    [JsonRoot append:@"sUpBanner" value : [BaseJSON writeString : self.sUpBanner]];
    [JsonRoot append:@"sDownBanner" value : [BaseJSON writeString : self.sDownBanner]];
    [JsonRoot append:@"fWeekIncrease" value : [BaseJSON writeFloat : self.fWeekIncrease]];
    [JsonRoot append:@"fTodayIncrease" value : [BaseJSON writeFloat : self.fTodayIncrease]];
    [JsonRoot append:@"fMaxSuccPercent" value : [BaseJSON writeFloat : self.fMaxSuccPercent]];
    [JsonRoot append:@"iMaxSuccHoldingPeriod" value : [BaseJSON writeInt32 : self.iMaxSuccHoldingPeriod]];
    [JsonRoot append:@"fWeekIncreaseEx" value : [BaseJSON writeFloat : self.fWeekIncreaseEx]];
    [JsonRoot append:@"bNew" value : [BaseJSON writeBoolean : self.bNew]];
    [JsonRoot append:@"fMaxRetAvgIncrease" value : [BaseJSON writeFloat : self.fMaxRetAvgIncrease]];
    [JsonRoot append:@"sMaxRetUpBanner" value : [BaseJSON writeString : self.sMaxRetUpBanner]];
    [JsonRoot append:@"iSubscriptionsCount" value : [BaseJSON writeInt32 : self.iSubscriptionsCount]];
    [JsonRoot append:@"sSubscriptionsCount" value : [BaseJSON writeString : self.sSubscriptionsCount]];
    return JsonRoot;
}

- (IntelliPickStockEx *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.eBackgroundType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eBackgroundType"] required:false def:(int32_t)self.eBackgroundType];
    self.vtTagInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtTagInfo"] required:false def:self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.vtIntelliStock = [BaseJSON readListDef:[RootMap objectForKey:@"vtIntelliStock"] required:false def:self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.iHoldingPeriod = [BaseJSON readInt32Def:[RootMap objectForKey:@"iHoldingPeriod"] required:false def:self.iHoldingPeriod];
    self.fAvgIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAvgIncrease"] required:false def:self.fAvgIncrease];
    self.fMorrowAvgIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMorrowAvgIncrease"] required:false def:self.fMorrowAvgIncrease];
    self.sSource = [BaseJSON readStringDef:[RootMap objectForKey:@"sSource"] required:false def:self.sSource];
    self.vIncomeResult = [BaseJSON readListDef:[RootMap objectForKey:@"vIncomeResult"] required:false def:self.vIncomeResult VAR_TYPE: [THOTH_LIST CREATE: [IncomeResult class]]];
    self.fSuccPrecent = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSuccPrecent"] required:false def:self.fSuccPrecent];
    self.fAnnualizedReturn = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAnnualizedReturn"] required:false def:self.fAnnualizedReturn];
    self.sUpBanner = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpBanner"] required:false def:self.sUpBanner];
    self.sDownBanner = [BaseJSON readStringDef:[RootMap objectForKey:@"sDownBanner"] required:false def:self.sDownBanner];
    self.fWeekIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fWeekIncrease"] required:false def:self.fWeekIncrease];
    self.fTodayIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fTodayIncrease"] required:false def:self.fTodayIncrease];
    self.fMaxSuccPercent = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMaxSuccPercent"] required:false def:self.fMaxSuccPercent];
    self.iMaxSuccHoldingPeriod = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMaxSuccHoldingPeriod"] required:false def:self.iMaxSuccHoldingPeriod];
    self.fWeekIncreaseEx = [BaseJSON readFloatDef:[RootMap objectForKey:@"fWeekIncreaseEx"] required:false def:self.fWeekIncreaseEx];
    self.bNew = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bNew"] required:false def:self.bNew];
    self.fMaxRetAvgIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMaxRetAvgIncrease"] required:false def:self.fMaxRetAvgIncrease];
    self.sMaxRetUpBanner = [BaseJSON readStringDef:[RootMap objectForKey:@"sMaxRetUpBanner"] required:false def:self.sMaxRetUpBanner];
    self.iSubscriptionsCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubscriptionsCount"] required:false def:self.iSubscriptionsCount];
    self.sSubscriptionsCount = [BaseJSON readStringDef:[RootMap objectForKey:@"sSubscriptionsCount"] required:false def:self.sSubscriptionsCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliBroker
- (id) init
{
    if (self = [super init])
    {
        self.sBrokerName = @"";
        self.sBrokerIcon = @"";
        self.sBrokerUrl = @"";
        self.vTag = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sBrokerName != nil)
    {
        [ostream writeString: 0 value: self.sBrokerName];
    }
    if (self.sBrokerIcon != nil)
    {
        [ostream writeString: 1 value: self.sBrokerIcon];
    }
    if (self.sBrokerUrl != nil)
    {
        [ostream writeString: 2 value: self.sBrokerUrl];
    }
    if (self.vTag != nil)
    {
        [ostream writeList: 3 value: self.vTag VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliBroker *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sBrokerName = [istream readStringDef: 0 required: false def: self.sBrokerName];
    self.sBrokerIcon = [istream readStringDef: 1 required: false def: self.sBrokerIcon];
    self.sBrokerUrl = [istream readStringDef: 2 required: false def: self.sBrokerUrl];
    self.vTag = [istream readListDef: 3 required: false def: self.vTag VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sBrokerName" value : [BaseJSON writeString : self.sBrokerName]];
    [JsonRoot append:@"sBrokerIcon" value : [BaseJSON writeString : self.sBrokerIcon]];
    [JsonRoot append:@"sBrokerUrl" value : [BaseJSON writeString : self.sBrokerUrl]];
    [JsonRoot append:@"vTag" value : [BaseJSON writeList : self.vTag VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (IntelliBroker *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sBrokerName = [BaseJSON readStringDef:[RootMap objectForKey:@"sBrokerName"] required:false def:self.sBrokerName];
    self.sBrokerIcon = [BaseJSON readStringDef:[RootMap objectForKey:@"sBrokerIcon"] required:false def:self.sBrokerIcon];
    self.sBrokerUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sBrokerUrl"] required:false def:self.sBrokerUrl];
    self.vTag = [BaseJSON readListDef:[RootMap objectForKey:@"vTag"] required:false def:self.vTag VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliPickStockV2
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sTitle = @"";
        self.vtTagInfo = [NSMutableArray arrayWithCapacity:0];
        self.sDescription = @"";
        self.sSource = @"";
        self.vtAvgIncrease = [NSMutableArray arrayWithCapacity:0];
        self.vtSuccPercent = [NSMutableArray arrayWithCapacity:0];
        self.vtYearEarning = [NSMutableArray arrayWithCapacity:0];
        self.sDate = @"";
        self.vtIntelliStock = [NSMutableArray arrayWithCapacity:0];
        self.vBrokerList = [NSMutableArray arrayWithCapacity:0];
        self.iSubscriptionsCount = 0;
        self.sSubscriptionsCount = @"";
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
    if (self.sTitle != nil)
    {
        [ostream writeString: 1 value: self.sTitle];
    }
    if (self.vtTagInfo != nil)
    {
        [ostream writeList: 2 value: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 3 value: self.sDescription];
    }
    if (self.sSource != nil)
    {
        [ostream writeString: 4 value: self.sSource];
    }
    if (self.vtAvgIncrease != nil)
    {
        [ostream writeList: 5 value: self.vtAvgIncrease VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    }
    if (self.vtSuccPercent != nil)
    {
        [ostream writeList: 6 value: self.vtSuccPercent VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    }
    if (self.vtYearEarning != nil)
    {
        [ostream writeList: 7 value: self.vtYearEarning VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    }
    if (self.sDate != nil)
    {
        [ostream writeString: 8 value: self.sDate];
    }
    if (self.vtIntelliStock != nil)
    {
        [ostream writeList: 9 value: self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    }
    if (self.vBrokerList != nil)
    {
        [ostream writeList: 10 value: self.vBrokerList VAR_TYPE: [THOTH_LIST CREATE: [IntelliBroker class]]];
    }
    [ostream writeInt32: 11 value: self.iSubscriptionsCount];
    if (self.sSubscriptionsCount != nil)
    {
        [ostream writeString: 12 value: self.sSubscriptionsCount];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStockV2 *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    self.vtTagInfo = [istream readListDef: 2 required: false def: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.sDescription = [istream readStringDef: 3 required: false def: self.sDescription];
    self.sSource = [istream readStringDef: 4 required: false def: self.sSource];
    self.vtAvgIncrease = [istream readListDef: 5 required: false def: self.vtAvgIncrease VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.vtSuccPercent = [istream readListDef: 6 required: false def: self.vtSuccPercent VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.vtYearEarning = [istream readListDef: 7 required: false def: self.vtYearEarning VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.sDate = [istream readStringDef: 8 required: false def: self.sDate];
    self.vtIntelliStock = [istream readListDef: 9 required: false def: self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    self.vBrokerList = [istream readListDef: 10 required: false def: self.vBrokerList VAR_TYPE: [THOTH_LIST CREATE: [IntelliBroker class]]];
    self.iSubscriptionsCount = [istream readInt32Def: 11 required: false def: self.iSubscriptionsCount];
    self.sSubscriptionsCount = [istream readStringDef: 12 required: false def: self.sSubscriptionsCount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"vtTagInfo" value : [BaseJSON writeList : self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"sSource" value : [BaseJSON writeString : self.sSource]];
    [JsonRoot append:@"vtAvgIncrease" value : [BaseJSON writeList : self.vtAvgIncrease VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]]];
    [JsonRoot append:@"vtSuccPercent" value : [BaseJSON writeList : self.vtSuccPercent VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]]];
    [JsonRoot append:@"vtYearEarning" value : [BaseJSON writeList : self.vtYearEarning VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"vtIntelliStock" value : [BaseJSON writeList : self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]]];
    [JsonRoot append:@"vBrokerList" value : [BaseJSON writeList : self.vBrokerList VAR_TYPE: [THOTH_LIST CREATE: [IntelliBroker class]]]];
    [JsonRoot append:@"iSubscriptionsCount" value : [BaseJSON writeInt32 : self.iSubscriptionsCount]];
    [JsonRoot append:@"sSubscriptionsCount" value : [BaseJSON writeString : self.sSubscriptionsCount]];
    return JsonRoot;
}

- (IntelliPickStockV2 *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.vtTagInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtTagInfo"] required:false def:self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.sSource = [BaseJSON readStringDef:[RootMap objectForKey:@"sSource"] required:false def:self.sSource];
    self.vtAvgIncrease = [BaseJSON readListDef:[RootMap objectForKey:@"vtAvgIncrease"] required:false def:self.vtAvgIncrease VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.vtSuccPercent = [BaseJSON readListDef:[RootMap objectForKey:@"vtSuccPercent"] required:false def:self.vtSuccPercent VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.vtYearEarning = [BaseJSON readListDef:[RootMap objectForKey:@"vtYearEarning"] required:false def:self.vtYearEarning VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.vtIntelliStock = [BaseJSON readListDef:[RootMap objectForKey:@"vtIntelliStock"] required:false def:self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    self.vBrokerList = [BaseJSON readListDef:[RootMap objectForKey:@"vBrokerList"] required:false def:self.vBrokerList VAR_TYPE: [THOTH_LIST CREATE: [IntelliBroker class]]];
    self.iSubscriptionsCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubscriptionsCount"] required:false def:self.iSubscriptionsCount];
    self.sSubscriptionsCount = [BaseJSON readStringDef:[RootMap objectForKey:@"sSubscriptionsCount"] required:false def:self.sSubscriptionsCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliPickStockReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sStartId = @"";
        self.sEndId = @"";
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
    if (self.sStartId != nil)
    {
        [ostream writeString: 1 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 2 value: self.sEndId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStockReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sStartId = [istream readStringDef: 1 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 2 required: false def: self.sEndId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    [JsonRoot append:@"sEndId" value : [BaseJSON writeString : self.sEndId]];
    return JsonRoot;
}

- (IntelliPickStockReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    self.sEndId = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndId"] required:false def:self.sEndId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliPickStockRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtIntelliPickStock = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtIntelliPickStock != nil)
    {
        [ostream writeList: 0 value: self.vtIntelliPickStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStock class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStockRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtIntelliPickStock = [istream readListDef: 0 required: false def: self.vtIntelliPickStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStock class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtIntelliPickStock" value : [BaseJSON writeList : self.vtIntelliPickStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStock class]]]];
    return JsonRoot;
}

- (IntelliPickStockRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtIntelliPickStock = [BaseJSON readListDef:[RootMap objectForKey:@"vtIntelliPickStock"] required:false def:self.vtIntelliPickStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStock class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliPickStockRspEx
- (id) init
{
    if (self = [super init])
    {
        self.vtIntelliPickStockEx = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtIntelliPickStockEx != nil)
    {
        [ostream writeList: 0 value: self.vtIntelliPickStockEx VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStockRspEx *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtIntelliPickStockEx = [istream readListDef: 0 required: false def: self.vtIntelliPickStockEx VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtIntelliPickStockEx" value : [BaseJSON writeList : self.vtIntelliPickStockEx VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]]];
    return JsonRoot;
}

- (IntelliPickStockRspEx *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtIntelliPickStockEx = [BaseJSON readListDef:[RootMap objectForKey:@"vtIntelliPickStockEx"] required:false def:self.vtIntelliPickStockEx VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliPickStockDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sId = @"";
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
    if (self.sId != nil)
    {
        [ostream writeString: 1 value: self.sId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStockDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sId = [istream readStringDef: 1 required: false def: self.sId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sId" value : [BaseJSON writeString : self.sId]];
    return JsonRoot;
}

- (IntelliPickStockDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
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
@implementation IntelliPickStockDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.stIntelliPickStockEx = [[IntelliPickStockEx alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stIntelliPickStockEx != nil)
    {
        [ostream writeMessage: 0 value: self.stIntelliPickStockEx];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStockDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stIntelliPickStockEx = (IntelliPickStockEx*)[istream readMessageDef: 0 required: false def: self.stIntelliPickStockEx VAR_TYPE: [IntelliPickStockEx class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stIntelliPickStockEx" value : [BaseJSON writeMessage : self.stIntelliPickStockEx]];
    return JsonRoot;
}

- (IntelliPickStockDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stIntelliPickStockEx = [BaseJSON readMessageDef:[RootMap objectForKey:@"stIntelliPickStockEx"] required:false def:self.stIntelliPickStockEx VAR_TYPE: [IntelliPickStockEx class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliPickStockDetailV2Rsp
- (id) init
{
    if (self = [super init])
    {
        self.stIntelliPickStockV2 = [[IntelliPickStockV2 alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stIntelliPickStockV2 != nil)
    {
        [ostream writeMessage: 0 value: self.stIntelliPickStockV2];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliPickStockDetailV2Rsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stIntelliPickStockV2 = (IntelliPickStockV2*)[istream readMessageDef: 0 required: false def: self.stIntelliPickStockV2 VAR_TYPE: [IntelliPickStockV2 class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stIntelliPickStockV2" value : [BaseJSON writeMessage : self.stIntelliPickStockV2]];
    return JsonRoot;
}

- (IntelliPickStockDetailV2Rsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stIntelliPickStockV2 = [BaseJSON readMessageDef:[RootMap objectForKey:@"stIntelliPickStockV2"] required:false def:self.stIntelliPickStockV2 VAR_TYPE: [IntelliPickStockV2 class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliSec
- (id) init
{
    if (self = [super init])
    {
        self.sChnName = @"";
        self.sDtCode = @"";
        self.fFirstIncrease = 0;
        self.fToNowIncrease = 0;
        self.fDayAvgIncrease = 0;
        self.fSelectedPrice = 0;
        self.fMaxIncrease = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sChnName != nil)
    {
        [ostream writeString: 0 value: self.sChnName];
    }
    if (self.sDtCode != nil)
    {
        [ostream writeString: 1 value: self.sDtCode];
    }
    [ostream writeFloat: 2 value: self.fFirstIncrease];
    [ostream writeFloat: 3 value: self.fToNowIncrease];
    [ostream writeFloat: 4 value: self.fDayAvgIncrease];
    [ostream writeFloat: 5 value: self.fSelectedPrice];
    [ostream writeFloat: 6 value: self.fMaxIncrease];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliSec *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sChnName = [istream readStringDef: 0 required: false def: self.sChnName];
    self.sDtCode = [istream readStringDef: 1 required: false def: self.sDtCode];
    self.fFirstIncrease = [istream readFloatDef: 2 required: false def: self.fFirstIncrease];
    self.fToNowIncrease = [istream readFloatDef: 3 required: false def: self.fToNowIncrease];
    self.fDayAvgIncrease = [istream readFloatDef: 4 required: false def: self.fDayAvgIncrease];
    self.fSelectedPrice = [istream readFloatDef: 5 required: false def: self.fSelectedPrice];
    self.fMaxIncrease = [istream readFloatDef: 6 required: false def: self.fMaxIncrease];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sChnName" value : [BaseJSON writeString : self.sChnName]];
    [JsonRoot append:@"sDtCode" value : [BaseJSON writeString : self.sDtCode]];
    [JsonRoot append:@"fFirstIncrease" value : [BaseJSON writeFloat : self.fFirstIncrease]];
    [JsonRoot append:@"fToNowIncrease" value : [BaseJSON writeFloat : self.fToNowIncrease]];
    [JsonRoot append:@"fDayAvgIncrease" value : [BaseJSON writeFloat : self.fDayAvgIncrease]];
    [JsonRoot append:@"fSelectedPrice" value : [BaseJSON writeFloat : self.fSelectedPrice]];
    [JsonRoot append:@"fMaxIncrease" value : [BaseJSON writeFloat : self.fMaxIncrease]];
    return JsonRoot;
}

- (IntelliSec *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sChnName = [BaseJSON readStringDef:[RootMap objectForKey:@"sChnName"] required:false def:self.sChnName];
    self.sDtCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtCode"] required:false def:self.sDtCode];
    self.fFirstIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFirstIncrease"] required:false def:self.fFirstIncrease];
    self.fToNowIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fToNowIncrease"] required:false def:self.fToNowIncrease];
    self.fDayAvgIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fDayAvgIncrease"] required:false def:self.fDayAvgIncrease];
    self.fSelectedPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSelectedPrice"] required:false def:self.fSelectedPrice];
    self.fMaxIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMaxIncrease"] required:false def:self.fMaxIncrease];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliDaySec
- (id) init
{
    if (self = [super init])
    {
        self.sOptime = @"";
        self.vtSec = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sOptime != nil)
    {
        [ostream writeString: 0 value: self.sOptime];
    }
    if (self.vtSec != nil)
    {
        [ostream writeList: 1 value: self.vtSec VAR_TYPE: [THOTH_LIST CREATE: [IntelliSec class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliDaySec *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sOptime = [istream readStringDef: 0 required: false def: self.sOptime];
    self.vtSec = [istream readListDef: 1 required: false def: self.vtSec VAR_TYPE: [THOTH_LIST CREATE: [IntelliSec class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sOptime" value : [BaseJSON writeString : self.sOptime]];
    [JsonRoot append:@"vtSec" value : [BaseJSON writeList : self.vtSec VAR_TYPE: [THOTH_LIST CREATE: [IntelliSec class]]]];
    return JsonRoot;
}

- (IntelliDaySec *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sOptime = [BaseJSON readStringDef:[RootMap objectForKey:@"sOptime"] required:false def:self.sOptime];
    self.vtSec = [BaseJSON readListDef:[RootMap objectForKey:@"vtSec"] required:false def:self.vtSec VAR_TYPE: [THOTH_LIST CREATE: [IntelliSec class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IntelliSecPoolReq
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.stUserInfo = [[UserInfo alloc] init];
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
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stUserInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliSecPoolReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
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
    [JsonRoot append:@"sId" value : [BaseJSON writeString : self.sId]];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    return JsonRoot;
}

- (IntelliSecPoolReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
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
@implementation IntelliSecPoolRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtDaySec = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtDaySec != nil)
    {
        [ostream writeList: 0 value: self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliDaySec class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IntelliSecPoolRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtDaySec = [istream readListDef: 0 required: false def: self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliDaySec class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtDaySec" value : [BaseJSON writeList : self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliDaySec class]]]];
    return JsonRoot;
}

- (IntelliSecPoolRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtDaySec = [BaseJSON readListDef:[RootMap objectForKey:@"vtDaySec"] required:false def:self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliDaySec class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation HotStockListReq
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

- (HotStockListReq *) read: (BaseDecodeStream *)istream
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

- (HotStockListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation HotStockDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.sStrategyName = @"";
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
    if (self.sStrategyName != nil)
    {
        [ostream writeString: 2 value: self.sStrategyName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (HotStockDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.sStrategyName = [istream readStringDef: 2 required: false def: self.sStrategyName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sStrategyName" value : [BaseJSON writeString : self.sStrategyName]];
    return JsonRoot;
}

- (HotStockDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sStrategyName = [BaseJSON readStringDef:[RootMap objectForKey:@"sStrategyName"] required:false def:self.sStrategyName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation HotStockListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtHotStock = [NSMutableArray arrayWithCapacity:0];
        self.sHotDesc = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtHotStock != nil)
    {
        [ostream writeList: 0 value: self.vtHotStock VAR_TYPE: [THOTH_LIST CREATE: [HotStockDesc class]]];
    }
    if (self.sHotDesc != nil)
    {
        [ostream writeString: 1 value: self.sHotDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (HotStockListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtHotStock = [istream readListDef: 0 required: false def: self.vtHotStock VAR_TYPE: [THOTH_LIST CREATE: [HotStockDesc class]]];
    self.sHotDesc = [istream readStringDef: 1 required: false def: self.sHotDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtHotStock" value : [BaseJSON writeList : self.vtHotStock VAR_TYPE: [THOTH_LIST CREATE: [HotStockDesc class]]]];
    [JsonRoot append:@"sHotDesc" value : [BaseJSON writeString : self.sHotDesc]];
    return JsonRoot;
}

- (HotStockListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtHotStock = [BaseJSON readListDef:[RootMap objectForKey:@"vtHotStock"] required:false def:self.vtHotStock VAR_TYPE: [THOTH_LIST CREATE: [HotStockDesc class]]];
    self.sHotDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sHotDesc"] required:false def:self.sHotDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StrategyListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eRankType = E_SRT_HOT;
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
    [ostream writeInt32: 1 value: (int32_t)self.eRankType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StrategyListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eRankType = [istream readInt32Def: 1 required: false def: (int32_t)self.eRankType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eRankType" value : [BaseJSON writeInt32 : (int32_t)self.eRankType]];
    return JsonRoot;
}

- (StrategyListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eRankType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eRankType"] required:false def:(int32_t)self.eRankType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StrategyListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtDaySec = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtDaySec != nil)
    {
        [ostream writeList: 0 value: self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StrategyListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtDaySec = [istream readListDef: 0 required: false def: self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtDaySec" value : [BaseJSON writeList : self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]]];
    return JsonRoot;
}

- (StrategyListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtDaySec = [BaseJSON readListDef:[RootMap objectForKey:@"vtDaySec"] required:false def:self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SearchIntelliPickStockListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eSearchCondition = E_SEARCH_CDT_ALL;
        self.sSearchStr = @"";
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
    [ostream writeInt32: 1 value: (int32_t)self.eSearchCondition];
    if (self.sSearchStr != nil)
    {
        [ostream writeString: 2 value: self.sSearchStr];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SearchIntelliPickStockListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eSearchCondition = [istream readInt32Def: 1 required: false def: (int32_t)self.eSearchCondition];
    self.sSearchStr = [istream readStringDef: 2 required: false def: self.sSearchStr];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eSearchCondition" value : [BaseJSON writeInt32 : (int32_t)self.eSearchCondition]];
    [JsonRoot append:@"sSearchStr" value : [BaseJSON writeString : self.sSearchStr]];
    return JsonRoot;
}

- (SearchIntelliPickStockListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eSearchCondition = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSearchCondition"] required:false def:(int32_t)self.eSearchCondition];
    self.sSearchStr = [BaseJSON readStringDef:[RootMap objectForKey:@"sSearchStr"] required:false def:self.sSearchStr];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SearchIntelliPickStockListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vIntelliPickStockEx = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vIntelliPickStockEx != nil)
    {
        [ostream writeList: 0 value: self.vIntelliPickStockEx VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SearchIntelliPickStockListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vIntelliPickStockEx = [istream readListDef: 0 required: false def: self.vIntelliPickStockEx VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vIntelliPickStockEx" value : [BaseJSON writeList : self.vIntelliPickStockEx VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]]];
    return JsonRoot;
}

- (SearchIntelliPickStockListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vIntelliPickStockEx = [BaseJSON readListDef:[RootMap objectForKey:@"vIntelliPickStockEx"] required:false def:self.vIntelliPickStockEx VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StrategySourceListReq
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

- (StrategySourceListReq *) read: (BaseDecodeStream *)istream
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

- (StrategySourceListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation StrategySourceListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vSource = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSource != nil)
    {
        [ostream writeList: 0 value: self.vSource VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StrategySourceListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSource = [istream readListDef: 0 required: false def: self.vSource VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vSource" value : [BaseJSON writeList : self.vSource VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (StrategySourceListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vSource = [BaseJSON readListDef:[RootMap objectForKey:@"vSource"] required:false def:self.vSource VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConditionPickStrategy
- (id) init
{
    if (self = [super init])
    {
        self.sStrategyName = @"";
        self.sUniKey = @"";
        self.vCondition = [NSMutableArray arrayWithCapacity:0];
        self.vtTagInfo = [NSMutableArray arrayWithCapacity:0];
        self.iSubTime = 0;
        self.sUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStrategyName != nil)
    {
        [ostream writeString: 0 value: self.sStrategyName];
    }
    if (self.sUniKey != nil)
    {
        [ostream writeString: 1 value: self.sUniKey];
    }
    if (self.vCondition != nil)
    {
        [ostream writeList: 2 value: self.vCondition VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.vtTagInfo != nil)
    {
        [ostream writeList: 3 value: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    }
    [ostream writeInt32: 4 value: self.iSubTime];
    if (self.sUrl != nil)
    {
        [ostream writeString: 5 value: self.sUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConditionPickStrategy *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStrategyName = [istream readStringDef: 0 required: false def: self.sStrategyName];
    self.sUniKey = [istream readStringDef: 1 required: false def: self.sUniKey];
    self.vCondition = [istream readListDef: 2 required: false def: self.vCondition VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.vtTagInfo = [istream readListDef: 3 required: false def: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.iSubTime = [istream readInt32Def: 4 required: false def: self.iSubTime];
    self.sUrl = [istream readStringDef: 5 required: false def: self.sUrl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sStrategyName" value : [BaseJSON writeString : self.sStrategyName]];
    [JsonRoot append:@"sUniKey" value : [BaseJSON writeString : self.sUniKey]];
    [JsonRoot append:@"vCondition" value : [BaseJSON writeList : self.vCondition VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"vtTagInfo" value : [BaseJSON writeList : self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]]];
    [JsonRoot append:@"iSubTime" value : [BaseJSON writeInt32 : self.iSubTime]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    return JsonRoot;
}

- (ConditionPickStrategy *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sStrategyName = [BaseJSON readStringDef:[RootMap objectForKey:@"sStrategyName"] required:false def:self.sStrategyName];
    self.sUniKey = [BaseJSON readStringDef:[RootMap objectForKey:@"sUniKey"] required:false def:self.sUniKey];
    self.vCondition = [BaseJSON readListDef:[RootMap objectForKey:@"vCondition"] required:false def:self.vCondition VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.vtTagInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtTagInfo"] required:false def:self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.iSubTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubTime"] required:false def:self.iSubTime];
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
@implementation SubConditionPickStrategyReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.eSubAction = E_SSA_ADD;
        self.stConditionPickStrategy = [[ConditionPickStrategy alloc] init];
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
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eSubAction];
    if (self.stConditionPickStrategy != nil)
    {
        [ostream writeMessage: 3 value: self.stConditionPickStrategy];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SubConditionPickStrategyReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.eSubAction = [istream readInt32Def: 2 required: false def: (int32_t)self.eSubAction];
    self.stConditionPickStrategy = (ConditionPickStrategy*)[istream readMessageDef: 3 required: false def: self.stConditionPickStrategy VAR_TYPE: [ConditionPickStrategy class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"eSubAction" value : [BaseJSON writeInt32 : (int32_t)self.eSubAction]];
    [JsonRoot append:@"stConditionPickStrategy" value : [BaseJSON writeMessage : self.stConditionPickStrategy]];
    return JsonRoot;
}

- (SubConditionPickStrategyReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.eSubAction = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSubAction"] required:false def:(int32_t)self.eSubAction];
    self.stConditionPickStrategy = [BaseJSON readMessageDef:[RootMap objectForKey:@"stConditionPickStrategy"] required:false def:self.stConditionPickStrategy VAR_TYPE: [ConditionPickStrategy class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SubConditionPickStrategyRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.eSubResult = E_SSR_SUCC;
        self.stConditionPickStrategy = [[ConditionPickStrategy alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    [ostream writeInt32: 1 value: (int32_t)self.eSubResult];
    if (self.stConditionPickStrategy != nil)
    {
        [ostream writeMessage: 2 value: self.stConditionPickStrategy];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SubConditionPickStrategyRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.eSubResult = [istream readInt32Def: 1 required: false def: (int32_t)self.eSubResult];
    self.stConditionPickStrategy = (ConditionPickStrategy*)[istream readMessageDef: 2 required: false def: self.stConditionPickStrategy VAR_TYPE: [ConditionPickStrategy class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eSubResult" value : [BaseJSON writeInt32 : (int32_t)self.eSubResult]];
    [JsonRoot append:@"stConditionPickStrategy" value : [BaseJSON writeMessage : self.stConditionPickStrategy]];
    return JsonRoot;
}

- (SubConditionPickStrategyRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRet = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRet"] required:false def:self.iRet];
    self.eSubResult = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSubResult"] required:false def:(int32_t)self.eSubResult];
    self.stConditionPickStrategy = [BaseJSON readMessageDef:[RootMap objectForKey:@"stConditionPickStrategy"] required:false def:self.stConditionPickStrategy VAR_TYPE: [ConditionPickStrategy class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConditionPickStrategyListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
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
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConditionPickStrategyListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    return JsonRoot;
}

- (ConditionPickStrategyListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConditionPickStrategyListRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.vtConditionPickStrategy = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.vtConditionPickStrategy != nil)
    {
        [ostream writeList: 1 value: self.vtConditionPickStrategy VAR_TYPE: [THOTH_LIST CREATE: [ConditionPickStrategy class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConditionPickStrategyListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.vtConditionPickStrategy = [istream readListDef: 1 required: false def: self.vtConditionPickStrategy VAR_TYPE: [THOTH_LIST CREATE: [ConditionPickStrategy class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vtConditionPickStrategy" value : [BaseJSON writeList : self.vtConditionPickStrategy VAR_TYPE: [THOTH_LIST CREATE: [ConditionPickStrategy class]]]];
    return JsonRoot;
}

- (ConditionPickStrategyListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRet = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRet"] required:false def:self.iRet];
    self.vtConditionPickStrategy = [BaseJSON readListDef:[RootMap objectForKey:@"vtConditionPickStrategy"] required:false def:self.vtConditionPickStrategy VAR_TYPE: [THOTH_LIST CREATE: [ConditionPickStrategy class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LotNumResult
- (id) init
{
    if (self = [super init])
    {
        self.sDescriptio = @"";
        self.sNumber = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDescriptio != nil)
    {
        [ostream writeString: 0 value: self.sDescriptio];
    }
    if (self.sNumber != nil)
    {
        [ostream writeString: 1 value: self.sNumber];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LotNumResult *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDescriptio = [istream readStringDef: 0 required: false def: self.sDescriptio];
    self.sNumber = [istream readStringDef: 1 required: false def: self.sNumber];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sDescriptio" value : [BaseJSON writeString : self.sDescriptio]];
    [JsonRoot append:@"sNumber" value : [BaseJSON writeString : self.sNumber]];
    return JsonRoot;
}

- (LotNumResult *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDescriptio = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescriptio"] required:false def:self.sDescriptio];
    self.sNumber = [BaseJSON readStringDef:[RootMap objectForKey:@"sNumber"] required:false def:self.sNumber];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecIPOBasicInfo
- (id) init
{
    if (self = [super init])
    {
        self.eStatus = E_IPO_ALL;
        self.sIPOCode = @"";
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.fIssPrice = 0;
        self.fAplCeil = 0;
        self.fPerCeil = 0;
        self.fAplRatio = 0;
        self.sListDate = @"";
        self.fChangePct = 0;
        self.sIPODate = @"";
        self.sLotNumberDate = @"";
        self.sPayInDate = @"";
        self.sLotResPubDay = @"";
        self.vLotNumResult = [NSMutableArray arrayWithCapacity:0];
        self.eMarketType = E_MT_NO;
        self.fIncomePerSign = 0;
        self.iTopIncreaseDay = 0;
        self.iIncreseStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eStatus];
    if (self.sIPOCode != nil)
    {
        [ostream writeString: 1 value: self.sIPOCode];
    }
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 2 value: self.sDtSecCode];
    }
    if (self.sSecName != nil)
    {
        [ostream writeString: 3 value: self.sSecName];
    }
    [ostream writeFloat: 4 value: self.fIssPrice];
    [ostream writeFloat: 5 value: self.fAplCeil];
    [ostream writeFloat: 6 value: self.fPerCeil];
    [ostream writeFloat: 7 value: self.fAplRatio];
    if (self.sListDate != nil)
    {
        [ostream writeString: 8 value: self.sListDate];
    }
    [ostream writeFloat: 9 value: self.fChangePct];
    if (self.sIPODate != nil)
    {
        [ostream writeString: 10 value: self.sIPODate];
    }
    if (self.sLotNumberDate != nil)
    {
        [ostream writeString: 11 value: self.sLotNumberDate];
    }
    if (self.sPayInDate != nil)
    {
        [ostream writeString: 12 value: self.sPayInDate];
    }
    if (self.sLotResPubDay != nil)
    {
        [ostream writeString: 13 value: self.sLotResPubDay];
    }
    if (self.vLotNumResult != nil)
    {
        [ostream writeList: 14 value: self.vLotNumResult VAR_TYPE: [THOTH_LIST CREATE: [LotNumResult class]]];
    }
    [ostream writeInt32: 15 value: (int32_t)self.eMarketType];
    [ostream writeFloat: 16 value: self.fIncomePerSign];
    [ostream writeInt32: 17 value: self.iTopIncreaseDay];
    [ostream writeInt32: 18 value: self.iIncreseStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecIPOBasicInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eStatus = [istream readInt32Def: 0 required: false def: (int32_t)self.eStatus];
    self.sIPOCode = [istream readStringDef: 1 required: false def: self.sIPOCode];
    self.sDtSecCode = [istream readStringDef: 2 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 3 required: false def: self.sSecName];
    self.fIssPrice = [istream readFloatDef: 4 required: false def: self.fIssPrice];
    self.fAplCeil = [istream readFloatDef: 5 required: false def: self.fAplCeil];
    self.fPerCeil = [istream readFloatDef: 6 required: false def: self.fPerCeil];
    self.fAplRatio = [istream readFloatDef: 7 required: false def: self.fAplRatio];
    self.sListDate = [istream readStringDef: 8 required: false def: self.sListDate];
    self.fChangePct = [istream readFloatDef: 9 required: false def: self.fChangePct];
    self.sIPODate = [istream readStringDef: 10 required: false def: self.sIPODate];
    self.sLotNumberDate = [istream readStringDef: 11 required: false def: self.sLotNumberDate];
    self.sPayInDate = [istream readStringDef: 12 required: false def: self.sPayInDate];
    self.sLotResPubDay = [istream readStringDef: 13 required: false def: self.sLotResPubDay];
    self.vLotNumResult = [istream readListDef: 14 required: false def: self.vLotNumResult VAR_TYPE: [THOTH_LIST CREATE: [LotNumResult class]]];
    self.eMarketType = [istream readInt32Def: 15 required: false def: (int32_t)self.eMarketType];
    self.fIncomePerSign = [istream readFloatDef: 16 required: false def: self.fIncomePerSign];
    self.iTopIncreaseDay = [istream readInt32Def: 17 required: false def: self.iTopIncreaseDay];
    self.iIncreseStatus = [istream readInt32Def: 18 required: false def: self.iIncreseStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"eStatus" value : [BaseJSON writeInt32 : (int32_t)self.eStatus]];
    [JsonRoot append:@"sIPOCode" value : [BaseJSON writeString : self.sIPOCode]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"fIssPrice" value : [BaseJSON writeFloat : self.fIssPrice]];
    [JsonRoot append:@"fAplCeil" value : [BaseJSON writeFloat : self.fAplCeil]];
    [JsonRoot append:@"fPerCeil" value : [BaseJSON writeFloat : self.fPerCeil]];
    [JsonRoot append:@"fAplRatio" value : [BaseJSON writeFloat : self.fAplRatio]];
    [JsonRoot append:@"sListDate" value : [BaseJSON writeString : self.sListDate]];
    [JsonRoot append:@"fChangePct" value : [BaseJSON writeFloat : self.fChangePct]];
    [JsonRoot append:@"sIPODate" value : [BaseJSON writeString : self.sIPODate]];
    [JsonRoot append:@"sLotNumberDate" value : [BaseJSON writeString : self.sLotNumberDate]];
    [JsonRoot append:@"sPayInDate" value : [BaseJSON writeString : self.sPayInDate]];
    [JsonRoot append:@"sLotResPubDay" value : [BaseJSON writeString : self.sLotResPubDay]];
    [JsonRoot append:@"vLotNumResult" value : [BaseJSON writeList : self.vLotNumResult VAR_TYPE: [THOTH_LIST CREATE: [LotNumResult class]]]];
    [JsonRoot append:@"eMarketType" value : [BaseJSON writeInt32 : (int32_t)self.eMarketType]];
    [JsonRoot append:@"fIncomePerSign" value : [BaseJSON writeFloat : self.fIncomePerSign]];
    [JsonRoot append:@"iTopIncreaseDay" value : [BaseJSON writeInt32 : self.iTopIncreaseDay]];
    [JsonRoot append:@"iIncreseStatus" value : [BaseJSON writeInt32 : self.iIncreseStatus]];
    return JsonRoot;
}

- (SecIPOBasicInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"eStatus"] required:false def:(int32_t)self.eStatus];
    self.sIPOCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sIPOCode"] required:false def:self.sIPOCode];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fIssPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIssPrice"] required:false def:self.fIssPrice];
    self.fAplCeil = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAplCeil"] required:false def:self.fAplCeil];
    self.fPerCeil = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPerCeil"] required:false def:self.fPerCeil];
    self.fAplRatio = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAplRatio"] required:false def:self.fAplRatio];
    self.sListDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sListDate"] required:false def:self.sListDate];
    self.fChangePct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fChangePct"] required:false def:self.fChangePct];
    self.sIPODate = [BaseJSON readStringDef:[RootMap objectForKey:@"sIPODate"] required:false def:self.sIPODate];
    self.sLotNumberDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sLotNumberDate"] required:false def:self.sLotNumberDate];
    self.sPayInDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sPayInDate"] required:false def:self.sPayInDate];
    self.sLotResPubDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sLotResPubDay"] required:false def:self.sLotResPubDay];
    self.vLotNumResult = [BaseJSON readListDef:[RootMap objectForKey:@"vLotNumResult"] required:false def:self.vLotNumResult VAR_TYPE: [THOTH_LIST CREATE: [LotNumResult class]]];
    self.eMarketType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eMarketType"] required:false def:(int32_t)self.eMarketType];
    self.fIncomePerSign = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIncomePerSign"] required:false def:self.fIncomePerSign];
    self.iTopIncreaseDay = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTopIncreaseDay"] required:false def:self.iTopIncreaseDay];
    self.iIncreseStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIncreseStatus"] required:false def:self.iIncreseStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecIPODetailInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.sIPOCode = @"";
        self.sIPODate = @"";
        self.sLotDeclDate = @"";
        self.fAplRatio = 0;
        self.sListDate = @"";
        self.fIssPrice = 0;
        self.fPerCeil = 0;
        self.fShareNum = 0;
        self.fOnlineShareNum = 0;
        self.fAplCeil = 0;
        self.fAplFundCeil = 0;
        self.sCompanyDesc = @"";
        self.sMainBusi = @"";
        self.sLotResPubDay = @"";
        self.vLotNumResult = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sIPOCode != nil)
    {
        [ostream writeString: 2 value: self.sIPOCode];
    }
    if (self.sIPODate != nil)
    {
        [ostream writeString: 3 value: self.sIPODate];
    }
    if (self.sLotDeclDate != nil)
    {
        [ostream writeString: 4 value: self.sLotDeclDate];
    }
    [ostream writeFloat: 5 value: self.fAplRatio];
    if (self.sListDate != nil)
    {
        [ostream writeString: 6 value: self.sListDate];
    }
    [ostream writeFloat: 7 value: self.fIssPrice];
    [ostream writeFloat: 8 value: self.fPerCeil];
    [ostream writeInt64: 9 value: self.fShareNum];
    [ostream writeFloat: 10 value: self.fOnlineShareNum];
    [ostream writeFloat: 11 value: self.fAplCeil];
    [ostream writeFloat: 12 value: self.fAplFundCeil];
    if (self.sCompanyDesc != nil)
    {
        [ostream writeString: 13 value: self.sCompanyDesc];
    }
    if (self.sMainBusi != nil)
    {
        [ostream writeString: 14 value: self.sMainBusi];
    }
    if (self.sLotResPubDay != nil)
    {
        [ostream writeString: 15 value: self.sLotResPubDay];
    }
    if (self.vLotNumResult != nil)
    {
        [ostream writeList: 16 value: self.vLotNumResult VAR_TYPE: [THOTH_LIST CREATE: [LotNumResult class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecIPODetailInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.sIPOCode = [istream readStringDef: 2 required: false def: self.sIPOCode];
    self.sIPODate = [istream readStringDef: 3 required: false def: self.sIPODate];
    self.sLotDeclDate = [istream readStringDef: 4 required: false def: self.sLotDeclDate];
    self.fAplRatio = [istream readFloatDef: 5 required: false def: self.fAplRatio];
    self.sListDate = [istream readStringDef: 6 required: false def: self.sListDate];
    self.fIssPrice = [istream readFloatDef: 7 required: false def: self.fIssPrice];
    self.fPerCeil = [istream readFloatDef: 8 required: false def: self.fPerCeil];
    self.fShareNum = [istream readInt64Def: 9 required: false def: self.fShareNum];
    self.fOnlineShareNum = [istream readFloatDef: 10 required: false def: self.fOnlineShareNum];
    self.fAplCeil = [istream readFloatDef: 11 required: false def: self.fAplCeil];
    self.fAplFundCeil = [istream readFloatDef: 12 required: false def: self.fAplFundCeil];
    self.sCompanyDesc = [istream readStringDef: 13 required: false def: self.sCompanyDesc];
    self.sMainBusi = [istream readStringDef: 14 required: false def: self.sMainBusi];
    self.sLotResPubDay = [istream readStringDef: 15 required: false def: self.sLotResPubDay];
    self.vLotNumResult = [istream readListDef: 16 required: false def: self.vLotNumResult VAR_TYPE: [THOTH_LIST CREATE: [LotNumResult class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sIPOCode" value : [BaseJSON writeString : self.sIPOCode]];
    [JsonRoot append:@"sIPODate" value : [BaseJSON writeString : self.sIPODate]];
    [JsonRoot append:@"sLotDeclDate" value : [BaseJSON writeString : self.sLotDeclDate]];
    [JsonRoot append:@"fAplRatio" value : [BaseJSON writeFloat : self.fAplRatio]];
    [JsonRoot append:@"sListDate" value : [BaseJSON writeString : self.sListDate]];
    [JsonRoot append:@"fIssPrice" value : [BaseJSON writeFloat : self.fIssPrice]];
    [JsonRoot append:@"fPerCeil" value : [BaseJSON writeFloat : self.fPerCeil]];
    [JsonRoot append:@"fShareNum" value : [BaseJSON writeInt64 : self.fShareNum]];
    [JsonRoot append:@"fOnlineShareNum" value : [BaseJSON writeFloat : self.fOnlineShareNum]];
    [JsonRoot append:@"fAplCeil" value : [BaseJSON writeFloat : self.fAplCeil]];
    [JsonRoot append:@"fAplFundCeil" value : [BaseJSON writeFloat : self.fAplFundCeil]];
    [JsonRoot append:@"sCompanyDesc" value : [BaseJSON writeString : self.sCompanyDesc]];
    [JsonRoot append:@"sMainBusi" value : [BaseJSON writeString : self.sMainBusi]];
    [JsonRoot append:@"sLotResPubDay" value : [BaseJSON writeString : self.sLotResPubDay]];
    [JsonRoot append:@"vLotNumResult" value : [BaseJSON writeList : self.vLotNumResult VAR_TYPE: [THOTH_LIST CREATE: [LotNumResult class]]]];
    return JsonRoot;
}

- (SecIPODetailInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sIPOCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sIPOCode"] required:false def:self.sIPOCode];
    self.sIPODate = [BaseJSON readStringDef:[RootMap objectForKey:@"sIPODate"] required:false def:self.sIPODate];
    self.sLotDeclDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sLotDeclDate"] required:false def:self.sLotDeclDate];
    self.fAplRatio = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAplRatio"] required:false def:self.fAplRatio];
    self.sListDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sListDate"] required:false def:self.sListDate];
    self.fIssPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIssPrice"] required:false def:self.fIssPrice];
    self.fPerCeil = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPerCeil"] required:false def:self.fPerCeil];
    self.fShareNum = [BaseJSON readInt64Def:[RootMap objectForKey:@"fShareNum"] required:false def:self.fShareNum];
    self.fOnlineShareNum = [BaseJSON readFloatDef:[RootMap objectForKey:@"fOnlineShareNum"] required:false def:self.fOnlineShareNum];
    self.fAplCeil = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAplCeil"] required:false def:self.fAplCeil];
    self.fAplFundCeil = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAplFundCeil"] required:false def:self.fAplFundCeil];
    self.sCompanyDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sCompanyDesc"] required:false def:self.sCompanyDesc];
    self.sMainBusi = [BaseJSON readStringDef:[RootMap objectForKey:@"sMainBusi"] required:false def:self.sMainBusi];
    self.sLotResPubDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sLotResPubDay"] required:false def:self.sLotResPubDay];
    self.vLotNumResult = [BaseJSON readListDef:[RootMap objectForKey:@"vLotNumResult"] required:false def:self.vLotNumResult VAR_TYPE: [THOTH_LIST CREATE: [LotNumResult class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetIPOBasicInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eStatus = E_IPO_ALL;
        self.iVersion = 0;
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
    [ostream writeInt32: 1 value: (int32_t)self.eStatus];
    [ostream writeInt32: 2 value: self.iVersion];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetIPOBasicInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eStatus = [istream readInt32Def: 1 required: false def: (int32_t)self.eStatus];
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
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"eStatus" value : [BaseJSON writeInt32 : (int32_t)self.eStatus]];
    [JsonRoot append:@"iVersion" value : [BaseJSON writeInt32 : self.iVersion]];
    return JsonRoot;
}

- (GetIPOBasicInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"eStatus"] required:false def:(int32_t)self.eStatus];
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
@implementation GetIPOBasicInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.vInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vInfo != nil)
    {
        [ostream writeList: 0 value: self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecIPOBasicInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetIPOBasicInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vInfo = [istream readListDef: 0 required: false def: self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecIPOBasicInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vInfo" value : [BaseJSON writeList : self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecIPOBasicInfo class]]]];
    return JsonRoot;
}

- (GetIPOBasicInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vInfo"] required:false def:self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecIPOBasicInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetIPODetailInfoReq
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

- (GetIPODetailInfoReq *) read: (BaseDecodeStream *)istream
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

- (GetIPODetailInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GetIPODetailInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.stInfo = [[SecIPODetailInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetIPODetailInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stInfo = (SecIPODetailInfo*)[istream readMessageDef: 0 required: false def: self.stInfo VAR_TYPE: [SecIPODetailInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stInfo" value : [BaseJSON writeMessage : self.stInfo]];
    return JsonRoot;
}

- (GetIPODetailInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stInfo"] required:false def:self.stInfo VAR_TYPE: [SecIPODetailInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetDtActivityListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eType = T_ACTIVITY_LIST;
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
    [ostream writeInt32: 1 value: (int32_t)self.eType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetDtActivityListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eType = [istream readInt32Def: 1 required: false def: (int32_t)self.eType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eType" value : [BaseJSON writeInt32 : (int32_t)self.eType]];
    return JsonRoot;
}

- (GetDtActivityListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eType"] required:false def:(int32_t)self.eType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DtActivityDetail
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sDesc = @"";
        self.sPicUrl = @"";
        self.sUrl = @"";
        self.lOnlineTime = 0;
        self.lOfflineTime = 0;
        self.iStatus = 0;
        self.iPriority = 0;
        self.sPlat = @"all";
        self.iType = 0;
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
    if (self.sDesc != nil)
    {
        [ostream writeString: 1 value: self.sDesc];
    }
    if (self.sPicUrl != nil)
    {
        [ostream writeString: 2 value: self.sPicUrl];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 3 value: self.sUrl];
    }
    [ostream writeInt64: 4 value: self.lOnlineTime];
    [ostream writeInt64: 5 value: self.lOfflineTime];
    [ostream writeInt32: 6 value: self.iStatus];
    [ostream writeInt32: 7 value: self.iPriority];
    if (self.sPlat != nil)
    {
        [ostream writeString: 8 value: self.sPlat];
    }
    [ostream writeInt32: 9 value: self.iType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtActivityDetail *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sDesc = [istream readStringDef: 1 required: false def: self.sDesc];
    self.sPicUrl = [istream readStringDef: 2 required: false def: self.sPicUrl];
    self.sUrl = [istream readStringDef: 3 required: false def: self.sUrl];
    self.lOnlineTime = [istream readInt64Def: 4 required: false def: self.lOnlineTime];
    self.lOfflineTime = [istream readInt64Def: 5 required: false def: self.lOfflineTime];
    self.iStatus = [istream readInt32Def: 6 required: false def: self.iStatus];
    self.iPriority = [istream readInt32Def: 7 required: false def: self.iPriority];
    self.sPlat = [istream readStringDef: 8 required: false def: self.sPlat];
    self.iType = [istream readInt32Def: 9 required: false def: self.iType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    [JsonRoot append:@"sPicUrl" value : [BaseJSON writeString : self.sPicUrl]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"lOnlineTime" value : [BaseJSON writeInt64 : self.lOnlineTime]];
    [JsonRoot append:@"lOfflineTime" value : [BaseJSON writeInt64 : self.lOfflineTime]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"iPriority" value : [BaseJSON writeInt32 : self.iPriority]];
    [JsonRoot append:@"sPlat" value : [BaseJSON writeString : self.sPlat]];
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    return JsonRoot;
}

- (DtActivityDetail *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.sPicUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sPicUrl"] required:false def:self.sPicUrl];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.lOnlineTime = [BaseJSON readInt64Def:[RootMap objectForKey:@"lOnlineTime"] required:false def:self.lOnlineTime];
    self.lOfflineTime = [BaseJSON readInt64Def:[RootMap objectForKey:@"lOfflineTime"] required:false def:self.lOfflineTime];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.iPriority = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPriority"] required:false def:self.iPriority];
    self.sPlat = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlat"] required:false def:self.sPlat];
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
@implementation GetDtActivityListRsp
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
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [DtActivityDetail class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetDtActivityListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [DtActivityDetail class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vList" value : [BaseJSON writeList : self.vList VAR_TYPE: [THOTH_LIST CREATE: [DtActivityDetail class]]]];
    return JsonRoot;
}

- (GetDtActivityListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vList = [BaseJSON readListDef:[RootMap objectForKey:@"vList"] required:false def:self.vList VAR_TYPE: [THOTH_LIST CREATE: [DtActivityDetail class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LHBActiveDay
- (id) init
{
    if (self = [super init])
    {
        self.vLHBActiveDay = [NSMutableArray arrayWithCapacity:0];
        self.mLHBStockActiveDay = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.mLHBSaleDepActiveDay = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vLHBActiveDay != nil)
    {
        [ostream writeList: 0 value: self.vLHBActiveDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.mLHBStockActiveDay != nil)
    {
        [ostream writeMap: 1 value: self.mLHBStockActiveDay VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    }
    if (self.mLHBSaleDepActiveDay != nil)
    {
        [ostream writeMap: 2 value: self.mLHBSaleDepActiveDay VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LHBActiveDay *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vLHBActiveDay = [istream readListDef: 0 required: false def: self.vLHBActiveDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.mLHBStockActiveDay = [istream readMapDef: 1 required: false def: self.mLHBStockActiveDay VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    self.mLHBSaleDepActiveDay = [istream readMapDef: 2 required: false def: self.mLHBSaleDepActiveDay VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vLHBActiveDay" value : [BaseJSON writeList : self.vLHBActiveDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"mLHBStockActiveDay" value : [BaseJSON writeMap : self.mLHBStockActiveDay VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]]];
    [JsonRoot append:@"mLHBSaleDepActiveDay" value : [BaseJSON writeMap : self.mLHBSaleDepActiveDay VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]]];
    return JsonRoot;
}

- (LHBActiveDay *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vLHBActiveDay = [BaseJSON readListDef:[RootMap objectForKey:@"vLHBActiveDay"] required:false def:self.vLHBActiveDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.mLHBStockActiveDay = [BaseJSON readMapDef:[RootMap objectForKey:@"mLHBStockActiveDay"] required:false def:self.mLHBStockActiveDay VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    self.mLHBSaleDepActiveDay = [BaseJSON readMapDef:[RootMap objectForKey:@"mLHBSaleDepActiveDay"] required:false def:self.mLHBSaleDepActiveDay VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LHBReasonDetail
- (id) init
{
    if (self = [super init])
    {
        self.sSaleDepName = @"";
        self.fBuyAmount = 0;
        self.fSellAmount = 0;
        self.eActType = E_LHB_ACT_BUY;
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.fIncome = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSaleDepName != nil)
    {
        [ostream writeString: 0 value: self.sSaleDepName];
    }
    [ostream writeFloat: 1 value: self.fBuyAmount];
    [ostream writeFloat: 2 value: self.fSellAmount];
    [ostream writeInt32: 3 value: (int32_t)self.eActType];
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 4 value: self.sDtSecCode];
    }
    if (self.sSecName != nil)
    {
        [ostream writeString: 5 value: self.sSecName];
    }
    [ostream writeFloat: 6 value: self.fIncome];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LHBReasonDetail *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSaleDepName = [istream readStringDef: 0 required: false def: self.sSaleDepName];
    self.fBuyAmount = [istream readFloatDef: 1 required: false def: self.fBuyAmount];
    self.fSellAmount = [istream readFloatDef: 2 required: false def: self.fSellAmount];
    self.eActType = [istream readInt32Def: 3 required: false def: (int32_t)self.eActType];
    self.sDtSecCode = [istream readStringDef: 4 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 5 required: false def: self.sSecName];
    self.fIncome = [istream readFloatDef: 6 required: false def: self.fIncome];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sSaleDepName" value : [BaseJSON writeString : self.sSaleDepName]];
    [JsonRoot append:@"fBuyAmount" value : [BaseJSON writeFloat : self.fBuyAmount]];
    [JsonRoot append:@"fSellAmount" value : [BaseJSON writeFloat : self.fSellAmount]];
    [JsonRoot append:@"eActType" value : [BaseJSON writeInt32 : (int32_t)self.eActType]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"fIncome" value : [BaseJSON writeFloat : self.fIncome]];
    return JsonRoot;
}

- (LHBReasonDetail *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSaleDepName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSaleDepName"] required:false def:self.sSaleDepName];
    self.fBuyAmount = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuyAmount"] required:false def:self.fBuyAmount];
    self.fSellAmount = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSellAmount"] required:false def:self.fSellAmount];
    self.eActType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eActType"] required:false def:(int32_t)self.eActType];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fIncome = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIncome"] required:false def:self.fIncome];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LHBReason
- (id) init
{
    if (self = [super init])
    {
        self.sReasonMsg = @"";
        self.vDetail = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sReasonMsg != nil)
    {
        [ostream writeString: 0 value: self.sReasonMsg];
    }
    if (self.vDetail != nil)
    {
        [ostream writeList: 1 value: self.vDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LHBReason *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sReasonMsg = [istream readStringDef: 0 required: false def: self.sReasonMsg];
    self.vDetail = [istream readListDef: 1 required: false def: self.vDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sReasonMsg" value : [BaseJSON writeString : self.sReasonMsg]];
    [JsonRoot append:@"vDetail" value : [BaseJSON writeList : self.vDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]]];
    return JsonRoot;
}

- (LHBReason *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sReasonMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sReasonMsg"] required:false def:self.sReasonMsg];
    self.vDetail = [BaseJSON readListDef:[RootMap objectForKey:@"vDetail"] required:false def:self.vDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LHBSecInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.eActType = E_LHB_ACT_BUY;
        self.fActMoney = 0;
        self.fClosePrice = 0;
        self.fChangePct = 0;
        self.sFundType = @"";
        self.vReason = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeInt32: 2 value: (int32_t)self.eActType];
    [ostream writeFloat: 3 value: self.fActMoney];
    [ostream writeFloat: 4 value: self.fClosePrice];
    [ostream writeFloat: 5 value: self.fChangePct];
    if (self.sFundType != nil)
    {
        [ostream writeString: 6 value: self.sFundType];
    }
    if (self.vReason != nil)
    {
        [ostream writeList: 7 value: self.vReason VAR_TYPE: [THOTH_LIST CREATE: [LHBReason class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LHBSecInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.eActType = [istream readInt32Def: 2 required: false def: (int32_t)self.eActType];
    self.fActMoney = [istream readFloatDef: 3 required: false def: self.fActMoney];
    self.fClosePrice = [istream readFloatDef: 4 required: false def: self.fClosePrice];
    self.fChangePct = [istream readFloatDef: 5 required: false def: self.fChangePct];
    self.sFundType = [istream readStringDef: 6 required: false def: self.sFundType];
    self.vReason = [istream readListDef: 7 required: false def: self.vReason VAR_TYPE: [THOTH_LIST CREATE: [LHBReason class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eActType" value : [BaseJSON writeInt32 : (int32_t)self.eActType]];
    [JsonRoot append:@"fActMoney" value : [BaseJSON writeFloat : self.fActMoney]];
    [JsonRoot append:@"fClosePrice" value : [BaseJSON writeFloat : self.fClosePrice]];
    [JsonRoot append:@"fChangePct" value : [BaseJSON writeFloat : self.fChangePct]];
    [JsonRoot append:@"sFundType" value : [BaseJSON writeString : self.sFundType]];
    [JsonRoot append:@"vReason" value : [BaseJSON writeList : self.vReason VAR_TYPE: [THOTH_LIST CREATE: [LHBReason class]]]];
    return JsonRoot;
}

- (LHBSecInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.eActType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eActType"] required:false def:(int32_t)self.eActType];
    self.fActMoney = [BaseJSON readFloatDef:[RootMap objectForKey:@"fActMoney"] required:false def:self.fActMoney];
    self.fClosePrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClosePrice"] required:false def:self.fClosePrice];
    self.fChangePct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fChangePct"] required:false def:self.fChangePct];
    self.sFundType = [BaseJSON readStringDef:[RootMap objectForKey:@"sFundType"] required:false def:self.sFundType];
    self.vReason = [BaseJSON readListDef:[RootMap objectForKey:@"vReason"] required:false def:self.vReason VAR_TYPE: [THOTH_LIST CREATE: [LHBReason class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LHBSaleDepInfo
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sStockNum = 0;
        self.fIncome = 0;
        self.vLHBReasonDetail = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeInt32: 1 value: self.sStockNum];
    [ostream writeFloat: 2 value: self.fIncome];
    if (self.vLHBReasonDetail != nil)
    {
        [ostream writeList: 3 value: self.vLHBReasonDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LHBSaleDepInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sStockNum = [istream readInt32Def: 1 required: false def: self.sStockNum];
    self.fIncome = [istream readFloatDef: 2 required: false def: self.fIncome];
    self.vLHBReasonDetail = [istream readListDef: 3 required: false def: self.vLHBReasonDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sStockNum" value : [BaseJSON writeInt32 : self.sStockNum]];
    [JsonRoot append:@"fIncome" value : [BaseJSON writeFloat : self.fIncome]];
    [JsonRoot append:@"vLHBReasonDetail" value : [BaseJSON writeList : self.vLHBReasonDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]]];
    return JsonRoot;
}

- (LHBSaleDepInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sStockNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"sStockNum"] required:false def:self.sStockNum];
    self.fIncome = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIncome"] required:false def:self.fIncome];
    self.vLHBReasonDetail = [BaseJSON readListDef:[RootMap objectForKey:@"vLHBReasonDetail"] required:false def:self.vLHBReasonDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetLHBListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDay = @"";
        self.iSubList = 0;
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
    if (self.sDay != nil)
    {
        [ostream writeString: 1 value: self.sDay];
    }
    [ostream writeInt32: 2 value: self.iSubList];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDay = [istream readStringDef: 1 required: false def: self.sDay];
    self.iSubList = [istream readInt32Def: 2 required: false def: self.iSubList];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDay" value : [BaseJSON writeString : self.sDay]];
    [JsonRoot append:@"iSubList" value : [BaseJSON writeInt32 : self.iSubList]];
    return JsonRoot;
}

- (GetLHBListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.iSubList = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubList"] required:false def:self.iSubList];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetLHBListRsp
- (id) init
{
    if (self = [super init])
    {
        self.sDay = @"";
        self.sWeekDay = @"";
        self.iSHSecNum = 0;
        self.iSZSecNum = 0;
        self.vSecList = [NSMutableArray arrayWithCapacity:0];
        self.vJgqcList = [NSMutableArray arrayWithCapacity:0];
        self.vYzbyList = [NSMutableArray arrayWithCapacity:0];
        self.vSaleDepList = [NSMutableArray arrayWithCapacity:0];
        self.vDay = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sWeekDay != nil)
    {
        [ostream writeString: 1 value: self.sWeekDay];
    }
    [ostream writeInt32: 2 value: self.iSHSecNum];
    [ostream writeInt32: 3 value: self.iSZSecNum];
    if (self.vSecList != nil)
    {
        [ostream writeList: 4 value: self.vSecList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    }
    if (self.vJgqcList != nil)
    {
        [ostream writeList: 5 value: self.vJgqcList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    }
    if (self.vYzbyList != nil)
    {
        [ostream writeList: 6 value: self.vYzbyList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    }
    if (self.vSaleDepList != nil)
    {
        [ostream writeList: 7 value: self.vSaleDepList VAR_TYPE: [THOTH_LIST CREATE: [LHBSaleDepInfo class]]];
    }
    if (self.vDay != nil)
    {
        [ostream writeList: 8 value: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDay = [istream readStringDef: 0 required: false def: self.sDay];
    self.sWeekDay = [istream readStringDef: 1 required: false def: self.sWeekDay];
    self.iSHSecNum = [istream readInt32Def: 2 required: false def: self.iSHSecNum];
    self.iSZSecNum = [istream readInt32Def: 3 required: false def: self.iSZSecNum];
    self.vSecList = [istream readListDef: 4 required: false def: self.vSecList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    self.vJgqcList = [istream readListDef: 5 required: false def: self.vJgqcList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    self.vYzbyList = [istream readListDef: 6 required: false def: self.vYzbyList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    self.vSaleDepList = [istream readListDef: 7 required: false def: self.vSaleDepList VAR_TYPE: [THOTH_LIST CREATE: [LHBSaleDepInfo class]]];
    self.vDay = [istream readListDef: 8 required: false def: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sWeekDay" value : [BaseJSON writeString : self.sWeekDay]];
    [JsonRoot append:@"iSHSecNum" value : [BaseJSON writeInt32 : self.iSHSecNum]];
    [JsonRoot append:@"iSZSecNum" value : [BaseJSON writeInt32 : self.iSZSecNum]];
    [JsonRoot append:@"vSecList" value : [BaseJSON writeList : self.vSecList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]]];
    [JsonRoot append:@"vJgqcList" value : [BaseJSON writeList : self.vJgqcList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]]];
    [JsonRoot append:@"vYzbyList" value : [BaseJSON writeList : self.vYzbyList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]]];
    [JsonRoot append:@"vSaleDepList" value : [BaseJSON writeList : self.vSaleDepList VAR_TYPE: [THOTH_LIST CREATE: [LHBSaleDepInfo class]]]];
    [JsonRoot append:@"vDay" value : [BaseJSON writeList : self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetLHBListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.sWeekDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sWeekDay"] required:false def:self.sWeekDay];
    self.iSHSecNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSHSecNum"] required:false def:self.iSHSecNum];
    self.iSZSecNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSZSecNum"] required:false def:self.iSZSecNum];
    self.vSecList = [BaseJSON readListDef:[RootMap objectForKey:@"vSecList"] required:false def:self.vSecList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    self.vJgqcList = [BaseJSON readListDef:[RootMap objectForKey:@"vJgqcList"] required:false def:self.vJgqcList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    self.vYzbyList = [BaseJSON readListDef:[RootMap objectForKey:@"vYzbyList"] required:false def:self.vYzbyList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    self.vSaleDepList = [BaseJSON readListDef:[RootMap objectForKey:@"vSaleDepList"] required:false def:self.vSaleDepList VAR_TYPE: [THOTH_LIST CREATE: [LHBSaleDepInfo class]]];
    self.vDay = [BaseJSON readListDef:[RootMap objectForKey:@"vDay"] required:false def:self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetLHBDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.sDay = @"";
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
    if (self.sDay != nil)
    {
        [ostream writeString: 2 value: self.sDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sDay = [istream readStringDef: 2 required: false def: self.sDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDay" value : [BaseJSON writeString : self.sDay]];
    return JsonRoot;
}

- (GetLHBDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
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
@implementation GetLHBDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.vReason = [NSMutableArray arrayWithCapacity:0];
        self.sDay = @"";
        self.sWeekDay = @"";
        self.vDay = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vReason != nil)
    {
        [ostream writeList: 1 value: self.vReason VAR_TYPE: [THOTH_LIST CREATE: [LHBReason class]]];
    }
    if (self.sDay != nil)
    {
        [ostream writeString: 2 value: self.sDay];
    }
    if (self.sWeekDay != nil)
    {
        [ostream writeString: 3 value: self.sWeekDay];
    }
    if (self.vDay != nil)
    {
        [ostream writeList: 4 value: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.vReason = [istream readListDef: 1 required: false def: self.vReason VAR_TYPE: [THOTH_LIST CREATE: [LHBReason class]]];
    self.sDay = [istream readStringDef: 2 required: false def: self.sDay];
    self.sWeekDay = [istream readStringDef: 3 required: false def: self.sWeekDay];
    self.vDay = [istream readListDef: 4 required: false def: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vReason" value : [BaseJSON writeList : self.vReason VAR_TYPE: [THOTH_LIST CREATE: [LHBReason class]]]];
    [JsonRoot append:@"sDay" value : [BaseJSON writeString : self.sDay]];
    [JsonRoot append:@"sWeekDay" value : [BaseJSON writeString : self.sWeekDay]];
    [JsonRoot append:@"vDay" value : [BaseJSON writeList : self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetLHBDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.vReason = [BaseJSON readListDef:[RootMap objectForKey:@"vReason"] required:false def:self.vReason VAR_TYPE: [THOTH_LIST CREATE: [LHBReason class]]];
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.sWeekDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sWeekDay"] required:false def:self.sWeekDay];
    self.vDay = [BaseJSON readListDef:[RootMap objectForKey:@"vDay"] required:false def:self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetLHBStockListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDay = @"";
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
    if (self.sDay != nil)
    {
        [ostream writeString: 1 value: self.sDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBStockListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDay = [istream readStringDef: 1 required: false def: self.sDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDay" value : [BaseJSON writeString : self.sDay]];
    return JsonRoot;
}

- (GetLHBStockListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
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
@implementation GetLHBStockListRsp
- (id) init
{
    if (self = [super init])
    {
        self.sDay = @"";
        self.iSHSecNum = 0;
        self.iSZSecNum = 0;
        self.vSecList = [NSMutableArray arrayWithCapacity:0];
        self.vDay = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeInt32: 1 value: self.iSHSecNum];
    [ostream writeInt32: 2 value: self.iSZSecNum];
    if (self.vSecList != nil)
    {
        [ostream writeList: 3 value: self.vSecList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    }
    if (self.vDay != nil)
    {
        [ostream writeList: 4 value: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBStockListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDay = [istream readStringDef: 0 required: false def: self.sDay];
    self.iSHSecNum = [istream readInt32Def: 1 required: false def: self.iSHSecNum];
    self.iSZSecNum = [istream readInt32Def: 2 required: false def: self.iSZSecNum];
    self.vSecList = [istream readListDef: 3 required: false def: self.vSecList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    self.vDay = [istream readListDef: 4 required: false def: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iSHSecNum" value : [BaseJSON writeInt32 : self.iSHSecNum]];
    [JsonRoot append:@"iSZSecNum" value : [BaseJSON writeInt32 : self.iSZSecNum]];
    [JsonRoot append:@"vSecList" value : [BaseJSON writeList : self.vSecList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]]];
    [JsonRoot append:@"vDay" value : [BaseJSON writeList : self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetLHBStockListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.iSHSecNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSHSecNum"] required:false def:self.iSHSecNum];
    self.iSZSecNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSZSecNum"] required:false def:self.iSZSecNum];
    self.vSecList = [BaseJSON readListDef:[RootMap objectForKey:@"vSecList"] required:false def:self.vSecList VAR_TYPE: [THOTH_LIST CREATE: [LHBSecInfo class]]];
    self.vDay = [BaseJSON readListDef:[RootMap objectForKey:@"vDay"] required:false def:self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetLHBSaleDepListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDay = @"";
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
    if (self.sDay != nil)
    {
        [ostream writeString: 1 value: self.sDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBSaleDepListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDay = [istream readStringDef: 1 required: false def: self.sDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDay" value : [BaseJSON writeString : self.sDay]];
    return JsonRoot;
}

- (GetLHBSaleDepListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
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
@implementation GetLHBSaleDepListRsp
- (id) init
{
    if (self = [super init])
    {
        self.sDay = @"";
        self.vSaleDepList = [NSMutableArray arrayWithCapacity:0];
        self.vDay = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vSaleDepList != nil)
    {
        [ostream writeList: 1 value: self.vSaleDepList VAR_TYPE: [THOTH_LIST CREATE: [LHBSaleDepInfo class]]];
    }
    if (self.vDay != nil)
    {
        [ostream writeList: 2 value: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBSaleDepListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDay = [istream readStringDef: 0 required: false def: self.sDay];
    self.vSaleDepList = [istream readListDef: 1 required: false def: self.vSaleDepList VAR_TYPE: [THOTH_LIST CREATE: [LHBSaleDepInfo class]]];
    self.vDay = [istream readListDef: 2 required: false def: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vSaleDepList" value : [BaseJSON writeList : self.vSaleDepList VAR_TYPE: [THOTH_LIST CREATE: [LHBSaleDepInfo class]]]];
    [JsonRoot append:@"vDay" value : [BaseJSON writeList : self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetLHBSaleDepListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.vSaleDepList = [BaseJSON readListDef:[RootMap objectForKey:@"vSaleDepList"] required:false def:self.vSaleDepList VAR_TYPE: [THOTH_LIST CREATE: [LHBSaleDepInfo class]]];
    self.vDay = [BaseJSON readListDef:[RootMap objectForKey:@"vDay"] required:false def:self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetLHBSaleDepDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDay = @"";
        self.sSaleDepName = @"";
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
    if (self.sDay != nil)
    {
        [ostream writeString: 1 value: self.sDay];
    }
    if (self.sSaleDepName != nil)
    {
        [ostream writeString: 2 value: self.sSaleDepName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBSaleDepDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDay = [istream readStringDef: 1 required: false def: self.sDay];
    self.sSaleDepName = [istream readStringDef: 2 required: false def: self.sSaleDepName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDay" value : [BaseJSON writeString : self.sDay]];
    [JsonRoot append:@"sSaleDepName" value : [BaseJSON writeString : self.sSaleDepName]];
    return JsonRoot;
}

- (GetLHBSaleDepDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.sSaleDepName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSaleDepName"] required:false def:self.sSaleDepName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetLHBSaleDepDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.sDay = @"";
        self.sSaleDepName = @"";
        self.fIncome = 0;
        self.sStockNum = 0;
        self.vLHBReasonDetail = [NSMutableArray arrayWithCapacity:0];
        self.vDay = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sSaleDepName != nil)
    {
        [ostream writeString: 1 value: self.sSaleDepName];
    }
    [ostream writeFloat: 2 value: self.fIncome];
    [ostream writeInt32: 3 value: self.sStockNum];
    if (self.vLHBReasonDetail != nil)
    {
        [ostream writeList: 4 value: self.vLHBReasonDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    }
    if (self.vDay != nil)
    {
        [ostream writeList: 5 value: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLHBSaleDepDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDay = [istream readStringDef: 0 required: false def: self.sDay];
    self.sSaleDepName = [istream readStringDef: 1 required: false def: self.sSaleDepName];
    self.fIncome = [istream readFloatDef: 2 required: false def: self.fIncome];
    self.sStockNum = [istream readInt32Def: 3 required: false def: self.sStockNum];
    self.vLHBReasonDetail = [istream readListDef: 4 required: false def: self.vLHBReasonDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    self.vDay = [istream readListDef: 5 required: false def: self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sSaleDepName" value : [BaseJSON writeString : self.sSaleDepName]];
    [JsonRoot append:@"fIncome" value : [BaseJSON writeFloat : self.fIncome]];
    [JsonRoot append:@"sStockNum" value : [BaseJSON writeInt32 : self.sStockNum]];
    [JsonRoot append:@"vLHBReasonDetail" value : [BaseJSON writeList : self.vLHBReasonDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]]];
    [JsonRoot append:@"vDay" value : [BaseJSON writeList : self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetLHBSaleDepDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sDay"] required:false def:self.sDay];
    self.sSaleDepName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSaleDepName"] required:false def:self.sSaleDepName];
    self.fIncome = [BaseJSON readFloatDef:[RootMap objectForKey:@"fIncome"] required:false def:self.fIncome];
    self.sStockNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"sStockNum"] required:false def:self.sStockNum];
    self.vLHBReasonDetail = [BaseJSON readListDef:[RootMap objectForKey:@"vLHBReasonDetail"] required:false def:self.vLHBReasonDetail VAR_TYPE: [THOTH_LIST CREATE: [LHBReasonDetail class]]];
    self.vDay = [BaseJSON readListDef:[RootMap objectForKey:@"vDay"] required:false def:self.vDay VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetCategoryListReq
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

- (GetCategoryListReq *) read: (BaseDecodeStream *)istream
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

- (GetCategoryListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation CategoryInfo
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sName = @"";
        self.sPicUrl = @"";
        self.sUrl = @"";
        self.sDesc = @"";
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
    if (self.sName != nil)
    {
        [ostream writeString: 1 value: self.sName];
    }
    if (self.sPicUrl != nil)
    {
        [ostream writeString: 2 value: self.sPicUrl];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 3 value: self.sUrl];
    }
    if (self.sDesc != nil)
    {
        [ostream writeString: 4 value: self.sDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CategoryInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sName = [istream readStringDef: 1 required: false def: self.sName];
    self.sPicUrl = [istream readStringDef: 2 required: false def: self.sPicUrl];
    self.sUrl = [istream readStringDef: 3 required: false def: self.sUrl];
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
    [JsonRoot append:@"sId" value : [BaseJSON writeString : self.sId]];
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"sPicUrl" value : [BaseJSON writeString : self.sPicUrl]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    return JsonRoot;
}

- (CategoryInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sPicUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sPicUrl"] required:false def:self.sPicUrl];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
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
@implementation GetCategoryListRsp
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
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [CategoryInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetCategoryListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [CategoryInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vList" value : [BaseJSON writeList : self.vList VAR_TYPE: [THOTH_LIST CREATE: [CategoryInfo class]]]];
    return JsonRoot;
}

- (GetCategoryListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vList = [BaseJSON readListDef:[RootMap objectForKey:@"vList"] required:false def:self.vList VAR_TYPE: [THOTH_LIST CREATE: [CategoryInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetCategoryDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sCategoryId = @"";
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
    if (self.sCategoryId != nil)
    {
        [ostream writeString: 1 value: self.sCategoryId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetCategoryDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sCategoryId = [istream readStringDef: 1 required: false def: self.sCategoryId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sCategoryId" value : [BaseJSON writeString : self.sCategoryId]];
    return JsonRoot;
}

- (GetCategoryDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sCategoryId = [BaseJSON readStringDef:[RootMap objectForKey:@"sCategoryId"] required:false def:self.sCategoryId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CategoryHotStockDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
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
    if (self.sSecName != nil)
    {
        [ostream writeString: 1 value: self.sSecName];
    }
    if (self.sDesc != nil)
    {
        [ostream writeString: 2 value: self.sDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CategoryHotStockDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.sDesc = [istream readStringDef: 2 required: false def: self.sDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    return JsonRoot;
}

- (CategoryHotStockDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
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
@implementation GetCategoryDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtDaySec = [NSMutableArray arrayWithCapacity:0];
        self.vHotStock = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtDaySec != nil)
    {
        [ostream writeList: 0 value: self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    }
    if (self.vHotStock != nil)
    {
        [ostream writeList: 1 value: self.vHotStock VAR_TYPE: [THOTH_LIST CREATE: [CategoryHotStockDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetCategoryDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtDaySec = [istream readListDef: 0 required: false def: self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    self.vHotStock = [istream readListDef: 1 required: false def: self.vHotStock VAR_TYPE: [THOTH_LIST CREATE: [CategoryHotStockDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vtDaySec" value : [BaseJSON writeList : self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]]];
    [JsonRoot append:@"vHotStock" value : [BaseJSON writeList : self.vHotStock VAR_TYPE: [THOTH_LIST CREATE: [CategoryHotStockDesc class]]]];
    return JsonRoot;
}

- (GetCategoryDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtDaySec = [BaseJSON readListDef:[RootMap objectForKey:@"vtDaySec"] required:false def:self.vtDaySec VAR_TYPE: [THOTH_LIST CREATE: [IntelliPickStockEx class]]];
    self.vHotStock = [BaseJSON readListDef:[RootMap objectForKey:@"vHotStock"] required:false def:self.vHotStock VAR_TYPE: [THOTH_LIST CREATE: [CategoryHotStockDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StrategySubItem
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sTitle = @"";
        self.vtTagInfo = [NSMutableArray arrayWithCapacity:0];
        self.vtIntelliStock = [NSMutableArray arrayWithCapacity:0];
        self.sUrl = @"";
        self.sDate = @"";
        self.sSource = @"";
        self.fMaxRetAvgIncrease = 0;
        self.sMaxRetUpBanner = @"";
        self.iStatus = 0;
        self.fSuccPercent = 0;
        self.iSubscriptionsCount = 0;
        self.sSubscriptionsCount = @"";
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
    if (self.sTitle != nil)
    {
        [ostream writeString: 1 value: self.sTitle];
    }
    if (self.vtTagInfo != nil)
    {
        [ostream writeList: 2 value: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    }
    if (self.vtIntelliStock != nil)
    {
        [ostream writeList: 3 value: self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 4 value: self.sUrl];
    }
    if (self.sDate != nil)
    {
        [ostream writeString: 5 value: self.sDate];
    }
    if (self.sSource != nil)
    {
        [ostream writeString: 6 value: self.sSource];
    }
    [ostream writeFloat: 7 value: self.fMaxRetAvgIncrease];
    if (self.sMaxRetUpBanner != nil)
    {
        [ostream writeString: 8 value: self.sMaxRetUpBanner];
    }
    [ostream writeInt32: 9 value: self.iStatus];
    [ostream writeFloat: 10 value: self.fSuccPercent];
    [ostream writeInt32: 11 value: self.iSubscriptionsCount];
    if (self.sSubscriptionsCount != nil)
    {
        [ostream writeString: 12 value: self.sSubscriptionsCount];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StrategySubItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    self.vtTagInfo = [istream readListDef: 2 required: false def: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.vtIntelliStock = [istream readListDef: 3 required: false def: self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    self.sUrl = [istream readStringDef: 4 required: false def: self.sUrl];
    self.sDate = [istream readStringDef: 5 required: false def: self.sDate];
    self.sSource = [istream readStringDef: 6 required: false def: self.sSource];
    self.fMaxRetAvgIncrease = [istream readFloatDef: 7 required: false def: self.fMaxRetAvgIncrease];
    self.sMaxRetUpBanner = [istream readStringDef: 8 required: false def: self.sMaxRetUpBanner];
    self.iStatus = [istream readInt32Def: 9 required: false def: self.iStatus];
    self.fSuccPercent = [istream readFloatDef: 10 required: false def: self.fSuccPercent];
    self.iSubscriptionsCount = [istream readInt32Def: 11 required: false def: self.iSubscriptionsCount];
    self.sSubscriptionsCount = [istream readStringDef: 12 required: false def: self.sSubscriptionsCount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"vtTagInfo" value : [BaseJSON writeList : self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]]];
    [JsonRoot append:@"vtIntelliStock" value : [BaseJSON writeList : self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"sSource" value : [BaseJSON writeString : self.sSource]];
    [JsonRoot append:@"fMaxRetAvgIncrease" value : [BaseJSON writeFloat : self.fMaxRetAvgIncrease]];
    [JsonRoot append:@"sMaxRetUpBanner" value : [BaseJSON writeString : self.sMaxRetUpBanner]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"fSuccPercent" value : [BaseJSON writeFloat : self.fSuccPercent]];
    [JsonRoot append:@"iSubscriptionsCount" value : [BaseJSON writeInt32 : self.iSubscriptionsCount]];
    [JsonRoot append:@"sSubscriptionsCount" value : [BaseJSON writeString : self.sSubscriptionsCount]];
    return JsonRoot;
}

- (StrategySubItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.vtTagInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtTagInfo"] required:false def:self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.vtIntelliStock = [BaseJSON readListDef:[RootMap objectForKey:@"vtIntelliStock"] required:false def:self.vtIntelliStock VAR_TYPE: [THOTH_LIST CREATE: [IntelliStock class]]];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.sSource = [BaseJSON readStringDef:[RootMap objectForKey:@"sSource"] required:false def:self.sSource];
    self.fMaxRetAvgIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMaxRetAvgIncrease"] required:false def:self.fMaxRetAvgIncrease];
    self.sMaxRetUpBanner = [BaseJSON readStringDef:[RootMap objectForKey:@"sMaxRetUpBanner"] required:false def:self.sMaxRetUpBanner];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.fSuccPercent = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSuccPercent"] required:false def:self.fSuccPercent];
    self.iSubscriptionsCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubscriptionsCount"] required:false def:self.iSubscriptionsCount];
    self.sSubscriptionsCount = [BaseJSON readStringDef:[RootMap objectForKey:@"sSubscriptionsCount"] required:false def:self.sSubscriptionsCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetStrategySubListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
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
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetStrategySubListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    return JsonRoot;
}

- (GetStrategySubListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetStrategySubListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
        self.iUpdateTimeStamp = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [StrategySubItem class]]];
    }
    [ostream writeInt32: 1 value: self.iUpdateTimeStamp];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetStrategySubListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [StrategySubItem class]]];
    self.iUpdateTimeStamp = [istream readInt32Def: 1 required: false def: self.iUpdateTimeStamp];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vList" value : [BaseJSON writeList : self.vList VAR_TYPE: [THOTH_LIST CREATE: [StrategySubItem class]]]];
    [JsonRoot append:@"iUpdateTimeStamp" value : [BaseJSON writeInt32 : self.iUpdateTimeStamp]];
    return JsonRoot;
}

- (GetStrategySubListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vList = [BaseJSON readListDef:[RootMap objectForKey:@"vList"] required:false def:self.vList VAR_TYPE: [THOTH_LIST CREATE: [StrategySubItem class]]];
    self.iUpdateTimeStamp = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpdateTimeStamp"] required:false def:self.iUpdateTimeStamp];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ActStrategySubReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iActType = 0;
        self.sStrategyId = @"";
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
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    [ostream writeInt32: 2 value: self.iActType];
    if (self.sStrategyId != nil)
    {
        [ostream writeString: 3 value: self.sStrategyId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ActStrategySubReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iActType = [istream readInt32Def: 2 required: false def: self.iActType];
    self.sStrategyId = [istream readStringDef: 3 required: false def: self.sStrategyId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iActType" value : [BaseJSON writeInt32 : self.iActType]];
    [JsonRoot append:@"sStrategyId" value : [BaseJSON writeString : self.sStrategyId]];
    return JsonRoot;
}

- (ActStrategySubReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iActType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iActType"] required:false def:self.iActType];
    self.sStrategyId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStrategyId"] required:false def:self.sStrategyId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ActStrategySubRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRetCode = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRetCode];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ActStrategySubRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRetCode = [istream readInt32Def: 0 required: false def: self.iRetCode];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iRetCode" value : [BaseJSON writeInt32 : self.iRetCode]];
    return JsonRoot;
}

- (ActStrategySubRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRetCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRetCode"] required:false def:self.iRetCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PrivInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtCode = @"";
        self.sSecCode = @"";
        self.sSecName = @"";
        self.sReleaseTime = @"";
        self.fRedeemPrice = 0;
        self.fArbitrageSpace = 0;
        self.ePaceCode = PRIV_PC_UNKOWN;
        self.sPace = @"";
        self.sNegotiatedTime = @"";
        self.fNegotiatedPrice = 0;
        self.sDelistingTime = @"";
        self.sOfferor = @"";
        self.sDescription = @"";
        self.sWhereAbouts = @"";
        self.sWBDtCode = @"";
        self.sWBSecName = @"";
        self.sWBDescription = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDtCode != nil)
    {
        [ostream writeString: 0 value: self.sDtCode];
    }
    if (self.sSecCode != nil)
    {
        [ostream writeString: 1 value: self.sSecCode];
    }
    if (self.sSecName != nil)
    {
        [ostream writeString: 2 value: self.sSecName];
    }
    if (self.sReleaseTime != nil)
    {
        [ostream writeString: 3 value: self.sReleaseTime];
    }
    [ostream writeFloat: 4 value: self.fRedeemPrice];
    [ostream writeFloat: 5 value: self.fArbitrageSpace];
    [ostream writeInt32: 6 value: (int32_t)self.ePaceCode];
    if (self.sPace != nil)
    {
        [ostream writeString: 7 value: self.sPace];
    }
    if (self.sNegotiatedTime != nil)
    {
        [ostream writeString: 8 value: self.sNegotiatedTime];
    }
    [ostream writeFloat: 9 value: self.fNegotiatedPrice];
    if (self.sDelistingTime != nil)
    {
        [ostream writeString: 10 value: self.sDelistingTime];
    }
    if (self.sOfferor != nil)
    {
        [ostream writeString: 11 value: self.sOfferor];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 12 value: self.sDescription];
    }
    if (self.sWhereAbouts != nil)
    {
        [ostream writeString: 13 value: self.sWhereAbouts];
    }
    if (self.sWBDtCode != nil)
    {
        [ostream writeString: 14 value: self.sWBDtCode];
    }
    if (self.sWBSecName != nil)
    {
        [ostream writeString: 15 value: self.sWBSecName];
    }
    if (self.sWBDescription != nil)
    {
        [ostream writeString: 16 value: self.sWBDescription];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PrivInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtCode = [istream readStringDef: 0 required: false def: self.sDtCode];
    self.sSecCode = [istream readStringDef: 1 required: false def: self.sSecCode];
    self.sSecName = [istream readStringDef: 2 required: false def: self.sSecName];
    self.sReleaseTime = [istream readStringDef: 3 required: false def: self.sReleaseTime];
    self.fRedeemPrice = [istream readFloatDef: 4 required: false def: self.fRedeemPrice];
    self.fArbitrageSpace = [istream readFloatDef: 5 required: false def: self.fArbitrageSpace];
    self.ePaceCode = [istream readInt32Def: 6 required: false def: (int32_t)self.ePaceCode];
    self.sPace = [istream readStringDef: 7 required: false def: self.sPace];
    self.sNegotiatedTime = [istream readStringDef: 8 required: false def: self.sNegotiatedTime];
    self.fNegotiatedPrice = [istream readFloatDef: 9 required: false def: self.fNegotiatedPrice];
    self.sDelistingTime = [istream readStringDef: 10 required: false def: self.sDelistingTime];
    self.sOfferor = [istream readStringDef: 11 required: false def: self.sOfferor];
    self.sDescription = [istream readStringDef: 12 required: false def: self.sDescription];
    self.sWhereAbouts = [istream readStringDef: 13 required: false def: self.sWhereAbouts];
    self.sWBDtCode = [istream readStringDef: 14 required: false def: self.sWBDtCode];
    self.sWBSecName = [istream readStringDef: 15 required: false def: self.sWBSecName];
    self.sWBDescription = [istream readStringDef: 16 required: false def: self.sWBDescription];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sDtCode" value : [BaseJSON writeString : self.sDtCode]];
    [JsonRoot append:@"sSecCode" value : [BaseJSON writeString : self.sSecCode]];
    [JsonRoot append:@"sSecName" value : [BaseJSON writeString : self.sSecName]];
    [JsonRoot append:@"sReleaseTime" value : [BaseJSON writeString : self.sReleaseTime]];
    [JsonRoot append:@"fRedeemPrice" value : [BaseJSON writeFloat : self.fRedeemPrice]];
    [JsonRoot append:@"fArbitrageSpace" value : [BaseJSON writeFloat : self.fArbitrageSpace]];
    [JsonRoot append:@"ePaceCode" value : [BaseJSON writeInt32 : (int32_t)self.ePaceCode]];
    [JsonRoot append:@"sPace" value : [BaseJSON writeString : self.sPace]];
    [JsonRoot append:@"sNegotiatedTime" value : [BaseJSON writeString : self.sNegotiatedTime]];
    [JsonRoot append:@"fNegotiatedPrice" value : [BaseJSON writeFloat : self.fNegotiatedPrice]];
    [JsonRoot append:@"sDelistingTime" value : [BaseJSON writeString : self.sDelistingTime]];
    [JsonRoot append:@"sOfferor" value : [BaseJSON writeString : self.sOfferor]];
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"sWhereAbouts" value : [BaseJSON writeString : self.sWhereAbouts]];
    [JsonRoot append:@"sWBDtCode" value : [BaseJSON writeString : self.sWBDtCode]];
    [JsonRoot append:@"sWBSecName" value : [BaseJSON writeString : self.sWBSecName]];
    [JsonRoot append:@"sWBDescription" value : [BaseJSON writeString : self.sWBDescription]];
    return JsonRoot;
}

- (PrivInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtCode"] required:false def:self.sDtCode];
    self.sSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecCode"] required:false def:self.sSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sReleaseTime = [BaseJSON readStringDef:[RootMap objectForKey:@"sReleaseTime"] required:false def:self.sReleaseTime];
    self.fRedeemPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRedeemPrice"] required:false def:self.fRedeemPrice];
    self.fArbitrageSpace = [BaseJSON readFloatDef:[RootMap objectForKey:@"fArbitrageSpace"] required:false def:self.fArbitrageSpace];
    self.ePaceCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"ePaceCode"] required:false def:(int32_t)self.ePaceCode];
    self.sPace = [BaseJSON readStringDef:[RootMap objectForKey:@"sPace"] required:false def:self.sPace];
    self.sNegotiatedTime = [BaseJSON readStringDef:[RootMap objectForKey:@"sNegotiatedTime"] required:false def:self.sNegotiatedTime];
    self.fNegotiatedPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNegotiatedPrice"] required:false def:self.fNegotiatedPrice];
    self.sDelistingTime = [BaseJSON readStringDef:[RootMap objectForKey:@"sDelistingTime"] required:false def:self.sDelistingTime];
    self.sOfferor = [BaseJSON readStringDef:[RootMap objectForKey:@"sOfferor"] required:false def:self.sOfferor];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.sWhereAbouts = [BaseJSON readStringDef:[RootMap objectForKey:@"sWhereAbouts"] required:false def:self.sWhereAbouts];
    self.sWBDtCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sWBDtCode"] required:false def:self.sWBDtCode];
    self.sWBSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sWBSecName"] required:false def:self.sWBSecName];
    self.sWBDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sWBDescription"] required:false def:self.sWBDescription];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPrivBreifInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vDtCode = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vDtCode != nil)
    {
        [ostream writeList: 1 value: self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPrivBreifInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtCode = [istream readListDef: 1 required: false def: self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vDtCode" value : [BaseJSON writeList : self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetPrivBreifInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtCode"] required:false def:self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPrivBreifInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.mPrivBreifInfo = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mPrivBreifInfo != nil)
    {
        [ostream writeMap: 0 value: self.mPrivBreifInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPrivBreifInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mPrivBreifInfo = [istream readMapDef: 0 required: false def: self.mPrivBreifInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mPrivBreifInfo" value : [BaseJSON writeMap : self.mPrivBreifInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetPrivBreifInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mPrivBreifInfo = [BaseJSON readMapDef:[RootMap objectForKey:@"mPrivBreifInfo"] required:false def:self.mPrivBreifInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPrivListReq
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

- (GetPrivListReq *) read: (BaseDecodeStream *)istream
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

- (GetPrivListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GetPrivListRsp
- (id) init
{
    if (self = [super init])
    {
        self.mPrivInfo = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mPrivInfo != nil)
    {
        [ostream writeMap: 1 value: self.mPrivInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [PrivInfo class]]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPrivListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mPrivInfo = [istream readMapDef: 1 required: false def: self.mPrivInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [PrivInfo class]]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mPrivInfo" value : [BaseJSON writeMap : self.mPrivInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [PrivInfo class]]]]];
    return JsonRoot;
}

- (GetPrivListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mPrivInfo = [BaseJSON readMapDef:[RootMap objectForKey:@"mPrivInfo"] required:false def:self.mPrivInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [PrivInfo class]]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPrivDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vDtCode = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vDtCode != nil)
    {
        [ostream writeList: 1 value: self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPrivDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtCode = [istream readListDef: 1 required: false def: self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vDtCode" value : [BaseJSON writeList : self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetPrivDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtCode"] required:false def:self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPrivDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.mPrivInfo = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mPrivInfo != nil)
    {
        [ostream writeMap: 0 value: self.mPrivInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [PrivInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPrivDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mPrivInfo = [istream readMapDef: 0 required: false def: self.mPrivInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [PrivInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mPrivInfo" value : [BaseJSON writeMap : self.mPrivInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [PrivInfo class]]]];
    return JsonRoot;
}

- (GetPrivDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mPrivInfo = [BaseJSON readMapDef:[RootMap objectForKey:@"mPrivInfo"] required:false def:self.mPrivInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [PrivInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPrivTopListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iTopN = 0;
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
    [ostream writeInt32: 1 value: self.iTopN];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPrivTopListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iTopN = [istream readInt32Def: 1 required: false def: self.iTopN];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iTopN" value : [BaseJSON writeInt32 : self.iTopN]];
    return JsonRoot;
}

- (GetPrivTopListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iTopN = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTopN"] required:false def:self.iTopN];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPrivTopListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPrivInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPrivInfo != nil)
    {
        [ostream writeList: 0 value: self.vPrivInfo VAR_TYPE: [THOTH_LIST CREATE: [PrivInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPrivTopListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPrivInfo = [istream readListDef: 0 required: false def: self.vPrivInfo VAR_TYPE: [THOTH_LIST CREATE: [PrivInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vPrivInfo" value : [BaseJSON writeList : self.vPrivInfo VAR_TYPE: [THOTH_LIST CREATE: [PrivInfo class]]]];
    return JsonRoot;
}

- (GetPrivTopListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vPrivInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vPrivInfo"] required:false def:self.vPrivInfo VAR_TYPE: [THOTH_LIST CREATE: [PrivInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SuspendDetailInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.lSuspendTime = 0;
        self.lResumeTime = 0;
        self.sDuration = @"";
        self.sReason = @"";
        self.sProgress = @"";
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
    [ostream writeInt64: 2 value: self.lSuspendTime];
    [ostream writeInt64: 3 value: self.lResumeTime];
    if (self.sDuration != nil)
    {
        [ostream writeString: 4 value: self.sDuration];
    }
    if (self.sReason != nil)
    {
        [ostream writeString: 5 value: self.sReason];
    }
    if (self.sProgress != nil)
    {
        [ostream writeString: 6 value: self.sProgress];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SuspendDetailInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.lSuspendTime = [istream readInt64Def: 2 required: false def: self.lSuspendTime];
    self.lResumeTime = [istream readInt64Def: 3 required: false def: self.lResumeTime];
    self.sDuration = [istream readStringDef: 4 required: false def: self.sDuration];
    self.sReason = [istream readStringDef: 5 required: false def: self.sReason];
    self.sProgress = [istream readStringDef: 6 required: false def: self.sProgress];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"lSuspendTime" value : [BaseJSON writeInt64 : self.lSuspendTime]];
    [JsonRoot append:@"lResumeTime" value : [BaseJSON writeInt64 : self.lResumeTime]];
    [JsonRoot append:@"sDuration" value : [BaseJSON writeString : self.sDuration]];
    [JsonRoot append:@"sReason" value : [BaseJSON writeString : self.sReason]];
    [JsonRoot append:@"sProgress" value : [BaseJSON writeString : self.sProgress]];
    return JsonRoot;
}

- (SuspendDetailInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.lSuspendTime = [BaseJSON readInt64Def:[RootMap objectForKey:@"lSuspendTime"] required:false def:self.lSuspendTime];
    self.lResumeTime = [BaseJSON readInt64Def:[RootMap objectForKey:@"lResumeTime"] required:false def:self.lResumeTime];
    self.sDuration = [BaseJSON readStringDef:[RootMap objectForKey:@"sDuration"] required:false def:self.sDuration];
    self.sReason = [BaseJSON readStringDef:[RootMap objectForKey:@"sReason"] required:false def:self.sReason];
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
@implementation GetSuspendDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vDtCode = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vDtCode != nil)
    {
        [ostream writeList: 1 value: self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSuspendDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtCode = [istream readListDef: 1 required: false def: self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vDtCode" value : [BaseJSON writeList : self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetSuspendDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtCode"] required:false def:self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSuspendDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.mDetailInfo = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mDetailInfo != nil)
    {
        [ostream writeMap: 0 value: self.mDetailInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [SuspendDetailInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSuspendDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mDetailInfo = [istream readMapDef: 0 required: false def: self.mDetailInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [SuspendDetailInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mDetailInfo" value : [BaseJSON writeMap : self.mDetailInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [SuspendDetailInfo class]]]];
    return JsonRoot;
}

- (GetSuspendDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mDetailInfo = [BaseJSON readMapDef:[RootMap objectForKey:@"mDetailInfo"] required:false def:self.mDetailInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [SuspendDetailInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPlateHisQuoteReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iPlateType = 0;
        self.iCycleType = 0;
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
    [ostream writeInt32: 1 value: self.iPlateType];
    [ostream writeInt32: 2 value: self.iCycleType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPlateHisQuoteReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iPlateType = [istream readInt32Def: 1 required: false def: self.iPlateType];
    self.iCycleType = [istream readInt32Def: 2 required: false def: self.iCycleType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iPlateType" value : [BaseJSON writeInt32 : self.iPlateType]];
    [JsonRoot append:@"iCycleType" value : [BaseJSON writeInt32 : self.iCycleType]];
    return JsonRoot;
}

- (GetPlateHisQuoteReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iPlateType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPlateType"] required:false def:self.iPlateType];
    self.iCycleType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCycleType"] required:false def:self.iCycleType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PlateHisCycleInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtPlateCode = @"";
        self.sPlateName = @"";
        self.fClosePrive = 0;
        self.sTradingDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDtPlateCode != nil)
    {
        [ostream writeString: 0 value: self.sDtPlateCode];
    }
    if (self.sPlateName != nil)
    {
        [ostream writeString: 1 value: self.sPlateName];
    }
    [ostream writeFloat: 2 value: self.fClosePrive];
    if (self.sTradingDay != nil)
    {
        [ostream writeString: 3 value: self.sTradingDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateHisCycleInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtPlateCode = [istream readStringDef: 0 required: false def: self.sDtPlateCode];
    self.sPlateName = [istream readStringDef: 1 required: false def: self.sPlateName];
    self.fClosePrive = [istream readFloatDef: 2 required: false def: self.fClosePrive];
    self.sTradingDay = [istream readStringDef: 3 required: false def: self.sTradingDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sDtPlateCode" value : [BaseJSON writeString : self.sDtPlateCode]];
    [JsonRoot append:@"sPlateName" value : [BaseJSON writeString : self.sPlateName]];
    [JsonRoot append:@"fClosePrive" value : [BaseJSON writeFloat : self.fClosePrive]];
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    return JsonRoot;
}

- (PlateHisCycleInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtPlateCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtPlateCode"] required:false def:self.sDtPlateCode];
    self.sPlateName = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlateName"] required:false def:self.sPlateName];
    self.fClosePrive = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClosePrive"] required:false def:self.fClosePrive];
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
@implementation GetPlateHisQuoteRsp
- (id) init
{
    if (self = [super init])
    {
        self.vHisInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vHisInfo != nil)
    {
        [ostream writeList: 0 value: self.vHisInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateHisCycleInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPlateHisQuoteRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vHisInfo = [istream readListDef: 0 required: false def: self.vHisInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateHisCycleInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vHisInfo" value : [BaseJSON writeList : self.vHisInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateHisCycleInfo class]]]];
    return JsonRoot;
}

- (GetPlateHisQuoteRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vHisInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vHisInfo"] required:false def:self.vHisInfo VAR_TYPE: [THOTH_LIST CREATE: [PlateHisCycleInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecStatusReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vDtCode = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vDtCode != nil)
    {
        [ostream writeList: 1 value: self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecStatusReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtCode = [istream readListDef: 1 required: false def: self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vDtCode" value : [BaseJSON writeList : self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetSecStatusReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vDtCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtCode"] required:false def:self.vDtCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecStatusRsp
- (id) init
{
    if (self = [super init])
    {
        self.mSecStatus = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mSecStatus != nil)
    {
        [ostream writeMap: 0 value: self.mSecStatus VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [SecStatusInfo class]]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecStatusRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mSecStatus = [istream readMapDef: 0 required: false def: self.mSecStatus VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [SecStatusInfo class]]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mSecStatus" value : [BaseJSON writeMap : self.mSecStatus VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [SecStatusInfo class]]]]];
    return JsonRoot;
}

- (GetSecStatusRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mSecStatus = [BaseJSON readMapDef:[RootMap objectForKey:@"mSecStatus"] required:false def:self.mSecStatus VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_LIST CREATE: [SecStatusInfo class]]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetAllStatusReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iStatus = E_STATUS_FIX;
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
    [ostream writeInt32: 1 value: (int32_t)self.iStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetAllStatusReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iStatus = [istream readInt32Def: 1 required: false def: (int32_t)self.iStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : (int32_t)self.iStatus]];
    return JsonRoot;
}

- (GetAllStatusReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:(int32_t)self.iStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetIndexStocksReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sIndexDtCode = @"";
        self.iReqType = 0;
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
    if (self.sIndexDtCode != nil)
    {
        [ostream writeString: 1 value: self.sIndexDtCode];
    }
    [ostream writeInt32: 2 value: self.iReqType];
    [ostream writeInt32: 3 value: self.iNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetIndexStocksReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sIndexDtCode = [istream readStringDef: 1 required: false def: self.sIndexDtCode];
    self.iReqType = [istream readInt32Def: 2 required: false def: self.iReqType];
    self.iNum = [istream readInt32Def: 3 required: false def: self.iNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sIndexDtCode" value : [BaseJSON writeString : self.sIndexDtCode]];
    [JsonRoot append:@"iReqType" value : [BaseJSON writeInt32 : self.iReqType]];
    [JsonRoot append:@"iNum" value : [BaseJSON writeInt32 : self.iNum]];
    return JsonRoot;
}

- (GetIndexStocksReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sIndexDtCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sIndexDtCode"] required:false def:self.sIndexDtCode];
    self.iReqType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iReqType"] required:false def:self.iReqType];
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
@implementation GetIndexStocksRsp
- (id) init
{
    if (self = [super init])
    {
        self.mStocks = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mStocks != nil)
    {
        [ostream writeMap: 0 value: self.mStocks VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_LIST CREATE: [SecQuote class]]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetIndexStocksRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mStocks = [istream readMapDef: 0 required: false def: self.mStocks VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_LIST CREATE: [SecQuote class]]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mStocks" value : [BaseJSON writeMap : self.mStocks VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_LIST CREATE: [SecQuote class]]]]];
    return JsonRoot;
}

- (GetIndexStocksRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mStocks = [BaseJSON readMapDef:[RootMap objectForKey:@"mStocks"] required:false def:self.mStocks VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_LIST CREATE: [SecQuote class]]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecDailyReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iStart = 0;
        self.iCount = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sTradingDay = @"";
        self.sPreTradingDay = @"";
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
    [ostream writeInt32: 1 value: self.iStart];
    [ostream writeInt32: 2 value: self.iCount];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 3 value: self.stAccountTicket];
    }
    if (self.sTradingDay != nil)
    {
        [ostream writeString: 4 value: self.sTradingDay];
    }
    if (self.sPreTradingDay != nil)
    {
        [ostream writeString: 5 value: self.sPreTradingDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecDailyReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iStart = [istream readInt32Def: 1 required: false def: self.iStart];
    self.iCount = [istream readInt32Def: 2 required: false def: self.iCount];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 3 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sTradingDay = [istream readStringDef: 4 required: false def: self.sTradingDay];
    self.sPreTradingDay = [istream readStringDef: 5 required: false def: self.sPreTradingDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iStart" value : [BaseJSON writeInt32 : self.iStart]];
    [JsonRoot append:@"iCount" value : [BaseJSON writeInt32 : self.iCount]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    [JsonRoot append:@"sPreTradingDay" value : [BaseJSON writeString : self.sPreTradingDay]];
    return JsonRoot;
}

- (GetSecDailyReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iStart = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStart"] required:false def:self.iStart];
    self.iCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCount"] required:false def:self.iCount];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingDay"] required:false def:self.sTradingDay];
    self.sPreTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sPreTradingDay"] required:false def:self.sPreTradingDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DefaultDailyItem
- (id) init
{
    if (self = [super init])
    {
        self.sCode = @"";
        self.sName = @"";
        self.fClose = 0;
        self.fUpPct = 0;
        self.lAmout = 0;
        self.fAmoutUpPct = 0;
        self.fFundIn = 0;
        self.fFundInUpPct = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sCode != nil)
    {
        [ostream writeString: 0 value: self.sCode];
    }
    if (self.sName != nil)
    {
        [ostream writeString: 1 value: self.sName];
    }
    [ostream writeFloat: 2 value: self.fClose];
    [ostream writeFloat: 3 value: self.fUpPct];
    [ostream writeInt64: 4 value: self.lAmout];
    [ostream writeFloat: 5 value: self.fAmoutUpPct];
    [ostream writeFloat: 6 value: self.fFundIn];
    [ostream writeFloat: 7 value: self.fFundInUpPct];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DefaultDailyItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sCode = [istream readStringDef: 0 required: false def: self.sCode];
    self.sName = [istream readStringDef: 1 required: false def: self.sName];
    self.fClose = [istream readFloatDef: 2 required: false def: self.fClose];
    self.fUpPct = [istream readFloatDef: 3 required: false def: self.fUpPct];
    self.lAmout = [istream readInt64Def: 4 required: false def: self.lAmout];
    self.fAmoutUpPct = [istream readFloatDef: 5 required: false def: self.fAmoutUpPct];
    self.fFundIn = [istream readFloatDef: 6 required: false def: self.fFundIn];
    self.fFundInUpPct = [istream readFloatDef: 7 required: false def: self.fFundInUpPct];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sCode" value : [BaseJSON writeString : self.sCode]];
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"fUpPct" value : [BaseJSON writeFloat : self.fUpPct]];
    [JsonRoot append:@"lAmout" value : [BaseJSON writeInt64 : self.lAmout]];
    [JsonRoot append:@"fAmoutUpPct" value : [BaseJSON writeFloat : self.fAmoutUpPct]];
    [JsonRoot append:@"fFundIn" value : [BaseJSON writeFloat : self.fFundIn]];
    [JsonRoot append:@"fFundInUpPct" value : [BaseJSON writeFloat : self.fFundInUpPct]];
    return JsonRoot;
}

- (DefaultDailyItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sCode"] required:false def:self.sCode];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.fUpPct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fUpPct"] required:false def:self.fUpPct];
    self.lAmout = [BaseJSON readInt64Def:[RootMap objectForKey:@"lAmout"] required:false def:self.lAmout];
    self.fAmoutUpPct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAmoutUpPct"] required:false def:self.fAmoutUpPct];
    self.fFundIn = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFundIn"] required:false def:self.fFundIn];
    self.fFundInUpPct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFundInUpPct"] required:false def:self.fFundInUpPct];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DefaultDailyInfo
- (id) init
{
    if (self = [super init])
    {
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.sTradingDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vItem != nil)
    {
        [ostream writeList: 0 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DefaultDailyItem class]]];
    }
    if (self.sTradingDay != nil)
    {
        [ostream writeString: 1 value: self.sTradingDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DefaultDailyInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vItem = [istream readListDef: 0 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DefaultDailyItem class]]];
    self.sTradingDay = [istream readStringDef: 1 required: false def: self.sTradingDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DefaultDailyItem class]]]];
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    return JsonRoot;
}

- (DefaultDailyInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DefaultDailyItem class]]];
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
@implementation SecDailyInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.vStatus = [NSMutableArray arrayWithCapacity:0];
        self.fClose = 0;
        self.fUpPct = 0;
        self.fWinSHIndexUpPct = 0;
        self.fWinIndusPlatePct = 0;
        self.sIndusPlateName = @"";
        self.sIndusPlateCode = @"";
        self.fMainFundIn = 0;
        self.iPosInHSMarket = 0;
        self.iHSMarketSecNum = 0;
        self.iPosInIndusPlate = 0;
        self.iIndusPlateSecNum = 0;
        self.bInLHList = true;
        self.fSupportPrice = 0;
        self.fPressPrice = 0;
        self.fAvgCost = 0;
        self.stAdvise = [[InvestAdviseInfo alloc] init];
        self.sTradingDay = @"";
        self.eSecStatus = E_SS_NORMAL;
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
    if (self.vStatus != nil)
    {
        [ostream writeList: 2 value: self.vStatus VAR_TYPE: [THOTH_LIST CREATE: [SecStatusInfo class]]];
    }
    [ostream writeFloat: 3 value: self.fClose];
    [ostream writeFloat: 4 value: self.fUpPct];
    [ostream writeFloat: 5 value: self.fWinSHIndexUpPct];
    [ostream writeFloat: 6 value: self.fWinIndusPlatePct];
    if (self.sIndusPlateName != nil)
    {
        [ostream writeString: 7 value: self.sIndusPlateName];
    }
    if (self.sIndusPlateCode != nil)
    {
        [ostream writeString: 8 value: self.sIndusPlateCode];
    }
    [ostream writeFloat: 9 value: self.fMainFundIn];
    [ostream writeInt32: 10 value: self.iPosInHSMarket];
    [ostream writeInt32: 11 value: self.iHSMarketSecNum];
    [ostream writeInt32: 12 value: self.iPosInIndusPlate];
    [ostream writeInt32: 13 value: self.iIndusPlateSecNum];
    [ostream writeBoolean: 14 value: self.bInLHList];
    [ostream writeFloat: 15 value: self.fSupportPrice];
    [ostream writeFloat: 16 value: self.fPressPrice];
    [ostream writeFloat: 17 value: self.fAvgCost];
    if (self.stAdvise != nil)
    {
        [ostream writeMessage: 18 value: self.stAdvise];
    }
    if (self.sTradingDay != nil)
    {
        [ostream writeString: 19 value: self.sTradingDay];
    }
    [ostream writeInt32: 20 value: (int32_t)self.eSecStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecDailyInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.vStatus = [istream readListDef: 2 required: false def: self.vStatus VAR_TYPE: [THOTH_LIST CREATE: [SecStatusInfo class]]];
    self.fClose = [istream readFloatDef: 3 required: false def: self.fClose];
    self.fUpPct = [istream readFloatDef: 4 required: false def: self.fUpPct];
    self.fWinSHIndexUpPct = [istream readFloatDef: 5 required: false def: self.fWinSHIndexUpPct];
    self.fWinIndusPlatePct = [istream readFloatDef: 6 required: false def: self.fWinIndusPlatePct];
    self.sIndusPlateName = [istream readStringDef: 7 required: false def: self.sIndusPlateName];
    self.sIndusPlateCode = [istream readStringDef: 8 required: false def: self.sIndusPlateCode];
    self.fMainFundIn = [istream readFloatDef: 9 required: false def: self.fMainFundIn];
    self.iPosInHSMarket = [istream readInt32Def: 10 required: false def: self.iPosInHSMarket];
    self.iHSMarketSecNum = [istream readInt32Def: 11 required: false def: self.iHSMarketSecNum];
    self.iPosInIndusPlate = [istream readInt32Def: 12 required: false def: self.iPosInIndusPlate];
    self.iIndusPlateSecNum = [istream readInt32Def: 13 required: false def: self.iIndusPlateSecNum];
    self.bInLHList = [istream readBooleanDef: 14 required: false def: self.bInLHList];
    self.fSupportPrice = [istream readFloatDef: 15 required: false def: self.fSupportPrice];
    self.fPressPrice = [istream readFloatDef: 16 required: false def: self.fPressPrice];
    self.fAvgCost = [istream readFloatDef: 17 required: false def: self.fAvgCost];
    self.stAdvise = (InvestAdviseInfo*)[istream readMessageDef: 18 required: false def: self.stAdvise VAR_TYPE: [InvestAdviseInfo class]];
    self.sTradingDay = [istream readStringDef: 19 required: false def: self.sTradingDay];
    self.eSecStatus = [istream readInt32Def: 20 required: false def: (int32_t)self.eSecStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"vStatus" value : [BaseJSON writeList : self.vStatus VAR_TYPE: [THOTH_LIST CREATE: [SecStatusInfo class]]]];
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"fUpPct" value : [BaseJSON writeFloat : self.fUpPct]];
    [JsonRoot append:@"fWinSHIndexUpPct" value : [BaseJSON writeFloat : self.fWinSHIndexUpPct]];
    [JsonRoot append:@"fWinIndusPlatePct" value : [BaseJSON writeFloat : self.fWinIndusPlatePct]];
    [JsonRoot append:@"sIndusPlateName" value : [BaseJSON writeString : self.sIndusPlateName]];
    [JsonRoot append:@"sIndusPlateCode" value : [BaseJSON writeString : self.sIndusPlateCode]];
    [JsonRoot append:@"fMainFundIn" value : [BaseJSON writeFloat : self.fMainFundIn]];
    [JsonRoot append:@"iPosInHSMarket" value : [BaseJSON writeInt32 : self.iPosInHSMarket]];
    [JsonRoot append:@"iHSMarketSecNum" value : [BaseJSON writeInt32 : self.iHSMarketSecNum]];
    [JsonRoot append:@"iPosInIndusPlate" value : [BaseJSON writeInt32 : self.iPosInIndusPlate]];
    [JsonRoot append:@"iIndusPlateSecNum" value : [BaseJSON writeInt32 : self.iIndusPlateSecNum]];
    [JsonRoot append:@"bInLHList" value : [BaseJSON writeBoolean : self.bInLHList]];
    [JsonRoot append:@"fSupportPrice" value : [BaseJSON writeFloat : self.fSupportPrice]];
    [JsonRoot append:@"fPressPrice" value : [BaseJSON writeFloat : self.fPressPrice]];
    [JsonRoot append:@"fAvgCost" value : [BaseJSON writeFloat : self.fAvgCost]];
    [JsonRoot append:@"stAdvise" value : [BaseJSON writeMessage : self.stAdvise]];
    [JsonRoot append:@"sTradingDay" value : [BaseJSON writeString : self.sTradingDay]];
    [JsonRoot append:@"eSecStatus" value : [BaseJSON writeInt32 : (int32_t)self.eSecStatus]];
    return JsonRoot;
}

- (SecDailyInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.vStatus = [BaseJSON readListDef:[RootMap objectForKey:@"vStatus"] required:false def:self.vStatus VAR_TYPE: [THOTH_LIST CREATE: [SecStatusInfo class]]];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.fUpPct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fUpPct"] required:false def:self.fUpPct];
    self.fWinSHIndexUpPct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fWinSHIndexUpPct"] required:false def:self.fWinSHIndexUpPct];
    self.fWinIndusPlatePct = [BaseJSON readFloatDef:[RootMap objectForKey:@"fWinIndusPlatePct"] required:false def:self.fWinIndusPlatePct];
    self.sIndusPlateName = [BaseJSON readStringDef:[RootMap objectForKey:@"sIndusPlateName"] required:false def:self.sIndusPlateName];
    self.sIndusPlateCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sIndusPlateCode"] required:false def:self.sIndusPlateCode];
    self.fMainFundIn = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMainFundIn"] required:false def:self.fMainFundIn];
    self.iPosInHSMarket = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPosInHSMarket"] required:false def:self.iPosInHSMarket];
    self.iHSMarketSecNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iHSMarketSecNum"] required:false def:self.iHSMarketSecNum];
    self.iPosInIndusPlate = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPosInIndusPlate"] required:false def:self.iPosInIndusPlate];
    self.iIndusPlateSecNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iIndusPlateSecNum"] required:false def:self.iIndusPlateSecNum];
    self.bInLHList = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bInLHList"] required:false def:self.bInLHList];
    self.fSupportPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSupportPrice"] required:false def:self.fSupportPrice];
    self.fPressPrice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPressPrice"] required:false def:self.fPressPrice];
    self.fAvgCost = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAvgCost"] required:false def:self.fAvgCost];
    self.stAdvise = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAdvise"] required:false def:self.stAdvise VAR_TYPE: [InvestAdviseInfo class]];
    self.sTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingDay"] required:false def:self.sTradingDay];
    self.eSecStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecStatus"] required:false def:(int32_t)self.eSecStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation DtMorNewsItem
- (id) init
{
    if (self = [super init])
    {
        self.sTitle = @"";
        self.sAbstract = @"";
        self.sNewsId = @"";
        self.sPublish = @"";
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
    if (self.sAbstract != nil)
    {
        [ostream writeString: 1 value: self.sAbstract];
    }
    if (self.sNewsId != nil)
    {
        [ostream writeString: 2 value: self.sNewsId];
    }
    if (self.sPublish != nil)
    {
        [ostream writeString: 3 value: self.sPublish];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtMorNewsItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTitle = [istream readStringDef: 0 required: false def: self.sTitle];
    self.sAbstract = [istream readStringDef: 1 required: false def: self.sAbstract];
    self.sNewsId = [istream readStringDef: 2 required: false def: self.sNewsId];
    self.sPublish = [istream readStringDef: 3 required: false def: self.sPublish];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sAbstract" value : [BaseJSON writeString : self.sAbstract]];
    [JsonRoot append:@"sNewsId" value : [BaseJSON writeString : self.sNewsId]];
    [JsonRoot append:@"sPublish" value : [BaseJSON writeString : self.sPublish]];
    return JsonRoot;
}

- (DtMorNewsItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sAbstract = [BaseJSON readStringDef:[RootMap objectForKey:@"sAbstract"] required:false def:self.sAbstract];
    self.sNewsId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNewsId"] required:false def:self.sNewsId];
    self.sPublish = [BaseJSON readStringDef:[RootMap objectForKey:@"sPublish"] required:false def:self.sPublish];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecDailyRsp
- (id) init
{
    if (self = [super init])
    {
        self.sTradingDay = @"";
        self.iType = 0;
        self.vInfo = [NSMutableArray arrayWithCapacity:0];
        self.stDefault = [[DefaultDailyInfo alloc] init];
        self.stMorNews = [[DtMorNewsItem alloc] init];
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
    [ostream writeInt32: 1 value: self.iType];
    if (self.vInfo != nil)
    {
        [ostream writeList: 2 value: self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecDailyInfo class]]];
    }
    if (self.stDefault != nil)
    {
        [ostream writeMessage: 3 value: self.stDefault];
    }
    if (self.stMorNews != nil)
    {
        [ostream writeMessage: 4 value: self.stMorNews];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecDailyRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTradingDay = [istream readStringDef: 0 required: false def: self.sTradingDay];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    self.vInfo = [istream readListDef: 2 required: false def: self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecDailyInfo class]]];
    self.stDefault = (DefaultDailyInfo*)[istream readMessageDef: 3 required: false def: self.stDefault VAR_TYPE: [DefaultDailyInfo class]];
    self.stMorNews = (DtMorNewsItem*)[istream readMessageDef: 4 required: false def: self.stMorNews VAR_TYPE: [DtMorNewsItem class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    [JsonRoot append:@"vInfo" value : [BaseJSON writeList : self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecDailyInfo class]]]];
    [JsonRoot append:@"stDefault" value : [BaseJSON writeMessage : self.stDefault]];
    [JsonRoot append:@"stMorNews" value : [BaseJSON writeMessage : self.stMorNews]];
    return JsonRoot;
}

- (GetSecDailyRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTradingDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sTradingDay"] required:false def:self.sTradingDay];
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    self.vInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vInfo"] required:false def:self.vInfo VAR_TYPE: [THOTH_LIST CREATE: [SecDailyInfo class]]];
    self.stDefault = [BaseJSON readMessageDef:[RootMap objectForKey:@"stDefault"] required:false def:self.stDefault VAR_TYPE: [DefaultDailyInfo class]];
    self.stMorNews = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMorNews"] required:false def:self.stMorNews VAR_TYPE: [DtMorNewsItem class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation BannerInfo
- (id) init
{
    if (self = [super init])
    {
        self.iID = 0;
        self.sTitle = @"";
        self.sImgUrl = @"";
        self.sSkippUrl = @"";
        self.vSceneType = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iID];
    if (self.sTitle != nil)
    {
        [ostream writeString: 1 value: self.sTitle];
    }
    if (self.sImgUrl != nil)
    {
        [ostream writeString: 2 value: self.sImgUrl];
    }
    if (self.sSkippUrl != nil)
    {
        [ostream writeString: 3 value: self.sSkippUrl];
    }
    if (self.vSceneType != nil)
    {
        [ostream writeList: 4 value: self.vSceneType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BannerInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iID = [istream readInt32Def: 0 required: false def: self.iID];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    self.sImgUrl = [istream readStringDef: 2 required: false def: self.sImgUrl];
    self.sSkippUrl = [istream readStringDef: 3 required: false def: self.sSkippUrl];
    self.vSceneType = [istream readListDef: 4 required: false def: self.vSceneType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iID" value : [BaseJSON writeInt32 : self.iID]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sImgUrl" value : [BaseJSON writeString : self.sImgUrl]];
    [JsonRoot append:@"sSkippUrl" value : [BaseJSON writeString : self.sSkippUrl]];
    [JsonRoot append:@"vSceneType" value : [BaseJSON writeList : self.vSceneType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (BannerInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iID = [BaseJSON readInt32Def:[RootMap objectForKey:@"iID"] required:false def:self.iID];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sImgUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sImgUrl"] required:false def:self.sImgUrl];
    self.sSkippUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sSkippUrl"] required:false def:self.sSkippUrl];
    self.vSceneType = [BaseJSON readListDef:[RootMap objectForKey:@"vSceneType"] required:false def:self.vSceneType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetDiscBannerReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eSceneType = E_ST_ADR;
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
    [ostream writeInt32: 1 value: (int32_t)self.eSceneType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetDiscBannerReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eSceneType = [istream readInt32Def: 1 required: false def: (int32_t)self.eSceneType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eSceneType" value : [BaseJSON writeInt32 : (int32_t)self.eSceneType]];
    return JsonRoot;
}

- (GetDiscBannerReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eSceneType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSceneType"] required:false def:(int32_t)self.eSceneType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetDiscBannerRsp
- (id) init
{
    if (self = [super init])
    {
        self.vBannerInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vBannerInfo != nil)
    {
        [ostream writeList: 0 value: self.vBannerInfo VAR_TYPE: [THOTH_LIST CREATE: [BannerInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetDiscBannerRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vBannerInfo = [istream readListDef: 0 required: false def: self.vBannerInfo VAR_TYPE: [THOTH_LIST CREATE: [BannerInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vBannerInfo" value : [BaseJSON writeList : self.vBannerInfo VAR_TYPE: [THOTH_LIST CREATE: [BannerInfo class]]]];
    return JsonRoot;
}

- (GetDiscBannerRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vBannerInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vBannerInfo"] required:false def:self.vBannerInfo VAR_TYPE: [THOTH_LIST CREATE: [BannerInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CalendarEventDetail
- (id) init
{
    if (self = [super init])
    {
        self.iId = 0;
        self.sDescription = @"";
        self.sTag = @"";
        self.sDate = @"";
        self.sUrl = @"";
        self.vtRelaStock = [NSMutableArray arrayWithCapacity:0];
        self.vtRelaPlate = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iId];
    if (self.sDescription != nil)
    {
        [ostream writeString: 1 value: self.sDescription];
    }
    if (self.sTag != nil)
    {
        [ostream writeString: 2 value: self.sTag];
    }
    if (self.sDate != nil)
    {
        [ostream writeString: 3 value: self.sDate];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 4 value: self.sUrl];
    }
    if (self.vtRelaStock != nil)
    {
        [ostream writeList: 5 value: self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    }
    if (self.vtRelaPlate != nil)
    {
        [ostream writeList: 6 value: self.vtRelaPlate VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CalendarEventDetail *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iId = [istream readInt32Def: 0 required: false def: self.iId];
    self.sDescription = [istream readStringDef: 1 required: false def: self.sDescription];
    self.sTag = [istream readStringDef: 2 required: false def: self.sTag];
    self.sDate = [istream readStringDef: 3 required: false def: self.sDate];
    self.sUrl = [istream readStringDef: 4 required: false def: self.sUrl];
    self.vtRelaStock = [istream readListDef: 5 required: false def: self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    self.vtRelaPlate = [istream readListDef: 6 required: false def: self.vtRelaPlate VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"sTag" value : [BaseJSON writeString : self.sTag]];
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    [JsonRoot append:@"vtRelaStock" value : [BaseJSON writeList : self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]]];
    [JsonRoot append:@"vtRelaPlate" value : [BaseJSON writeList : self.vtRelaPlate VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]]];
    return JsonRoot;
}

- (CalendarEventDetail *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iId = [BaseJSON readInt32Def:[RootMap objectForKey:@"iId"] required:false def:self.iId];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.sTag = [BaseJSON readStringDef:[RootMap objectForKey:@"sTag"] required:false def:self.sTag];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.sUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sUrl"] required:false def:self.sUrl];
    self.vtRelaStock = [BaseJSON readListDef:[RootMap objectForKey:@"vtRelaStock"] required:false def:self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    self.vtRelaPlate = [BaseJSON readListDef:[RootMap objectForKey:@"vtRelaPlate"] required:false def:self.vtRelaPlate VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetCalendarEventsReq
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

- (GetCalendarEventsReq *) read: (BaseDecodeStream *)istream
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

- (GetCalendarEventsReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GetCalendarEventsRsp
- (id) init
{
    if (self = [super init])
    {
        self.sStartDate = @"";
        self.sEndDate = @"";
        self.vtCalendarEventDetail = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStartDate != nil)
    {
        [ostream writeString: 0 value: self.sStartDate];
    }
    if (self.sEndDate != nil)
    {
        [ostream writeString: 1 value: self.sEndDate];
    }
    if (self.vtCalendarEventDetail != nil)
    {
        [ostream writeList: 2 value: self.vtCalendarEventDetail VAR_TYPE: [THOTH_LIST CREATE: [CalendarEventDetail class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetCalendarEventsRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStartDate = [istream readStringDef: 0 required: false def: self.sStartDate];
    self.sEndDate = [istream readStringDef: 1 required: false def: self.sEndDate];
    self.vtCalendarEventDetail = [istream readListDef: 2 required: false def: self.vtCalendarEventDetail VAR_TYPE: [THOTH_LIST CREATE: [CalendarEventDetail class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sStartDate" value : [BaseJSON writeString : self.sStartDate]];
    [JsonRoot append:@"sEndDate" value : [BaseJSON writeString : self.sEndDate]];
    [JsonRoot append:@"vtCalendarEventDetail" value : [BaseJSON writeList : self.vtCalendarEventDetail VAR_TYPE: [THOTH_LIST CREATE: [CalendarEventDetail class]]]];
    return JsonRoot;
}

- (GetCalendarEventsRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sStartDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartDate"] required:false def:self.sStartDate];
    self.sEndDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sEndDate"] required:false def:self.sEndDate];
    self.vtCalendarEventDetail = [BaseJSON readListDef:[RootMap objectForKey:@"vtCalendarEventDetail"] required:false def:self.vtCalendarEventDetail VAR_TYPE: [THOTH_LIST CREATE: [CalendarEventDetail class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetHSTradingStatusReq
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

- (GetHSTradingStatusReq *) read: (BaseDecodeStream *)istream
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

- (GetHSTradingStatusReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GetHSTradingStatusRsp
- (id) init
{
    if (self = [super init])
    {
        self.mTradingStatus = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mTradingStatus != nil)
    {
        [ostream writeMap: 0 value: self.mTradingStatus VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetHSTradingStatusRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mTradingStatus = [istream readMapDef: 0 required: false def: self.mTradingStatus VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mTradingStatus" value : [BaseJSON writeMap : self.mTradingStatus VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (GetHSTradingStatusRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mTradingStatus = [BaseJSON readMapDef:[RootMap objectForKey:@"mTradingStatus"] required:false def:self.mTradingStatus VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecBsInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sDate = @"";
        self.iBs = 0;
        self.fClose = 0;
        self.fClosePre = 0;
        self.fBetaValue = 0;
        self.fBsValue = 0;
        self.fProbability = 0;
        self.sName = @"";
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
    [ostream writeInt32: 2 value: self.iBs];
    [ostream writeFloat: 3 value: self.fClose];
    [ostream writeFloat: 4 value: self.fClosePre];
    [ostream writeFloat: 5 value: self.fBetaValue];
    [ostream writeFloat: 6 value: self.fBsValue];
    [ostream writeFloat: 7 value: self.fProbability];
    if (self.sName != nil)
    {
        [ostream writeString: 8 value: self.sName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecBsInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sDate = [istream readStringDef: 1 required: false def: self.sDate];
    self.iBs = [istream readInt32Def: 2 required: false def: self.iBs];
    self.fClose = [istream readFloatDef: 3 required: false def: self.fClose];
    self.fClosePre = [istream readFloatDef: 4 required: false def: self.fClosePre];
    self.fBetaValue = [istream readFloatDef: 5 required: false def: self.fBetaValue];
    self.fBsValue = [istream readFloatDef: 6 required: false def: self.fBsValue];
    self.fProbability = [istream readFloatDef: 7 required: false def: self.fProbability];
    self.sName = [istream readStringDef: 8 required: false def: self.sName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iBs" value : [BaseJSON writeInt32 : self.iBs]];
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"fClosePre" value : [BaseJSON writeFloat : self.fClosePre]];
    [JsonRoot append:@"fBetaValue" value : [BaseJSON writeFloat : self.fBetaValue]];
    [JsonRoot append:@"fBsValue" value : [BaseJSON writeFloat : self.fBsValue]];
    [JsonRoot append:@"fProbability" value : [BaseJSON writeFloat : self.fProbability]];
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    return JsonRoot;
}

- (SecBsInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.iBs = [BaseJSON readInt32Def:[RootMap objectForKey:@"iBs"] required:false def:self.iBs];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.fClosePre = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClosePre"] required:false def:self.fClosePre];
    self.fBetaValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBetaValue"] required:false def:self.fBetaValue];
    self.fBsValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBsValue"] required:false def:self.fBsValue];
    self.fProbability = [BaseJSON readFloatDef:[RootMap objectForKey:@"fProbability"] required:false def:self.fProbability];
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
@implementation GetSecBsInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.sDate = @"";
        self.iSize = 0;
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
    if (self.sDate != nil)
    {
        [ostream writeString: 2 value: self.sDate];
    }
    [ostream writeInt32: 3 value: self.iSize];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecBsInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sDate = [istream readStringDef: 2 required: false def: self.sDate];
    self.iSize = [istream readInt32Def: 3 required: false def: self.iSize];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDate" value : [BaseJSON writeString : self.sDate]];
    [JsonRoot append:@"iSize" value : [BaseJSON writeInt32 : self.iSize]];
    return JsonRoot;
}

- (GetSecBsInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.iSize = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSize"] required:false def:self.iSize];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecBsInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.vSecBsInfo = [NSMutableArray arrayWithCapacity:0];
        self.fValue = 0;
        self.sTypeText = @"";
        self.sDescText = @"";
        self.sShortDescText = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSecBsInfo != nil)
    {
        [ostream writeList: 0 value: self.vSecBsInfo VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    }
    [ostream writeFloat: 1 value: self.fValue];
    if (self.sTypeText != nil)
    {
        [ostream writeString: 2 value: self.sTypeText];
    }
    if (self.sDescText != nil)
    {
        [ostream writeString: 3 value: self.sDescText];
    }
    if (self.sShortDescText != nil)
    {
        [ostream writeString: 4 value: self.sShortDescText];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecBsInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSecBsInfo = [istream readListDef: 0 required: false def: self.vSecBsInfo VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    self.fValue = [istream readFloatDef: 1 required: false def: self.fValue];
    self.sTypeText = [istream readStringDef: 2 required: false def: self.sTypeText];
    self.sDescText = [istream readStringDef: 3 required: false def: self.sDescText];
    self.sShortDescText = [istream readStringDef: 4 required: false def: self.sShortDescText];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vSecBsInfo" value : [BaseJSON writeList : self.vSecBsInfo VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]]];
    [JsonRoot append:@"fValue" value : [BaseJSON writeFloat : self.fValue]];
    [JsonRoot append:@"sTypeText" value : [BaseJSON writeString : self.sTypeText]];
    [JsonRoot append:@"sDescText" value : [BaseJSON writeString : self.sDescText]];
    [JsonRoot append:@"sShortDescText" value : [BaseJSON writeString : self.sShortDescText]];
    return JsonRoot;
}

- (GetSecBsInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vSecBsInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vSecBsInfo"] required:false def:self.vSecBsInfo VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    self.fValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fValue"] required:false def:self.fValue];
    self.sTypeText = [BaseJSON readStringDef:[RootMap objectForKey:@"sTypeText"] required:false def:self.sTypeText];
    self.sDescText = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescText"] required:false def:self.sDescText];
    self.sShortDescText = [BaseJSON readStringDef:[RootMap objectForKey:@"sShortDescText"] required:false def:self.sShortDescText];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetSecBsTopReq
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

- (GetSecBsTopReq *) read: (BaseDecodeStream *)istream
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

- (GetSecBsTopReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GetSecBsTopRsp
- (id) init
{
    if (self = [super init])
    {
        self.vSecBsInfoBuy = [NSMutableArray arrayWithCapacity:0];
        self.vSecBsInfoSell = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSecBsInfoBuy != nil)
    {
        [ostream writeList: 0 value: self.vSecBsInfoBuy VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    }
    if (self.vSecBsInfoSell != nil)
    {
        [ostream writeList: 1 value: self.vSecBsInfoSell VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetSecBsTopRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSecBsInfoBuy = [istream readListDef: 0 required: false def: self.vSecBsInfoBuy VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    self.vSecBsInfoSell = [istream readListDef: 1 required: false def: self.vSecBsInfoSell VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vSecBsInfoBuy" value : [BaseJSON writeList : self.vSecBsInfoBuy VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]]];
    [JsonRoot append:@"vSecBsInfoSell" value : [BaseJSON writeList : self.vSecBsInfoSell VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]]];
    return JsonRoot;
}

- (GetSecBsTopRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vSecBsInfoBuy = [BaseJSON readListDef:[RootMap objectForKey:@"vSecBsInfoBuy"] required:false def:self.vSecBsInfoBuy VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    self.vSecBsInfoSell = [BaseJSON readListDef:[RootMap objectForKey:@"vSecBsInfoSell"] required:false def:self.vSecBsInfoSell VAR_TYPE: [THOTH_LIST CREATE: [SecBsInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

