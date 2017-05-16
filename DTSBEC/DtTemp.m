#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "DtTemp.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation TempItem
- (id) init
{
    if (self = [super init])
    {
        self.sKey = @"";
        self.iTimestamp = 0;
        self.fHeatIndex = 0;
        self.fTotalHeatIndex = 0;
        self.fTemperature = 0;
        self.fMarketHeatIndex = 0;
        self.fMarketTotalHeatIndex = 0;
        self.fMarketTemperature = 0;
        self.fNewsHeatIndex = 0;
        self.fNewsTotalHeatIndex = 0;
        self.fNewsTemperature = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sKey != nil)
    {
        [ostream writeString: 0 value: self.sKey];
    }
    [ostream writeInt32: 1 value: self.iTimestamp];
    [ostream writeFloat: 2 value: self.fHeatIndex];
    [ostream writeFloat: 3 value: self.fTotalHeatIndex];
    [ostream writeFloat: 4 value: self.fTemperature];
    [ostream writeFloat: 5 value: self.fMarketHeatIndex];
    [ostream writeFloat: 6 value: self.fMarketTotalHeatIndex];
    [ostream writeFloat: 7 value: self.fMarketTemperature];
    [ostream writeFloat: 8 value: self.fNewsHeatIndex];
    [ostream writeFloat: 9 value: self.fNewsTotalHeatIndex];
    [ostream writeFloat: 10 value: self.fNewsTemperature];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TempItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sKey = [istream readStringDef: 0 required: false def: self.sKey];
    self.iTimestamp = [istream readInt32Def: 1 required: false def: self.iTimestamp];
    self.fHeatIndex = [istream readFloatDef: 2 required: false def: self.fHeatIndex];
    self.fTotalHeatIndex = [istream readFloatDef: 3 required: false def: self.fTotalHeatIndex];
    self.fTemperature = [istream readFloatDef: 4 required: false def: self.fTemperature];
    self.fMarketHeatIndex = [istream readFloatDef: 5 required: false def: self.fMarketHeatIndex];
    self.fMarketTotalHeatIndex = [istream readFloatDef: 6 required: false def: self.fMarketTotalHeatIndex];
    self.fMarketTemperature = [istream readFloatDef: 7 required: false def: self.fMarketTemperature];
    self.fNewsHeatIndex = [istream readFloatDef: 8 required: false def: self.fNewsHeatIndex];
    self.fNewsTotalHeatIndex = [istream readFloatDef: 9 required: false def: self.fNewsTotalHeatIndex];
    self.fNewsTemperature = [istream readFloatDef: 10 required: false def: self.fNewsTemperature];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sKey" value : [BaseJSON writeString : self.sKey]];
    [JsonRoot append:@"iTimestamp" value : [BaseJSON writeInt32 : self.iTimestamp]];
    [JsonRoot append:@"fHeatIndex" value : [BaseJSON writeFloat : self.fHeatIndex]];
    [JsonRoot append:@"fTotalHeatIndex" value : [BaseJSON writeFloat : self.fTotalHeatIndex]];
    [JsonRoot append:@"fTemperature" value : [BaseJSON writeFloat : self.fTemperature]];
    [JsonRoot append:@"fMarketHeatIndex" value : [BaseJSON writeFloat : self.fMarketHeatIndex]];
    [JsonRoot append:@"fMarketTotalHeatIndex" value : [BaseJSON writeFloat : self.fMarketTotalHeatIndex]];
    [JsonRoot append:@"fMarketTemperature" value : [BaseJSON writeFloat : self.fMarketTemperature]];
    [JsonRoot append:@"fNewsHeatIndex" value : [BaseJSON writeFloat : self.fNewsHeatIndex]];
    [JsonRoot append:@"fNewsTotalHeatIndex" value : [BaseJSON writeFloat : self.fNewsTotalHeatIndex]];
    [JsonRoot append:@"fNewsTemperature" value : [BaseJSON writeFloat : self.fNewsTemperature]];
    return JsonRoot;
}

