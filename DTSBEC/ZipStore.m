#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "ZipStore.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation ZipDiffRes
- (id) init
{
    if (self = [super init])
    {
        self.sFileName = @"";
        self.sMd5 = @"";
        self.sUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sFileName != nil)
    {
        [ostream writeString: 0 value: self.sFileName];
    }
    if (self.sMd5 != nil)
    {
        [ostream writeString: 1 value: self.sMd5];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 2 value: self.sUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ZipDiffRes *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sFileName = [istream readStringDef: 0 required: false def: self.sFileName];
    self.sMd5 = [istream readStringDef: 1 required: false def: self.sMd5];
    self.sUrl = [istream readStringDef: 2 required: false def: self.sUrl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ZipRequest
- (id) init
{
    if (self = [super init])
    {
        self.iType = 0;
        self.iVersion = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iType];
    [ostream writeInt32: 1 value: self.iVersion];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ZipRequest *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iType = [istream readInt32Def: 0 required: false def: self.iType];
    self.iVersion = [istream readInt32Def: 1 required: false def: self.iVersion];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ZipResponse
- (id) init
{
    if (self = [super init])
    {
        self.bLast = true;
        self.iType = 0;
        self.iVersion = 0;
        self.sUrl = @"";
        self.iSize = 0;
        self.sMd5 = @"";
        self.sUploadTime = @"";
        self.sAppVersion = @"";
        self.vZipDiffRes = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeBoolean: 0 value: self.bLast];
    [ostream writeInt32: 1 value: self.iType];
    [ostream writeInt32: 2 value: self.iVersion];
    if (self.sUrl != nil)
    {
        [ostream writeString: 3 value: self.sUrl];
    }
    [ostream writeInt32: 4 value: self.iSize];
    if (self.sMd5 != nil)
    {
        [ostream writeString: 5 value: self.sMd5];
    }
    if (self.sUploadTime != nil)
    {
        [ostream writeString: 6 value: self.sUploadTime];
    }
    if (self.sAppVersion != nil)
    {
        [ostream writeString: 7 value: self.sAppVersion];
    }
    if (self.vZipDiffRes != nil)
    {
        [ostream writeList: 8 value: self.vZipDiffRes VAR_TYPE: [THOTH_LIST CREATE: [ZipDiffRes class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ZipResponse *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.bLast = [istream readBooleanDef: 0 required: false def: self.bLast];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    self.iVersion = [istream readInt32Def: 2 required: false def: self.iVersion];
    self.sUrl = [istream readStringDef: 3 required: false def: self.sUrl];
    self.iSize = [istream readInt32Def: 4 required: false def: self.iSize];
    self.sMd5 = [istream readStringDef: 5 required: false def: self.sMd5];
    self.sUploadTime = [istream readStringDef: 6 required: false def: self.sUploadTime];
    self.sAppVersion = [istream readStringDef: 7 required: false def: self.sAppVersion];
    self.vZipDiffRes = [istream readListDef: 8 required: false def: self.vZipDiffRes VAR_TYPE: [THOTH_LIST CREATE: [ZipDiffRes class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ZipStoreReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vZipRequest = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vZipRequest != nil)
    {
        [ostream writeList: 1 value: self.vZipRequest VAR_TYPE: [THOTH_LIST CREATE: [ZipRequest class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ZipStoreReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vZipRequest = [istream readListDef: 1 required: false def: self.vZipRequest VAR_TYPE: [THOTH_LIST CREATE: [ZipRequest class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ZipStoreRsp
- (id) init
{
    if (self = [super init])
    {
        self.vZipResponse = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vZipResponse != nil)
    {
        [ostream writeList: 0 value: self.vZipResponse VAR_TYPE: [THOTH_LIST CREATE: [ZipResponse class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ZipStoreRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vZipResponse = [istream readListDef: 0 required: false def: self.vZipResponse VAR_TYPE: [THOTH_LIST CREATE: [ZipResponse class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

