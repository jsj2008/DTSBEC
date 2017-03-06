#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "UserPortfolio.h"
#import "Beacon.h"
#import "Account.h"

//////////////////////////////////////////////////////////////
@implementation CommentInfo
- (id) init
{
    if (self = [super init])
    {
        self.sComment = @"";
        self.iCreateTime = -1;
        self.iUpdateTime = -1;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sComment != nil)
    {
        [ostream writeString: 0 value: self.sComment];
    }
    [ostream writeInt32: 1 value: self.iCreateTime];
    [ostream writeInt32: 2 value: self.iUpdateTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommentInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sComment = [istream readStringDef: 0 required: false def: self.sComment];
    self.iCreateTime = [istream readInt32Def: 1 required: false def: self.iCreateTime];
    self.iUpdateTime = [istream readInt32Def: 2 required: false def: self.iUpdateTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ProSecInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fHighPrice = -1;
        self.fLowPrice = -1;
        self.fIncreasePer = -1;
        self.fDecreasesPer = -1;
        self.bRecvAnnounce = false;
        self.bRecvResearch = false;
        self.isDel = false;
        self.iCreateTime = -1;
        self.iUpdateTime = -1;
        self.sName = @"";
        self.isHold = false;
        self.stCommentInfo = [[CommentInfo alloc] init];
        self.isAiAlert = true;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 0 value: self.sDtSecCode];
    }
    [ostream writeFloat: 1 value: self.fHighPrice];
    [ostream writeFloat: 2 value: self.fLowPrice];
    [ostream writeFloat: 3 value: self.fIncreasePer];
    [ostream writeFloat: 4 value: self.fDecreasesPer];
    [ostream writeBoolean: 5 value: self.bRecvAnnounce];
    [ostream writeBoolean: 6 value: self.bRecvResearch];
    [ostream writeBoolean: 7 value: self.isDel];
    [ostream writeInt32: 8 value: self.iCreateTime];
    [ostream writeInt32: 9 value: self.iUpdateTime];
    if (self.sName != nil)
    {
        [ostream writeString: 10 value: self.sName];
    }
    [ostream writeBoolean: 11 value: self.isHold];
    if (self.stCommentInfo != nil)
    {
        [ostream writeMessage: 12 value: self.stCommentInfo];
    }
    [ostream writeBoolean: 13 value: self.isAiAlert];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ProSecInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fHighPrice = [istream readFloatDef: 1 required: false def: self.fHighPrice];
    self.fLowPrice = [istream readFloatDef: 2 required: false def: self.fLowPrice];
    self.fIncreasePer = [istream readFloatDef: 3 required: false def: self.fIncreasePer];
    self.fDecreasesPer = [istream readFloatDef: 4 required: false def: self.fDecreasesPer];
    self.bRecvAnnounce = [istream readBooleanDef: 5 required: false def: self.bRecvAnnounce];
    self.bRecvResearch = [istream readBooleanDef: 6 required: false def: self.bRecvResearch];
    self.isDel = [istream readBooleanDef: 7 required: false def: self.isDel];
    self.iCreateTime = [istream readInt32Def: 8 required: false def: self.iCreateTime];
    self.iUpdateTime = [istream readInt32Def: 9 required: false def: self.iUpdateTime];
    self.sName = [istream readStringDef: 10 required: false def: self.sName];
    self.isHold = [istream readBooleanDef: 11 required: false def: self.isHold];
    self.stCommentInfo = (CommentInfo*)[istream readMessageDef: 12 required: false def: self.stCommentInfo VAR_TYPE: [CommentInfo class]];
    self.isAiAlert = [istream readBooleanDef: 13 required: false def: self.isAiAlert];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SubjectInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.isDel = false;
        self.iCreateTime = -1;
        self.iUpdateTime = -1;
        self.sName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 0 value: self.sDtSecCode];
    }
    [ostream writeBoolean: 1 value: self.isDel];
    [ostream writeInt32: 2 value: self.iCreateTime];
    [ostream writeInt32: 3 value: self.iUpdateTime];
    if (self.sName != nil)
    {
        [ostream writeString: 4 value: self.sName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SubjectInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.isDel = [istream readBooleanDef: 1 required: false def: self.isDel];
    self.iCreateTime = [istream readInt32Def: 2 required: false def: self.iCreateTime];
    self.iUpdateTime = [istream readInt32Def: 3 required: false def: self.iUpdateTime];
    self.sName = [istream readStringDef: 4 required: false def: self.sName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GroupSecInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.iUpdateTime = -1;
        self.isDel = false;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 0 value: self.sDtSecCode];
    }
    [ostream writeInt32: 1 value: self.iUpdateTime];
    [ostream writeBoolean: 2 value: self.isDel];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GroupSecInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.iUpdateTime = [istream readInt32Def: 1 required: false def: self.iUpdateTime];
    self.isDel = [istream readBooleanDef: 2 required: false def: self.isDel];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GroupInfo
- (id) init
{
    if (self = [super init])
    {
        self.sGroupName = @"";
        self.isDel = false;
        self.iCreateTime = -1;
        self.iUpdateTime = -1;
        self.vGroupSecInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sGroupName != nil)
    {
        [ostream writeString: 0 value: self.sGroupName];
    }
    [ostream writeBoolean: 1 value: self.isDel];
    [ostream writeInt32: 2 value: self.iCreateTime];
    [ostream writeInt32: 3 value: self.iUpdateTime];
    if (self.vGroupSecInfo != nil)
    {
        [ostream writeList: 4 value: self.vGroupSecInfo VAR_TYPE: [THOTH_LIST CREATE: [GroupSecInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GroupInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sGroupName = [istream readStringDef: 0 required: false def: self.sGroupName];
    self.isDel = [istream readBooleanDef: 1 required: false def: self.isDel];
    self.iCreateTime = [istream readInt32Def: 2 required: false def: self.iCreateTime];
    self.iUpdateTime = [istream readInt32Def: 3 required: false def: self.iUpdateTime];
    self.vGroupSecInfo = [istream readListDef: 4 required: false def: self.vGroupSecInfo VAR_TYPE: [THOTH_LIST CREATE: [GroupSecInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ProSecInfoList
- (id) init
{
    if (self = [super init])
    {
        self.vProSecInfo = [NSMutableArray arrayWithCapacity:0];
        self.vSubjectInfo = [NSMutableArray arrayWithCapacity:0];
        self.iVersion = 0;
        self.vGroupInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vProSecInfo != nil)
    {
        [ostream writeList: 0 value: self.vProSecInfo VAR_TYPE: [THOTH_LIST CREATE: [ProSecInfo class]]];
    }
    if (self.vSubjectInfo != nil)
    {
        [ostream writeList: 1 value: self.vSubjectInfo VAR_TYPE: [THOTH_LIST CREATE: [SubjectInfo class]]];
    }
    [ostream writeInt32: 2 value: self.iVersion];
    if (self.vGroupInfo != nil)
    {
        [ostream writeList: 3 value: self.vGroupInfo VAR_TYPE: [THOTH_LIST CREATE: [GroupInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ProSecInfoList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vProSecInfo = [istream readListDef: 0 required: false def: self.vProSecInfo VAR_TYPE: [THOTH_LIST CREATE: [ProSecInfo class]]];
    self.vSubjectInfo = [istream readListDef: 1 required: false def: self.vSubjectInfo VAR_TYPE: [THOTH_LIST CREATE: [SubjectInfo class]]];
    self.iVersion = [istream readInt32Def: 2 required: false def: self.iVersion];
    self.vGroupInfo = [istream readListDef: 3 required: false def: self.vGroupInfo VAR_TYPE: [THOTH_LIST CREATE: [GroupInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation QueryPortfolioReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iVersion = 0;
        self.iAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
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
    [ostream writeInt32: 1 value: self.iVersion];
    [ostream writeUInt32: 3 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 4 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QueryPortfolioReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iVersion = [istream readInt32Def: 1 required: false def: self.iVersion];
    self.iAccountId = [istream readUInt32Def: 3 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 4 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation QueryPortfolioRsp
- (id) init
{
    if (self = [super init])
    {
        self.stProSecInfoList = [[ProSecInfoList alloc] init];
        self.iAccountId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stProSecInfoList != nil)
    {
        [ostream writeMessage: 0 value: self.stProSecInfoList];
    }
    [ostream writeUInt32: 1 value: self.iAccountId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (QueryPortfolioRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stProSecInfoList = (ProSecInfoList*)[istream readMessageDef: 0 required: false def: self.stProSecInfoList VAR_TYPE: [ProSecInfoList class]];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SavePortfolioReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stProSecInfoList = [[ProSecInfoList alloc] init];
        self.iAccountId = 0;
        self.stAccountTicket = [[AccountTicket alloc] init];
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
    if (self.stProSecInfoList != nil)
    {
        [ostream writeMessage: 1 value: self.stProSecInfoList];
    }
    [ostream writeUInt32: 2 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 3 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SavePortfolioReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stProSecInfoList = (ProSecInfoList*)[istream readMessageDef: 1 required: false def: self.stProSecInfoList VAR_TYPE: [ProSecInfoList class]];
    self.iAccountId = [istream readUInt32Def: 2 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 3 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SavePortfolioRsp
- (id) init
{
    if (self = [super init])
    {
        self.iVersion = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iVersion];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SavePortfolioRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iVersion = [istream readInt32Def: 0 required: false def: self.iVersion];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

