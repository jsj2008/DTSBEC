#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
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
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
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
@end

//////////////////////////////////////////////////////////////
@implementation TrendRsp
- (id) init
{
    if (self = [super init])
    {
        self.vTrendDesc = [NSMutableArray arrayWithCapacity:0];
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TrendRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTrendDesc = [istream readListDef: 0 required: false def: self.vTrendDesc VAR_TYPE: [THOTH_LIST CREATE: [TrendDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
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
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
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
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
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
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
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
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
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
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LargeUnitReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.iNum = [istream readInt32Def: 2 required: false def: self.iNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
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
@end

