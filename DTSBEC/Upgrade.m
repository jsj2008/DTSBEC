#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Upgrade.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation UpgradeInfo
- (id) init
{
    if (self = [super init])
    {
        self.iStatus = 0;
        self.sURL = @"";
        self.sText = @"";
        self.sHeader = @"";
        self.sFileSize = @"";
        self.sReleaseTime = @"";
        self.sTitle = @"";
        self.iMaxVersion = 0;
        self.iMinVersion = 0;
        self.sMd5 = @"";
        self.iVersion = 0;
        self.sVersionName = @"";
        self.isFreqControl = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iStatus];
    if (self.sURL != nil)
    {
        [ostream writeString: 1 value: self.sURL];
    }
    if (self.sText != nil)
    {
        [ostream writeString: 2 value: self.sText];
    }
    if (self.sHeader != nil)
    {
        [ostream writeString: 3 value: self.sHeader];
    }
    if (self.sFileSize != nil)
    {
        [ostream writeString: 4 value: self.sFileSize];
    }
    if (self.sReleaseTime != nil)
    {
        [ostream writeString: 5 value: self.sReleaseTime];
    }
    if (self.sTitle != nil)
    {
        [ostream writeString: 6 value: self.sTitle];
    }
    [ostream writeInt32: 7 value: self.iMaxVersion];
    [ostream writeInt32: 8 value: self.iMinVersion];
    if (self.sMd5 != nil)
    {
        [ostream writeString: 9 value: self.sMd5];
    }
    [ostream writeInt32: 10 value: self.iVersion];
    if (self.sVersionName != nil)
    {
        [ostream writeString: 11 value: self.sVersionName];
    }
    [ostream writeInt32: 12 value: self.isFreqControl];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UpgradeInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iStatus = [istream readInt32Def: 0 required: false def: self.iStatus];
    self.sURL = [istream readStringDef: 1 required: false def: self.sURL];
    self.sText = [istream readStringDef: 2 required: false def: self.sText];
    self.sHeader = [istream readStringDef: 3 required: false def: self.sHeader];
    self.sFileSize = [istream readStringDef: 4 required: false def: self.sFileSize];
    self.sReleaseTime = [istream readStringDef: 5 required: false def: self.sReleaseTime];
    self.sTitle = [istream readStringDef: 6 required: false def: self.sTitle];
    self.iMaxVersion = [istream readInt32Def: 7 required: false def: self.iMaxVersion];
    self.iMinVersion = [istream readInt32Def: 8 required: false def: self.iMinVersion];
    self.sMd5 = [istream readStringDef: 9 required: false def: self.sMd5];
    self.iVersion = [istream readInt32Def: 10 required: false def: self.iVersion];
    self.sVersionName = [istream readStringDef: 11 required: false def: self.sVersionName];
    self.isFreqControl = [istream readInt32Def: 12 required: false def: self.isFreqControl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation UpgradeCacheInfo
- (id) init
{
    if (self = [super init])
    {
        self.iLastUpgradeTime = 0;
        self.iCount = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iLastUpgradeTime];
    [ostream writeInt32: 1 value: self.iCount];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UpgradeCacheInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iLastUpgradeTime = [istream readInt32Def: 0 required: false def: self.iLastUpgradeTime];
    self.iCount = [istream readInt32Def: 1 required: false def: self.iCount];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation UpgradeReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sClientMd5 = @"";
        self.iCheckFreq = 0;
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
    if (self.sClientMd5 != nil)
    {
        [ostream writeString: 1 value: self.sClientMd5];
    }
    [ostream writeInt32: 2 value: self.iCheckFreq];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UpgradeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sClientMd5 = [istream readStringDef: 1 required: false def: self.sClientMd5];
    self.iCheckFreq = [istream readInt32Def: 2 required: false def: self.iCheckFreq];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation UpgradeRsp
- (id) init
{
    if (self = [super init])
    {
        self.stUpgradeInfo = [[UpgradeInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stUpgradeInfo != nil)
    {
        [ostream writeMessage: 0 value: self.stUpgradeInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UpgradeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUpgradeInfo = (UpgradeInfo*)[istream readMessageDef: 0 required: false def: self.stUpgradeInfo VAR_TYPE: [UpgradeInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

