#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "JsonResult.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation SecPortraitUpdowns
- (id) init
{
    if (self = [super init])
    {
        self.iTradeDate = 0;
        self.sUpDowns = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTradeDate];
    if (self.sUpDowns != nil)
    {
        [ostream writeString: 1 value: self.sUpDowns];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecPortraitUpdowns *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTradeDate = [istream readInt32Def: 0 required: false def: self.iTradeDate];
    self.sUpDowns = [istream readStringDef: 1 required: false def: self.sUpDowns];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecPortraitIndustry
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.vtUpdowns = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vtUpdowns != nil)
    {
        [ostream writeList: 1 value: self.vtUpdowns VAR_TYPE: [THOTH_LIST CREATE: [SecPortraitUpdowns class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecPortraitIndustry *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.vtUpdowns = [istream readListDef: 1 required: false def: self.vtUpdowns VAR_TYPE: [THOTH_LIST CREATE: [SecPortraitUpdowns class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecPortraitMarket
- (id) init
{
    if (self = [super init])
    {
        self.stStockUpdowns = [[SecPortraitIndustry alloc] init];
        self.stIndexUpdowns = [[SecPortraitIndustry alloc] init];
        self.stPlateUpdowns = [[SecPortraitIndustry alloc] init];
        self.sDesc = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stStockUpdowns != nil)
    {
        [ostream writeMessage: 0 value: self.stStockUpdowns];
    }
    if (self.stIndexUpdowns != nil)
    {
        [ostream writeMessage: 1 value: self.stIndexUpdowns];
    }
    if (self.stPlateUpdowns != nil)
    {
        [ostream writeMessage: 2 value: self.stPlateUpdowns];
    }
    if (self.sDesc != nil)
    {
        [ostream writeString: 3 value: self.sDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecPortraitMarket *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stStockUpdowns = (SecPortraitIndustry*)[istream readMessageDef: 0 required: false def: self.stStockUpdowns VAR_TYPE: [SecPortraitIndustry class]];
    self.stIndexUpdowns = (SecPortraitIndustry*)[istream readMessageDef: 1 required: false def: self.stIndexUpdowns VAR_TYPE: [SecPortraitIndustry class]];
    self.stPlateUpdowns = (SecPortraitIndustry*)[istream readMessageDef: 2 required: false def: self.stPlateUpdowns VAR_TYPE: [SecPortraitIndustry class]];
    self.sDesc = [istream readStringDef: 3 required: false def: self.sDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecRelaLastUpDowns
- (id) init
{
    if (self = [super init])
    {
        self.vtSecUpdowns = [NSMutableArray arrayWithCapacity:0];
        self.sDesc = @"";
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
    if (self.sDesc != nil)
    {
        [ostream writeString: 1 value: self.sDesc];
    }
    [ostream writeInt32: 2 value: self.iUpdateTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecRelaLastUpDowns *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtSecUpdowns = [istream readListDef: 0 required: false def: self.vtSecUpdowns VAR_TYPE: [THOTH_LIST CREATE: [SecUpdowns class]]];
    self.sDesc = [istream readStringDef: 1 required: false def: self.sDesc];
    self.iUpdateTime = [istream readInt32Def: 2 required: false def: self.iUpdateTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecPerformance
- (id) init
{
    if (self = [super init])
    {
        self.vOperatingRevenue = [NSMutableArray arrayWithCapacity:0];
        self.sOperatingDesc = @"";
        self.vProfit = [NSMutableArray arrayWithCapacity:0];
        self.sProfitDesc = @"";
        self.eOPUnit = E_FRU_YUAN;
        self.eProfitUnit = E_FRU_YUAN;
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
    [ostream writeInt32: 4 value: (int32_t)self.eOPUnit];
    [ostream writeInt32: 5 value: (int32_t)self.eProfitUnit];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecPerformance *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vOperatingRevenue = [istream readListDef: 0 required: false def: self.vOperatingRevenue VAR_TYPE: [THOTH_LIST CREATE: [OperatingRevenue class]]];
    self.sOperatingDesc = [istream readStringDef: 1 required: false def: self.sOperatingDesc];
    self.vProfit = [istream readListDef: 2 required: false def: self.vProfit VAR_TYPE: [THOTH_LIST CREATE: [Profit class]]];
    self.sProfitDesc = [istream readStringDef: 3 required: false def: self.sProfitDesc];
    self.eOPUnit = [istream readInt32Def: 4 required: false def: (int32_t)self.eOPUnit];
    self.eProfitUnit = [istream readInt32Def: 5 required: false def: (int32_t)self.eProfitUnit];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation RelaSecPerformance
- (id) init
{
    if (self = [super init])
    {
        self.vtPerformance = [NSMutableArray arrayWithCapacity:0];
        self.sDesc = @"";
        self.iUpdateTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtPerformance != nil)
    {
        [ostream writeList: 0 value: self.vtPerformance VAR_TYPE: [THOTH_LIST CREATE: [SimpleFinancialAnalysis class]]];
    }
    if (self.sDesc != nil)
    {
        [ostream writeString: 1 value: self.sDesc];
    }
    [ostream writeInt32: 2 value: self.iUpdateTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RelaSecPerformance *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtPerformance = [istream readListDef: 0 required: false def: self.vtPerformance VAR_TYPE: [THOTH_LIST CREATE: [SimpleFinancialAnalysis class]]];
    self.sDesc = [istream readStringDef: 1 required: false def: self.sDesc];
    self.iUpdateTime = [istream readInt32Def: 2 required: false def: self.iUpdateTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ConcDetailRelaStock
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sStockName = @"";
        self.fRelaDegree = 0;
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
    if (self.sStockName != nil)
    {
        [ostream writeString: 1 value: self.sStockName];
    }
    [ostream writeFloat: 2 value: self.fRelaDegree];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcDetailRelaStock *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sStockName = [istream readStringDef: 1 required: false def: self.sStockName];
    self.fRelaDegree = [istream readFloatDef: 2 required: false def: self.fRelaDegree];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ConcDetailQuote
- (id) init
{
    if (self = [super init])
    {
        self.fConcUpdownsRange = 0;
        self.sUpdownsCount = @"";
        self.sConcDesc = @"";
        self.sConcName = @"";
        self.fHot = 0;
        self.vtConcDetailRelaStock = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeFloat: 0 value: self.fConcUpdownsRange];
    if (self.sUpdownsCount != nil)
    {
        [ostream writeString: 1 value: self.sUpdownsCount];
    }
    if (self.sConcDesc != nil)
    {
        [ostream writeString: 2 value: self.sConcDesc];
    }
    if (self.sConcName != nil)
    {
        [ostream writeString: 3 value: self.sConcName];
    }
    [ostream writeFloat: 4 value: self.fHot];
    if (self.vtConcDetailRelaStock != nil)
    {
        [ostream writeList: 5 value: self.vtConcDetailRelaStock VAR_TYPE: [THOTH_LIST CREATE: [ConcDetailRelaStock class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConcDetailQuote *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.fConcUpdownsRange = [istream readFloatDef: 0 required: false def: self.fConcUpdownsRange];
    self.sUpdownsCount = [istream readStringDef: 1 required: false def: self.sUpdownsCount];
    self.sConcDesc = [istream readStringDef: 2 required: false def: self.sConcDesc];
    self.sConcName = [istream readStringDef: 3 required: false def: self.sConcName];
    self.fHot = [istream readFloatDef: 4 required: false def: self.fHot];
    self.vtConcDetailRelaStock = [istream readListDef: 5 required: false def: self.vtConcDetailRelaStock VAR_TYPE: [THOTH_LIST CREATE: [ConcDetailRelaStock class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SearchStockResult
- (id) init
{
    if (self = [super init])
    {
        self.vStockItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vStockItem != nil)
    {
        [ostream writeList: 0 value: self.vStockItem VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SearchStockResult *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vStockItem = [istream readListDef: 0 required: false def: self.vStockItem VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

