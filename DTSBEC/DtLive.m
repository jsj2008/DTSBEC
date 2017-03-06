#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "DtLive.h"
#import "UserPortfolio.h"
#import "Beacon.h"
#import "Quote.h"
#import "SecBase.h"

//////////////////////////////////////////////////////////////
@implementation PortfolioLiveMsgDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sSecName = @"";
        self.iTime = 0;
        self.sMsg = @"";
        self.iMsgType = 0;
        self.iTotalNum = 0;
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
    [ostream writeInt32: 2 value: self.iTime];
    if (self.sMsg != nil)
    {
        [ostream writeString: 3 value: self.sMsg];
    }
    [ostream writeInt32: 4 value: self.iMsgType];
    [ostream writeInt32: 5 value: self.iTotalNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PortfolioLiveMsgDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sSecName = [istream readStringDef: 1 required: false def: self.sSecName];
    self.iTime = [istream readInt32Def: 2 required: false def: self.iTime];
    self.sMsg = [istream readStringDef: 3 required: false def: self.sMsg];
    self.iMsgType = [istream readInt32Def: 4 required: false def: self.iMsgType];
    self.iTotalNum = [istream readInt32Def: 5 required: false def: self.iTotalNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation MarketLiveMsgDesc
- (id) init
{
    if (self = [super init])
    {
        self.iTime = 0;
        self.iType = 0;
        self.sMsg = @"";
        self.iMsgType = 0;
        self.sSimpleMsg = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTime];
    [ostream writeInt32: 1 value: self.iType];
    if (self.sMsg != nil)
    {
        [ostream writeString: 2 value: self.sMsg];
    }
    [ostream writeInt32: 3 value: self.iMsgType];
    if (self.sSimpleMsg != nil)
    {
        [ostream writeString: 4 value: self.sSimpleMsg];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketLiveMsgDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTime = [istream readInt32Def: 0 required: false def: self.iTime];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    self.sMsg = [istream readStringDef: 2 required: false def: self.sMsg];
    self.iMsgType = [istream readInt32Def: 3 required: false def: self.iMsgType];
    self.sSimpleMsg = [istream readStringDef: 4 required: false def: self.sSimpleMsg];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetLiveReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iType = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iTime = 0;
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
    [ostream writeInt32: 1 value: self.iType];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    [ostream writeInt32: 3 value: self.iTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLiveReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iTime = [istream readInt32Def: 3 required: false def: self.iTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetLiveRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPortfolioLive = [NSMutableArray arrayWithCapacity:0];
        self.vMarketLive = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPortfolioLive != nil)
    {
        [ostream writeList: 0 value: self.vPortfolioLive VAR_TYPE: [THOTH_LIST CREATE: [PortfolioLiveMsgDesc class]]];
    }
    if (self.vMarketLive != nil)
    {
        [ostream writeList: 1 value: self.vMarketLive VAR_TYPE: [THOTH_LIST CREATE: [MarketLiveMsgDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLiveRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPortfolioLive = [istream readListDef: 0 required: false def: self.vPortfolioLive VAR_TYPE: [THOTH_LIST CREATE: [PortfolioLiveMsgDesc class]]];
    self.vMarketLive = [istream readListDef: 1 required: false def: self.vMarketLive VAR_TYPE: [THOTH_LIST CREATE: [MarketLiveMsgDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetBoxLiveReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iType = 0;
        self.iTime = 0;
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
    [ostream writeInt32: 2 value: self.iType];
    [ostream writeInt32: 3 value: self.iTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetBoxLiveReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iType = [istream readInt32Def: 2 required: false def: self.iType];
    self.iTime = [istream readInt32Def: 3 required: false def: self.iTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetBoxLiveRsp
- (id) init
{
    if (self = [super init])
    {
        self.sMsg = @"";
        self.sSkipUrl = @"";
        self.iMsgType = 0;
        self.iTime = 0;
        self.iLiveType = 0;
        self.iLiveMsgStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sMsg != nil)
    {
        [ostream writeString: 0 value: self.sMsg];
    }
    if (self.sSkipUrl != nil)
    {
        [ostream writeString: 1 value: self.sSkipUrl];
    }
    [ostream writeInt32: 2 value: self.iMsgType];
    [ostream writeInt32: 3 value: self.iTime];
    [ostream writeInt32: 4 value: self.iLiveType];
    [ostream writeInt32: 5 value: self.iLiveMsgStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetBoxLiveRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sMsg = [istream readStringDef: 0 required: false def: self.sMsg];
    self.sSkipUrl = [istream readStringDef: 1 required: false def: self.sSkipUrl];
    self.iMsgType = [istream readInt32Def: 2 required: false def: self.iMsgType];
    self.iTime = [istream readInt32Def: 3 required: false def: self.iTime];
    self.iLiveType = [istream readInt32Def: 4 required: false def: self.iLiveType];
    self.iLiveMsgStatus = [istream readInt32Def: 5 required: false def: self.iLiveMsgStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation RecordMakertDesc
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fOpen = 0;
        self.fNow = 0;
        self.fClose = 0;
        self.lVolume = 0;
        self.lAmount = 0;
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
    [ostream writeFloat: 1 value: self.fOpen];
    [ostream writeFloat: 2 value: self.fNow];
    [ostream writeFloat: 3 value: self.fClose];
    [ostream writeInt64: 4 value: self.lVolume];
    [ostream writeInt64: 5 value: self.lAmount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RecordMakertDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fOpen = [istream readFloatDef: 1 required: false def: self.fOpen];
    self.fNow = [istream readFloatDef: 2 required: false def: self.fNow];
    self.fClose = [istream readFloatDef: 3 required: false def: self.fClose];
    self.lVolume = [istream readInt64Def: 4 required: false def: self.lVolume];
    self.lAmount = [istream readInt64Def: 5 required: false def: self.lAmount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation RecordMakertMap
- (id) init
{
    if (self = [super init])
    {
        self.mRecordMakertDesc = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mRecordMakertDesc != nil)
    {
        [ostream writeMap: 0 value: self.mRecordMakertDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [RecordMakertDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RecordMakertMap *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mRecordMakertDesc = [istream readMapDef: 0 required: false def: self.mRecordMakertDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [RecordMakertDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation MarketLiveCacheInfo
- (id) init
{
    if (self = [super init])
    {
        self.vMarketLive = [NSMutableArray arrayWithCapacity:0];
        self.vSecLimit = [NSMutableArray arrayWithCapacity:0];
        self.sDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vMarketLive != nil)
    {
        [ostream writeList: 0 value: self.vMarketLive VAR_TYPE: [THOTH_LIST CREATE: [MarketLiveMsgDesc class]]];
    }
    if (self.vSecLimit != nil)
    {
        [ostream writeList: 1 value: self.vSecLimit VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.sDay != nil)
    {
        [ostream writeString: 2 value: self.sDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarketLiveCacheInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vMarketLive = [istream readListDef: 0 required: false def: self.vMarketLive VAR_TYPE: [THOTH_LIST CREATE: [MarketLiveMsgDesc class]]];
    self.vSecLimit = [istream readListDef: 1 required: false def: self.vSecLimit VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sDay = [istream readStringDef: 2 required: false def: self.sDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecLargeUnitInfo
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

- (SecLargeUnitInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stDesc = (LargeUnitDesc*)[istream readMessageDef: 0 required: false def: self.stDesc VAR_TYPE: [LargeUnitDesc class]];
    self.iTotalNum = [istream readInt32Def: 1 required: false def: self.iTotalNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation LargeUnitCacheInfo
- (id) init
{
    if (self = [super init])
    {
        self.mLargeUnit = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mLargeUnit != nil)
    {
        [ostream writeMap: 0 value: self.mLargeUnit VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [SecLargeUnitInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LargeUnitCacheInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mLargeUnit = [istream readMapDef: 0 required: false def: self.mLargeUnit VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [SecLargeUnitInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation MinLimitSecCacheInfo
- (id) init
{
    if (self = [super init])
    {
        self.vSecLimit = [NSMutableArray arrayWithCapacity:0];
        self.sDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSecLimit != nil)
    {
        [ostream writeList: 0 value: self.vSecLimit VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.sDay != nil)
    {
        [ostream writeString: 1 value: self.sDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MinLimitSecCacheInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSecLimit = [istream readListDef: 0 required: false def: self.vSecLimit VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sDay = [istream readStringDef: 1 required: false def: self.sDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ChoosedLimitSecCacheInfo
- (id) init
{
    if (self = [super init])
    {
        self.mChoosedLimitSec = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mChoosedLimitSec != nil)
    {
        [ostream writeMap: 0 value: self.mChoosedLimitSec VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ChoosedLimitSecCacheInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mChoosedLimitSec = [istream readMapDef: 0 required: false def: self.mChoosedLimitSec VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ChangeFor5MinCacheInfo
- (id) init
{
    if (self = [super init])
    {
        self.mChangeInfo = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mChangeInfo != nil)
    {
        [ostream writeMap: 0 value: self.mChangeInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ChangeFor5MinCacheInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mChangeInfo = [istream readMapDef: 0 required: false def: self.mChangeInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

