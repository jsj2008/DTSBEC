#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "MarketAlert.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation DtMarketAlert
- (id) init
{
    if (self = [super init])
    {
        self.sDate = @"";
        self.iMakertAlert = 0;
        self.fAIndex = 0;
        self.fMarginTrade = 0;
        self.fAHExtend = 0;
        self.fNewInvestor = 0;
        self.fTradeAInvestorPer = 0;
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
    [ostream writeInt32: 1 value: self.iMakertAlert];
    [ostream writeFloat: 2 value: self.fAIndex];
    [ostream writeFloat: 3 value: self.fMarginTrade];
    [ostream writeFloat: 4 value: self.fAHExtend];
    [ostream writeFloat: 5 value: self.fNewInvestor];
    [ostream writeFloat: 6 value: self.fTradeAInvestorPer];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtMarketAlert *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDate = [istream readStringDef: 0 required: false def: self.sDate];
    self.iMakertAlert = [istream readInt32Def: 1 required: false def: self.iMakertAlert];
    self.fAIndex = [istream readFloatDef: 2 required: false def: self.fAIndex];
    self.fMarginTrade = [istream readFloatDef: 3 required: false def: self.fMarginTrade];
    self.fAHExtend = [istream readFloatDef: 4 required: false def: self.fAHExtend];
    self.fNewInvestor = [istream readFloatDef: 5 required: false def: self.fNewInvestor];
    self.fTradeAInvestorPer = [istream readFloatDef: 6 required: false def: self.fTradeAInvestorPer];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation MaxDateValue
- (id) init
{
    if (self = [super init])
    {
        self.sMaxDate = @"";
        self.fMaxValue = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sMaxDate != nil)
    {
        [ostream writeString: 0 value: self.sMaxDate];
    }
    [ostream writeFloat: 1 value: self.fMaxValue];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MaxDateValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sMaxDate = [istream readStringDef: 0 required: false def: self.sMaxDate];
    self.fMaxValue = [istream readFloatDef: 1 required: false def: self.fMaxValue];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation MarketAlertReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iStart = 0;
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
    [ostream writeUInt32: 1 value: self.iStart];
    [ostream writeUInt32: 2 value: self.iSize];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketAlertReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iStart = [istream readUInt32Def: 1 required: false def: self.iStart];
    self.iSize = [istream readUInt32Def: 2 required: false def: self.iSize];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation MarketAlertRsp
- (id) init
{
    if (self = [super init])
    {
        self.iDtAIndex = 0;
        self.iMarketMoney = 0;
        self.iMarketHot = 0;
        self.stMaxMarketAlert = [[MaxDateValue alloc] init];
        self.stMaxDtAIndex = [[MaxDateValue alloc] init];
        self.stMaxMarginTrade = [[MaxDateValue alloc] init];
        self.stMaxAHExtend = [[MaxDateValue alloc] init];
        self.stMaxNewInvestor = [[MaxDateValue alloc] init];
        self.stMaxTradeAInvestorPer = [[MaxDateValue alloc] init];
        self.vDtMarketAlert = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iDtAIndex];
    [ostream writeInt32: 1 value: self.iMarketMoney];
    [ostream writeInt32: 2 value: self.iMarketHot];
    if (self.stMaxMarketAlert != nil)
    {
        [ostream writeMessage: 3 value: self.stMaxMarketAlert];
    }
    if (self.stMaxDtAIndex != nil)
    {
        [ostream writeMessage: 4 value: self.stMaxDtAIndex];
    }
    if (self.stMaxMarginTrade != nil)
    {
        [ostream writeMessage: 5 value: self.stMaxMarginTrade];
    }
    if (self.stMaxAHExtend != nil)
    {
        [ostream writeMessage: 6 value: self.stMaxAHExtend];
    }
    if (self.stMaxNewInvestor != nil)
    {
        [ostream writeMessage: 7 value: self.stMaxNewInvestor];
    }
    if (self.stMaxTradeAInvestorPer != nil)
    {
        [ostream writeMessage: 8 value: self.stMaxTradeAInvestorPer];
    }
    if (self.vDtMarketAlert != nil)
    {
        [ostream writeList: 9 value: self.vDtMarketAlert VAR_TYPE: [THOTH_LIST CREATE: [DtMarketAlert class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketAlertRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iDtAIndex = [istream readInt32Def: 0 required: false def: self.iDtAIndex];
    self.iMarketMoney = [istream readInt32Def: 1 required: false def: self.iMarketMoney];
    self.iMarketHot = [istream readInt32Def: 2 required: false def: self.iMarketHot];
    self.stMaxMarketAlert = (MaxDateValue*)[istream readMessageDef: 3 required: false def: self.stMaxMarketAlert VAR_TYPE: [MaxDateValue class]];
    self.stMaxDtAIndex = (MaxDateValue*)[istream readMessageDef: 4 required: false def: self.stMaxDtAIndex VAR_TYPE: [MaxDateValue class]];
    self.stMaxMarginTrade = (MaxDateValue*)[istream readMessageDef: 5 required: false def: self.stMaxMarginTrade VAR_TYPE: [MaxDateValue class]];
    self.stMaxAHExtend = (MaxDateValue*)[istream readMessageDef: 6 required: false def: self.stMaxAHExtend VAR_TYPE: [MaxDateValue class]];
    self.stMaxNewInvestor = (MaxDateValue*)[istream readMessageDef: 7 required: false def: self.stMaxNewInvestor VAR_TYPE: [MaxDateValue class]];
    self.stMaxTradeAInvestorPer = (MaxDateValue*)[istream readMessageDef: 8 required: false def: self.stMaxTradeAInvestorPer VAR_TYPE: [MaxDateValue class]];
    self.vDtMarketAlert = [istream readListDef: 9 required: false def: self.vDtMarketAlert VAR_TYPE: [THOTH_LIST CREATE: [DtMarketAlert class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