- (TempItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sKey = [BaseJSON readStringDef:[RootMap objectForKey:@"sKey"] required:false def:self.sKey];
    self.iTimestamp = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTimestamp"] required:false def:self.iTimestamp];
    self.fHeatIndex = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHeatIndex"] required:false def:self.fHeatIndex];
    self.fTotalHeatIndex = [BaseJSON readFloatDef:[RootMap objectForKey:@"fTotalHeatIndex"] required:false def:self.fTotalHeatIndex];
    self.fTemperature = [BaseJSON readFloatDef:[RootMap objectForKey:@"fTemperature"] required:false def:self.fTemperature];
    self.fMarketHeatIndex = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMarketHeatIndex"] required:false def:self.fMarketHeatIndex];
    self.fMarketTotalHeatIndex = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMarketTotalHeatIndex"] required:false def:self.fMarketTotalHeatIndex];
    self.fMarketTemperature = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMarketTemperature"] required:false def:self.fMarketTemperature];
    self.fNewsHeatIndex = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNewsHeatIndex"] required:false def:self.fNewsHeatIndex];
    self.fNewsTotalHeatIndex = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNewsTotalHeatIndex"] required:false def:self.fNewsTotalHeatIndex];
    self.fNewsTemperature = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNewsTemperature"] required:false def:self.fNewsTemperature];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TempTopReq
- (id) init
{
    if (self = [super init])
    {
        self.iStartTime = 0;
        self.iEndTime = 0;
        self.eCycleType = CT_HOUR;
        self.eTempKey = TK_STOCK;
        self.iTopCount = 0;
        self.vKeys = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStartTime];
    [ostream writeInt32: 1 value: self.iEndTime];
    [ostream writeInt32: 2 value: (int32_t)self.eCycleType];
    [ostream writeInt32: 3 value: (int32_t)self.eTempKey];
    [ostream writeInt32: 4 value: self.iTopCount];
    if (self.vKeys != nil)
    {
        [ostream writeList: 5 value: self.vKeys VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TempTopReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStartTime = [istream readInt32Def: 0 required: false def: self.iStartTime];
    self.iEndTime = [istream readInt32Def: 1 required: false def: self.iEndTime];
    self.eCycleType = [istream readInt32Def: 2 required: false def: (int32_t)self.eCycleType];
    self.eTempKey = [istream readInt32Def: 3 required: false def: (int32_t)self.eTempKey];
    self.iTopCount = [istream readInt32Def: 4 required: false def: self.iTopCount];
    self.vKeys = [istream readListDef: 5 required: false def: self.vKeys VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iEndTime" value : [BaseJSON writeInt32 : self.iEndTime]];
    [JsonRoot append:@"eCycleType" value : [BaseJSON writeInt32 : (int32_t)self.eCycleType]];
    [JsonRoot append:@"eTempKey" value : [BaseJSON writeInt32 : (int32_t)self.eTempKey]];
    [JsonRoot append:@"iTopCount" value : [BaseJSON writeInt32 : self.iTopCount]];
    [JsonRoot append:@"vKeys" value : [BaseJSON writeList : self.vKeys VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (TempTopReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStartTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartTime"] required:false def:self.iStartTime];
    self.iEndTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEndTime"] required:false def:self.iEndTime];
    self.eCycleType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eCycleType"] required:false def:(int32_t)self.eCycleType];
    self.eTempKey = [BaseJSON readInt32Def:[RootMap objectForKey:@"eTempKey"] required:false def:(int32_t)self.eTempKey];
    self.iTopCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTopCount"] required:false def:self.iTopCount];
    self.vKeys = [BaseJSON readListDef:[RootMap objectForKey:@"vKeys"] required:false def:self.vKeys VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TempTopRsp
- (id) init
{
    if (self = [super init])
    {
        self.vTempItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vTempItem != nil)
    {
        [ostream writeList: 0 value: self.vTempItem VAR_TYPE: [THOTH_LIST CREATE: [TempItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TempTopRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTempItem = [istream readListDef: 0 required: false def: self.vTempItem VAR_TYPE: [THOTH_LIST CREATE: [TempItem class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vTempItem" value : [BaseJSON writeList : self.vTempItem VAR_TYPE: [THOTH_LIST CREATE: [TempItem class]]]];
    return JsonRoot;
}

- (TempTopRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vTempItem = [BaseJSON readListDef:[RootMap objectForKey:@"vTempItem"] required:false def:self.vTempItem VAR_TYPE: [THOTH_LIST CREATE: [TempItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TempDataReq
- (id) init
{
    if (self = [super init])
    {
        self.sKey = @"";
        self.iStartTime = 0;
        self.iEndTime = 0;
        self.eCycleType = CT_HOUR;
        self.eTempKey = TK_STOCK;
        self.iCycleCount = 1;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sKey != nil)
    {
        [ostream writeString: 0 value: self.sKey];
    }
    [ostream writeInt32: 1 value: self.iStartTime];
    [ostream writeInt32: 2 value: self.iEndTime];
    [ostream writeInt32: 3 value: (int32_t)self.eCycleType];
    [ostream writeInt32: 4 value: (int32_t)self.eTempKey];
    [ostream writeInt32: 5 value: self.iCycleCount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TempDataReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sKey = [istream readStringDef: 0 required: false def: self.sKey];
    self.iStartTime = [istream readInt32Def: 1 required: false def: self.iStartTime];
    self.iEndTime = [istream readInt32Def: 2 required: false def: self.iEndTime];
    self.eCycleType = [istream readInt32Def: 3 required: false def: (int32_t)self.eCycleType];
    self.eTempKey = [istream readInt32Def: 4 required: false def: (int32_t)self.eTempKey];
    self.iCycleCount = [istream readInt32Def: 5 required: false def: self.iCycleCount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sKey" value : [BaseJSON writeString : self.sKey]];
    [JsonRoot append:@"iStartTime" value : [BaseJSON writeInt32 : self.iStartTime]];
    [JsonRoot append:@"iEndTime" value : [BaseJSON writeInt32 : self.iEndTime]];
    [JsonRoot append:@"eCycleType" value : [BaseJSON writeInt32 : (int32_t)self.eCycleType]];
    [JsonRoot append:@"eTempKey" value : [BaseJSON writeInt32 : (int32_t)self.eTempKey]];
    [JsonRoot append:@"iCycleCount" value : [BaseJSON writeInt32 : self.iCycleCount]];
    return JsonRoot;
}

- (TempDataReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sKey = [BaseJSON readStringDef:[RootMap objectForKey:@"sKey"] required:false def:self.sKey];
    self.iStartTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartTime"] required:false def:self.iStartTime];
    self.iEndTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEndTime"] required:false def:self.iEndTime];
    self.eCycleType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eCycleType"] required:false def:(int32_t)self.eCycleType];
    self.eTempKey = [BaseJSON readInt32Def:[RootMap objectForKey:@"eTempKey"] required:false def:(int32_t)self.eTempKey];
    self.iCycleCount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCycleCount"] required:false def:self.iCycleCount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TempDataRsp
- (id) init
{
    if (self = [super init])
    {
        self.mTempItem = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.bHasMore = false;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mTempItem != nil)
    {
        [ostream writeMap: 0 value: self.mTempItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [TempItem class]]];
    }
    [ostream writeBoolean: 1 value: self.bHasMore];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TempDataRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mTempItem = [istream readMapDef: 0 required: false def: self.mTempItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [TempItem class]]];
    self.bHasMore = [istream readBooleanDef: 1 required: false def: self.bHasMore];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mTempItem" value : [BaseJSON writeMap : self.mTempItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [TempItem class]]]];
    [JsonRoot append:@"bHasMore" value : [BaseJSON writeBoolean : self.bHasMore]];
    return JsonRoot;
}

- (TempDataRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mTempItem = [BaseJSON readMapDef:[RootMap objectForKey:@"mTempItem"] required:false def:self.mTempItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [TempItem class]]];
    self.bHasMore = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bHasMore"] required:false def:self.bHasMore];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StockRela
- (id) init
{
    if (self = [super init])
    {
        self.stSecBaseInfo = [[SecBaseInfo alloc] init];
        self.fRela = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stSecBaseInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stSecBaseInfo];
    }
    [ostream writeFloat: 1 value: self.fRela];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StockRela *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stSecBaseInfo = (SecBaseInfo*)[istream readMessageDef: 0 required: false def: self.stSecBaseInfo VAR_TYPE: [SecBaseInfo class]];
    self.fRela = [istream readFloatDef: 1 required: false def: self.fRela];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stSecBaseInfo" value : [BaseJSON writeMessage : self.stSecBaseInfo]];
    [JsonRoot append:@"fRela" value : [BaseJSON writeFloat : self.fRela]];
    return JsonRoot;
}

- (StockRela *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stSecBaseInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecBaseInfo"] required:false def:self.stSecBaseInfo VAR_TYPE: [SecBaseInfo class]];
    self.fRela = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRela"] required:false def:self.fRela];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicMessage
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sTitle = @"";
        self.iPubTime = 0;
        self.sContent = @"";
        self.vStockRela = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeInt32: 2 value: self.iPubTime];
    if (self.sContent != nil)
    {
        [ostream writeString: 3 value: self.sContent];
    }
    if (self.vStockRela != nil)
    {
        [ostream writeList: 4 value: self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicMessage *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sTitle = [istream readStringDef: 1 required: false def: self.sTitle];
    self.iPubTime = [istream readInt32Def: 2 required: false def: self.iPubTime];
    self.sContent = [istream readStringDef: 3 required: false def: self.sContent];
    self.vStockRela = [istream readListDef: 4 required: false def: self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iPubTime" value : [BaseJSON writeInt32 : self.iPubTime]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    [JsonRoot append:@"vStockRela" value : [BaseJSON writeList : self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]]];
    return JsonRoot;
}

- (TopicMessage *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.iPubTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPubTime"] required:false def:self.iPubTime];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
    self.vStockRela = [BaseJSON readListDef:[RootMap objectForKey:@"vStockRela"] required:false def:self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicNews
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.iPublish = 0;
        self.sTitle = @"";
        self.sAbstract = @"";
        self.sSource = @"";
        self.sContent = @"";
        self.sUrl = @"";
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
    [ostream writeInt32: 1 value: self.iPublish];
    if (self.sTitle != nil)
    {
        [ostream writeString: 2 value: self.sTitle];
    }
    if (self.sAbstract != nil)
    {
        [ostream writeString: 3 value: self.sAbstract];
    }
    if (self.sSource != nil)
    {
        [ostream writeString: 4 value: self.sSource];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 5 value: self.sContent];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 6 value: self.sUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicNews *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.iPublish = [istream readInt32Def: 1 required: false def: self.iPublish];
    self.sTitle = [istream readStringDef: 2 required: false def: self.sTitle];
    self.sAbstract = [istream readStringDef: 3 required: false def: self.sAbstract];
    self.sSource = [istream readStringDef: 4 required: false def: self.sSource];
    self.sContent = [istream readStringDef: 5 required: false def: self.sContent];
    self.sUrl = [istream readStringDef: 6 required: false def: self.sUrl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iPublish" value : [BaseJSON writeInt32 : self.iPublish]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"sAbstract" value : [BaseJSON writeString : self.sAbstract]];
    [JsonRoot append:@"sSource" value : [BaseJSON writeString : self.sSource]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    [JsonRoot append:@"sUrl" value : [BaseJSON writeString : self.sUrl]];
    return JsonRoot;
}

- (TopicNews *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.iPublish = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPublish"] required:false def:self.iPublish];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.sAbstract = [BaseJSON readStringDef:[RootMap objectForKey:@"sAbstract"] required:false def:self.sAbstract];
    self.sSource = [BaseJSON readStringDef:[RootMap objectForKey:@"sSource"] required:false def:self.sSource];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
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
@implementation TopicDetail
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sName = @"";
        self.sDescription = @"";
        self.iTimestamp = 0;
        self.vStockRela = [NSMutableArray arrayWithCapacity:0];
        self.vTopicMessage = [NSMutableArray arrayWithCapacity:0];
        self.mTempItem = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.vTopicNews = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sDescription != nil)
    {
        [ostream writeString: 2 value: self.sDescription];
    }
    [ostream writeInt32: 3 value: self.iTimestamp];
    if (self.vStockRela != nil)
    {
        [ostream writeList: 4 value: self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    }
    if (self.vTopicMessage != nil)
    {
        [ostream writeList: 5 value: self.vTopicMessage VAR_TYPE: [THOTH_LIST CREATE: [TopicMessage class]]];
    }
    if (self.mTempItem != nil)
    {
        [ostream writeMap: 6 value: self.mTempItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [TempItem class]]];
    }
    if (self.vTopicNews != nil)
    {
        [ostream writeList: 7 value: self.vTopicNews VAR_TYPE: [THOTH_LIST CREATE: [TopicNews class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicDetail *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sName = [istream readStringDef: 1 required: false def: self.sName];
    self.sDescription = [istream readStringDef: 2 required: false def: self.sDescription];
    self.iTimestamp = [istream readInt32Def: 3 required: false def: self.iTimestamp];
    self.vStockRela = [istream readListDef: 4 required: false def: self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    self.vTopicMessage = [istream readListDef: 5 required: false def: self.vTopicMessage VAR_TYPE: [THOTH_LIST CREATE: [TopicMessage class]]];
    self.mTempItem = [istream readMapDef: 6 required: false def: self.mTempItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [TempItem class]]];
    self.vTopicNews = [istream readListDef: 7 required: false def: self.vTopicNews VAR_TYPE: [THOTH_LIST CREATE: [TopicNews class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"iTimestamp" value : [BaseJSON writeInt32 : self.iTimestamp]];
    [JsonRoot append:@"vStockRela" value : [BaseJSON writeList : self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]]];
    [JsonRoot append:@"vTopicMessage" value : [BaseJSON writeList : self.vTopicMessage VAR_TYPE: [THOTH_LIST CREATE: [TopicMessage class]]]];
    [JsonRoot append:@"mTempItem" value : [BaseJSON writeMap : self.mTempItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [TempItem class]]]];
    [JsonRoot append:@"vTopicNews" value : [BaseJSON writeList : self.vTopicNews VAR_TYPE: [THOTH_LIST CREATE: [TopicNews class]]]];
    return JsonRoot;
}

- (TopicDetail *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.iTimestamp = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTimestamp"] required:false def:self.iTimestamp];
    self.vStockRela = [BaseJSON readListDef:[RootMap objectForKey:@"vStockRela"] required:false def:self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    self.vTopicMessage = [BaseJSON readListDef:[RootMap objectForKey:@"vTopicMessage"] required:false def:self.vTopicMessage VAR_TYPE: [THOTH_LIST CREATE: [TopicMessage class]]];
    self.mTempItem = [BaseJSON readMapDef:[RootMap objectForKey:@"mTempItem"] required:false def:self.mTempItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [TempItem class]]];
    self.vTopicNews = [BaseJSON readListDef:[RootMap objectForKey:@"vTopicNews"] required:false def:self.vTopicNews VAR_TYPE: [THOTH_LIST CREATE: [TopicNews class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicListItem
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sName = @"";
        self.sDescription = @"";
        self.iTimestamp = 0;
        self.vStockRela = [NSMutableArray arrayWithCapacity:0];
        self.stTopicMessage = [[TopicMessage alloc] init];
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
    if (self.sDescription != nil)
    {
        [ostream writeString: 2 value: self.sDescription];
    }
    [ostream writeInt32: 3 value: self.iTimestamp];
    if (self.vStockRela != nil)
    {
        [ostream writeList: 4 value: self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    }
    if (self.stTopicMessage != nil)
    {
        [ostream writeMessage: 5 value: self.stTopicMessage];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicListItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sName = [istream readStringDef: 1 required: false def: self.sName];
    self.sDescription = [istream readStringDef: 2 required: false def: self.sDescription];
    self.iTimestamp = [istream readInt32Def: 3 required: false def: self.iTimestamp];
    self.vStockRela = [istream readListDef: 4 required: false def: self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    self.stTopicMessage = (TopicMessage*)[istream readMessageDef: 5 required: false def: self.stTopicMessage VAR_TYPE: [TopicMessage class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sDescription" value : [BaseJSON writeString : self.sDescription]];
    [JsonRoot append:@"iTimestamp" value : [BaseJSON writeInt32 : self.iTimestamp]];
    [JsonRoot append:@"vStockRela" value : [BaseJSON writeList : self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]]];
    [JsonRoot append:@"stTopicMessage" value : [BaseJSON writeMessage : self.stTopicMessage]];
    return JsonRoot;
}

- (TopicListItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sDescription = [BaseJSON readStringDef:[RootMap objectForKey:@"sDescription"] required:false def:self.sDescription];
    self.iTimestamp = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTimestamp"] required:false def:self.iTimestamp];
    self.vStockRela = [BaseJSON readListDef:[RootMap objectForKey:@"vStockRela"] required:false def:self.vStockRela VAR_TYPE: [THOTH_LIST CREATE: [StockRela class]]];
    self.stTopicMessage = [BaseJSON readMessageDef:[RootMap objectForKey:@"stTopicMessage"] required:false def:self.stTopicMessage VAR_TYPE: [TopicMessage class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicDetailReq
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

- (TopicDetailReq *) read: (BaseDecodeStream *)istream
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

- (TopicDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation TopicDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.stTopicDetail = [[TopicDetail alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stTopicDetail != nil)
    {
        [ostream writeMessage: 0 value: self.stTopicDetail];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stTopicDetail = (TopicDetail*)[istream readMessageDef: 0 required: false def: self.stTopicDetail VAR_TYPE: [TopicDetail class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stTopicDetail" value : [BaseJSON writeMessage : self.stTopicDetail]];
    return JsonRoot;
}

- (TopicDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stTopicDetail = [BaseJSON readMessageDef:[RootMap objectForKey:@"stTopicDetail"] required:false def:self.stTopicDetail VAR_TYPE: [TopicDetail class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicListReq
- (id) init
{
    if (self = [super init])
    {
        self.iStartTime = 0;
        self.iEndTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStartTime];
    [ostream writeInt32: 1 value: self.iEndTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStartTime = [istream readInt32Def: 0 required: false def: self.iStartTime];
    self.iEndTime = [istream readInt32Def: 1 required: false def: self.iEndTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iEndTime" value : [BaseJSON writeInt32 : self.iEndTime]];
    return JsonRoot;
}

- (TopicListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStartTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartTime"] required:false def:self.iStartTime];
    self.iEndTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEndTime"] required:false def:self.iEndTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicListRsp
- (id) init
{
    if (self = [super init])
    {
        self.stTopicList = [NSMutableArray arrayWithCapacity:0];
        self.bHasMore = true;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stTopicList != nil)
    {
        [ostream writeList: 0 value: self.stTopicList VAR_TYPE: [THOTH_LIST CREATE: [TopicListItem class]]];
    }
    [ostream writeBoolean: 1 value: self.bHasMore];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stTopicList = [istream readListDef: 0 required: false def: self.stTopicList VAR_TYPE: [THOTH_LIST CREATE: [TopicListItem class]]];
    self.bHasMore = [istream readBooleanDef: 1 required: false def: self.bHasMore];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stTopicList" value : [BaseJSON writeList : self.stTopicList VAR_TYPE: [THOTH_LIST CREATE: [TopicListItem class]]]];
    [JsonRoot append:@"bHasMore" value : [BaseJSON writeBoolean : self.bHasMore]];
    return JsonRoot;
}

- (TopicListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stTopicList = [BaseJSON readListDef:[RootMap objectForKey:@"stTopicList"] required:false def:self.stTopicList VAR_TYPE: [THOTH_LIST CREATE: [TopicListItem class]]];
    self.bHasMore = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bHasMore"] required:false def:self.bHasMore];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicMessageListReq
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.iStartTime = 0;
        self.iEndTime = 0;
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
    [ostream writeInt32: 1 value: self.iStartTime];
    [ostream writeInt32: 2 value: self.iEndTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicMessageListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.iStartTime = [istream readInt32Def: 1 required: false def: self.iStartTime];
    self.iEndTime = [istream readInt32Def: 2 required: false def: self.iEndTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iStartTime" value : [BaseJSON writeInt32 : self.iStartTime]];
    [JsonRoot append:@"iEndTime" value : [BaseJSON writeInt32 : self.iEndTime]];
    return JsonRoot;
}

- (TopicMessageListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.iStartTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartTime"] required:false def:self.iStartTime];
    self.iEndTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEndTime"] required:false def:self.iEndTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicMessageListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vTopicMessage = [NSMutableArray arrayWithCapacity:0];
        self.bHasMore = true;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vTopicMessage != nil)
    {
        [ostream writeList: 0 value: self.vTopicMessage VAR_TYPE: [THOTH_LIST CREATE: [TopicMessage class]]];
    }
    [ostream writeBoolean: 1 value: self.bHasMore];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicMessageListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTopicMessage = [istream readListDef: 0 required: false def: self.vTopicMessage VAR_TYPE: [THOTH_LIST CREATE: [TopicMessage class]]];
    self.bHasMore = [istream readBooleanDef: 1 required: false def: self.bHasMore];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vTopicMessage" value : [BaseJSON writeList : self.vTopicMessage VAR_TYPE: [THOTH_LIST CREATE: [TopicMessage class]]]];
    [JsonRoot append:@"bHasMore" value : [BaseJSON writeBoolean : self.bHasMore]];
    return JsonRoot;
}

- (TopicMessageListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vTopicMessage = [BaseJSON readListDef:[RootMap objectForKey:@"vTopicMessage"] required:false def:self.vTopicMessage VAR_TYPE: [THOTH_LIST CREATE: [TopicMessage class]]];
    self.bHasMore = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bHasMore"] required:false def:self.bHasMore];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicNewsListReq
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.iEndTime = 0;
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
    [ostream writeInt32: 1 value: self.iEndTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicNewsListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.iEndTime = [istream readInt32Def: 1 required: false def: self.iEndTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iEndTime" value : [BaseJSON writeInt32 : self.iEndTime]];
    return JsonRoot;
}

- (TopicNewsListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.iEndTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEndTime"] required:false def:self.iEndTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TopicNewsListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vTopicNews = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vTopicNews != nil)
    {
        [ostream writeList: 0 value: self.vTopicNews VAR_TYPE: [THOTH_LIST CREATE: [TopicNews class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicNewsListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTopicNews = [istream readListDef: 0 required: false def: self.vTopicNews VAR_TYPE: [THOTH_LIST CREATE: [TopicNews class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vTopicNews" value : [BaseJSON writeList : self.vTopicNews VAR_TYPE: [THOTH_LIST CREATE: [TopicNews class]]]];
    return JsonRoot;
}

- (TopicNewsListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vTopicNews = [BaseJSON readListDef:[RootMap objectForKey:@"vTopicNews"] required:false def:self.vTopicNews VAR_TYPE: [THOTH_LIST CREATE: [TopicNews class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

