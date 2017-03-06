#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Check.h"
#import "NewsInfo.h"

//////////////////////////////////////////////////////////////
@implementation RefreshSecInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.vtFuncType = [NSMutableArray arrayWithCapacity:0];
        self.eNewsType = NT_UNKNOWN;
        self.sNewsId = @"";
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
    if (self.vtFuncType != nil)
    {
        [ostream writeList: 1 value: self.vtFuncType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    if (self.sNewsId != nil)
    {
        [ostream writeString: 3 value: self.sNewsId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RefreshSecInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.vtFuncType = [istream readListDef: 1 required: false def: self.vtFuncType VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    self.sNewsId = [istream readStringDef: 3 required: false def: self.sNewsId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation RefreshDataReq
- (id) init
{
    if (self = [super init])
    {
        self.vtRefreshSecInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtRefreshSecInfo != nil)
    {
        [ostream writeList: 0 value: self.vtRefreshSecInfo VAR_TYPE: [THOTH_LIST CREATE: [RefreshSecInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RefreshDataReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtRefreshSecInfo = [istream readListDef: 0 required: false def: self.vtRefreshSecInfo VAR_TYPE: [THOTH_LIST CREATE: [RefreshSecInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation RefreshDataRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (RefreshDataRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

