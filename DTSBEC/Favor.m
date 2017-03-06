#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Favor.h"
#import "Beacon.h"
#import "NewsInfo.h"
#import "Account.h"

//////////////////////////////////////////////////////////////
@implementation FavorNews
- (id) init
{
    if (self = [super init])
    {
        self.sNewsID = @"";
        self.eNewsType = NT_UNKNOWN;
        self.stNewsDesc = [[NewsDesc alloc] init];
        self.eSecType = E_ST_UNKNOWN;
        self.iTimeStamp = -1;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sNewsID != nil)
    {
        [ostream writeString: 0 value: self.sNewsID];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    if (self.stNewsDesc != nil)
    {
        [ostream writeMessage: 3 value: self.stNewsDesc];
    }
    [ostream writeInt32: 4 value: (int32_t)self.eSecType];
    [ostream writeInt32: 5 value: self.iTimeStamp];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FavorNews *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sNewsID = [istream readStringDef: 0 required: false def: self.sNewsID];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.stNewsDesc = (NewsDesc*)[istream readMessageDef: 3 required: false def: self.stNewsDesc VAR_TYPE: [NewsDesc class]];
    self.eSecType = [istream readInt32Def: 4 required: false def: (int32_t)self.eSecType];
    self.iTimeStamp = [istream readInt32Def: 5 required: false def: self.iTimeStamp];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation FavorAction
- (id) init
{
    if (self = [super init])
    {
        self.stFavorNews = [[FavorNews alloc] init];
        self.eFavorAction = E_FA_ADD;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFavorNews != nil)
    {
        [ostream writeMessage: 0 value: self.stFavorNews];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eFavorAction];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FavorAction *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFavorNews = (FavorNews*)[istream readMessageDef: 0 required: false def: self.stFavorNews VAR_TYPE: [FavorNews class]];
    self.eFavorAction = [istream readInt32Def: 1 required: false def: (int32_t)self.eFavorAction];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation FavorList
- (id) init
{
    if (self = [super init])
    {
        self.vFavorNews = [NSMutableArray arrayWithCapacity:0];
        self.iVersion = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vFavorNews != nil)
    {
        [ostream writeList: 0 value: self.vFavorNews VAR_TYPE: [THOTH_LIST CREATE: [FavorNews class]]];
    }
    [ostream writeInt32: 1 value: self.iVersion];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FavorList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vFavorNews = [istream readListDef: 0 required: false def: self.vFavorNews VAR_TYPE: [THOTH_LIST CREATE: [FavorNews class]]];
    self.iVersion = [istream readInt32Def: 1 required: false def: self.iVersion];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation QueryFavorNewsReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iVersion = 0;
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
    [ostream writeUInt32: 2 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 3 value: self.stAccountTicket];
    }
    [ostream writeInt32: 4 value: self.iVersion];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QueryFavorNewsReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [istream readUInt32Def: 2 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 3 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iVersion = [istream readInt32Def: 4 required: false def: self.iVersion];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation QueryFavorNewsRsp
- (id) init
{
    if (self = [super init])
    {
        self.stFavorList = [[FavorList alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stFavorList != nil)
    {
        [ostream writeMessage: 0 value: self.stFavorList];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QueryFavorNewsRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stFavorList = (FavorList*)[istream readMessageDef: 0 required: false def: self.stFavorList VAR_TYPE: [FavorList class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SaveFavorNewsReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.vFavorAction = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeUInt32: 2 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 3 value: self.stAccountTicket];
    }
    if (self.vFavorAction != nil)
    {
        [ostream writeList: 4 value: self.vFavorAction VAR_TYPE: [THOTH_LIST CREATE: [FavorAction class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SaveFavorNewsReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [istream readUInt32Def: 2 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 3 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.vFavorAction = [istream readListDef: 4 required: false def: self.vFavorAction VAR_TYPE: [THOTH_LIST CREATE: [FavorAction class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SaveFavorNewsRsp
- (id) init
{
    if (self = [super init])
    {
        self.eRet = E_FR_SUCC;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eRet];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SaveFavorNewsRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eRet = [istream readInt32Def: 0 required: false def: (int32_t)self.eRet];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

