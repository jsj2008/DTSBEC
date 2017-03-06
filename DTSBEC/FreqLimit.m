#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "FreqLimit.h"

//////////////////////////////////////////////////////////////
@implementation LimitReq
- (id) init
{
    if (self = [super init])
    {
        self.sGuid = @"";
        self.sBussinessId = @"";
        self.sStrategyId = @"";
        self.vtKey = [NSMutableArray arrayWithCapacity:0];
        self.bUpdateData = true;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sGuid != nil)
    {
        [ostream writeString: 0 value: self.sGuid];
    }
    if (self.sBussinessId != nil)
    {
        [ostream writeString: 1 value: self.sBussinessId];
    }
    if (self.sStrategyId != nil)
    {
        [ostream writeString: 2 value: self.sStrategyId];
    }
    if (self.vtKey != nil)
    {
        [ostream writeList: 3 value: self.vtKey VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    [ostream writeBoolean: 4 value: self.bUpdateData];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LimitReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sGuid = [istream readStringDef: 0 required: false def: self.sGuid];
    self.sBussinessId = [istream readStringDef: 1 required: false def: self.sBussinessId];
    self.sStrategyId = [istream readStringDef: 2 required: false def: self.sStrategyId];
    self.vtKey = [istream readListDef: 3 required: false def: self.vtKey VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.bUpdateData = [istream readBooleanDef: 4 required: false def: self.bUpdateData];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation LimitRsp
- (id) init
{
    if (self = [super init])
    {
        self.mpLimitRet = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mpLimitRet != nil)
    {
        [ostream writeMap: 0 value: self.mpLimitRet VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LimitRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mpLimitRet = [istream readMapDef: 0 required: false def: self.mpLimitRet VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation CacheValue
- (id) init
{
    if (self = [super init])
    {
        self.iLastTime = 0;
        self.iCount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iLastTime];
    [ostream writeInt32: 1 value: self.iCount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CacheValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iLastTime = [istream readInt32Def: 0 required: false def: self.iLastTime];
    self.iCount = [istream readInt32Def: 1 required: false def: self.iCount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

