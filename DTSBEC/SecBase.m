#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "SecBase.h"
#import "Beacon.h"
//#import "InvestAdviser.h"

//////////////////////////////////////////////////////////////
@implementation SecLiveMsg
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.iTime = 0;
        self.sMsg = @"";
        self.eSecLiveMsgType = E_SLMT_GOOD;
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
    [ostream writeInt32: 1 value: self.iTime];
    if (self.sMsg != nil)
    {
        [ostream writeString: 2 value: self.sMsg];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eSecLiveMsgType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecLiveMsg *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.iTime = [istream readInt32Def: 1 required: false def: self.iTime];
    self.sMsg = [istream readStringDef: 2 required: false def: self.sMsg];
    self.eSecLiveMsgType = [istream readInt32Def: 3 required: false def: (int32_t)self.eSecLiveMsgType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecLiveMsgReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
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
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.sId != nil)
    {
        [ostream writeString: 2 value: self.sId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecLiveMsgReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sId = [istream readStringDef: 2 required: false def: self.sId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecLiveMsgRsp
- (id) init
{
    if (self = [super init])
    {
        self.vSecLiveMsg = [NSMutableArray arrayWithCapacity:0];
        self.iLiveMsgStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vSecLiveMsg != nil)
    {
        [ostream writeList: 0 value: self.vSecLiveMsg VAR_TYPE: [THOTH_LIST CREATE: [SecLiveMsg class]]];
    }
    [ostream writeInt32: 1 value: self.iLiveMsgStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecLiveMsgRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vSecLiveMsg = [istream readListDef: 0 required: false def: self.vSecLiveMsg VAR_TYPE: [THOTH_LIST CREATE: [SecLiveMsg class]]];
    self.iLiveMsgStatus = [istream readInt32Def: 1 required: false def: self.iLiveMsgStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

