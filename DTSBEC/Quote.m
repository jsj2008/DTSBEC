#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Quote.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation QuoteReq
- (id) init
{
    if (self = [super init])
    {
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
        self.vGuid = [NSData data];
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
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 1 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QuoteReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDtSecCode = [istream readListDef: 0 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
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
    [JsonRoot append:@"vDtSecCode" value : [BaseJSON writeList : self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (QuoteReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vDtSecCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtSecCode"] required:false def:self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
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
@implementation SecQuote
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.fClose = 0;
        self.fOpen = 0;
        self.fMax = 0;
        self.fMin = 0;
        self.fNow = 0;
        self.fBuy = 0;
        self.fSell = 0;
        self.lVolume = 0;
        self.lNowVolume = 0;
        self.fAmout = 0;
        self.lInside = 0;
        self.lOutside = 0;
        self.fTickdiff = 0;
        self.fVolinstock = 0;
        self.fFhsl = 0;
        self.vBuyp = [NSMutableArray arrayWithCapacity:0];
        self.vBuyv = [NSMutableArray arrayWithCapacity:0];
        self.vSellp = [NSMutableArray arrayWithCapacity:0];
        self.vSellv = [NSMutableArray arrayWithCapacity:0];
        self.cInoutflag = 0;
        self.lRestvol = 0;
        self.iTpFlag = 0;
        self.fSyl = 0;
        self.iUpnum = 0;
        self.iDownnum = 0;
        self.fLtg = 0;
        self.fYclose = 0;
        self.lYvolinstock = 0;
        self.fAverageprice = 0;
        self.fTotalmarketvalue = 0;
        self.fCirculationmarketvalue = 0;
        self.iErveyhand = 0;
        self.fDayincrease = 0;
        self.fCointype = 0;
        self.fHot = 0;
        self.iTime = 0;
        self.eSecStatus = E_SS_NORMAL;
        self.fFundNetValue = 0;
        self.fMaxLimit = 0;
        self.fMinLimit = 0;
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
    [ostream writeFloat: 2 value: self.fClose];
    [ostream writeFloat: 3 value: self.fOpen];
    [ostream writeFloat: 4 value: self.fMax];
    [ostream writeFloat: 5 value: self.fMin];
    [ostream writeFloat: 6 value: self.fNow];
    [ostream writeFloat: 7 value: self.fBuy];
    [ostream writeFloat: 8 value: self.fSell];
    [ostream writeInt64: 9 value: self.lVolume];
    [ostream writeInt64: 10 value: self.lNowVolume];
    [ostream writeFloat: 11 value: self.fAmout];
    [ostream writeInt64: 12 value: self.lInside];
    [ostream writeInt64: 13 value: self.lOutside];
    [ostream writeFloat: 14 value: self.fTickdiff];
    [ostream writeFloat: 15 value: self.fVolinstock];
    [ostream writeFloat: 16 value: self.fFhsl];
    if (self.vBuyp != nil)
    {
        [ostream writeList: 17 value: self.vBuyp VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    }
    if (self.vBuyv != nil)
    {
        [ostream writeList: 18 value: self.vBuyv VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT64 class]]];
    }
    if (self.vSellp != nil)
    {
        [ostream writeList: 19 value: self.vSellp VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    }
    if (self.vSellv != nil)
    {
        [ostream writeList: 20 value: self.vSellv VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT64 class]]];
    }
    [ostream writeInt8: 21 value: self.cInoutflag];
    [ostream writeInt64: 22 value: self.lRestvol];
    [ostream writeInt32: 23 value: self.iTpFlag];
    [ostream writeFloat: 24 value: self.fSyl];
    [ostream writeInt32: 25 value: self.iUpnum];
    [ostream writeInt32: 26 value: self.iDownnum];
    [ostream writeFloat: 27 value: self.fLtg];
    [ostream writeFloat: 28 value: self.fYclose];
    [ostream writeInt64: 29 value: self.lYvolinstock];
    [ostream writeFloat: 30 value: self.fAverageprice];
    [ostream writeFloat: 31 value: self.fTotalmarketvalue];
    [ostream writeFloat: 32 value: self.fCirculationmarketvalue];
    [ostream writeInt32: 33 value: self.iErveyhand];
    [ostream writeFloat: 34 value: self.fDayincrease];
    [ostream writeFloat: 35 value: self.fCointype];
    [ostream writeFloat: 36 value: self.fHot];
    [ostream writeInt32: 37 value: self.iTime];
    [ostream writeInt32: 38 value: (int32_t)self.eSecStatus];
    [ostream writeFloat: 39 value: self.fFundNetValue];
    [ostream writeFloat: 40 value: self.fMaxLimit];
    [ostream writeFloat: 41 value: self.fMinLimit];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecQuote *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.fClose = [istream readFloatDef: 2 required: false def: self.fClose];
    self.fOpen = [istream readFloatDef: 3 required: false def: self.fOpen];
    self.fMax = [istream readFloatDef: 4 required: false def: self.fMax];
    self.fMin = [istream readFloatDef: 5 required: false def: self.fMin];
    self.fNow = [istream readFloatDef: 6 required: false def: self.fNow];
    self.fBuy = [istream readFloatDef: 7 required: false def: self.fBuy];
    self.fSell = [istream readFloatDef: 8 required: false def: self.fSell];
    self.lVolume = [istream readInt64Def: 9 required: false def: self.lVolume];
    self.lNowVolume = [istream readInt64Def: 10 required: false def: self.lNowVolume];
    self.fAmout = [istream readFloatDef: 11 required: false def: self.fAmout];
    self.lInside = [istream readInt64Def: 12 required: false def: self.lInside];
    self.lOutside = [istream readInt64Def: 13 required: false def: self.lOutside];
    self.fTickdiff = [istream readFloatDef: 14 required: false def: self.fTickdiff];
    self.fVolinstock = [istream readFloatDef: 15 required: false def: self.fVolinstock];
    self.fFhsl = [istream readFloatDef: 16 required: false def: self.fFhsl];
    self.vBuyp = [istream readListDef: 17 required: false def: self.vBuyp VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.vBuyv = [istream readListDef: 18 required: false def: self.vBuyv VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT64 class]]];
    self.vSellp = [istream readListDef: 19 required: false def: self.vSellp VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.vSellv = [istream readListDef: 20 required: false def: self.vSellv VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT64 class]]];
    self.cInoutflag = [istream readInt8Def: 21 required: false def: self.cInoutflag];
    self.lRestvol = [istream readInt64Def: 22 required: false def: self.lRestvol];
    self.iTpFlag = [istream readInt32Def: 23 required: false def: self.iTpFlag];
    self.fSyl = [istream readFloatDef: 24 required: false def: self.fSyl];
    self.iUpnum = [istream readInt32Def: 25 required: false def: self.iUpnum];
    self.iDownnum = [istream readInt32Def: 26 required: false def: self.iDownnum];
    self.fLtg = [istream readFloatDef: 27 required: false def: self.fLtg];
    self.fYclose = [istream readFloatDef: 28 required: false def: self.fYclose];
    self.lYvolinstock = [istream readInt64Def: 29 required: false def: self.lYvolinstock];
    self.fAverageprice = [istream readFloatDef: 30 required: false def: self.fAverageprice];
    self.fTotalmarketvalue = [istream readFloatDef: 31 required: false def: self.fTotalmarketvalue];
    self.fCirculationmarketvalue = [istream readFloatDef: 32 required: false def: self.fCirculationmarketvalue];
    self.iErveyhand = [istream readInt32Def: 33 required: false def: self.iErveyhand];
    self.fDayincrease = [istream readFloatDef: 34 required: false def: self.fDayincrease];
    self.fCointype = [istream readFloatDef: 35 required: false def: self.fCointype];
    self.fHot = [istream readFloatDef: 36 required: false def: self.fHot];
    self.iTime = [istream readInt32Def: 37 required: false def: self.iTime];
    self.eSecStatus = [istream readInt32Def: 38 required: false def: (int32_t)self.eSecStatus];
    self.fFundNetValue = [istream readFloatDef: 39 required: false def: self.fFundNetValue];
    self.fMaxLimit = [istream readFloatDef: 40 required: false def: self.fMaxLimit];
    self.fMinLimit = [istream readFloatDef: 41 required: false def: self.fMinLimit];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"fOpen" value : [BaseJSON writeFloat : self.fOpen]];
    [JsonRoot append:@"fMax" value : [BaseJSON writeFloat : self.fMax]];
    [JsonRoot append:@"fMin" value : [BaseJSON writeFloat : self.fMin]];
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"fBuy" value : [BaseJSON writeFloat : self.fBuy]];
    [JsonRoot append:@"fSell" value : [BaseJSON writeFloat : self.fSell]];
    [JsonRoot append:@"lVolume" value : [BaseJSON writeInt64 : self.lVolume]];
    [JsonRoot append:@"lNowVolume" value : [BaseJSON writeInt64 : self.lNowVolume]];
    [JsonRoot append:@"fAmout" value : [BaseJSON writeFloat : self.fAmout]];
    [JsonRoot append:@"lInside" value : [BaseJSON writeInt64 : self.lInside]];
    [JsonRoot append:@"lOutside" value : [BaseJSON writeInt64 : self.lOutside]];
    [JsonRoot append:@"fTickdiff" value : [BaseJSON writeFloat : self.fTickdiff]];
    [JsonRoot append:@"fVolinstock" value : [BaseJSON writeFloat : self.fVolinstock]];
    [JsonRoot append:@"fFhsl" value : [BaseJSON writeFloat : self.fFhsl]];
    [JsonRoot append:@"vBuyp" value : [BaseJSON writeList : self.vBuyp VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]]];
    [JsonRoot append:@"vBuyv" value : [BaseJSON writeList : self.vBuyv VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT64 class]]]];
    [JsonRoot append:@"vSellp" value : [BaseJSON writeList : self.vSellp VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]]];
    [JsonRoot append:@"vSellv" value : [BaseJSON writeList : self.vSellv VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT64 class]]]];
    [JsonRoot append:@"cInoutflag" value : [BaseJSON writeInt8 : self.cInoutflag]];
    [JsonRoot append:@"lRestvol" value : [BaseJSON writeInt64 : self.lRestvol]];
    [JsonRoot append:@"iTpFlag" value : [BaseJSON writeInt32 : self.iTpFlag]];
    [JsonRoot append:@"fSyl" value : [BaseJSON writeFloat : self.fSyl]];
    [JsonRoot append:@"iUpnum" value : [BaseJSON writeInt32 : self.iUpnum]];
    [JsonRoot append:@"iDownnum" value : [BaseJSON writeInt32 : self.iDownnum]];
    [JsonRoot append:@"fLtg" value : [BaseJSON writeFloat : self.fLtg]];
    [JsonRoot append:@"fYclose" value : [BaseJSON writeFloat : self.fYclose]];
    [JsonRoot append:@"lYvolinstock" value : [BaseJSON writeInt64 : self.lYvolinstock]];
    [JsonRoot append:@"fAverageprice" value : [BaseJSON writeFloat : self.fAverageprice]];
    [JsonRoot append:@"fTotalmarketvalue" value : [BaseJSON writeFloat : self.fTotalmarketvalue]];
    [JsonRoot append:@"fCirculationmarketvalue" value : [BaseJSON writeFloat : self.fCirculationmarketvalue]];
    [JsonRoot append:@"iErveyhand" value : [BaseJSON writeInt32 : self.iErveyhand]];
    [JsonRoot append:@"fDayincrease" value : [BaseJSON writeFloat : self.fDayincrease]];
    [JsonRoot append:@"fCointype" value : [BaseJSON writeFloat : self.fCointype]];
    [JsonRoot append:@"fHot" value : [BaseJSON writeFloat : self.fHot]];
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    [JsonRoot append:@"eSecStatus" value : [BaseJSON writeInt32 : (int32_t)self.eSecStatus]];
    [JsonRoot append:@"fFundNetValue" value : [BaseJSON writeFloat : self.fFundNetValue]];
    [JsonRoot append:@"fMaxLimit" value : [BaseJSON writeFloat : self.fMaxLimit]];
    [JsonRoot append:@"fMinLimit" value : [BaseJSON writeFloat : self.fMinLimit]];
    return JsonRoot;
}

- (SecQuote *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.fOpen = [BaseJSON readFloatDef:[RootMap objectForKey:@"fOpen"] required:false def:self.fOpen];
    self.fMax = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMax"] required:false def:self.fMax];
    self.fMin = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMin"] required:false def:self.fMin];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.fBuy = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuy"] required:false def:self.fBuy];
    self.fSell = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSell"] required:false def:self.fSell];
    self.lVolume = [BaseJSON readInt64Def:[RootMap objectForKey:@"lVolume"] required:false def:self.lVolume];
    self.lNowVolume = [BaseJSON readInt64Def:[RootMap objectForKey:@"lNowVolume"] required:false def:self.lNowVolume];
    self.fAmout = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAmout"] required:false def:self.fAmout];
    self.lInside = [BaseJSON readInt64Def:[RootMap objectForKey:@"lInside"] required:false def:self.lInside];
    self.lOutside = [BaseJSON readInt64Def:[RootMap objectForKey:@"lOutside"] required:false def:self.lOutside];
    self.fTickdiff = [BaseJSON readFloatDef:[RootMap objectForKey:@"fTickdiff"] required:false def:self.fTickdiff];
    self.fVolinstock = [BaseJSON readFloatDef:[RootMap objectForKey:@"fVolinstock"] required:false def:self.fVolinstock];
    self.fFhsl = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFhsl"] required:false def:self.fFhsl];
    self.vBuyp = [BaseJSON readListDef:[RootMap objectForKey:@"vBuyp"] required:false def:self.vBuyp VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.vBuyv = [BaseJSON readListDef:[RootMap objectForKey:@"vBuyv"] required:false def:self.vBuyv VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT64 class]]];
    self.vSellp = [BaseJSON readListDef:[RootMap objectForKey:@"vSellp"] required:false def:self.vSellp VAR_TYPE: [THOTH_LIST CREATE: [THOTH_FLOAT class]]];
    self.vSellv = [BaseJSON readListDef:[RootMap objectForKey:@"vSellv"] required:false def:self.vSellv VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT64 class]]];
    self.cInoutflag = [BaseJSON readInt8Def:[RootMap objectForKey:@"cInoutflag"] required:false def:self.cInoutflag];
    self.lRestvol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lRestvol"] required:false def:self.lRestvol];
    self.iTpFlag = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTpFlag"] required:false def:self.iTpFlag];
    self.fSyl = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSyl"] required:false def:self.fSyl];
    self.iUpnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpnum"] required:false def:self.iUpnum];
    self.iDownnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDownnum"] required:false def:self.iDownnum];
    self.fLtg = [BaseJSON readFloatDef:[RootMap objectForKey:@"fLtg"] required:false def:self.fLtg];
    self.fYclose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fYclose"] required:false def:self.fYclose];
    self.lYvolinstock = [BaseJSON readInt64Def:[RootMap objectForKey:@"lYvolinstock"] required:false def:self.lYvolinstock];
    self.fAverageprice = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAverageprice"] required:false def:self.fAverageprice];
    self.fTotalmarketvalue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fTotalmarketvalue"] required:false def:self.fTotalmarketvalue];
    self.fCirculationmarketvalue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fCirculationmarketvalue"] required:false def:self.fCirculationmarketvalue];
    self.iErveyhand = [BaseJSON readInt32Def:[RootMap objectForKey:@"iErveyhand"] required:false def:self.iErveyhand];
    self.fDayincrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fDayincrease"] required:false def:self.fDayincrease];
    self.fCointype = [BaseJSON readFloatDef:[RootMap objectForKey:@"fCointype"] required:false def:self.fCointype];
    self.fHot = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHot"] required:false def:self.fHot];
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    self.eSecStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecStatus"] required:false def:(int32_t)self.eSecStatus];
    self.fFundNetValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFundNetValue"] required:false def:self.fFundNetValue];
    self.fMaxLimit = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMaxLimit"] required:false def:self.fMaxLimit];
    self.fMinLimit = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMinLimit"] required:false def:self.fMinLimit];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation QuoteRsp
