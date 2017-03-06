#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "FileAccess.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation FaceImageSaveReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sFileName = @"";
        self.iAccountId = 0;
        self.vtData = [NSData data];
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
    if (self.sFileName != nil)
    {
        [ostream writeString: 1 value: self.sFileName];
    }
    [ostream writeUInt32: 2 value: self.iAccountId];
    if (self.vtData != nil)
    {
        [ostream writeBytes: 3 value: self.vtData];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FaceImageSaveReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sFileName = [istream readStringDef: 1 required: false def: self.sFileName];
    self.iAccountId = [istream readUInt32Def: 2 required: false def: self.iAccountId];
    self.vtData = [istream readBytesDef: 3 required: false def: self.vtData];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation FaceImageSaveRsp
- (id) init
{
    if (self = [super init])
    {
        self.sUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sUrl != nil)
    {
        [ostream writeString: 0 value: self.sUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FaceImageSaveRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sUrl = [istream readStringDef: 0 required: false def: self.sUrl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

