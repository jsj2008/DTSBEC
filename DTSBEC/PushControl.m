#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "PushControl.h"
#import "Beacon.h"
#import "Notification.h"

//////////////////////////////////////////////////////////////
@implementation CheckUserPushReq
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.stPushType = [[PushType alloc] init];
        self.eFreqControlType = E_FCT_TYPE_CONTROL;
        self.ePushCastType = E_PCT_UNICAST;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.stPushType != nil)
    {
        [ostream writeMessage: 1 value: self.stPushType];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eFreqControlType];
    [ostream writeInt32: 3 value: (int32_t)self.ePushCastType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CheckUserPushReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.stPushType = (PushType*)[istream readMessageDef: 1 required: false def: self.stPushType VAR_TYPE: [PushType class]];
    self.eFreqControlType = [istream readInt32Def: 2 required: false def: (int32_t)self.eFreqControlType];
    self.ePushCastType = [istream readInt32Def: 3 required: false def: (int32_t)self.ePushCastType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation CheckUserPushRsp
- (id) init
{
    if (self = [super init])
    {
        self.mpCheckResult = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mpCheckResult != nil)
    {
        [ostream writeMap: 0 value: self.mpCheckResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CheckUserPushRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mpCheckResult = [istream readMapDef: 0 required: false def: self.mpCheckResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

