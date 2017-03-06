#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "YunWeb.h"
#import "Beacon.h"
#import "Account.h"

//////////////////////////////////////////////////////////////
@implementation CtrlKey
- (id) init
{
    if (self = [super init])
    {
        self.sKey = @"";
        self.sUUID = @"";
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
    if (self.sUUID != nil)
    {
        [ostream writeString: 1 value: self.sUUID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CtrlKey *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sKey = [istream readStringDef: 0 required: false def: self.sKey];
    self.sUUID = [istream readStringDef: 1 required: false def: self.sUUID];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ReportScanReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sSessionId = @"";
        self.iTargetType = 0;
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
    if (self.sSessionId != nil)
    {
        [ostream writeString: 2 value: self.sSessionId];
    }
    [ostream writeInt32: 3 value: self.iTargetType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportScanReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sSessionId = [istream readStringDef: 2 required: false def: self.sSessionId];
    self.iTargetType = [istream readInt32Def: 3 required: false def: self.iTargetType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ReportScanRsp
- (id) init
{
    if (self = [super init])
    {
        self.sTicket = @"";
        self.sTipMsg = @"";
        self.sTargetMsg = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTicket != nil)
    {
        [ostream writeString: 0 value: self.sTicket];
    }
    if (self.sTipMsg != nil)
    {
        [ostream writeString: 1 value: self.sTipMsg];
    }
    if (self.sTargetMsg != nil)
    {
        [ostream writeString: 2 value: self.sTargetMsg];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportScanRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTicket = [istream readStringDef: 0 required: false def: self.sTicket];
    self.sTipMsg = [istream readStringDef: 1 required: false def: self.sTipMsg];
    self.sTargetMsg = [istream readStringDef: 2 required: false def: self.sTargetMsg];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ReportAckLoginReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sTicket = @"";
        self.iTargetType = 0;
        self.bAckLogin = true;
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
    if (self.sTicket != nil)
    {
        [ostream writeString: 2 value: self.sTicket];
    }
    [ostream writeInt32: 3 value: self.iTargetType];
    [ostream writeBoolean: 4 value: self.bAckLogin];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportAckLoginReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sTicket = [istream readStringDef: 2 required: false def: self.sTicket];
    self.iTargetType = [istream readInt32Def: 3 required: false def: self.iTargetType];
    self.bAckLogin = [istream readBooleanDef: 4 required: false def: self.bAckLogin];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ReportAckLoginRsp
- (id) init
{
    if (self = [super init])
    {
        self.sTipMsg = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTipMsg != nil)
    {
        [ostream writeString: 0 value: self.sTipMsg];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportAckLoginRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTipMsg = [istream readStringDef: 0 required: false def: self.sTipMsg];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation getScanSessionReq
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

- (getScanSessionReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation getScanSessionRsp
- (id) init
{
    if (self = [super init])
    {
        self.sSessionId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSessionId != nil)
    {
        [ostream writeString: 0 value: self.sSessionId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (getScanSessionRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSessionId = [istream readStringDef: 0 required: false def: self.sSessionId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

