#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Stat.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation BeaconStatData
- (id) init
{
    if (self = [super init])
    {
        self.iTime = 0;
        self.eStat = E_BST_PUSH;
        self.sData = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iTime];
    [ostream writeInt32: 1 value: (int32_t)self.eStat];
    if (self.sData != nil)
    {
        [ostream writeString: 2 value: self.sData];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BeaconStatData *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTime = [istream readUInt32Def: 0 required: false def: self.iTime];
    self.eStat = [istream readInt32Def: 1 required: false def: (int32_t)self.eStat];
    self.sData = [istream readStringDef: 2 required: false def: self.sData];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation BeaconStat
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.vBeaconStatData = [NSMutableArray arrayWithCapacity:0];
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
    if (self.vBeaconStatData != nil)
    {
        [ostream writeList: 1 value: self.vBeaconStatData VAR_TYPE: [THOTH_LIST CREATE: [BeaconStatData class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BeaconStat *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.vBeaconStatData = [istream readListDef: 1 required: false def: self.vBeaconStatData VAR_TYPE: [THOTH_LIST CREATE: [BeaconStatData class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

