#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "DtGoldenStock.h"
#import "Beacon.h"
#import "Account.h"

//////////////////////////////////////////////////////////////
@implementation SetLoginDayReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iType = 0;
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
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    [ostream writeInt32: 2 value: self.iType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SetLoginDayReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iType = [istream readInt32Def: 2 required: false def: self.iType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SetLoginDayRsp
- (id) init
{
    if (self = [super init])
    {
        self.iLeftDays = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iLeftDays];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SetLoginDayRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iLeftDays = [istream readInt32Def: 0 required: false def: self.iLeftDays];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation CheckInvitePassReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sReqPass = @"";
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
    if (self.sReqPass != nil)
    {
        [ostream writeString: 1 value: self.sReqPass];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CheckInvitePassReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sReqPass = [istream readStringDef: 1 required: false def: self.sReqPass];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation CheckInvitePassRsp
- (id) init
{
    if (self = [super init])
    {
        self.bIsDtInvitePass = true;
        self.bIsInvitedBefore = true;
        self.iCodeType = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeBoolean: 1 value: self.bIsDtInvitePass];
    [ostream writeBoolean: 2 value: self.bIsInvitedBefore];
    [ostream writeInt32: 3 value: self.iCodeType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CheckInvitePassRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.bIsDtInvitePass = [istream readBooleanDef: 1 required: false def: self.bIsDtInvitePass];
    self.bIsInvitedBefore = [istream readBooleanDef: 2 required: false def: self.bIsInvitedBefore];
    self.iCodeType = [istream readInt32Def: 3 required: false def: self.iCodeType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetShareUrlReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iType = 0;
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
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    [ostream writeInt32: 2 value: self.iType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetShareUrlReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iType = [istream readInt32Def: 2 required: false def: self.iType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetShareUrlRsp
- (id) init
{
    if (self = [super init])
    {
        self.sUrl = @"";
        self.sPass = @"";
        self.iFullUnlockNeedInvite = 0;
        self.iPartUnlockNeedInvite = 0;
        self.iInviteAlready = 0;
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
    if (self.sPass != nil)
    {
        [ostream writeString: 1 value: self.sPass];
    }
    [ostream writeInt32: 2 value: self.iFullUnlockNeedInvite];
    [ostream writeInt32: 3 value: self.iPartUnlockNeedInvite];
    [ostream writeInt32: 4 value: self.iInviteAlready];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetShareUrlRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sUrl = [istream readStringDef: 0 required: false def: self.sUrl];
    self.sPass = [istream readStringDef: 1 required: false def: self.sPass];
    self.iFullUnlockNeedInvite = [istream readInt32Def: 2 required: false def: self.iFullUnlockNeedInvite];
    self.iPartUnlockNeedInvite = [istream readInt32Def: 3 required: false def: self.iPartUnlockNeedInvite];
    self.iInviteAlready = [istream readInt32Def: 4 required: false def: self.iInviteAlready];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation CommitInvitePassReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sInvitePass = @"";
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
    if (self.sInvitePass != nil)
    {
        [ostream writeString: 1 value: self.sInvitePass];
    }
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommitInvitePassReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sInvitePass = [istream readStringDef: 1 required: false def: self.sInvitePass];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation CommitInvitePassRsp
- (id) init
{
    if (self = [super init])
    {
        self.iNeedInvite = 0;
        self.iCodeType = 0;
        self.sPriviEndDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iNeedInvite];
    [ostream writeInt32: 1 value: self.iCodeType];
    if (self.sPriviEndDay != nil)
    {
        [ostream writeString: 2 value: self.sPriviEndDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommitInvitePassRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iNeedInvite = [istream readInt32Def: 0 required: false def: self.iNeedInvite];
    self.iCodeType = [istream readInt32Def: 1 required: false def: self.iCodeType];
    self.sPriviEndDay = [istream readStringDef: 2 required: false def: self.sPriviEndDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetUserInviteInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
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
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserInviteInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetUserInviteInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.iFullUnlockNeedInvite = 0;
        self.iPartUnlockNeedInvite = 0;
        self.iInviteAlready = 0;
        self.iUnlockStatus = 0;
        self.sInvitePass = @"";
        self.iLeftDays = 0;
        self.iFirstLoginTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iFullUnlockNeedInvite];
    [ostream writeInt32: 1 value: self.iPartUnlockNeedInvite];
    [ostream writeInt32: 2 value: self.iInviteAlready];
    [ostream writeInt32: 3 value: self.iUnlockStatus];
    if (self.sInvitePass != nil)
    {
        [ostream writeString: 4 value: self.sInvitePass];
    }
    [ostream writeInt32: 5 value: self.iLeftDays];
    [ostream writeInt32: 6 value: self.iFirstLoginTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserInviteInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iFullUnlockNeedInvite = [istream readInt32Def: 0 required: false def: self.iFullUnlockNeedInvite];
    self.iPartUnlockNeedInvite = [istream readInt32Def: 1 required: false def: self.iPartUnlockNeedInvite];
    self.iInviteAlready = [istream readInt32Def: 2 required: false def: self.iInviteAlready];
    self.iUnlockStatus = [istream readInt32Def: 3 required: false def: self.iUnlockStatus];
    self.sInvitePass = [istream readStringDef: 4 required: false def: self.sInvitePass];
    self.iLeftDays = [istream readInt32Def: 5 required: false def: self.iLeftDays];
    self.iFirstLoginTime = [istream readInt32Def: 6 required: false def: self.iFirstLoginTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetPriviUserInviteInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
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
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPriviUserInviteInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetPriviUserInviteInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRetCode = 0;
        self.iPriviSwitch = 0;
        self.iInviteFriendNum = 0;
        self.iInviteOpenDays = 0;
        self.iAccuUseDays = 0;
        self.iAccuOpenDays = 0;
        self.iLoginOpenDays = 0;
        self.iFriendOpenDays = 0;
        self.iSuccInviteFriendNum = 0;
        self.iMonthAccuUseDays = 0;
        self.iFirstLoginTime = 0;
        self.sPriviEndDay = @"";
        self.sInvitePass = @"";
        self.iPriviStatus = 0;
        self.iTotalOpenUserNum = 0;
        self.iAlarmDaysOfExpire = 0;
        self.iPriviLeftDays = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRetCode];
    [ostream writeInt32: 1 value: self.iPriviSwitch];
    [ostream writeInt32: 2 value: self.iInviteFriendNum];
    [ostream writeInt32: 3 value: self.iInviteOpenDays];
    [ostream writeInt32: 4 value: self.iAccuUseDays];
    [ostream writeInt32: 5 value: self.iAccuOpenDays];
    [ostream writeInt32: 6 value: self.iLoginOpenDays];
    [ostream writeInt32: 7 value: self.iFriendOpenDays];
    [ostream writeInt32: 8 value: self.iSuccInviteFriendNum];
    [ostream writeInt32: 9 value: self.iMonthAccuUseDays];
    [ostream writeInt32: 10 value: self.iFirstLoginTime];
    if (self.sPriviEndDay != nil)
    {
        [ostream writeString: 11 value: self.sPriviEndDay];
    }
    if (self.sInvitePass != nil)
    {
        [ostream writeString: 12 value: self.sInvitePass];
    }
    [ostream writeInt32: 13 value: self.iPriviStatus];
    [ostream writeInt32: 14 value: self.iTotalOpenUserNum];
    [ostream writeInt32: 15 value: self.iAlarmDaysOfExpire];
    [ostream writeInt32: 16 value: self.iPriviLeftDays];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPriviUserInviteInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRetCode = [istream readInt32Def: 0 required: false def: self.iRetCode];
    self.iPriviSwitch = [istream readInt32Def: 1 required: false def: self.iPriviSwitch];
    self.iInviteFriendNum = [istream readInt32Def: 2 required: false def: self.iInviteFriendNum];
    self.iInviteOpenDays = [istream readInt32Def: 3 required: false def: self.iInviteOpenDays];
    self.iAccuUseDays = [istream readInt32Def: 4 required: false def: self.iAccuUseDays];
    self.iAccuOpenDays = [istream readInt32Def: 5 required: false def: self.iAccuOpenDays];
    self.iLoginOpenDays = [istream readInt32Def: 6 required: false def: self.iLoginOpenDays];
    self.iFriendOpenDays = [istream readInt32Def: 7 required: false def: self.iFriendOpenDays];
    self.iSuccInviteFriendNum = [istream readInt32Def: 8 required: false def: self.iSuccInviteFriendNum];
    self.iMonthAccuUseDays = [istream readInt32Def: 9 required: false def: self.iMonthAccuUseDays];
    self.iFirstLoginTime = [istream readInt32Def: 10 required: false def: self.iFirstLoginTime];
    self.sPriviEndDay = [istream readStringDef: 11 required: false def: self.sPriviEndDay];
    self.sInvitePass = [istream readStringDef: 12 required: false def: self.sInvitePass];
    self.iPriviStatus = [istream readInt32Def: 13 required: false def: self.iPriviStatus];
    self.iTotalOpenUserNum = [istream readInt32Def: 14 required: false def: self.iTotalOpenUserNum];
    self.iAlarmDaysOfExpire = [istream readInt32Def: 15 required: false def: self.iAlarmDaysOfExpire];
    self.iPriviLeftDays = [istream readInt32Def: 16 required: false def: self.iPriviLeftDays];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetConverCodeReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iType = 0;
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
    [ostream writeInt32: 1 value: self.iType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetConverCodeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetConverCodeRsp
- (id) init
{
    if (self = [super init])
    {
        self.vConversionCode = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vConversionCode != nil)
    {
        [ostream writeList: 0 value: self.vConversionCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetConverCodeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vConversionCode = [istream readListDef: 0 required: false def: self.vConversionCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetGoldenStockSwitchReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iType = 0;
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
    [ostream writeInt32: 1 value: self.iType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetGoldenStockSwitchReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetGoldenStockSwitchRsp
- (id) init
{
    if (self = [super init])
    {
        self.bOpen = true;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeBoolean: 0 value: self.bOpen];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetGoldenStockSwitchRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.bOpen = [istream readBooleanDef: 0 required: false def: self.bOpen];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

