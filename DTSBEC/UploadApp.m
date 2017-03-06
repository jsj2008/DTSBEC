#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "UploadApp.h"

//////////////////////////////////////////////////////////////
@implementation UploadAppReq
- (id) init
{
    if (self = [super init])
    {
        self.sFileName = @"";
        self.sFileContent = @"";
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
    if (self.sFileContent != nil)
    {
        [ostream writeString: 1 value: self.sFileContent];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UploadAppReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sFileName = [istream readStringDef: 0 required: false def: self.sFileName];
    self.sFileContent = [istream readStringDef: 1 required: false def: self.sFileContent];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation UploadAppRsp
- (id) init
{
    if (self = [super init])
    {
        self.sDownloadUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDownloadUrl != nil)
    {
        [ostream writeString: 0 value: self.sDownloadUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UploadAppRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDownloadUrl = [istream readStringDef: 0 required: false def: self.sDownloadUrl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

