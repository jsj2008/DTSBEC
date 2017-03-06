#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "TextProcess.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation ProcessNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sContent = @"";
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
    if (self.sContent != nil)
    {
        [ostream writeString: 1 value: self.sContent];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ProcessNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sContent = [istream readStringDef: 1 required: false def: self.sContent];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ProcessNewsContentRsp
- (id) init
{
    if (self = [super init])
    {
        self.sResult = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sResult != nil)
    {
        [ostream writeString: 0 value: self.sResult];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ProcessNewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sResult = [istream readStringDef: 0 required: false def: self.sResult];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

