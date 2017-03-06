#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "OssAccess.h"

//////////////////////////////////////////////////////////////
@implementation OssKey
- (id) init
{
    if (self = [super init])
    {
        self.sBucketName = @"";
        self.sObjName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sBucketName != nil)
    {
        [ostream writeString: 0 value: self.sBucketName];
    }
    if (self.sObjName != nil)
    {
        [ostream writeString: 1 value: self.sObjName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OssKey *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sBucketName = [istream readStringDef: 0 required: false def: self.sBucketName];
    self.sObjName = [istream readStringDef: 1 required: false def: self.sObjName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation OssUrl
- (id) init
{
    if (self = [super init])
    {
        self.stOssKey = [[OssKey alloc] init];
        self.sIntranetUrl = @"";
        self.sExtranetUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stOssKey != nil)
    {
        [ostream writeMessage: 0 value: self.stOssKey];
    }
    if (self.sIntranetUrl != nil)
    {
        [ostream writeString: 1 value: self.sIntranetUrl];
    }
    if (self.sExtranetUrl != nil)
    {
        [ostream writeString: 2 value: self.sExtranetUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OssUrl *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stOssKey = (OssKey*)[istream readMessageDef: 0 required: false def: self.stOssKey VAR_TYPE: [OssKey class]];
    self.sIntranetUrl = [istream readStringDef: 1 required: false def: self.sIntranetUrl];
    self.sExtranetUrl = [istream readStringDef: 2 required: false def: self.sExtranetUrl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation OssData
- (id) init
{
    if (self = [super init])
    {
        self.stOssKey = [[OssKey alloc] init];
        self.vObjData = [NSData data];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stOssKey != nil)
    {
        [ostream writeMessage: 0 value: self.stOssKey];
    }
    if (self.vObjData != nil)
    {
        [ostream writeBytes: 1 value: self.vObjData];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OssData *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stOssKey = (OssKey*)[istream readMessageDef: 0 required: false def: self.stOssKey VAR_TYPE: [OssKey class]];
    self.vObjData = [istream readBytesDef: 1 required: false def: self.vObjData];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation PutOssReq
- (id) init
{
    if (self = [super init])
    {
        self.vPutOssRequest = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPutOssRequest != nil)
    {
        [ostream writeList: 0 value: self.vPutOssRequest VAR_TYPE: [THOTH_LIST CREATE: [OssData class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PutOssReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPutOssRequest = [istream readListDef: 0 required: false def: self.vPutOssRequest VAR_TYPE: [THOTH_LIST CREATE: [OssData class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation PutOssRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPutOssResponse = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPutOssResponse != nil)
    {
        [ostream writeList: 0 value: self.vPutOssResponse VAR_TYPE: [THOTH_LIST CREATE: [OssUrl class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PutOssRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPutOssResponse = [istream readListDef: 0 required: false def: self.vPutOssResponse VAR_TYPE: [THOTH_LIST CREATE: [OssUrl class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetOssReq
- (id) init
{
    if (self = [super init])
    {
        self.vGetOssRequest = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vGetOssRequest != nil)
    {
        [ostream writeList: 0 value: self.vGetOssRequest VAR_TYPE: [THOTH_LIST CREATE: [OssKey class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetOssReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vGetOssRequest = [istream readListDef: 0 required: false def: self.vGetOssRequest VAR_TYPE: [THOTH_LIST CREATE: [OssKey class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetOssRsp
- (id) init
{
    if (self = [super init])
    {
        self.vGetOssResponse = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vGetOssResponse != nil)
    {
        [ostream writeList: 0 value: self.vGetOssResponse VAR_TYPE: [THOTH_LIST CREATE: [OssData class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetOssRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vGetOssResponse = [istream readListDef: 0 required: false def: self.vGetOssResponse VAR_TYPE: [THOTH_LIST CREATE: [OssData class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

