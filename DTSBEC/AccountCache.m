#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "AccountCache.h"

//////////////////////////////////////////////////////////////
@implementation VerifyCodeValue
- (id) init
{
    if (self = [super init])
    {
        self.sPhoneCode = @"";
        self.iPhoneCodeTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPhoneCode != nil)
    {
        [ostream writeString: 0 value: self.sPhoneCode];
    }
    [ostream writeInt32: 1 value: self.iPhoneCodeTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VerifyCodeValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPhoneCode = [istream readStringDef: 0 required: false def: self.sPhoneCode];
    self.iPhoneCodeTime = [istream readInt32Def: 1 required: false def: self.iPhoneCodeTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AccountValue
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
        self.sUserName = @"";
        self.sPasswordHash = @"";
        self.sPasswordSalt = @"";
        self.sPhone = @"";
        self.sWxOpenId = @"";
        self.sQqOpenId = @"";
        self.sWbOpenId = @"";
        self.sFaceUrl = @"";
        self.iUpdateTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    if (self.sUserName != nil)
    {
        [ostream writeString: 1 value: self.sUserName];
    }
    if (self.sPasswordHash != nil)
    {
        [ostream writeString: 2 value: self.sPasswordHash];
    }
    if (self.sPasswordSalt != nil)
    {
        [ostream writeString: 3 value: self.sPasswordSalt];
    }
    if (self.sPhone != nil)
    {
        [ostream writeString: 4 value: self.sPhone];
    }
    if (self.sWxOpenId != nil)
    {
        [ostream writeString: 5 value: self.sWxOpenId];
    }
    if (self.sQqOpenId != nil)
    {
        [ostream writeString: 6 value: self.sQqOpenId];
    }
    if (self.sWbOpenId != nil)
    {
        [ostream writeString: 7 value: self.sWbOpenId];
    }
    if (self.sFaceUrl != nil)
    {
        [ostream writeString: 8 value: self.sFaceUrl];
    }
    [ostream writeInt32: 9 value: self.iUpdateTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AccountValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    self.sUserName = [istream readStringDef: 1 required: false def: self.sUserName];
    self.sPasswordHash = [istream readStringDef: 2 required: false def: self.sPasswordHash];
    self.sPasswordSalt = [istream readStringDef: 3 required: false def: self.sPasswordSalt];
    self.sPhone = [istream readStringDef: 4 required: false def: self.sPhone];
    self.sWxOpenId = [istream readStringDef: 5 required: false def: self.sWxOpenId];
    self.sQqOpenId = [istream readStringDef: 6 required: false def: self.sQqOpenId];
    self.sWbOpenId = [istream readStringDef: 7 required: false def: self.sWbOpenId];
    self.sFaceUrl = [istream readStringDef: 8 required: false def: self.sFaceUrl];
    self.iUpdateTime = [istream readInt32Def: 9 required: false def: self.iUpdateTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation UserNameIndexValue
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UserNameIndexValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation PhoneIndexValue
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PhoneIndexValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation WxIdIndexValue
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (WxIdIndexValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation WbIdIndexValue
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (WbIdIndexValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation QqIdIndexValue
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QqIdIndexValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