- (id) init
{
    if (self = [super init])
    {
        self.vSecQuote = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSecQuote != nil)
    {
        [ostream writeList: 0 value: self.vSecQuote VAR_TYPE: [THOTH_LIST CREATE: [SecQuote class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QuoteRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSecQuote = [istream readListDef: 0 required: false def: self.vSecQuote VAR_TYPE: [THOTH_LIST CREATE: [SecQuote class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vSecQuote" value : [BaseJSON writeList : self.vSecQuote VAR_TYPE: [THOTH_LIST CREATE: [SecQuote class]]]];
    return JsonRoot;
}

- (QuoteRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vSecQuote = [BaseJSON readListDef:[RootMap objectForKey:@"vSecQuote"] required:false def:self.vSecQuote VAR_TYPE: [THOTH_LIST CREATE: [SecQuote class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SecSimpleQuote
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.fClose = 0;
        self.fNow = 0;
        self.fTotalmarketvalue = 0;
        self.iTpFlag = 0;
        self.fFhsl = 0;
        self.fSyl = 0;
        self.iUpnum = 0;
        self.iDownnum = 0;
        self.fHot = 0;
        self.iTime = 0;
        self.eSecStatus = E_SS_NORMAL;
        self.stSecAttr = [[SecAttr alloc] init];
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
    [ostream writeFloat: 2 value: self.fClose];
    [ostream writeFloat: 3 value: self.fNow];
    [ostream writeFloat: 4 value: self.fTotalmarketvalue];
    [ostream writeInt32: 5 value: self.iTpFlag];
    [ostream writeFloat: 6 value: self.fFhsl];
    [ostream writeFloat: 7 value: self.fSyl];
    [ostream writeInt32: 8 value: self.iUpnum];
    [ostream writeInt32: 9 value: self.iDownnum];
    [ostream writeFloat: 10 value: self.fHot];
    [ostream writeInt32: 11 value: self.iTime];
    [ostream writeInt32: 12 value: (int32_t)self.eSecStatus];
    if (self.stSecAttr != nil)
    {
        [ostream writeMessage: 13 value: self.stSecAttr];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecSimpleQuote *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.fClose = [istream readFloatDef: 2 required: false def: self.fClose];
    self.fNow = [istream readFloatDef: 3 required: false def: self.fNow];
    self.fTotalmarketvalue = [istream readFloatDef: 4 required: false def: self.fTotalmarketvalue];
    self.iTpFlag = [istream readInt32Def: 5 required: false def: self.iTpFlag];
    self.fFhsl = [istream readFloatDef: 6 required: false def: self.fFhsl];
    self.fSyl = [istream readFloatDef: 7 required: false def: self.fSyl];
    self.iUpnum = [istream readInt32Def: 8 required: false def: self.iUpnum];
    self.iDownnum = [istream readInt32Def: 9 required: false def: self.iDownnum];
    self.fHot = [istream readFloatDef: 10 required: false def: self.fHot];
    self.iTime = [istream readInt32Def: 11 required: false def: self.iTime];
    self.eSecStatus = [istream readInt32Def: 12 required: false def: (int32_t)self.eSecStatus];
    self.stSecAttr = (SecAttr*)[istream readMessageDef: 13 required: false def: self.stSecAttr VAR_TYPE: [SecAttr class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"fTotalmarketvalue" value : [BaseJSON writeFloat : self.fTotalmarketvalue]];
    [JsonRoot append:@"iTpFlag" value : [BaseJSON writeInt32 : self.iTpFlag]];
    [JsonRoot append:@"fFhsl" value : [BaseJSON writeFloat : self.fFhsl]];
    [JsonRoot append:@"fSyl" value : [BaseJSON writeFloat : self.fSyl]];
    [JsonRoot append:@"iUpnum" value : [BaseJSON writeInt32 : self.iUpnum]];
    [JsonRoot append:@"iDownnum" value : [BaseJSON writeInt32 : self.iDownnum]];
    [JsonRoot append:@"fHot" value : [BaseJSON writeFloat : self.fHot]];
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    [JsonRoot append:@"eSecStatus" value : [BaseJSON writeInt32 : (int32_t)self.eSecStatus]];
    [JsonRoot append:@"stSecAttr" value : [BaseJSON writeMessage : self.stSecAttr]];
    return JsonRoot;
}

- (SecSimpleQuote *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.fTotalmarketvalue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fTotalmarketvalue"] required:false def:self.fTotalmarketvalue];
    self.iTpFlag = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTpFlag"] required:false def:self.iTpFlag];
    self.fFhsl = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFhsl"] required:false def:self.fFhsl];
    self.fSyl = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSyl"] required:false def:self.fSyl];
    self.iUpnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUpnum"] required:false def:self.iUpnum];
    self.iDownnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDownnum"] required:false def:self.iDownnum];
    self.fHot = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHot"] required:false def:self.fHot];
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    self.eSecStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecStatus"] required:false def:(int32_t)self.eSecStatus];
    self.stSecAttr = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecAttr"] required:false def:self.stSecAttr VAR_TYPE: [SecAttr class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation QuoteSimpleRsp
- (id) init
{
    if (self = [super init])
    {
        self.vSecSimpleQuote = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSecSimpleQuote != nil)
    {
        [ostream writeList: 0 value: self.vSecSimpleQuote VAR_TYPE: [THOTH_LIST CREATE: [SecSimpleQuote class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QuoteSimpleRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSecSimpleQuote = [istream readListDef: 0 required: false def: self.vSecSimpleQuote VAR_TYPE: [THOTH_LIST CREATE: [SecSimpleQuote class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vSecSimpleQuote" value : [BaseJSON writeList : self.vSecSimpleQuote VAR_TYPE: [THOTH_LIST CREATE: [SecSimpleQuote class]]]];
    return JsonRoot;
}

- (QuoteSimpleRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vSecSimpleQuote = [BaseJSON readListDef:[RootMap objectForKey:@"vSecSimpleQuote"] required:false def:self.vSecSimpleQuote VAR_TYPE: [THOTH_LIST CREATE: [SecSimpleQuote class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation QuoteCacheKey
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

- (QuoteCacheKey *) read: (BaseDecodeStream *)istream
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

- (QuoteCacheKey *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation QuoteCacheValue
- (id) init
{
    if (self = [super init])
    {
        self.stSecQuote = [[SecQuote alloc] init];
        self.iFlushTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stSecQuote != nil)
    {
        [ostream writeMessage: 0 value: self.stSecQuote];
    }
    [ostream writeInt32: 1 value: self.iFlushTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QuoteCacheValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stSecQuote = (SecQuote*)[istream readMessageDef: 0 required: false def: self.stSecQuote VAR_TYPE: [SecQuote class]];
    self.iFlushTime = [istream readInt32Def: 1 required: false def: self.iFlushTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stSecQuote" value : [BaseJSON writeMessage : self.stSecQuote]];
    [JsonRoot append:@"iFlushTime" value : [BaseJSON writeInt32 : self.iFlushTime]];
    return JsonRoot;
}

- (QuoteCacheValue *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stSecQuote = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecQuote"] required:false def:self.stSecQuote VAR_TYPE: [SecQuote class]];
    self.iFlushTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFlushTime"] required:false def:self.iFlushTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TrendDesc
- (id) init
{
    if (self = [super init])
    {
        self.iMinute = 0;
        self.fNow = 0;
        self.fAverage = 0;
        self.lNowvol = 0;
        self.lBuyvol = 0;
        self.lSellvol = 0;
        self.fLead = 0;
        self.fAmount = 0;
        self.lTotalvol = 0;
        self.fTotalAmount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iMinute];
    [ostream writeFloat: 1 value: self.fNow];
    [ostream writeFloat: 2 value: self.fAverage];
    [ostream writeInt64: 3 value: self.lNowvol];
    [ostream writeInt64: 4 value: self.lBuyvol];
    [ostream writeInt64: 5 value: self.lSellvol];
    [ostream writeFloat: 6 value: self.fLead];
    [ostream writeFloat: 7 value: self.fAmount];
    [ostream writeInt64: 8 value: self.lTotalvol];
    [ostream writeInt64: 9 value: self.fTotalAmount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TrendDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iMinute = [istream readInt32Def: 0 required: false def: self.iMinute];
    self.fNow = [istream readFloatDef: 1 required: false def: self.fNow];
    self.fAverage = [istream readFloatDef: 2 required: false def: self.fAverage];
    self.lNowvol = [istream readInt64Def: 3 required: false def: self.lNowvol];
    self.lBuyvol = [istream readInt64Def: 4 required: false def: self.lBuyvol];
    self.lSellvol = [istream readInt64Def: 5 required: false def: self.lSellvol];
    self.fLead = [istream readFloatDef: 6 required: false def: self.fLead];
    self.fAmount = [istream readFloatDef: 7 required: false def: self.fAmount];
    self.lTotalvol = [istream readInt64Def: 8 required: false def: self.lTotalvol];
    self.fTotalAmount = [istream readInt64Def: 9 required: false def: self.fTotalAmount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iMinute" value : [BaseJSON writeInt32 : self.iMinute]];
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"fAverage" value : [BaseJSON writeFloat : self.fAverage]];
    [JsonRoot append:@"lNowvol" value : [BaseJSON writeInt64 : self.lNowvol]];
    [JsonRoot append:@"lBuyvol" value : [BaseJSON writeInt64 : self.lBuyvol]];
    [JsonRoot append:@"lSellvol" value : [BaseJSON writeInt64 : self.lSellvol]];
    [JsonRoot append:@"fLead" value : [BaseJSON writeFloat : self.fLead]];
    [JsonRoot append:@"fAmount" value : [BaseJSON writeFloat : self.fAmount]];
    [JsonRoot append:@"lTotalvol" value : [BaseJSON writeInt64 : self.lTotalvol]];
    [JsonRoot append:@"fTotalAmount" value : [BaseJSON writeInt64 : self.fTotalAmount]];
    return JsonRoot;
}

- (TrendDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iMinute = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMinute"] required:false def:self.iMinute];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.fAverage = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAverage"] required:false def:self.fAverage];
    self.lNowvol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lNowvol"] required:false def:self.lNowvol];
    self.lBuyvol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lBuyvol"] required:false def:self.lBuyvol];
    self.lSellvol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lSellvol"] required:false def:self.lSellvol];
    self.fLead = [BaseJSON readFloatDef:[RootMap objectForKey:@"fLead"] required:false def:self.fLead];
    self.fAmount = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAmount"] required:false def:self.fAmount];
    self.lTotalvol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTotalvol"] required:false def:self.lTotalvol];
    self.fTotalAmount = [BaseJSON readInt64Def:[RootMap objectForKey:@"fTotalAmount"] required:false def:self.fTotalAmount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TrendReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.vGuid = [NSData data];
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
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 1 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TrendReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
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
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (TrendReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
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
@implementation TrendRsp
- (id) init
{
    if (self = [super init])
    {
        self.vTrendDesc = [NSMutableArray arrayWithCapacity:0];
        self.bSupport = true;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vTrendDesc != nil)
    {
        [ostream writeList: 0 value: self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    }
    [ostream writeBoolean: 1 value: self.bSupport];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TrendRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTrendDesc = [istream readListDef: 0 required: false def: self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    self.bSupport = [istream readBooleanDef: 1 required: false def: self.bSupport];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vTrendDesc" value : [BaseJSON writeList : self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]]];
    [JsonRoot append:@"bSupport" value : [BaseJSON writeBoolean : self.bSupport]];
    return JsonRoot;
}

- (TrendRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vTrendDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vTrendDesc"] required:false def:self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    self.bSupport = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bSupport"] required:false def:self.bSupport];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TrendCacheKey
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

- (TrendCacheKey *) read: (BaseDecodeStream *)istream
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

- (TrendCacheKey *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation TrendCacheValue
- (id) init
{
    if (self = [super init])
    {
        self.vTrendDesc = [NSMutableArray arrayWithCapacity:0];
        self.iFlushTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vTrendDesc != nil)
    {
        [ostream writeList: 0 value: self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    }
    [ostream writeInt32: 1 value: self.iFlushTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TrendCacheValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTrendDesc = [istream readListDef: 0 required: false def: self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    self.iFlushTime = [istream readInt32Def: 1 required: false def: self.iFlushTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vTrendDesc" value : [BaseJSON writeList : self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]]];
    [JsonRoot append:@"iFlushTime" value : [BaseJSON writeInt32 : self.iFlushTime]];
    return JsonRoot;
}

- (TrendCacheValue *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vTrendDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vTrendDesc"] required:false def:self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    self.iFlushTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFlushTime"] required:false def:self.iFlushTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalFlow
- (id) init
{
    if (self = [super init])
    {
        self.lTime = 0;
        self.fSuperin = 0;
        self.fSuperout = 0;
        self.fBigin = 0;
        self.fBigout = 0;
        self.fMidin = 0;
        self.fMidout = 0;
        self.fSmallin = 0;
        self.fSmallout = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt64: 0 value: self.lTime];
    [ostream writeFloat: 1 value: self.fSuperin];
    [ostream writeFloat: 2 value: self.fSuperout];
    [ostream writeFloat: 3 value: self.fBigin];
    [ostream writeFloat: 4 value: self.fBigout];
    [ostream writeFloat: 5 value: self.fMidin];
    [ostream writeFloat: 6 value: self.fMidout];
    [ostream writeFloat: 7 value: self.fSmallin];
    [ostream writeFloat: 8 value: self.fSmallout];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalFlow *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.lTime = [istream readInt64Def: 0 required: false def: self.lTime];
    self.fSuperin = [istream readFloatDef: 1 required: false def: self.fSuperin];
    self.fSuperout = [istream readFloatDef: 2 required: false def: self.fSuperout];
    self.fBigin = [istream readFloatDef: 3 required: false def: self.fBigin];
    self.fBigout = [istream readFloatDef: 4 required: false def: self.fBigout];
    self.fMidin = [istream readFloatDef: 5 required: false def: self.fMidin];
    self.fMidout = [istream readFloatDef: 6 required: false def: self.fMidout];
    self.fSmallin = [istream readFloatDef: 7 required: false def: self.fSmallin];
    self.fSmallout = [istream readFloatDef: 8 required: false def: self.fSmallout];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"lTime" value : [BaseJSON writeInt64 : self.lTime]];
    [JsonRoot append:@"fSuperin" value : [BaseJSON writeFloat : self.fSuperin]];
    [JsonRoot append:@"fSuperout" value : [BaseJSON writeFloat : self.fSuperout]];
    [JsonRoot append:@"fBigin" value : [BaseJSON writeFloat : self.fBigin]];
    [JsonRoot append:@"fBigout" value : [BaseJSON writeFloat : self.fBigout]];
    [JsonRoot append:@"fMidin" value : [BaseJSON writeFloat : self.fMidin]];
    [JsonRoot append:@"fMidout" value : [BaseJSON writeFloat : self.fMidout]];
    [JsonRoot append:@"fSmallin" value : [BaseJSON writeFloat : self.fSmallin]];
    [JsonRoot append:@"fSmallout" value : [BaseJSON writeFloat : self.fSmallout]];
    return JsonRoot;
}

- (CapitalFlow *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.lTime = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTime"] required:false def:self.lTime];
    self.fSuperin = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSuperin"] required:false def:self.fSuperin];
    self.fSuperout = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSuperout"] required:false def:self.fSuperout];
    self.fBigin = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBigin"] required:false def:self.fBigin];
    self.fBigout = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBigout"] required:false def:self.fBigout];
    self.fMidin = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMidin"] required:false def:self.fMidin];
    self.fMidout = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMidout"] required:false def:self.fMidout];
    self.fSmallin = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSmallin"] required:false def:self.fSmallin];
    self.fSmallout = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSmallout"] required:false def:self.fSmallout];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalFlowReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iPeriod = 0;
        self.iStartxh = 0;
        self.iNum = 0;
        self.vGuid = [NSData data];
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
    [ostream writeInt32: 1 value: self.iPeriod];
    [ostream writeInt32: 2 value: self.iStartxh];
    [ostream writeInt32: 3 value: self.iNum];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 4 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalFlowReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iPeriod = [istream readInt32Def: 1 required: false def: self.iPeriod];
    self.iStartxh = [istream readInt32Def: 2 required: false def: self.iStartxh];
    self.iNum = [istream readInt32Def: 3 required: false def: self.iNum];
    self.vGuid = [istream readBytesDef: 4 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iPeriod" value : [BaseJSON writeInt32 : self.iPeriod]];
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iNum" value : [BaseJSON writeInt32 : self.iNum]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (CapitalFlowReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iPeriod = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPeriod"] required:false def:self.iPeriod];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNum"] required:false def:self.iNum];
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
@implementation CapitalFlowRsp
- (id) init
{
    if (self = [super init])
    {
        self.vCapitalFlow = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vCapitalFlow != nil)
    {
        [ostream writeList: 0 value: self.vCapitalFlow VAR_TYPE: [THOTH_LIST CREATE: [CapitalFlow class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalFlowRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vCapitalFlow = [istream readListDef: 0 required: false def: self.vCapitalFlow VAR_TYPE: [THOTH_LIST CREATE: [CapitalFlow class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vCapitalFlow" value : [BaseJSON writeList : self.vCapitalFlow VAR_TYPE: [THOTH_LIST CREATE: [CapitalFlow class]]]];
    return JsonRoot;
}

- (CapitalFlowRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vCapitalFlow = [BaseJSON readListDef:[RootMap objectForKey:@"vCapitalFlow"] required:false def:self.vCapitalFlow VAR_TYPE: [THOTH_LIST CREATE: [CapitalFlow class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation KLineDesc
- (id) init
{
    if (self = [super init])
    {
        self.lYmd = 0;
        self.lMinute = 0;
        self.fOpen = 0;
        self.fHigh = 0;
        self.fLow = 0;
        self.fClose = 0;
        self.lAmout = 0;
        self.lVolume = 0;
        self.lUp = 0;
        self.lDown = 0;
        self.fZjs = 0;
        self.lTotalvol = 0;
        self.fTotalAmount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt64: 0 value: self.lYmd];
    [ostream writeInt64: 1 value: self.lMinute];
    [ostream writeFloat: 2 value: self.fOpen];
    [ostream writeFloat: 3 value: self.fHigh];
    [ostream writeFloat: 4 value: self.fLow];
    [ostream writeFloat: 5 value: self.fClose];
    [ostream writeInt64: 6 value: self.lAmout];
    [ostream writeInt64: 7 value: self.lVolume];
    [ostream writeInt64: 8 value: self.lUp];
    [ostream writeInt64: 9 value: self.lDown];
    [ostream writeFloat: 10 value: self.fZjs];
    [ostream writeInt64: 11 value: self.lTotalvol];
    [ostream writeInt64: 12 value: self.fTotalAmount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (KLineDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.lYmd = [istream readInt64Def: 0 required: false def: self.lYmd];
    self.lMinute = [istream readInt64Def: 1 required: false def: self.lMinute];
    self.fOpen = [istream readFloatDef: 2 required: false def: self.fOpen];
    self.fHigh = [istream readFloatDef: 3 required: false def: self.fHigh];
    self.fLow = [istream readFloatDef: 4 required: false def: self.fLow];
    self.fClose = [istream readFloatDef: 5 required: false def: self.fClose];
    self.lAmout = [istream readInt64Def: 6 required: false def: self.lAmout];
    self.lVolume = [istream readInt64Def: 7 required: false def: self.lVolume];
    self.lUp = [istream readInt64Def: 8 required: false def: self.lUp];
    self.lDown = [istream readInt64Def: 9 required: false def: self.lDown];
    self.fZjs = [istream readFloatDef: 10 required: false def: self.fZjs];
    self.lTotalvol = [istream readInt64Def: 11 required: false def: self.lTotalvol];
    self.fTotalAmount = [istream readInt64Def: 12 required: false def: self.fTotalAmount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"lYmd" value : [BaseJSON writeInt64 : self.lYmd]];
    [JsonRoot append:@"lMinute" value : [BaseJSON writeInt64 : self.lMinute]];
    [JsonRoot append:@"fOpen" value : [BaseJSON writeFloat : self.fOpen]];
    [JsonRoot append:@"fHigh" value : [BaseJSON writeFloat : self.fHigh]];
    [JsonRoot append:@"fLow" value : [BaseJSON writeFloat : self.fLow]];
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"lAmout" value : [BaseJSON writeInt64 : self.lAmout]];
    [JsonRoot append:@"lVolume" value : [BaseJSON writeInt64 : self.lVolume]];
    [JsonRoot append:@"lUp" value : [BaseJSON writeInt64 : self.lUp]];
    [JsonRoot append:@"lDown" value : [BaseJSON writeInt64 : self.lDown]];
    [JsonRoot append:@"fZjs" value : [BaseJSON writeFloat : self.fZjs]];
    [JsonRoot append:@"lTotalvol" value : [BaseJSON writeInt64 : self.lTotalvol]];
    [JsonRoot append:@"fTotalAmount" value : [BaseJSON writeInt64 : self.fTotalAmount]];
    return JsonRoot;
}

- (KLineDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.lYmd = [BaseJSON readInt64Def:[RootMap objectForKey:@"lYmd"] required:false def:self.lYmd];
    self.lMinute = [BaseJSON readInt64Def:[RootMap objectForKey:@"lMinute"] required:false def:self.lMinute];
    self.fOpen = [BaseJSON readFloatDef:[RootMap objectForKey:@"fOpen"] required:false def:self.fOpen];
    self.fHigh = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHigh"] required:false def:self.fHigh];
    self.fLow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fLow"] required:false def:self.fLow];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.lAmout = [BaseJSON readInt64Def:[RootMap objectForKey:@"lAmout"] required:false def:self.lAmout];
    self.lVolume = [BaseJSON readInt64Def:[RootMap objectForKey:@"lVolume"] required:false def:self.lVolume];
    self.lUp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lUp"] required:false def:self.lUp];
    self.lDown = [BaseJSON readInt64Def:[RootMap objectForKey:@"lDown"] required:false def:self.lDown];
    self.fZjs = [BaseJSON readFloatDef:[RootMap objectForKey:@"fZjs"] required:false def:self.fZjs];
    self.lTotalvol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTotalvol"] required:false def:self.lTotalvol];
    self.fTotalAmount = [BaseJSON readInt64Def:[RootMap objectForKey:@"fTotalAmount"] required:false def:self.fTotalAmount];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation KLineReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eKLineType = E_KLT_5_MIN;
        self.iMulnum = 0;
        self.iStartxh = 0;
        self.iWantnum = 0;
        self.bTg = true;
        self.vGuid = [NSData data];
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
    [ostream writeInt32: 2 value: self.iMulnum];
    [ostream writeInt32: 3 value: self.iStartxh];
    [ostream writeInt32: 4 value: self.iWantnum];
    [ostream writeBoolean: 5 value: self.bTg];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 6 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (KLineReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eKLineType = [istream readInt32Def: 1 required: false def: (int32_t)self.eKLineType];
    self.iMulnum = [istream readInt32Def: 2 required: false def: self.iMulnum];
    self.iStartxh = [istream readInt32Def: 3 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 4 required: false def: self.iWantnum];
    self.bTg = [istream readBooleanDef: 5 required: false def: self.bTg];
    self.vGuid = [istream readBytesDef: 6 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iMulnum" value : [BaseJSON writeInt32 : self.iMulnum]];
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    [JsonRoot append:@"bTg" value : [BaseJSON writeBoolean : self.bTg]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (KLineReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eKLineType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eKLineType"] required:false def:(int32_t)self.eKLineType];
    self.iMulnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMulnum"] required:false def:self.iMulnum];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
    self.bTg = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bTg"] required:false def:self.bTg];
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
@implementation KLineRsp
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
    [ostream writeInt32: 2 value: (int32_t)self.eKLineType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (KLineRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vKLineDesc = [istream readListDef: 0 required: false def: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.eKLineType = [istream readInt32Def: 2 required: false def: (int32_t)self.eKLineType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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

- (KLineRsp *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation PlateQuoteDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.fClose = 0;
        self.fNow = 0;
        self.lVolume = 0;
        self.fAmout = 0;
        self.fFhsl = 0;
        self.sHeadName = @"";
        self.fHeadNow = 0;
        self.fHeadClose = 0;
        self.fYclose = 0;
        self.iTpFlag = 0;
        self.stSecAttr = [[SecAttr alloc] init];
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
    [ostream writeFloat: 2 value: self.fClose];
    [ostream writeFloat: 3 value: self.fNow];
    [ostream writeInt64: 4 value: self.lVolume];
    [ostream writeFloat: 5 value: self.fAmout];
    [ostream writeFloat: 6 value: self.fFhsl];
    if (self.sHeadName != nil)
    {
        [ostream writeString: 7 value: self.sHeadName];
    }
    [ostream writeFloat: 8 value: self.fHeadNow];
    [ostream writeFloat: 9 value: self.fHeadClose];
    [ostream writeFloat: 10 value: self.fYclose];
    [ostream writeInt32: 11 value: self.iTpFlag];
    if (self.stSecAttr != nil)
    {
        [ostream writeMessage: 12 value: self.stSecAttr];
    }
    [ostream writeInt32: 13 value: (int32_t)self.eSecStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateQuoteDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.fClose = [istream readFloatDef: 2 required: false def: self.fClose];
    self.fNow = [istream readFloatDef: 3 required: false def: self.fNow];
    self.lVolume = [istream readInt64Def: 4 required: false def: self.lVolume];
    self.fAmout = [istream readFloatDef: 5 required: false def: self.fAmout];
    self.fFhsl = [istream readFloatDef: 6 required: false def: self.fFhsl];
    self.sHeadName = [istream readStringDef: 7 required: false def: self.sHeadName];
    self.fHeadNow = [istream readFloatDef: 8 required: false def: self.fHeadNow];
    self.fHeadClose = [istream readFloatDef: 9 required: false def: self.fHeadClose];
    self.fYclose = [istream readFloatDef: 10 required: false def: self.fYclose];
    self.iTpFlag = [istream readInt32Def: 11 required: false def: self.iTpFlag];
    self.stSecAttr = (SecAttr*)[istream readMessageDef: 12 required: false def: self.stSecAttr VAR_TYPE: [SecAttr class]];
    self.eSecStatus = [istream readInt32Def: 13 required: false def: (int32_t)self.eSecStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"lVolume" value : [BaseJSON writeInt64 : self.lVolume]];
    [JsonRoot append:@"fAmout" value : [BaseJSON writeFloat : self.fAmout]];
    [JsonRoot append:@"fFhsl" value : [BaseJSON writeFloat : self.fFhsl]];
    [JsonRoot append:@"sHeadName" value : [BaseJSON writeString : self.sHeadName]];
    [JsonRoot append:@"fHeadNow" value : [BaseJSON writeFloat : self.fHeadNow]];
    [JsonRoot append:@"fHeadClose" value : [BaseJSON writeFloat : self.fHeadClose]];
    [JsonRoot append:@"fYclose" value : [BaseJSON writeFloat : self.fYclose]];
    [JsonRoot append:@"iTpFlag" value : [BaseJSON writeInt32 : self.iTpFlag]];
    [JsonRoot append:@"stSecAttr" value : [BaseJSON writeMessage : self.stSecAttr]];
    [JsonRoot append:@"eSecStatus" value : [BaseJSON writeInt32 : (int32_t)self.eSecStatus]];
    return JsonRoot;
}

- (PlateQuoteDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.lVolume = [BaseJSON readInt64Def:[RootMap objectForKey:@"lVolume"] required:false def:self.lVolume];
    self.fAmout = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAmout"] required:false def:self.fAmout];
    self.fFhsl = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFhsl"] required:false def:self.fFhsl];
    self.sHeadName = [BaseJSON readStringDef:[RootMap objectForKey:@"sHeadName"] required:false def:self.sHeadName];
    self.fHeadNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHeadNow"] required:false def:self.fHeadNow];
    self.fHeadClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHeadClose"] required:false def:self.fHeadClose];
    self.fYclose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fYclose"] required:false def:self.fYclose];
    self.iTpFlag = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTpFlag"] required:false def:self.iTpFlag];
    self.stSecAttr = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecAttr"] required:false def:self.stSecAttr VAR_TYPE: [SecAttr class]];
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
@implementation PlateQuoteReq
- (id) init
{
    if (self = [super init])
    {
        self.ePlateQuoteReqType = E_PQT_PLATE;
        self.iColype = 0;
        self.iStartxh = 0;
        self.iWantnum = 0;
        self.ePlateQuoteSortType = E_PQT_INCEREASE;
        self.eMarketType = E_MT_NO;
        self.vGuid = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.ePlateQuoteReqType];
    [ostream writeInt32: 1 value: self.iColype];
    [ostream writeInt32: 2 value: self.iStartxh];
    [ostream writeInt32: 3 value: self.iWantnum];
    [ostream writeInt32: 4 value: (int32_t)self.ePlateQuoteSortType];
    [ostream writeInt32: 5 value: (int32_t)self.eMarketType];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 6 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateQuoteReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.ePlateQuoteReqType = [istream readInt32Def: 0 required: false def: (int32_t)self.ePlateQuoteReqType];
    self.iColype = [istream readInt32Def: 1 required: false def: self.iColype];
    self.iStartxh = [istream readInt32Def: 2 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 3 required: false def: self.iWantnum];
    self.ePlateQuoteSortType = [istream readInt32Def: 4 required: false def: (int32_t)self.ePlateQuoteSortType];
    self.eMarketType = [istream readInt32Def: 5 required: false def: (int32_t)self.eMarketType];
    self.vGuid = [istream readBytesDef: 6 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"ePlateQuoteReqType" value : [BaseJSON writeInt32 : (int32_t)self.ePlateQuoteReqType]];
    [JsonRoot append:@"iColype" value : [BaseJSON writeInt32 : self.iColype]];
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    [JsonRoot append:@"ePlateQuoteSortType" value : [BaseJSON writeInt32 : (int32_t)self.ePlateQuoteSortType]];
    [JsonRoot append:@"eMarketType" value : [BaseJSON writeInt32 : (int32_t)self.eMarketType]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (PlateQuoteReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.ePlateQuoteReqType = [BaseJSON readInt32Def:[RootMap objectForKey:@"ePlateQuoteReqType"] required:false def:(int32_t)self.ePlateQuoteReqType];
    self.iColype = [BaseJSON readInt32Def:[RootMap objectForKey:@"iColype"] required:false def:self.iColype];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
    self.ePlateQuoteSortType = [BaseJSON readInt32Def:[RootMap objectForKey:@"ePlateQuoteSortType"] required:false def:(int32_t)self.ePlateQuoteSortType];
    self.eMarketType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eMarketType"] required:false def:(int32_t)self.eMarketType];
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
@implementation PlateQuoteRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPlateQuoteDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPlateQuoteDesc != nil)
    {
        [ostream writeList: 0 value: self.vPlateQuoteDesc VAR_TYPE: [THOTH_LIST CREATE: [PlateQuoteDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateQuoteRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPlateQuoteDesc = [istream readListDef: 0 required: false def: self.vPlateQuoteDesc VAR_TYPE: [THOTH_LIST CREATE: [PlateQuoteDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vPlateQuoteDesc" value : [BaseJSON writeList : self.vPlateQuoteDesc VAR_TYPE: [THOTH_LIST CREATE: [PlateQuoteDesc class]]]];
    return JsonRoot;
}

- (PlateQuoteRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vPlateQuoteDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vPlateQuoteDesc"] required:false def:self.vPlateQuoteDesc VAR_TYPE: [THOTH_LIST CREATE: [PlateQuoteDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConcQuoteDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sConcName = @"";
        self.fClose = 0;
        self.fOpen = 0;
        self.fMax = 0;
        self.fMin = 0;
        self.fNow = 0;
        self.lNowVolume = 0;
        self.fAmout = 0;
        self.fHot = 0;
        self.sHeadName = @"";
        self.fHeadNow = 0;
        self.fHeadClose = 0;
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
    if (self.sConcName != nil)
    {
        [ostream writeString: 1 value: self.sConcName];
    }
    [ostream writeFloat: 2 value: self.fClose];
    [ostream writeFloat: 3 value: self.fOpen];
    [ostream writeFloat: 4 value: self.fMax];
    [ostream writeFloat: 5 value: self.fMin];
    [ostream writeFloat: 6 value: self.fNow];
    [ostream writeInt64: 7 value: self.lNowVolume];
    [ostream writeFloat: 8 value: self.fAmout];
    [ostream writeFloat: 9 value: self.fHot];
    if (self.sHeadName != nil)
    {
        [ostream writeString: 10 value: self.sHeadName];
    }
    [ostream writeFloat: 11 value: self.fHeadNow];
    [ostream writeFloat: 12 value: self.fHeadClose];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcQuoteDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sConcName = [istream readStringDef: 1 required: false def: self.sConcName];
    self.fClose = [istream readFloatDef: 2 required: false def: self.fClose];
    self.fOpen = [istream readFloatDef: 3 required: false def: self.fOpen];
    self.fMax = [istream readFloatDef: 4 required: false def: self.fMax];
    self.fMin = [istream readFloatDef: 5 required: false def: self.fMin];
    self.fNow = [istream readFloatDef: 6 required: false def: self.fNow];
    self.lNowVolume = [istream readInt64Def: 7 required: false def: self.lNowVolume];
    self.fAmout = [istream readFloatDef: 8 required: false def: self.fAmout];
    self.fHot = [istream readFloatDef: 9 required: false def: self.fHot];
    self.sHeadName = [istream readStringDef: 10 required: false def: self.sHeadName];
    self.fHeadNow = [istream readFloatDef: 11 required: false def: self.fHeadNow];
    self.fHeadClose = [istream readFloatDef: 12 required: false def: self.fHeadClose];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sConcName" value : [BaseJSON writeString : self.sConcName]];
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"fOpen" value : [BaseJSON writeFloat : self.fOpen]];
    [JsonRoot append:@"fMax" value : [BaseJSON writeFloat : self.fMax]];
    [JsonRoot append:@"fMin" value : [BaseJSON writeFloat : self.fMin]];
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"lNowVolume" value : [BaseJSON writeInt64 : self.lNowVolume]];
    [JsonRoot append:@"fAmout" value : [BaseJSON writeFloat : self.fAmout]];
    [JsonRoot append:@"fHot" value : [BaseJSON writeFloat : self.fHot]];
    [JsonRoot append:@"sHeadName" value : [BaseJSON writeString : self.sHeadName]];
    [JsonRoot append:@"fHeadNow" value : [BaseJSON writeFloat : self.fHeadNow]];
    [JsonRoot append:@"fHeadClose" value : [BaseJSON writeFloat : self.fHeadClose]];
    return JsonRoot;
}

- (ConcQuoteDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sConcName = [BaseJSON readStringDef:[RootMap objectForKey:@"sConcName"] required:false def:self.sConcName];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.fOpen = [BaseJSON readFloatDef:[RootMap objectForKey:@"fOpen"] required:false def:self.fOpen];
    self.fMax = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMax"] required:false def:self.fMax];
    self.fMin = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMin"] required:false def:self.fMin];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.lNowVolume = [BaseJSON readInt64Def:[RootMap objectForKey:@"lNowVolume"] required:false def:self.lNowVolume];
    self.fAmout = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAmout"] required:false def:self.fAmout];
    self.fHot = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHot"] required:false def:self.fHot];
    self.sHeadName = [BaseJSON readStringDef:[RootMap objectForKey:@"sHeadName"] required:false def:self.sHeadName];
    self.fHeadNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHeadNow"] required:false def:self.fHeadNow];
    self.fHeadClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHeadClose"] required:false def:self.fHeadClose];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConcQuoteReq
- (id) init
{
    if (self = [super init])
    {
        self.iStartxh = 0;
        self.iWantnum = 0;
        self.vGuid = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStartxh];
    [ostream writeInt32: 1 value: self.iWantnum];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 2 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcQuoteReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStartxh = [istream readInt32Def: 0 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 1 required: false def: self.iWantnum];
    self.vGuid = [istream readBytesDef: 2 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (ConcQuoteReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
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
@implementation ConcQuoteRsp
- (id) init
{
    if (self = [super init])
    {
        self.vConcQuoteDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vConcQuoteDesc != nil)
    {
        [ostream writeList: 0 value: self.vConcQuoteDesc VAR_TYPE: [THOTH_LIST CREATE: [ConcQuoteDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcQuoteRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vConcQuoteDesc = [istream readListDef: 0 required: false def: self.vConcQuoteDesc VAR_TYPE: [THOTH_LIST CREATE: [ConcQuoteDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vConcQuoteDesc" value : [BaseJSON writeList : self.vConcQuoteDesc VAR_TYPE: [THOTH_LIST CREATE: [ConcQuoteDesc class]]]];
    return JsonRoot;
}

- (ConcQuoteRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vConcQuoteDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vConcQuoteDesc"] required:false def:self.vConcQuoteDesc VAR_TYPE: [THOTH_LIST CREATE: [ConcQuoteDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalDetailDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.fNow = 0;
        self.fChangeRate = 0;
        self.fChangeValue = 0;
        self.fZljlr = 0;
        self.fZljzb = 0;
        self.fShjlr = 0;
        self.fShjzb = 0;
        self.fCddjlr = 0;
        self.fCddjzb = 0;
        self.fDdjlr = 0;
        self.fDdjzb = 0;
        self.fZdjlr = 0;
        self.fZdjzb = 0;
        self.fXdjlr = 0;
        self.fXdjzb = 0;
        self.eSecStatus = E_SS_NORMAL;
        self.stSecAttr = [[SecAttr alloc] init];
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
    [ostream writeFloat: 2 value: self.fNow];
    [ostream writeFloat: 3 value: self.fChangeRate];
    [ostream writeFloat: 4 value: self.fChangeValue];
    [ostream writeFloat: 5 value: self.fZljlr];
    [ostream writeFloat: 6 value: self.fZljzb];
    [ostream writeFloat: 7 value: self.fShjlr];
    [ostream writeFloat: 8 value: self.fShjzb];
    [ostream writeFloat: 9 value: self.fCddjlr];
    [ostream writeFloat: 10 value: self.fCddjzb];
    [ostream writeFloat: 11 value: self.fDdjlr];
    [ostream writeFloat: 12 value: self.fDdjzb];
    [ostream writeFloat: 13 value: self.fZdjlr];
    [ostream writeFloat: 14 value: self.fZdjzb];
    [ostream writeFloat: 15 value: self.fXdjlr];
    [ostream writeFloat: 16 value: self.fXdjzb];
    [ostream writeInt32: 17 value: (int32_t)self.eSecStatus];
    if (self.stSecAttr != nil)
    {
        [ostream writeMessage: 18 value: self.stSecAttr];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalDetailDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.fNow = [istream readFloatDef: 2 required: false def: self.fNow];
    self.fChangeRate = [istream readFloatDef: 3 required: false def: self.fChangeRate];
    self.fChangeValue = [istream readFloatDef: 4 required: false def: self.fChangeValue];
    self.fZljlr = [istream readFloatDef: 5 required: false def: self.fZljlr];
    self.fZljzb = [istream readFloatDef: 6 required: false def: self.fZljzb];
    self.fShjlr = [istream readFloatDef: 7 required: false def: self.fShjlr];
    self.fShjzb = [istream readFloatDef: 8 required: false def: self.fShjzb];
    self.fCddjlr = [istream readFloatDef: 9 required: false def: self.fCddjlr];
    self.fCddjzb = [istream readFloatDef: 10 required: false def: self.fCddjzb];
    self.fDdjlr = [istream readFloatDef: 11 required: false def: self.fDdjlr];
    self.fDdjzb = [istream readFloatDef: 12 required: false def: self.fDdjzb];
    self.fZdjlr = [istream readFloatDef: 13 required: false def: self.fZdjlr];
    self.fZdjzb = [istream readFloatDef: 14 required: false def: self.fZdjzb];
    self.fXdjlr = [istream readFloatDef: 15 required: false def: self.fXdjlr];
    self.fXdjzb = [istream readFloatDef: 16 required: false def: self.fXdjzb];
    self.eSecStatus = [istream readInt32Def: 17 required: false def: (int32_t)self.eSecStatus];
    self.stSecAttr = (SecAttr*)[istream readMessageDef: 18 required: false def: self.stSecAttr VAR_TYPE: [SecAttr class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"fChangeRate" value : [BaseJSON writeFloat : self.fChangeRate]];
    [JsonRoot append:@"fChangeValue" value : [BaseJSON writeFloat : self.fChangeValue]];
    [JsonRoot append:@"fZljlr" value : [BaseJSON writeFloat : self.fZljlr]];
    [JsonRoot append:@"fZljzb" value : [BaseJSON writeFloat : self.fZljzb]];
    [JsonRoot append:@"fShjlr" value : [BaseJSON writeFloat : self.fShjlr]];
    [JsonRoot append:@"fShjzb" value : [BaseJSON writeFloat : self.fShjzb]];
    [JsonRoot append:@"fCddjlr" value : [BaseJSON writeFloat : self.fCddjlr]];
    [JsonRoot append:@"fCddjzb" value : [BaseJSON writeFloat : self.fCddjzb]];
    [JsonRoot append:@"fDdjlr" value : [BaseJSON writeFloat : self.fDdjlr]];
    [JsonRoot append:@"fDdjzb" value : [BaseJSON writeFloat : self.fDdjzb]];
    [JsonRoot append:@"fZdjlr" value : [BaseJSON writeFloat : self.fZdjlr]];
    [JsonRoot append:@"fZdjzb" value : [BaseJSON writeFloat : self.fZdjzb]];
    [JsonRoot append:@"fXdjlr" value : [BaseJSON writeFloat : self.fXdjlr]];
    [JsonRoot append:@"fXdjzb" value : [BaseJSON writeFloat : self.fXdjzb]];
    [JsonRoot append:@"eSecStatus" value : [BaseJSON writeInt32 : (int32_t)self.eSecStatus]];
    [JsonRoot append:@"stSecAttr" value : [BaseJSON writeMessage : self.stSecAttr]];
    return JsonRoot;
}

- (CapitalDetailDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.fChangeRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fChangeRate"] required:false def:self.fChangeRate];
    self.fChangeValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fChangeValue"] required:false def:self.fChangeValue];
    self.fZljlr = [BaseJSON readFloatDef:[RootMap objectForKey:@"fZljlr"] required:false def:self.fZljlr];
    self.fZljzb = [BaseJSON readFloatDef:[RootMap objectForKey:@"fZljzb"] required:false def:self.fZljzb];
    self.fShjlr = [BaseJSON readFloatDef:[RootMap objectForKey:@"fShjlr"] required:false def:self.fShjlr];
    self.fShjzb = [BaseJSON readFloatDef:[RootMap objectForKey:@"fShjzb"] required:false def:self.fShjzb];
    self.fCddjlr = [BaseJSON readFloatDef:[RootMap objectForKey:@"fCddjlr"] required:false def:self.fCddjlr];
    self.fCddjzb = [BaseJSON readFloatDef:[RootMap objectForKey:@"fCddjzb"] required:false def:self.fCddjzb];
    self.fDdjlr = [BaseJSON readFloatDef:[RootMap objectForKey:@"fDdjlr"] required:false def:self.fDdjlr];
    self.fDdjzb = [BaseJSON readFloatDef:[RootMap objectForKey:@"fDdjzb"] required:false def:self.fDdjzb];
    self.fZdjlr = [BaseJSON readFloatDef:[RootMap objectForKey:@"fZdjlr"] required:false def:self.fZdjlr];
    self.fZdjzb = [BaseJSON readFloatDef:[RootMap objectForKey:@"fZdjzb"] required:false def:self.fZdjzb];
    self.fXdjlr = [BaseJSON readFloatDef:[RootMap objectForKey:@"fXdjlr"] required:false def:self.fXdjlr];
    self.fXdjzb = [BaseJSON readFloatDef:[RootMap objectForKey:@"fXdjzb"] required:false def:self.fXdjzb];
    self.eSecStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecStatus"] required:false def:(int32_t)self.eSecStatus];
    self.stSecAttr = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecAttr"] required:false def:self.stSecAttr VAR_TYPE: [SecAttr class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.eSetType = E_CDST_STOCK;
        self.iColype = 0;
        self.iStartxh = 0;
        self.iNum = 0;
        self.eSortType = E_CDST_INCEREASE;
        self.eDataType = E_CDDT_1_DAY;
        self.vGuid = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eSetType];
    [ostream writeInt32: 1 value: self.iColype];
    [ostream writeInt32: 2 value: self.iStartxh];
    [ostream writeInt32: 3 value: self.iNum];
    [ostream writeInt32: 4 value: (int32_t)self.eSortType];
    [ostream writeInt32: 5 value: (int32_t)self.eDataType];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 6 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eSetType = [istream readInt32Def: 0 required: false def: (int32_t)self.eSetType];
    self.iColype = [istream readInt32Def: 1 required: false def: self.iColype];
    self.iStartxh = [istream readInt32Def: 2 required: false def: self.iStartxh];
    self.iNum = [istream readInt32Def: 3 required: false def: self.iNum];
    self.eSortType = [istream readInt32Def: 4 required: false def: (int32_t)self.eSortType];
    self.eDataType = [istream readInt32Def: 5 required: false def: (int32_t)self.eDataType];
    self.vGuid = [istream readBytesDef: 6 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"eSetType" value : [BaseJSON writeInt32 : (int32_t)self.eSetType]];
    [JsonRoot append:@"iColype" value : [BaseJSON writeInt32 : self.iColype]];
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iNum" value : [BaseJSON writeInt32 : self.iNum]];
    [JsonRoot append:@"eSortType" value : [BaseJSON writeInt32 : (int32_t)self.eSortType]];
    [JsonRoot append:@"eDataType" value : [BaseJSON writeInt32 : (int32_t)self.eDataType]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (CapitalDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eSetType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSetType"] required:false def:(int32_t)self.eSetType];
    self.iColype = [BaseJSON readInt32Def:[RootMap objectForKey:@"iColype"] required:false def:self.iColype];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNum"] required:false def:self.iNum];
    self.eSortType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSortType"] required:false def:(int32_t)self.eSortType];
    self.eDataType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eDataType"] required:false def:(int32_t)self.eDataType];
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
@implementation CapitalDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.vCapitalDetailDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vCapitalDetailDesc != nil)
    {
        [ostream writeList: 0 value: self.vCapitalDetailDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalDetailDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vCapitalDetailDesc = [istream readListDef: 0 required: false def: self.vCapitalDetailDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalDetailDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vCapitalDetailDesc" value : [BaseJSON writeList : self.vCapitalDetailDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalDetailDesc class]]]];
    return JsonRoot;
}

- (CapitalDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vCapitalDetailDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vCapitalDetailDesc"] required:false def:self.vCapitalDetailDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalDetailDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TickDesc
- (id) init
{
    if (self = [super init])
    {
        self.iMinute = 0;
        self.fNow = 0;
        self.lNowVolume = 0;
        self.iInOut = 0;
        self.iTradeIndex = 0;
        self.iTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iMinute];
    [ostream writeFloat: 1 value: self.fNow];
    [ostream writeInt64: 2 value: self.lNowVolume];
    [ostream writeInt32: 3 value: self.iInOut];
    [ostream writeInt32: 4 value: self.iTradeIndex];
    [ostream writeInt32: 5 value: self.iTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TickDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iMinute = [istream readInt32Def: 0 required: false def: self.iMinute];
    self.fNow = [istream readFloatDef: 1 required: false def: self.fNow];
    self.lNowVolume = [istream readInt64Def: 2 required: false def: self.lNowVolume];
    self.iInOut = [istream readInt32Def: 3 required: false def: self.iInOut];
    self.iTradeIndex = [istream readInt32Def: 4 required: false def: self.iTradeIndex];
    self.iTime = [istream readInt32Def: 5 required: false def: self.iTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iMinute" value : [BaseJSON writeInt32 : self.iMinute]];
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"lNowVolume" value : [BaseJSON writeInt64 : self.lNowVolume]];
    [JsonRoot append:@"iInOut" value : [BaseJSON writeInt32 : self.iInOut]];
    [JsonRoot append:@"iTradeIndex" value : [BaseJSON writeInt32 : self.iTradeIndex]];
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    return JsonRoot;
}

- (TickDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iMinute = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMinute"] required:false def:self.iMinute];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.lNowVolume = [BaseJSON readInt64Def:[RootMap objectForKey:@"lNowVolume"] required:false def:self.lNowVolume];
    self.iInOut = [BaseJSON readInt32Def:[RootMap objectForKey:@"iInOut"] required:false def:self.iInOut];
    self.iTradeIndex = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTradeIndex"] required:false def:self.iTradeIndex];
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TickReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iStartxh = 0;
        self.iWantnum = 0;
        self.vGuid = [NSData data];
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
    [ostream writeInt32: 1 value: self.iStartxh];
    [ostream writeInt32: 2 value: self.iWantnum];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 3 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TickReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iStartxh = [istream readInt32Def: 1 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 2 required: false def: self.iWantnum];
    self.vGuid = [istream readBytesDef: 3 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (TickReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
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
@implementation TickRsp
- (id) init
{
    if (self = [super init])
    {
        self.vTickDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vTickDesc != nil)
    {
        [ostream writeList: 0 value: self.vTickDesc VAR_TYPE: [THOTH_LIST CREATE: [TickDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TickRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTickDesc = [istream readListDef: 0 required: false def: self.vTickDesc VAR_TYPE: [THOTH_LIST CREATE: [TickDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vTickDesc" value : [BaseJSON writeList : self.vTickDesc VAR_TYPE: [THOTH_LIST CREATE: [TickDesc class]]]];
    return JsonRoot;
}

- (TickRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vTickDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vTickDesc"] required:false def:self.vTickDesc VAR_TYPE: [THOTH_LIST CREATE: [TickDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalMainFlowDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.fNow = 0;
        self.fChangeRate = 0;
        self.fChangeValue = 0;
        self.fZljlr = 0;
        self.fZljzb = 0;
        self.eSecStatus = E_SS_NORMAL;
        self.stSecAttr = [[SecAttr alloc] init];
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
    [ostream writeFloat: 2 value: self.fNow];
    [ostream writeFloat: 3 value: self.fChangeRate];
    [ostream writeFloat: 4 value: self.fChangeValue];
    [ostream writeFloat: 5 value: self.fZljlr];
    [ostream writeFloat: 6 value: self.fZljzb];
    [ostream writeInt32: 7 value: (int32_t)self.eSecStatus];
    if (self.stSecAttr != nil)
    {
        [ostream writeMessage: 8 value: self.stSecAttr];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalMainFlowDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.fNow = [istream readFloatDef: 2 required: false def: self.fNow];
    self.fChangeRate = [istream readFloatDef: 3 required: false def: self.fChangeRate];
    self.fChangeValue = [istream readFloatDef: 4 required: false def: self.fChangeValue];
    self.fZljlr = [istream readFloatDef: 5 required: false def: self.fZljlr];
    self.fZljzb = [istream readFloatDef: 6 required: false def: self.fZljzb];
    self.eSecStatus = [istream readInt32Def: 7 required: false def: (int32_t)self.eSecStatus];
    self.stSecAttr = (SecAttr*)[istream readMessageDef: 8 required: false def: self.stSecAttr VAR_TYPE: [SecAttr class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"fChangeRate" value : [BaseJSON writeFloat : self.fChangeRate]];
    [JsonRoot append:@"fChangeValue" value : [BaseJSON writeFloat : self.fChangeValue]];
    [JsonRoot append:@"fZljlr" value : [BaseJSON writeFloat : self.fZljlr]];
    [JsonRoot append:@"fZljzb" value : [BaseJSON writeFloat : self.fZljzb]];
    [JsonRoot append:@"eSecStatus" value : [BaseJSON writeInt32 : (int32_t)self.eSecStatus]];
    [JsonRoot append:@"stSecAttr" value : [BaseJSON writeMessage : self.stSecAttr]];
    return JsonRoot;
}

- (CapitalMainFlowDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.fChangeRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fChangeRate"] required:false def:self.fChangeRate];
    self.fChangeValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fChangeValue"] required:false def:self.fChangeValue];
    self.fZljlr = [BaseJSON readFloatDef:[RootMap objectForKey:@"fZljlr"] required:false def:self.fZljlr];
    self.fZljzb = [BaseJSON readFloatDef:[RootMap objectForKey:@"fZljzb"] required:false def:self.fZljzb];
    self.eSecStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSecStatus"] required:false def:(int32_t)self.eSecStatus];
    self.stSecAttr = [BaseJSON readMessageDef:[RootMap objectForKey:@"stSecAttr"] required:false def:self.stSecAttr VAR_TYPE: [SecAttr class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalMainFlowReq
- (id) init
{
    if (self = [super init])
    {
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
        self.iStartxh = 0;
        self.iWantnum = 0;
        self.vGuid = [NSData data];
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
    [ostream writeInt32: 1 value: self.iStartxh];
    [ostream writeInt32: 2 value: self.iWantnum];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 3 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalMainFlowReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDtSecCode = [istream readListDef: 0 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.iStartxh = [istream readInt32Def: 1 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 2 required: false def: self.iWantnum];
    self.vGuid = [istream readBytesDef: 3 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (CapitalMainFlowReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vDtSecCode = [BaseJSON readListDef:[RootMap objectForKey:@"vDtSecCode"] required:false def:self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
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
@implementation CapitalMainFlowRsp
- (id) init
{
    if (self = [super init])
    {
        self.vCapitalMainFlowDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vCapitalMainFlowDesc != nil)
    {
        [ostream writeList: 0 value: self.vCapitalMainFlowDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalMainFlowDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalMainFlowRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vCapitalMainFlowDesc = [istream readListDef: 0 required: false def: self.vCapitalMainFlowDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalMainFlowDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vCapitalMainFlowDesc" value : [BaseJSON writeList : self.vCapitalMainFlowDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalMainFlowDesc class]]]];
    return JsonRoot;
}

- (CapitalMainFlowRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vCapitalMainFlowDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vCapitalMainFlowDesc"] required:false def:self.vCapitalMainFlowDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalMainFlowDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConcIndexDesc
- (id) init
{
    if (self = [super init])
    {
        self.lYmd = 0;
        self.fHotIndex = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt64: 0 value: self.lYmd];
    [ostream writeFloat: 1 value: self.fHotIndex];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcIndexDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.lYmd = [istream readInt64Def: 0 required: false def: self.lYmd];
    self.fHotIndex = [istream readFloatDef: 1 required: false def: self.fHotIndex];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"lYmd" value : [BaseJSON writeInt64 : self.lYmd]];
    [JsonRoot append:@"fHotIndex" value : [BaseJSON writeFloat : self.fHotIndex]];
    return JsonRoot;
}

- (ConcIndexDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.lYmd = [BaseJSON readInt64Def:[RootMap objectForKey:@"lYmd"] required:false def:self.lYmd];
    self.fHotIndex = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHotIndex"] required:false def:self.fHotIndex];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ConcIndexReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iStartxh = 0;
        self.iWantnum = 0;
        self.vGuid = [NSData data];
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
    [ostream writeInt32: 1 value: self.iStartxh];
    [ostream writeInt32: 2 value: self.iWantnum];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 3 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcIndexReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iStartxh = [istream readInt32Def: 1 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 2 required: false def: self.iWantnum];
    self.vGuid = [istream readBytesDef: 3 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (ConcIndexReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
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
@implementation ConcIndexRsp
- (id) init
{
    if (self = [super init])
    {
        self.vConcIndexDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vConcIndexDesc != nil)
    {
        [ostream writeList: 0 value: self.vConcIndexDesc VAR_TYPE: [THOTH_LIST CREATE: [ConcIndexDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcIndexRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vConcIndexDesc = [istream readListDef: 0 required: false def: self.vConcIndexDesc VAR_TYPE: [THOTH_LIST CREATE: [ConcIndexDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vConcIndexDesc" value : [BaseJSON writeList : self.vConcIndexDesc VAR_TYPE: [THOTH_LIST CREATE: [ConcIndexDesc class]]]];
    return JsonRoot;
}

- (ConcIndexRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vConcIndexDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vConcIndexDesc"] required:false def:self.vConcIndexDesc VAR_TYPE: [THOTH_LIST CREATE: [ConcIndexDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TradingTimeDesc
- (id) init
{
    if (self = [super init])
    {
        self.eMarketType = E_MT_NO;
        self.iOpenTime = 0;
        self.iCloseTime = 0;
        self.eTradingTimeType = E_TTT_TRADING;
        self.eTradingDealType = E_TDT_OPEN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eMarketType];
    [ostream writeInt32: 1 value: self.iOpenTime];
    [ostream writeInt32: 2 value: self.iCloseTime];
    [ostream writeInt32: 3 value: (int32_t)self.eTradingTimeType];
    [ostream writeInt32: 4 value: (int32_t)self.eTradingDealType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TradingTimeDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eMarketType = [istream readInt32Def: 0 required: false def: (int32_t)self.eMarketType];
    self.iOpenTime = [istream readInt32Def: 1 required: false def: self.iOpenTime];
    self.iCloseTime = [istream readInt32Def: 2 required: false def: self.iCloseTime];
    self.eTradingTimeType = [istream readInt32Def: 3 required: false def: (int32_t)self.eTradingTimeType];
    self.eTradingDealType = [istream readInt32Def: 4 required: false def: (int32_t)self.eTradingDealType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"eMarketType" value : [BaseJSON writeInt32 : (int32_t)self.eMarketType]];
    [JsonRoot append:@"iOpenTime" value : [BaseJSON writeInt32 : self.iOpenTime]];
    [JsonRoot append:@"iCloseTime" value : [BaseJSON writeInt32 : self.iCloseTime]];
    [JsonRoot append:@"eTradingTimeType" value : [BaseJSON writeInt32 : (int32_t)self.eTradingTimeType]];
    [JsonRoot append:@"eTradingDealType" value : [BaseJSON writeInt32 : (int32_t)self.eTradingDealType]];
    return JsonRoot;
}

- (TradingTimeDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eMarketType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eMarketType"] required:false def:(int32_t)self.eMarketType];
    self.iOpenTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOpenTime"] required:false def:self.iOpenTime];
    self.iCloseTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCloseTime"] required:false def:self.iCloseTime];
    self.eTradingTimeType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eTradingTimeType"] required:false def:(int32_t)self.eTradingTimeType];
    self.eTradingDealType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eTradingDealType"] required:false def:(int32_t)self.eTradingDealType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TradingTimeReq
- (id) init
{
    if (self = [super init])
    {
        self.iLocalTime = 0;
        self.vGuid = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iLocalTime];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 1 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TradingTimeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iLocalTime = [istream readInt32Def: 0 required: false def: self.iLocalTime];
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
    [JsonRoot append:@"iLocalTime" value : [BaseJSON writeInt32 : self.iLocalTime]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (TradingTimeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iLocalTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLocalTime"] required:false def:self.iLocalTime];
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
@implementation TradingTimeRsp
- (id) init
{
    if (self = [super init])
    {
        self.iNow = 0;
        self.vTradingTimeDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iNow];
    if (self.vTradingTimeDesc != nil)
    {
        [ostream writeList: 1 value: self.vTradingTimeDesc VAR_TYPE: [THOTH_LIST CREATE: [TradingTimeDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TradingTimeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iNow = [istream readInt32Def: 0 required: false def: self.iNow];
    self.vTradingTimeDesc = [istream readListDef: 1 required: false def: self.vTradingTimeDesc VAR_TYPE: [THOTH_LIST CREATE: [TradingTimeDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iNow" value : [BaseJSON writeInt32 : self.iNow]];
    [JsonRoot append:@"vTradingTimeDesc" value : [BaseJSON writeList : self.vTradingTimeDesc VAR_TYPE: [THOTH_LIST CREATE: [TradingTimeDesc class]]]];
    return JsonRoot;
}

- (TradingTimeRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iNow = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNow"] required:false def:self.iNow];
    self.vTradingTimeDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vTradingTimeDesc"] required:false def:self.vTradingTimeDesc VAR_TYPE: [THOTH_LIST CREATE: [TradingTimeDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AHPlateReq
- (id) init
{
    if (self = [super init])
    {
        self.iStartxh = 0;
        self.iWantnum = 0;
        self.iColype = 0;
        self.eSortType = E_CDST_INCEREASE;
        self.vGuid = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStartxh];
    [ostream writeInt32: 1 value: self.iWantnum];
    [ostream writeInt32: 2 value: self.iColype];
    [ostream writeInt32: 3 value: (int32_t)self.eSortType];
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 4 value: self.vGuid];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AHPlateReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStartxh = [istream readInt32Def: 0 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 1 required: false def: self.iWantnum];
    self.iColype = [istream readInt32Def: 2 required: false def: self.iColype];
    self.eSortType = [istream readInt32Def: 3 required: false def: (int32_t)self.eSortType];
    self.vGuid = [istream readBytesDef: 4 required: false def: self.vGuid];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    [JsonRoot append:@"iColype" value : [BaseJSON writeInt32 : self.iColype]];
    [JsonRoot append:@"eSortType" value : [BaseJSON writeInt32 : (int32_t)self.eSortType]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    return JsonRoot;
}

- (AHPlateReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
    self.iColype = [BaseJSON readInt32Def:[RootMap objectForKey:@"iColype"] required:false def:self.iColype];
    self.eSortType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSortType"] required:false def:(int32_t)self.eSortType];
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
@implementation AHPlateDesc
- (id) init
{
    if (self = [super init])
    {
        self.fPremiumrate = 0;
        self.sADtSecCode = @"";
        self.sHKDtSecCode = @"";
        self.sASecName = @"";
        self.sHKSecName = @"";
        self.fANow = 0;
        self.fHKNow = 0;
        self.fAIncrease = 0;
        self.fHKIncrease = 0;
        self.lATotalhand = 0;
        self.lHKTotalhand = 0;
        self.fAFhsl = 0;
        self.fHKFhsl = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeFloat: 0 value: self.fPremiumrate];
    if (self.sADtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sADtSecCode];
    }
    if (self.sHKDtSecCode != nil)
    {
        [ostream writeString: 2 value: self.sHKDtSecCode];
    }
    if (self.sASecName != nil)
    {
        [ostream writeString: 3 value: self.sASecName];
    }
    if (self.sHKSecName != nil)
    {
        [ostream writeString: 4 value: self.sHKSecName];
    }
    [ostream writeFloat: 5 value: self.fANow];
    [ostream writeFloat: 6 value: self.fHKNow];
    [ostream writeFloat: 7 value: self.fAIncrease];
    [ostream writeFloat: 8 value: self.fHKIncrease];
    [ostream writeInt64: 9 value: self.lATotalhand];
    [ostream writeInt64: 10 value: self.lHKTotalhand];
    [ostream writeFloat: 11 value: self.fAFhsl];
    [ostream writeFloat: 12 value: self.fHKFhsl];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AHPlateDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.fPremiumrate = [istream readFloatDef: 0 required: false def: self.fPremiumrate];
    self.sADtSecCode = [istream readStringDef: 1 required: false def: self.sADtSecCode];
    self.sHKDtSecCode = [istream readStringDef: 2 required: false def: self.sHKDtSecCode];
    self.sASecName = [istream readStringDef: 3 required: false def: self.sASecName];
    self.sHKSecName = [istream readStringDef: 4 required: false def: self.sHKSecName];
    self.fANow = [istream readFloatDef: 5 required: false def: self.fANow];
    self.fHKNow = [istream readFloatDef: 6 required: false def: self.fHKNow];
    self.fAIncrease = [istream readFloatDef: 7 required: false def: self.fAIncrease];
    self.fHKIncrease = [istream readFloatDef: 8 required: false def: self.fHKIncrease];
    self.lATotalhand = [istream readInt64Def: 9 required: false def: self.lATotalhand];
    self.lHKTotalhand = [istream readInt64Def: 10 required: false def: self.lHKTotalhand];
    self.fAFhsl = [istream readFloatDef: 11 required: false def: self.fAFhsl];
    self.fHKFhsl = [istream readFloatDef: 12 required: false def: self.fHKFhsl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"fPremiumrate" value : [BaseJSON writeFloat : self.fPremiumrate]];
    [JsonRoot append:@"sADtSecCode" value : [BaseJSON writeString : self.sADtSecCode]];
    [JsonRoot append:@"sHKDtSecCode" value : [BaseJSON writeString : self.sHKDtSecCode]];
    [JsonRoot append:@"sASecName" value : [BaseJSON writeString : self.sASecName]];
    [JsonRoot append:@"sHKSecName" value : [BaseJSON writeString : self.sHKSecName]];
    [JsonRoot append:@"fANow" value : [BaseJSON writeFloat : self.fANow]];
    [JsonRoot append:@"fHKNow" value : [BaseJSON writeFloat : self.fHKNow]];
    [JsonRoot append:@"fAIncrease" value : [BaseJSON writeFloat : self.fAIncrease]];
    [JsonRoot append:@"fHKIncrease" value : [BaseJSON writeFloat : self.fHKIncrease]];
    [JsonRoot append:@"lATotalhand" value : [BaseJSON writeInt64 : self.lATotalhand]];
    [JsonRoot append:@"lHKTotalhand" value : [BaseJSON writeInt64 : self.lHKTotalhand]];
    [JsonRoot append:@"fAFhsl" value : [BaseJSON writeFloat : self.fAFhsl]];
    [JsonRoot append:@"fHKFhsl" value : [BaseJSON writeFloat : self.fHKFhsl]];
    return JsonRoot;
}

- (AHPlateDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.fPremiumrate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPremiumrate"] required:false def:self.fPremiumrate];
    self.sADtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sADtSecCode"] required:false def:self.sADtSecCode];
    self.sHKDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sHKDtSecCode"] required:false def:self.sHKDtSecCode];
    self.sASecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sASecName"] required:false def:self.sASecName];
    self.sHKSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sHKSecName"] required:false def:self.sHKSecName];
    self.fANow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fANow"] required:false def:self.fANow];
    self.fHKNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHKNow"] required:false def:self.fHKNow];
    self.fAIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAIncrease"] required:false def:self.fAIncrease];
    self.fHKIncrease = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHKIncrease"] required:false def:self.fHKIncrease];
    self.lATotalhand = [BaseJSON readInt64Def:[RootMap objectForKey:@"lATotalhand"] required:false def:self.lATotalhand];
    self.lHKTotalhand = [BaseJSON readInt64Def:[RootMap objectForKey:@"lHKTotalhand"] required:false def:self.lHKTotalhand];
    self.fAFhsl = [BaseJSON readFloatDef:[RootMap objectForKey:@"fAFhsl"] required:false def:self.fAFhsl];
    self.fHKFhsl = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHKFhsl"] required:false def:self.fHKFhsl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AHPlateRsp
- (id) init
{
    if (self = [super init])
    {
        self.vAHPlateDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vAHPlateDesc != nil)
    {
        [ostream writeList: 1 value: self.vAHPlateDesc VAR_TYPE: [THOTH_LIST CREATE: [AHPlateDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AHPlateRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vAHPlateDesc = [istream readListDef: 1 required: false def: self.vAHPlateDesc VAR_TYPE: [THOTH_LIST CREATE: [AHPlateDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vAHPlateDesc" value : [BaseJSON writeList : self.vAHPlateDesc VAR_TYPE: [THOTH_LIST CREATE: [AHPlateDesc class]]]];
    return JsonRoot;
}

- (AHPlateRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vAHPlateDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vAHPlateDesc"] required:false def:self.vAHPlateDesc VAR_TYPE: [THOTH_LIST CREATE: [AHPlateDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AHExtendInfo
- (id) init
{
    if (self = [super init])
    {
        self.fRmbHkExchangeRate = 0;
        self.fSHHKFlowInto = 0;
        self.fSHHKQuota = 0;
        self.fHKSHFlowInto = 0;
        self.fHKSHQuota = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeFloat: 0 value: self.fRmbHkExchangeRate];
    [ostream writeFloat: 1 value: self.fSHHKFlowInto];
    [ostream writeFloat: 2 value: self.fSHHKQuota];
    [ostream writeFloat: 3 value: self.fHKSHFlowInto];
    [ostream writeFloat: 4 value: self.fHKSHQuota];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AHExtendInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.fRmbHkExchangeRate = [istream readFloatDef: 0 required: false def: self.fRmbHkExchangeRate];
    self.fSHHKFlowInto = [istream readFloatDef: 1 required: false def: self.fSHHKFlowInto];
    self.fSHHKQuota = [istream readFloatDef: 2 required: false def: self.fSHHKQuota];
    self.fHKSHFlowInto = [istream readFloatDef: 3 required: false def: self.fHKSHFlowInto];
    self.fHKSHQuota = [istream readFloatDef: 4 required: false def: self.fHKSHQuota];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"fRmbHkExchangeRate" value : [BaseJSON writeFloat : self.fRmbHkExchangeRate]];
    [JsonRoot append:@"fSHHKFlowInto" value : [BaseJSON writeFloat : self.fSHHKFlowInto]];
    [JsonRoot append:@"fSHHKQuota" value : [BaseJSON writeFloat : self.fSHHKQuota]];
    [JsonRoot append:@"fHKSHFlowInto" value : [BaseJSON writeFloat : self.fHKSHFlowInto]];
    [JsonRoot append:@"fHKSHQuota" value : [BaseJSON writeFloat : self.fHKSHQuota]];
    return JsonRoot;
}

- (AHExtendInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.fRmbHkExchangeRate = [BaseJSON readFloatDef:[RootMap objectForKey:@"fRmbHkExchangeRate"] required:false def:self.fRmbHkExchangeRate];
    self.fSHHKFlowInto = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSHHKFlowInto"] required:false def:self.fSHHKFlowInto];
    self.fSHHKQuota = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSHHKQuota"] required:false def:self.fSHHKQuota];
    self.fHKSHFlowInto = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHKSHFlowInto"] required:false def:self.fHKSHFlowInto];
    self.fHKSHQuota = [BaseJSON readFloatDef:[RootMap objectForKey:@"fHKSHQuota"] required:false def:self.fHKSHQuota];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AHExtendReq
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

- (AHExtendReq *) read: (BaseDecodeStream *)istream
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

- (AHExtendReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation AHExtendRsp
- (id) init
{
    if (self = [super init])
    {
        self.stAHExtendInfo = [[AHExtendInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stAHExtendInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stAHExtendInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AHExtendRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stAHExtendInfo = (AHExtendInfo*)[istream readMessageDef: 0 required: false def: self.stAHExtendInfo VAR_TYPE: [AHExtendInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stAHExtendInfo" value : [BaseJSON writeMessage : self.stAHExtendInfo]];
    return JsonRoot;
}

- (AHExtendRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stAHExtendInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAHExtendInfo"] required:false def:self.stAHExtendInfo VAR_TYPE: [AHExtendInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PlateStockListReq
- (id) init
{
    if (self = [super init])
    {
        self.vGuid = [NSData data];
        self.sDtSecCode = @"";
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
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateStockListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vGuid = [istream readBytesDef: 0 required: false def: self.vGuid];
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
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    return JsonRoot;
}

- (PlateStockListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vGuid = [BaseJSON readBytesDef:[RootMap objectForKey:@"vGuid"] required:false def:self.vGuid];
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
@implementation PlateStockListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vSecSimpleQuote = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSecSimpleQuote != nil)
    {
        [ostream writeList: 0 value: self.vSecSimpleQuote VAR_TYPE: [THOTH_LIST CREATE: [SecSimpleQuote class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateStockListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSecSimpleQuote = [istream readListDef: 0 required: false def: self.vSecSimpleQuote VAR_TYPE: [THOTH_LIST CREATE: [SecSimpleQuote class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vSecSimpleQuote" value : [BaseJSON writeList : self.vSecSimpleQuote VAR_TYPE: [THOTH_LIST CREATE: [SecSimpleQuote class]]]];
    return JsonRoot;
}

- (PlateStockListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vSecSimpleQuote = [BaseJSON readListDef:[RootMap objectForKey:@"vSecSimpleQuote"] required:false def:self.vSecSimpleQuote VAR_TYPE: [THOTH_LIST CREATE: [SecSimpleQuote class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarginTradeInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.fBuyBalance = 0;
        self.fSellBalance = 0;
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
    [ostream writeFloat: 1 value: self.fBuyBalance];
    [ostream writeFloat: 2 value: self.fSellBalance];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarginTradeInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.fBuyBalance = [istream readFloatDef: 1 required: false def: self.fBuyBalance];
    self.fSellBalance = [istream readFloatDef: 2 required: false def: self.fSellBalance];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"fBuyBalance" value : [BaseJSON writeFloat : self.fBuyBalance]];
    [JsonRoot append:@"fSellBalance" value : [BaseJSON writeFloat : self.fSellBalance]];
    return JsonRoot;
}

- (MarginTradeInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sDate"] required:false def:self.sDate];
    self.fBuyBalance = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuyBalance"] required:false def:self.fBuyBalance];
    self.fSellBalance = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSellBalance"] required:false def:self.fSellBalance];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarginTradeReq
- (id) init
{
    if (self = [super init])
    {
        self.vGuid = [NSData data];
        self.sDtSecCode = @"";
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
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarginTradeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vGuid = [istream readBytesDef: 0 required: false def: self.vGuid];
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
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    return JsonRoot;
}

- (MarginTradeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vGuid = [BaseJSON readBytesDef:[RootMap objectForKey:@"vGuid"] required:false def:self.vGuid];
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
@implementation MarginTradeRsp
- (id) init
{
    if (self = [super init])
    {
        self.vMarginTradeInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vMarginTradeInfo != nil)
    {
        [ostream writeList: 0 value: self.vMarginTradeInfo VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarginTradeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vMarginTradeInfo = [istream readListDef: 0 required: false def: self.vMarginTradeInfo VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vMarginTradeInfo" value : [BaseJSON writeList : self.vMarginTradeInfo VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeInfo class]]]];
    return JsonRoot;
}

- (MarginTradeRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vMarginTradeInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vMarginTradeInfo"] required:false def:self.vMarginTradeInfo VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalDDZDesc
- (id) init
{
    if (self = [super init])
    {
        self.lTime = 0;
        self.fSuperInAmt = 0;
        self.fSuperOutAmt = 0;
        self.fBigInAmt = 0;
        self.fBigOutAmt = 0;
        self.fMidInAmt = 0;
        self.fMidOutAmt = 0;
        self.fSmallInAmt = 0;
        self.fSmallOutAmt = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt64: 2 value: self.lTime];
    [ostream writeFloat: 3 value: self.fSuperInAmt];
    [ostream writeFloat: 4 value: self.fSuperOutAmt];
    [ostream writeFloat: 5 value: self.fBigInAmt];
    [ostream writeFloat: 6 value: self.fBigOutAmt];
    [ostream writeFloat: 7 value: self.fMidInAmt];
    [ostream writeFloat: 8 value: self.fMidOutAmt];
    [ostream writeFloat: 9 value: self.fSmallInAmt];
    [ostream writeFloat: 10 value: self.fSmallOutAmt];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalDDZDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.lTime = [istream readInt64Def: 2 required: false def: self.lTime];
    self.fSuperInAmt = [istream readFloatDef: 3 required: false def: self.fSuperInAmt];
    self.fSuperOutAmt = [istream readFloatDef: 4 required: false def: self.fSuperOutAmt];
    self.fBigInAmt = [istream readFloatDef: 5 required: false def: self.fBigInAmt];
    self.fBigOutAmt = [istream readFloatDef: 6 required: false def: self.fBigOutAmt];
    self.fMidInAmt = [istream readFloatDef: 7 required: false def: self.fMidInAmt];
    self.fMidOutAmt = [istream readFloatDef: 8 required: false def: self.fMidOutAmt];
    self.fSmallInAmt = [istream readFloatDef: 9 required: false def: self.fSmallInAmt];
    self.fSmallOutAmt = [istream readFloatDef: 10 required: false def: self.fSmallOutAmt];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"lTime" value : [BaseJSON writeInt64 : self.lTime]];
    [JsonRoot append:@"fSuperInAmt" value : [BaseJSON writeFloat : self.fSuperInAmt]];
    [JsonRoot append:@"fSuperOutAmt" value : [BaseJSON writeFloat : self.fSuperOutAmt]];
    [JsonRoot append:@"fBigInAmt" value : [BaseJSON writeFloat : self.fBigInAmt]];
    [JsonRoot append:@"fBigOutAmt" value : [BaseJSON writeFloat : self.fBigOutAmt]];
    [JsonRoot append:@"fMidInAmt" value : [BaseJSON writeFloat : self.fMidInAmt]];
    [JsonRoot append:@"fMidOutAmt" value : [BaseJSON writeFloat : self.fMidOutAmt]];
    [JsonRoot append:@"fSmallInAmt" value : [BaseJSON writeFloat : self.fSmallInAmt]];
    [JsonRoot append:@"fSmallOutAmt" value : [BaseJSON writeFloat : self.fSmallOutAmt]];
    return JsonRoot;
}

- (CapitalDDZDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.lTime = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTime"] required:false def:self.lTime];
    self.fSuperInAmt = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSuperInAmt"] required:false def:self.fSuperInAmt];
    self.fSuperOutAmt = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSuperOutAmt"] required:false def:self.fSuperOutAmt];
    self.fBigInAmt = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBigInAmt"] required:false def:self.fBigInAmt];
    self.fBigOutAmt = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBigOutAmt"] required:false def:self.fBigOutAmt];
    self.fMidInAmt = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMidInAmt"] required:false def:self.fMidInAmt];
    self.fMidOutAmt = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMidOutAmt"] required:false def:self.fMidOutAmt];
    self.fSmallInAmt = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSmallInAmt"] required:false def:self.fSmallInAmt];
    self.fSmallOutAmt = [BaseJSON readFloatDef:[RootMap objectForKey:@"fSmallOutAmt"] required:false def:self.fSmallOutAmt];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalDDZReq
- (id) init
{
    if (self = [super init])
    {
        self.iStartxh = 0;
        self.iNum = 0;
        self.sDtSecCode = @"";
        self.vGuid = [NSData data];
        self.eCapitalDDZType = E_CDT_MIN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 1 value: self.iStartxh];
    [ostream writeInt32: 2 value: self.iNum];
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 3 value: self.sDtSecCode];
    }
    if (self.vGuid != nil)
    {
        [ostream writeBytes: 4 value: self.vGuid];
    }
    [ostream writeInt32: 5 value: (int32_t)self.eCapitalDDZType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalDDZReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStartxh = [istream readInt32Def: 1 required: false def: self.iStartxh];
    self.iNum = [istream readInt32Def: 2 required: false def: self.iNum];
    self.sDtSecCode = [istream readStringDef: 3 required: false def: self.sDtSecCode];
    self.vGuid = [istream readBytesDef: 4 required: false def: self.vGuid];
    self.eCapitalDDZType = [istream readInt32Def: 5 required: false def: (int32_t)self.eCapitalDDZType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iNum" value : [BaseJSON writeInt32 : self.iNum]];
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"vGuid" value : [BaseJSON writeBytes : self.vGuid]];
    [JsonRoot append:@"eCapitalDDZType" value : [BaseJSON writeInt32 : (int32_t)self.eCapitalDDZType]];
    return JsonRoot;
}

- (CapitalDDZReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNum"] required:false def:self.iNum];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.vGuid = [BaseJSON readBytesDef:[RootMap objectForKey:@"vGuid"] required:false def:self.vGuid];
    self.eCapitalDDZType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eCapitalDDZType"] required:false def:(int32_t)self.eCapitalDDZType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CapitalDDZRsp
- (id) init
{
    if (self = [super init])
    {
        self.vCapitalDDZDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vCapitalDDZDesc != nil)
    {
        [ostream writeList: 0 value: self.vCapitalDDZDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalDDZDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CapitalDDZRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vCapitalDDZDesc = [istream readListDef: 0 required: false def: self.vCapitalDDZDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalDDZDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vCapitalDDZDesc" value : [BaseJSON writeList : self.vCapitalDDZDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalDDZDesc class]]]];
    return JsonRoot;
}

- (CapitalDDZRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vCapitalDDZDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vCapitalDDZDesc"] required:false def:self.vCapitalDDZDesc VAR_TYPE: [THOTH_LIST CREATE: [CapitalDDZDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SimilarKLineBase
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.sUpBanner = @"";
        self.sUpValue = @"";
        self.sLeftValue1 = @"";
        self.sLeftValue2 = @"";
        self.sRightBanner = @"";
        self.vKLineDesc = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sUpBanner != nil)
    {
        [ostream writeString: 2 value: self.sUpBanner];
    }
    if (self.sUpValue != nil)
    {
        [ostream writeString: 3 value: self.sUpValue];
    }
    if (self.sLeftValue1 != nil)
    {
        [ostream writeString: 4 value: self.sLeftValue1];
    }
    if (self.sLeftValue2 != nil)
    {
        [ostream writeString: 5 value: self.sLeftValue2];
    }
    if (self.sRightBanner != nil)
    {
        [ostream writeString: 6 value: self.sRightBanner];
    }
    if (self.vKLineDesc != nil)
    {
        [ostream writeList: 7 value: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SimilarKLineBase *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sUpBanner = [istream readStringDef: 2 required: false def: self.sUpBanner];
    self.sUpValue = [istream readStringDef: 3 required: false def: self.sUpValue];
    self.sLeftValue1 = [istream readStringDef: 4 required: false def: self.sLeftValue1];
    self.sLeftValue2 = [istream readStringDef: 5 required: false def: self.sLeftValue2];
    self.sRightBanner = [istream readStringDef: 6 required: false def: self.sRightBanner];
    self.vKLineDesc = [istream readListDef: 7 required: false def: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sUpBanner" value : [BaseJSON writeString : self.sUpBanner]];
    [JsonRoot append:@"sUpValue" value : [BaseJSON writeString : self.sUpValue]];
    [JsonRoot append:@"sLeftValue1" value : [BaseJSON writeString : self.sLeftValue1]];
    [JsonRoot append:@"sLeftValue2" value : [BaseJSON writeString : self.sLeftValue2]];
    [JsonRoot append:@"sRightBanner" value : [BaseJSON writeString : self.sRightBanner]];
    [JsonRoot append:@"vKLineDesc" value : [BaseJSON writeList : self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]]];
    return JsonRoot;
}

- (SimilarKLineBase *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sUpBanner = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpBanner"] required:false def:self.sUpBanner];
    self.sUpValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpValue"] required:false def:self.sUpValue];
    self.sLeftValue1 = [BaseJSON readStringDef:[RootMap objectForKey:@"sLeftValue1"] required:false def:self.sLeftValue1];
    self.sLeftValue2 = [BaseJSON readStringDef:[RootMap objectForKey:@"sLeftValue2"] required:false def:self.sLeftValue2];
    self.sRightBanner = [BaseJSON readStringDef:[RootMap objectForKey:@"sRightBanner"] required:false def:self.sRightBanner];
    self.vKLineDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vKLineDesc"] required:false def:self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SimilarKLineReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eSimilarKLineType = E_SKLT_CLOSE;
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
    [ostream writeInt32: 1 value: (int32_t)self.eSimilarKLineType];
    if (self.vDtSecCode != nil)
    {
        [ostream writeList: 2 value: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SimilarKLineReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eSimilarKLineType = [istream readInt32Def: 1 required: false def: (int32_t)self.eSimilarKLineType];
    self.vDtSecCode = [istream readListDef: 2 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eSimilarKLineType" value : [BaseJSON writeInt32 : (int32_t)self.eSimilarKLineType]];
    [JsonRoot append:@"vDtSecCode" value : [BaseJSON writeList : self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (SimilarKLineReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eSimilarKLineType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSimilarKLineType"] required:false def:(int32_t)self.eSimilarKLineType];
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
@implementation SimilarKLineDaysRst
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.sUpBan = @"";
        self.sUpVal = @"";
        self.sValue1 = @"";
        self.sValue2 = @"";
        self.eSimilarKLineType = E_SKLT_CLOSE;
        self.vKLineDesc = [NSMutableArray arrayWithCapacity:0];
        self.vSimilarKLine = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sUpBan != nil)
    {
        [ostream writeString: 2 value: self.sUpBan];
    }
    if (self.sUpVal != nil)
    {
        [ostream writeString: 3 value: self.sUpVal];
    }
    if (self.sValue1 != nil)
    {
        [ostream writeString: 4 value: self.sValue1];
    }
    if (self.sValue2 != nil)
    {
        [ostream writeString: 5 value: self.sValue2];
    }
    [ostream writeInt32: 6 value: (int32_t)self.eSimilarKLineType];
    if (self.vKLineDesc != nil)
    {
        [ostream writeList: 7 value: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    }
    if (self.vSimilarKLine != nil)
    {
        [ostream writeList: 8 value: self.vSimilarKLine VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SimilarKLineDaysRst *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sUpBan = [istream readStringDef: 2 required: false def: self.sUpBan];
    self.sUpVal = [istream readStringDef: 3 required: false def: self.sUpVal];
    self.sValue1 = [istream readStringDef: 4 required: false def: self.sValue1];
    self.sValue2 = [istream readStringDef: 5 required: false def: self.sValue2];
    self.eSimilarKLineType = [istream readInt32Def: 6 required: false def: (int32_t)self.eSimilarKLineType];
    self.vKLineDesc = [istream readListDef: 7 required: false def: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.vSimilarKLine = [istream readListDef: 8 required: false def: self.vSimilarKLine VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sUpBan" value : [BaseJSON writeString : self.sUpBan]];
    [JsonRoot append:@"sUpVal" value : [BaseJSON writeString : self.sUpVal]];
    [JsonRoot append:@"sValue1" value : [BaseJSON writeString : self.sValue1]];
    [JsonRoot append:@"sValue2" value : [BaseJSON writeString : self.sValue2]];
    [JsonRoot append:@"eSimilarKLineType" value : [BaseJSON writeInt32 : (int32_t)self.eSimilarKLineType]];
    [JsonRoot append:@"vKLineDesc" value : [BaseJSON writeList : self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]]];
    [JsonRoot append:@"vSimilarKLine" value : [BaseJSON writeList : self.vSimilarKLine VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]]];
    return JsonRoot;
}

- (SimilarKLineDaysRst *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sUpBan = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpBan"] required:false def:self.sUpBan];
    self.sUpVal = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpVal"] required:false def:self.sUpVal];
    self.sValue1 = [BaseJSON readStringDef:[RootMap objectForKey:@"sValue1"] required:false def:self.sValue1];
    self.sValue2 = [BaseJSON readStringDef:[RootMap objectForKey:@"sValue2"] required:false def:self.sValue2];
    self.eSimilarKLineType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSimilarKLineType"] required:false def:(int32_t)self.eSimilarKLineType];
    self.vKLineDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vKLineDesc"] required:false def:self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.vSimilarKLine = [BaseJSON readListDef:[RootMap objectForKey:@"vSimilarKLine"] required:false def:self.vSimilarKLine VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SimilarKLineRst
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.sUpBan = @"";
        self.sUpVal = @"";
        self.sValue1 = @"";
        self.sValue2 = @"";
        self.eSimilarKLineType = E_SKLT_CLOSE;
        self.vKLineDesc = [NSMutableArray arrayWithCapacity:0];
        self.vSimilarKLine = [NSMutableArray arrayWithCapacity:0];
        self.vSimilarKLineSelf = [NSMutableArray arrayWithCapacity:0];
        self.sUpValDay60 = @"";
        self.sValue1Day60 = @"";
        self.sValue2Day60 = @"";
        self.vKLineDescDay60 = [NSMutableArray arrayWithCapacity:0];
        self.vSimilarKLineDay60 = [NSMutableArray arrayWithCapacity:0];
        self.vSimilarKLineDay60Self = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sUpBan != nil)
    {
        [ostream writeString: 2 value: self.sUpBan];
    }
    if (self.sUpVal != nil)
    {
        [ostream writeString: 3 value: self.sUpVal];
    }
    if (self.sValue1 != nil)
    {
        [ostream writeString: 4 value: self.sValue1];
    }
    if (self.sValue2 != nil)
    {
        [ostream writeString: 5 value: self.sValue2];
    }
    [ostream writeInt32: 6 value: (int32_t)self.eSimilarKLineType];
    if (self.vKLineDesc != nil)
    {
        [ostream writeList: 7 value: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    }
    if (self.vSimilarKLine != nil)
    {
        [ostream writeList: 8 value: self.vSimilarKLine VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    }
    if (self.vSimilarKLineSelf != nil)
    {
        [ostream writeList: 9 value: self.vSimilarKLineSelf VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    }
    if (self.sUpValDay60 != nil)
    {
        [ostream writeString: 10 value: self.sUpValDay60];
    }
    if (self.sValue1Day60 != nil)
    {
        [ostream writeString: 11 value: self.sValue1Day60];
    }
    if (self.sValue2Day60 != nil)
    {
        [ostream writeString: 12 value: self.sValue2Day60];
    }
    if (self.vKLineDescDay60 != nil)
    {
        [ostream writeList: 13 value: self.vKLineDescDay60 VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    }
    if (self.vSimilarKLineDay60 != nil)
    {
        [ostream writeList: 14 value: self.vSimilarKLineDay60 VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    }
    if (self.vSimilarKLineDay60Self != nil)
    {
        [ostream writeList: 15 value: self.vSimilarKLineDay60Self VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SimilarKLineRst *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sUpBan = [istream readStringDef: 2 required: false def: self.sUpBan];
    self.sUpVal = [istream readStringDef: 3 required: false def: self.sUpVal];
    self.sValue1 = [istream readStringDef: 4 required: false def: self.sValue1];
    self.sValue2 = [istream readStringDef: 5 required: false def: self.sValue2];
    self.eSimilarKLineType = [istream readInt32Def: 6 required: false def: (int32_t)self.eSimilarKLineType];
    self.vKLineDesc = [istream readListDef: 7 required: false def: self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.vSimilarKLine = [istream readListDef: 8 required: false def: self.vSimilarKLine VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    self.vSimilarKLineSelf = [istream readListDef: 9 required: false def: self.vSimilarKLineSelf VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    self.sUpValDay60 = [istream readStringDef: 10 required: false def: self.sUpValDay60];
    self.sValue1Day60 = [istream readStringDef: 11 required: false def: self.sValue1Day60];
    self.sValue2Day60 = [istream readStringDef: 12 required: false def: self.sValue2Day60];
    self.vKLineDescDay60 = [istream readListDef: 13 required: false def: self.vKLineDescDay60 VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.vSimilarKLineDay60 = [istream readListDef: 14 required: false def: self.vSimilarKLineDay60 VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    self.vSimilarKLineDay60Self = [istream readListDef: 15 required: false def: self.vSimilarKLineDay60Self VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"sUpBan" value : [BaseJSON writeString : self.sUpBan]];
    [JsonRoot append:@"sUpVal" value : [BaseJSON writeString : self.sUpVal]];
    [JsonRoot append:@"sValue1" value : [BaseJSON writeString : self.sValue1]];
    [JsonRoot append:@"sValue2" value : [BaseJSON writeString : self.sValue2]];
    [JsonRoot append:@"eSimilarKLineType" value : [BaseJSON writeInt32 : (int32_t)self.eSimilarKLineType]];
    [JsonRoot append:@"vKLineDesc" value : [BaseJSON writeList : self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]]];
    [JsonRoot append:@"vSimilarKLine" value : [BaseJSON writeList : self.vSimilarKLine VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]]];
    [JsonRoot append:@"vSimilarKLineSelf" value : [BaseJSON writeList : self.vSimilarKLineSelf VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]]];
    [JsonRoot append:@"sUpValDay60" value : [BaseJSON writeString : self.sUpValDay60]];
    [JsonRoot append:@"sValue1Day60" value : [BaseJSON writeString : self.sValue1Day60]];
    [JsonRoot append:@"sValue2Day60" value : [BaseJSON writeString : self.sValue2Day60]];
    [JsonRoot append:@"vKLineDescDay60" value : [BaseJSON writeList : self.vKLineDescDay60 VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]]];
    [JsonRoot append:@"vSimilarKLineDay60" value : [BaseJSON writeList : self.vSimilarKLineDay60 VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]]];
    [JsonRoot append:@"vSimilarKLineDay60Self" value : [BaseJSON writeList : self.vSimilarKLineDay60Self VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]]];
    return JsonRoot;
}

- (SimilarKLineRst *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sUpBan = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpBan"] required:false def:self.sUpBan];
    self.sUpVal = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpVal"] required:false def:self.sUpVal];
    self.sValue1 = [BaseJSON readStringDef:[RootMap objectForKey:@"sValue1"] required:false def:self.sValue1];
    self.sValue2 = [BaseJSON readStringDef:[RootMap objectForKey:@"sValue2"] required:false def:self.sValue2];
    self.eSimilarKLineType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eSimilarKLineType"] required:false def:(int32_t)self.eSimilarKLineType];
    self.vKLineDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vKLineDesc"] required:false def:self.vKLineDesc VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.vSimilarKLine = [BaseJSON readListDef:[RootMap objectForKey:@"vSimilarKLine"] required:false def:self.vSimilarKLine VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    self.vSimilarKLineSelf = [BaseJSON readListDef:[RootMap objectForKey:@"vSimilarKLineSelf"] required:false def:self.vSimilarKLineSelf VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    self.sUpValDay60 = [BaseJSON readStringDef:[RootMap objectForKey:@"sUpValDay60"] required:false def:self.sUpValDay60];
    self.sValue1Day60 = [BaseJSON readStringDef:[RootMap objectForKey:@"sValue1Day60"] required:false def:self.sValue1Day60];
    self.sValue2Day60 = [BaseJSON readStringDef:[RootMap objectForKey:@"sValue2Day60"] required:false def:self.sValue2Day60];
    self.vKLineDescDay60 = [BaseJSON readListDef:[RootMap objectForKey:@"vKLineDescDay60"] required:false def:self.vKLineDescDay60 VAR_TYPE: [THOTH_LIST CREATE: [KLineDesc class]]];
    self.vSimilarKLineDay60 = [BaseJSON readListDef:[RootMap objectForKey:@"vSimilarKLineDay60"] required:false def:self.vSimilarKLineDay60 VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    self.vSimilarKLineDay60Self = [BaseJSON readListDef:[RootMap objectForKey:@"vSimilarKLineDay60Self"] required:false def:self.vSimilarKLineDay60Self VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineBase class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SimilarKLineRsp
- (id) init
{
    if (self = [super init])
    {
        self.vRst = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vRst != nil)
    {
        [ostream writeList: 0 value: self.vRst VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineRst class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SimilarKLineRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vRst = [istream readListDef: 0 required: false def: self.vRst VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineRst class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vRst" value : [BaseJSON writeList : self.vRst VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineRst class]]]];
    return JsonRoot;
}

- (SimilarKLineRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vRst = [BaseJSON readListDef:[RootMap objectForKey:@"vRst"] required:false def:self.vRst VAR_TYPE: [THOTH_LIST CREATE: [SimilarKLineRst class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ShortLineStrategy
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iTime = 0;
        self.ePanKouType = E_PKT_SUPER_BUY;
        self.sInfo = @"";
        self.fNow = 0;
        self.fClose = 0;
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
    [ostream writeInt32: 1 value: self.iTime];
    [ostream writeInt32: 2 value: (int32_t)self.ePanKouType];
    if (self.sInfo != nil)
    {
        [ostream writeString: 3 value: self.sInfo];
    }
    [ostream writeFloat: 4 value: self.fNow];
    [ostream writeFloat: 5 value: self.fClose];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ShortLineStrategy *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iTime = [istream readInt32Def: 1 required: false def: self.iTime];
    self.ePanKouType = [istream readInt32Def: 2 required: false def: (int32_t)self.ePanKouType];
    self.sInfo = [istream readStringDef: 3 required: false def: self.sInfo];
    self.fNow = [istream readFloatDef: 4 required: false def: self.fNow];
    self.fClose = [istream readFloatDef: 5 required: false def: self.fClose];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    [JsonRoot append:@"ePanKouType" value : [BaseJSON writeInt32 : (int32_t)self.ePanKouType]];
    [JsonRoot append:@"sInfo" value : [BaseJSON writeString : self.sInfo]];
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    return JsonRoot;
}

- (ShortLineStrategy *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    self.ePanKouType = [BaseJSON readInt32Def:[RootMap objectForKey:@"ePanKouType"] required:false def:(int32_t)self.ePanKouType];
    self.sInfo = [BaseJSON readStringDef:[RootMap objectForKey:@"sInfo"] required:false def:self.sInfo];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ShortLineStrategyList
- (id) init
{
    if (self = [super init])
    {
        self.vShortLineStrategy = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vShortLineStrategy != nil)
    {
        [ostream writeList: 0 value: self.vShortLineStrategy VAR_TYPE: [THOTH_LIST CREATE: [ShortLineStrategy class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ShortLineStrategyList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vShortLineStrategy = [istream readListDef: 0 required: false def: self.vShortLineStrategy VAR_TYPE: [THOTH_LIST CREATE: [ShortLineStrategy class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vShortLineStrategy" value : [BaseJSON writeList : self.vShortLineStrategy VAR_TYPE: [THOTH_LIST CREATE: [ShortLineStrategy class]]]];
    return JsonRoot;
}

- (ShortLineStrategyList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vShortLineStrategy = [BaseJSON readListDef:[RootMap objectForKey:@"vShortLineStrategy"] required:false def:self.vShortLineStrategy VAR_TYPE: [THOTH_LIST CREATE: [ShortLineStrategy class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LargeUnitDesc
- (id) init
{
    if (self = [super init])
    {
        self.sSecName = @"";
        self.sDtSecCode = @"";
        self.iTime = 0;
        self.fNow = 0;
        self.lLargeBuy = 0;
        self.lLargeSell = 0;
        self.lSuperBuy = 0;
        self.lSuperSell = 0;
        self.lSuperLargeBuy = 0;
        self.lSuperLargeSell = 0;
        self.lCancelBuy = 0;
        self.lCancelSell = 0;
        self.lPostLargeBuy = 0;
        self.lPostLargeSell = 0;
        self.fClose = 0;
        self.ePanKouType = E_PKT_SUPER_BUY;
        self.lFenDan = 0;
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
    [ostream writeInt32: 2 value: self.iTime];
    [ostream writeFloat: 3 value: self.fNow];
    [ostream writeInt64: 4 value: self.lLargeBuy];
    [ostream writeInt64: 5 value: self.lLargeSell];
    [ostream writeInt64: 6 value: self.lSuperBuy];
    [ostream writeInt64: 7 value: self.lSuperSell];
    [ostream writeInt64: 8 value: self.lSuperLargeBuy];
    [ostream writeInt64: 9 value: self.lSuperLargeSell];
    [ostream writeInt64: 10 value: self.lCancelBuy];
    [ostream writeInt64: 11 value: self.lCancelSell];
    [ostream writeInt64: 12 value: self.lPostLargeBuy];
    [ostream writeInt64: 13 value: self.lPostLargeSell];
    [ostream writeFloat: 14 value: self.fClose];
    [ostream writeInt32: 15 value: (int32_t)self.ePanKouType];
    [ostream writeInt64: 16 value: self.lFenDan];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LargeUnitDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSecName = [istream readStringDef: 0 required: false def: self.sSecName];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.iTime = [istream readInt32Def: 2 required: false def: self.iTime];
    self.fNow = [istream readFloatDef: 3 required: false def: self.fNow];
    self.lLargeBuy = [istream readInt64Def: 4 required: false def: self.lLargeBuy];
    self.lLargeSell = [istream readInt64Def: 5 required: false def: self.lLargeSell];
    self.lSuperBuy = [istream readInt64Def: 6 required: false def: self.lSuperBuy];
    self.lSuperSell = [istream readInt64Def: 7 required: false def: self.lSuperSell];
    self.lSuperLargeBuy = [istream readInt64Def: 8 required: false def: self.lSuperLargeBuy];
    self.lSuperLargeSell = [istream readInt64Def: 9 required: false def: self.lSuperLargeSell];
    self.lCancelBuy = [istream readInt64Def: 10 required: false def: self.lCancelBuy];
    self.lCancelSell = [istream readInt64Def: 11 required: false def: self.lCancelSell];
    self.lPostLargeBuy = [istream readInt64Def: 12 required: false def: self.lPostLargeBuy];
    self.lPostLargeSell = [istream readInt64Def: 13 required: false def: self.lPostLargeSell];
    self.fClose = [istream readFloatDef: 14 required: false def: self.fClose];
    self.ePanKouType = [istream readInt32Def: 15 required: false def: (int32_t)self.ePanKouType];
    self.lFenDan = [istream readInt64Def: 16 required: false def: self.lFenDan];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    [JsonRoot append:@"fNow" value : [BaseJSON writeFloat : self.fNow]];
    [JsonRoot append:@"lLargeBuy" value : [BaseJSON writeInt64 : self.lLargeBuy]];
    [JsonRoot append:@"lLargeSell" value : [BaseJSON writeInt64 : self.lLargeSell]];
    [JsonRoot append:@"lSuperBuy" value : [BaseJSON writeInt64 : self.lSuperBuy]];
    [JsonRoot append:@"lSuperSell" value : [BaseJSON writeInt64 : self.lSuperSell]];
    [JsonRoot append:@"lSuperLargeBuy" value : [BaseJSON writeInt64 : self.lSuperLargeBuy]];
    [JsonRoot append:@"lSuperLargeSell" value : [BaseJSON writeInt64 : self.lSuperLargeSell]];
    [JsonRoot append:@"lCancelBuy" value : [BaseJSON writeInt64 : self.lCancelBuy]];
    [JsonRoot append:@"lCancelSell" value : [BaseJSON writeInt64 : self.lCancelSell]];
    [JsonRoot append:@"lPostLargeBuy" value : [BaseJSON writeInt64 : self.lPostLargeBuy]];
    [JsonRoot append:@"lPostLargeSell" value : [BaseJSON writeInt64 : self.lPostLargeSell]];
    [JsonRoot append:@"fClose" value : [BaseJSON writeFloat : self.fClose]];
    [JsonRoot append:@"ePanKouType" value : [BaseJSON writeInt32 : (int32_t)self.ePanKouType]];
    [JsonRoot append:@"lFenDan" value : [BaseJSON writeInt64 : self.lFenDan]];
    return JsonRoot;
}

- (LargeUnitDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSecName = [BaseJSON readStringDef:[RootMap objectForKey:@"sSecName"] required:false def:self.sSecName];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    self.fNow = [BaseJSON readFloatDef:[RootMap objectForKey:@"fNow"] required:false def:self.fNow];
    self.lLargeBuy = [BaseJSON readInt64Def:[RootMap objectForKey:@"lLargeBuy"] required:false def:self.lLargeBuy];
    self.lLargeSell = [BaseJSON readInt64Def:[RootMap objectForKey:@"lLargeSell"] required:false def:self.lLargeSell];
    self.lSuperBuy = [BaseJSON readInt64Def:[RootMap objectForKey:@"lSuperBuy"] required:false def:self.lSuperBuy];
    self.lSuperSell = [BaseJSON readInt64Def:[RootMap objectForKey:@"lSuperSell"] required:false def:self.lSuperSell];
    self.lSuperLargeBuy = [BaseJSON readInt64Def:[RootMap objectForKey:@"lSuperLargeBuy"] required:false def:self.lSuperLargeBuy];
    self.lSuperLargeSell = [BaseJSON readInt64Def:[RootMap objectForKey:@"lSuperLargeSell"] required:false def:self.lSuperLargeSell];
    self.lCancelBuy = [BaseJSON readInt64Def:[RootMap objectForKey:@"lCancelBuy"] required:false def:self.lCancelBuy];
    self.lCancelSell = [BaseJSON readInt64Def:[RootMap objectForKey:@"lCancelSell"] required:false def:self.lCancelSell];
    self.lPostLargeBuy = [BaseJSON readInt64Def:[RootMap objectForKey:@"lPostLargeBuy"] required:false def:self.lPostLargeBuy];
    self.lPostLargeSell = [BaseJSON readInt64Def:[RootMap objectForKey:@"lPostLargeSell"] required:false def:self.lPostLargeSell];
    self.fClose = [BaseJSON readFloatDef:[RootMap objectForKey:@"fClose"] required:false def:self.fClose];
    self.ePanKouType = [BaseJSON readInt32Def:[RootMap objectForKey:@"ePanKouType"] required:false def:(int32_t)self.ePanKouType];
    self.lFenDan = [BaseJSON readInt64Def:[RootMap objectForKey:@"lFenDan"] required:false def:self.lFenDan];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LargeUnitDescListReq
- (id) init
{
    if (self = [super init])
    {
        self.iTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LargeUnitDescListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTime = [istream readInt32Def: 0 required: false def: self.iTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    return JsonRoot;
}

- (LargeUnitDescListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LargeUnitDescListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vLargeUnitDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vLargeUnitDesc != nil)
    {
        [ostream writeList: 0 value: self.vLargeUnitDesc VAR_TYPE: [THOTH_LIST CREATE: [LargeUnitDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LargeUnitDescListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vLargeUnitDesc = [istream readListDef: 0 required: false def: self.vLargeUnitDesc VAR_TYPE: [THOTH_LIST CREATE: [LargeUnitDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vLargeUnitDesc" value : [BaseJSON writeList : self.vLargeUnitDesc VAR_TYPE: [THOTH_LIST CREATE: [LargeUnitDesc class]]]];
    return JsonRoot;
}

- (LargeUnitDescListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vLargeUnitDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vLargeUnitDesc"] required:false def:self.vLargeUnitDesc VAR_TYPE: [THOTH_LIST CREATE: [LargeUnitDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LargeUnitReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.iNum = 0;
        self.iTimeStamp = 0;
        self.iSort = 0;
        self.iDirection = 0;
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
    [ostream writeInt32: 2 value: self.iNum];
    [ostream writeInt32: 3 value: self.iTimeStamp];
    [ostream writeInt32: 4 value: self.iSort];
    [ostream writeInt32: 5 value: self.iDirection];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LargeUnitReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.iNum = [istream readInt32Def: 2 required: false def: self.iNum];
    self.iTimeStamp = [istream readInt32Def: 3 required: false def: self.iTimeStamp];
    self.iSort = [istream readInt32Def: 4 required: false def: self.iSort];
    self.iDirection = [istream readInt32Def: 5 required: false def: self.iDirection];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iNum" value : [BaseJSON writeInt32 : self.iNum]];
    [JsonRoot append:@"iTimeStamp" value : [BaseJSON writeInt32 : self.iTimeStamp]];
    [JsonRoot append:@"iSort" value : [BaseJSON writeInt32 : self.iSort]];
    [JsonRoot append:@"iDirection" value : [BaseJSON writeInt32 : self.iDirection]];
    return JsonRoot;
}

- (LargeUnitReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNum"] required:false def:self.iNum];
    self.iTimeStamp = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTimeStamp"] required:false def:self.iTimeStamp];
    self.iSort = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSort"] required:false def:self.iSort];
    self.iDirection = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDirection"] required:false def:self.iDirection];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LargeUnitRsp
- (id) init
{
    if (self = [super init])
    {
        self.vLargeUnitDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vLargeUnitDesc != nil)
    {
        [ostream writeList: 0 value: self.vLargeUnitDesc VAR_TYPE: [THOTH_LIST CREATE: [LargeUnitDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LargeUnitRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vLargeUnitDesc = [istream readListDef: 0 required: false def: self.vLargeUnitDesc VAR_TYPE: [THOTH_LIST CREATE: [LargeUnitDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vLargeUnitDesc" value : [BaseJSON writeList : self.vLargeUnitDesc VAR_TYPE: [THOTH_LIST CREATE: [LargeUnitDesc class]]]];
    return JsonRoot;
}

- (LargeUnitRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vLargeUnitDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vLargeUnitDesc"] required:false def:self.vLargeUnitDesc VAR_TYPE: [THOTH_LIST CREATE: [LargeUnitDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RecentLargeUnitReq
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

- (RecentLargeUnitReq *) read: (BaseDecodeStream *)istream
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

- (RecentLargeUnitReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation RecentLargeUnit
- (id) init
{
    if (self = [super init])
    {
        self.stDesc = [[LargeUnitDesc alloc] init];
        self.iTotalNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stDesc != nil)
    {
        [ostream writeMessage: 0 value: self.stDesc];
    }
    [ostream writeInt32: 1 value: self.iTotalNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RecentLargeUnit *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stDesc = (LargeUnitDesc*)[istream readMessageDef: 0 required: false def: self.stDesc VAR_TYPE: [LargeUnitDesc class]];
    self.iTotalNum = [istream readInt32Def: 1 required: false def: self.iTotalNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stDesc" value : [BaseJSON writeMessage : self.stDesc]];
    [JsonRoot append:@"iTotalNum" value : [BaseJSON writeInt32 : self.iTotalNum]];
    return JsonRoot;
}

- (RecentLargeUnit *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stDesc = [BaseJSON readMessageDef:[RootMap objectForKey:@"stDesc"] required:false def:self.stDesc VAR_TYPE: [LargeUnitDesc class]];
    self.iTotalNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalNum"] required:false def:self.iTotalNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation RecentLargeUnitRsp
- (id) init
{
    if (self = [super init])
    {
        self.mLargeUnitDesc = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mLargeUnitDesc != nil)
    {
        [ostream writeMap: 0 value: self.mLargeUnitDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [RecentLargeUnit class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RecentLargeUnitRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mLargeUnitDesc = [istream readMapDef: 0 required: false def: self.mLargeUnitDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [RecentLargeUnit class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mLargeUnitDesc" value : [BaseJSON writeMap : self.mLargeUnitDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [RecentLargeUnit class]]]];
    return JsonRoot;
}

- (RecentLargeUnitRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mLargeUnitDesc = [BaseJSON readMapDef:[RootMap objectForKey:@"mLargeUnitDesc"] required:false def:self.mLargeUnitDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [RecentLargeUnit class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarketStatDesc
- (id) init
{
    if (self = [super init])
    {
        self.iTime = 0;
        self.iChange10 = 0;
        self.iChange5 = 0;
        self.iChangeN5 = 0;
        self.iChangeN10 = 0;
        self.iChangeMax = 0;
        self.iChangeMin = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTime];
    [ostream writeInt32: 1 value: self.iChange10];
    [ostream writeInt32: 2 value: self.iChange5];
    [ostream writeInt32: 3 value: self.iChangeN5];
    [ostream writeInt32: 4 value: self.iChangeN10];
    [ostream writeInt32: 5 value: self.iChangeMax];
    [ostream writeInt32: 6 value: self.iChangeMin];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketStatDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTime = [istream readInt32Def: 0 required: false def: self.iTime];
    self.iChange10 = [istream readInt32Def: 1 required: false def: self.iChange10];
    self.iChange5 = [istream readInt32Def: 2 required: false def: self.iChange5];
    self.iChangeN5 = [istream readInt32Def: 3 required: false def: self.iChangeN5];
    self.iChangeN10 = [istream readInt32Def: 4 required: false def: self.iChangeN10];
    self.iChangeMax = [istream readInt32Def: 5 required: false def: self.iChangeMax];
    self.iChangeMin = [istream readInt32Def: 6 required: false def: self.iChangeMin];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iTime" value : [BaseJSON writeInt32 : self.iTime]];
    [JsonRoot append:@"iChange10" value : [BaseJSON writeInt32 : self.iChange10]];
    [JsonRoot append:@"iChange5" value : [BaseJSON writeInt32 : self.iChange5]];
    [JsonRoot append:@"iChangeN5" value : [BaseJSON writeInt32 : self.iChangeN5]];
    [JsonRoot append:@"iChangeN10" value : [BaseJSON writeInt32 : self.iChangeN10]];
    [JsonRoot append:@"iChangeMax" value : [BaseJSON writeInt32 : self.iChangeMax]];
    [JsonRoot append:@"iChangeMin" value : [BaseJSON writeInt32 : self.iChangeMin]];
    return JsonRoot;
}

- (MarketStatDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTime"] required:false def:self.iTime];
    self.iChange10 = [BaseJSON readInt32Def:[RootMap objectForKey:@"iChange10"] required:false def:self.iChange10];
    self.iChange5 = [BaseJSON readInt32Def:[RootMap objectForKey:@"iChange5"] required:false def:self.iChange5];
    self.iChangeN5 = [BaseJSON readInt32Def:[RootMap objectForKey:@"iChangeN5"] required:false def:self.iChangeN5];
    self.iChangeN10 = [BaseJSON readInt32Def:[RootMap objectForKey:@"iChangeN10"] required:false def:self.iChangeN10];
    self.iChangeMax = [BaseJSON readInt32Def:[RootMap objectForKey:@"iChangeMax"] required:false def:self.iChangeMax];
    self.iChangeMin = [BaseJSON readInt32Def:[RootMap objectForKey:@"iChangeMin"] required:false def:self.iChangeMin];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarketStatReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iStartxh = 0;
        self.iWantnum = 0;
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
    [ostream writeInt32: 1 value: self.iStartxh];
    [ostream writeInt32: 2 value: self.iWantnum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketStatReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iStartxh = [istream readInt32Def: 1 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 2 required: false def: self.iWantnum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    return JsonRoot;
}

- (MarketStatReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarketStatMap
- (id) init
{
    if (self = [super init])
    {
        self.mMarketStatDesc = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mMarketStatDesc != nil)
    {
        [ostream writeMap: 0 value: self.mMarketStatDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [MarketStatDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketStatMap *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mMarketStatDesc = [istream readMapDef: 0 required: false def: self.mMarketStatDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [MarketStatDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"mMarketStatDesc" value : [BaseJSON writeMap : self.mMarketStatDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [MarketStatDesc class]]]];
    return JsonRoot;
}

- (MarketStatMap *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mMarketStatDesc = [BaseJSON readMapDef:[RootMap objectForKey:@"mMarketStatDesc"] required:false def:self.mMarketStatDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [MarketStatDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarketStatList
- (id) init
{
    if (self = [super init])
    {
        self.vMarketStatDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vMarketStatDesc != nil)
    {
        [ostream writeList: 0 value: self.vMarketStatDesc VAR_TYPE: [THOTH_LIST CREATE: [MarketStatDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketStatList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vMarketStatDesc = [istream readListDef: 0 required: false def: self.vMarketStatDesc VAR_TYPE: [THOTH_LIST CREATE: [MarketStatDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vMarketStatDesc" value : [BaseJSON writeList : self.vMarketStatDesc VAR_TYPE: [THOTH_LIST CREATE: [MarketStatDesc class]]]];
    return JsonRoot;
}

- (MarketStatList *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vMarketStatDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vMarketStatDesc"] required:false def:self.vMarketStatDesc VAR_TYPE: [THOTH_LIST CREATE: [MarketStatDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarketStatRsp
- (id) init
{
    if (self = [super init])
    {
        self.stMarketStatList = [[MarketStatList alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stMarketStatList != nil)
    {
        [ostream writeMessage: 0 value: self.stMarketStatList];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketStatRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stMarketStatList = (MarketStatList*)[istream readMessageDef: 0 required: false def: self.stMarketStatList VAR_TYPE: [MarketStatList class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stMarketStatList" value : [BaseJSON writeMessage : self.stMarketStatList]];
    return JsonRoot;
}

- (MarketStatRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stMarketStatList = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMarketStatList"] required:false def:self.stMarketStatList VAR_TYPE: [MarketStatList class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TransStatDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eTranStatType = E_FST_BUY;
        self.iNo = 0;
        self.lTotalAmt = 0;
        self.fPriceAvg = 0;
        self.lTotalVol = 0;
        self.iLastTime = 0;
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
    [ostream writeInt32: 1 value: (int32_t)self.eTranStatType];
    [ostream writeInt32: 2 value: self.iNo];
    [ostream writeInt64: 3 value: self.lTotalAmt];
    [ostream writeFloat: 4 value: self.fPriceAvg];
    [ostream writeInt64: 5 value: self.lTotalVol];
    [ostream writeInt32: 6 value: self.iLastTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TransStatDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eTranStatType = [istream readInt32Def: 1 required: false def: (int32_t)self.eTranStatType];
    self.iNo = [istream readInt32Def: 2 required: false def: self.iNo];
    self.lTotalAmt = [istream readInt64Def: 3 required: false def: self.lTotalAmt];
    self.fPriceAvg = [istream readFloatDef: 4 required: false def: self.fPriceAvg];
    self.lTotalVol = [istream readInt64Def: 5 required: false def: self.lTotalVol];
    self.iLastTime = [istream readInt32Def: 6 required: false def: self.iLastTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"eTranStatType" value : [BaseJSON writeInt32 : (int32_t)self.eTranStatType]];
    [JsonRoot append:@"iNo" value : [BaseJSON writeInt32 : self.iNo]];
    [JsonRoot append:@"lTotalAmt" value : [BaseJSON writeInt64 : self.lTotalAmt]];
    [JsonRoot append:@"fPriceAvg" value : [BaseJSON writeFloat : self.fPriceAvg]];
    [JsonRoot append:@"lTotalVol" value : [BaseJSON writeInt64 : self.lTotalVol]];
    [JsonRoot append:@"iLastTime" value : [BaseJSON writeInt32 : self.iLastTime]];
    return JsonRoot;
}

- (TransStatDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.eTranStatType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eTranStatType"] required:false def:(int32_t)self.eTranStatType];
    self.iNo = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNo"] required:false def:self.iNo];
    self.lTotalAmt = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTotalAmt"] required:false def:self.lTotalAmt];
    self.fPriceAvg = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPriceAvg"] required:false def:self.fPriceAvg];
    self.lTotalVol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTotalVol"] required:false def:self.lTotalVol];
    self.iLastTime = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLastTime"] required:false def:self.iLastTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TransStat
- (id) init
{
    if (self = [super init])
    {
        self.vTransStatDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vTransStatDesc != nil)
    {
        [ostream writeList: 0 value: self.vTransStatDesc VAR_TYPE: [THOTH_LIST CREATE: [TransStatDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TransStat *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTransStatDesc = [istream readListDef: 0 required: false def: self.vTransStatDesc VAR_TYPE: [THOTH_LIST CREATE: [TransStatDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vTransStatDesc" value : [BaseJSON writeList : self.vTransStatDesc VAR_TYPE: [THOTH_LIST CREATE: [TransStatDesc class]]]];
    return JsonRoot;
}

- (TransStat *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vTransStatDesc = [BaseJSON readListDef:[RootMap objectForKey:@"vTransStatDesc"] required:false def:self.vTransStatDesc VAR_TYPE: [THOTH_LIST CREATE: [TransStatDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TransStatReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.iStartxh = 0;
        self.iWantnum = 0;
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
    [ostream writeInt32: 2 value: self.iStartxh];
    [ostream writeInt32: 3 value: self.iWantnum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TransStatReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.iStartxh = [istream readInt32Def: 2 required: false def: self.iStartxh];
    self.iWantnum = [istream readInt32Def: 3 required: false def: self.iWantnum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
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
    [JsonRoot append:@"iStartxh" value : [BaseJSON writeInt32 : self.iStartxh]];
    [JsonRoot append:@"iWantnum" value : [BaseJSON writeInt32 : self.iWantnum]];
    return JsonRoot;
}

- (TransStatReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.iStartxh = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStartxh"] required:false def:self.iStartxh];
    self.iWantnum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantnum"] required:false def:self.iWantnum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation TransStatRsp
- (id) init
{
    if (self = [super init])
    {
        self.stTransStatBuy = [[TransStat alloc] init];
        self.stTransStatSell = [[TransStat alloc] init];
        self.lTotalBuyAmt = 0;
        self.lTotalSellAmt = 0;
        self.fPriceAvg = 0;
        self.lTotalBuyVol = 0;
        self.lTotalSellVol = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stTransStatBuy != nil)
    {
        [ostream writeMessage: 0 value: self.stTransStatBuy];
    }
    if (self.stTransStatSell != nil)
    {
        [ostream writeMessage: 1 value: self.stTransStatSell];
    }
    [ostream writeInt64: 2 value: self.lTotalBuyAmt];
    [ostream writeInt64: 3 value: self.lTotalSellAmt];
    [ostream writeFloat: 4 value: self.fPriceAvg];
    [ostream writeInt64: 5 value: self.lTotalBuyVol];
    [ostream writeInt64: 6 value: self.lTotalSellVol];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TransStatRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stTransStatBuy = (TransStat*)[istream readMessageDef: 0 required: false def: self.stTransStatBuy VAR_TYPE: [TransStat class]];
    self.stTransStatSell = (TransStat*)[istream readMessageDef: 1 required: false def: self.stTransStatSell VAR_TYPE: [TransStat class]];
    self.lTotalBuyAmt = [istream readInt64Def: 2 required: false def: self.lTotalBuyAmt];
    self.lTotalSellAmt = [istream readInt64Def: 3 required: false def: self.lTotalSellAmt];
    self.fPriceAvg = [istream readFloatDef: 4 required: false def: self.fPriceAvg];
    self.lTotalBuyVol = [istream readInt64Def: 5 required: false def: self.lTotalBuyVol];
    self.lTotalSellVol = [istream readInt64Def: 6 required: false def: self.lTotalSellVol];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stTransStatBuy" value : [BaseJSON writeMessage : self.stTransStatBuy]];
    [JsonRoot append:@"stTransStatSell" value : [BaseJSON writeMessage : self.stTransStatSell]];
    [JsonRoot append:@"lTotalBuyAmt" value : [BaseJSON writeInt64 : self.lTotalBuyAmt]];
    [JsonRoot append:@"lTotalSellAmt" value : [BaseJSON writeInt64 : self.lTotalSellAmt]];
    [JsonRoot append:@"fPriceAvg" value : [BaseJSON writeFloat : self.fPriceAvg]];
    [JsonRoot append:@"lTotalBuyVol" value : [BaseJSON writeInt64 : self.lTotalBuyVol]];
    [JsonRoot append:@"lTotalSellVol" value : [BaseJSON writeInt64 : self.lTotalSellVol]];
    return JsonRoot;
}

- (TransStatRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stTransStatBuy = [BaseJSON readMessageDef:[RootMap objectForKey:@"stTransStatBuy"] required:false def:self.stTransStatBuy VAR_TYPE: [TransStat class]];
    self.stTransStatSell = [BaseJSON readMessageDef:[RootMap objectForKey:@"stTransStatSell"] required:false def:self.stTransStatSell VAR_TYPE: [TransStat class]];
    self.lTotalBuyAmt = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTotalBuyAmt"] required:false def:self.lTotalBuyAmt];
    self.lTotalSellAmt = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTotalSellAmt"] required:false def:self.lTotalSellAmt];
    self.fPriceAvg = [BaseJSON readFloatDef:[RootMap objectForKey:@"fPriceAvg"] required:false def:self.fPriceAvg];
    self.lTotalBuyVol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTotalBuyVol"] required:false def:self.lTotalBuyVol];
    self.lTotalSellVol = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTotalSellVol"] required:false def:self.lTotalSellVol];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

