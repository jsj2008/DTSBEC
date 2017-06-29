#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "AccuPoint.h"
#import "Beacon.h"
#import "Account.h"

//////////////////////////////////////////////////////////////
@implementation GetUserPointInfoReq
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

- (GetUserPointInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    return JsonRoot;
}

- (GetUserPointInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AccuPointPriviInfo
- (id) init
{
    if (self = [super init])
    {
        self.iPriviType = 0;
        self.sPriviEndDay = @"";
        self.iPriviLeftDays = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iPriviType];
    if (self.sPriviEndDay != nil)
    {
        [ostream writeString: 1 value: self.sPriviEndDay];
    }
    [ostream writeInt32: 2 value: self.iPriviLeftDays];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AccuPointPriviInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iPriviType = [istream readInt32Def: 0 required: false def: self.iPriviType];
    self.sPriviEndDay = [istream readStringDef: 1 required: false def: self.sPriviEndDay];
    self.iPriviLeftDays = [istream readInt32Def: 2 required: false def: self.iPriviLeftDays];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iPriviType" value : [BaseJSON writeInt32 : self.iPriviType]];
    [JsonRoot append:@"sPriviEndDay" value : [BaseJSON writeString : self.sPriviEndDay]];
    [JsonRoot append:@"iPriviLeftDays" value : [BaseJSON writeInt32 : self.iPriviLeftDays]];
    return JsonRoot;
}

- (AccuPointPriviInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iPriviType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPriviType"] required:false def:self.iPriviType];
    self.sPriviEndDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sPriviEndDay"] required:false def:self.sPriviEndDay];
    self.iPriviLeftDays = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPriviLeftDays"] required:false def:self.iPriviLeftDays];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserPointInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.sInviteCode = @"";
        self.iAccuPoints = 0;
        self.iGetPointsDaily = 0;
        self.iLeftTaskNum = 0;
        self.vPrivi = [NSMutableArray arrayWithCapacity:0];
        self.mPriviPoints = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.iInviteUserNum = 0;
        self.iInviteGetPoints = 0;
        self.iWebRetCode = 0;
        self.vYXTCourseId = [NSMutableArray arrayWithCapacity:0];
        self.sMemberEndDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sInviteCode != nil)
    {
        [ostream writeString: 0 value: self.sInviteCode];
    }
    [ostream writeInt32: 1 value: self.iAccuPoints];
    [ostream writeInt32: 2 value: self.iGetPointsDaily];
    [ostream writeInt32: 3 value: self.iLeftTaskNum];
    if (self.vPrivi != nil)
    {
        [ostream writeList: 4 value: self.vPrivi VAR_TYPE: [THOTH_LIST CREATE: [AccuPointPriviInfo class]]];
    }
    if (self.mPriviPoints != nil)
    {
        [ostream writeMap: 5 value: self.mPriviPoints VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    }
    [ostream writeInt32: 6 value: self.iInviteUserNum];
    [ostream writeInt32: 7 value: self.iInviteGetPoints];
    [ostream writeInt32: 8 value: self.iWebRetCode];
    if (self.vYXTCourseId != nil)
    {
        [ostream writeList: 9 value: self.vYXTCourseId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.sMemberEndDay != nil)
    {
        [ostream writeString: 10 value: self.sMemberEndDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserPointInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sInviteCode = [istream readStringDef: 0 required: false def: self.sInviteCode];
    self.iAccuPoints = [istream readInt32Def: 1 required: false def: self.iAccuPoints];
    self.iGetPointsDaily = [istream readInt32Def: 2 required: false def: self.iGetPointsDaily];
    self.iLeftTaskNum = [istream readInt32Def: 3 required: false def: self.iLeftTaskNum];
    self.vPrivi = [istream readListDef: 4 required: false def: self.vPrivi VAR_TYPE: [THOTH_LIST CREATE: [AccuPointPriviInfo class]]];
    self.mPriviPoints = [istream readMapDef: 5 required: false def: self.mPriviPoints VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    self.iInviteUserNum = [istream readInt32Def: 6 required: false def: self.iInviteUserNum];
    self.iInviteGetPoints = [istream readInt32Def: 7 required: false def: self.iInviteGetPoints];
    self.iWebRetCode = [istream readInt32Def: 8 required: false def: self.iWebRetCode];
    self.vYXTCourseId = [istream readListDef: 9 required: false def: self.vYXTCourseId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sMemberEndDay = [istream readStringDef: 10 required: false def: self.sMemberEndDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sInviteCode" value : [BaseJSON writeString : self.sInviteCode]];
    [JsonRoot append:@"iAccuPoints" value : [BaseJSON writeInt32 : self.iAccuPoints]];
    [JsonRoot append:@"iGetPointsDaily" value : [BaseJSON writeInt32 : self.iGetPointsDaily]];
    [JsonRoot append:@"iLeftTaskNum" value : [BaseJSON writeInt32 : self.iLeftTaskNum]];
    [JsonRoot append:@"vPrivi" value : [BaseJSON writeList : self.vPrivi VAR_TYPE: [THOTH_LIST CREATE: [AccuPointPriviInfo class]]]];
    [JsonRoot append:@"mPriviPoints" value : [BaseJSON writeMap : self.mPriviPoints VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]]];
    [JsonRoot append:@"iInviteUserNum" value : [BaseJSON writeInt32 : self.iInviteUserNum]];
    [JsonRoot append:@"iInviteGetPoints" value : [BaseJSON writeInt32 : self.iInviteGetPoints]];
    [JsonRoot append:@"iWebRetCode" value : [BaseJSON writeInt32 : self.iWebRetCode]];
    [JsonRoot append:@"vYXTCourseId" value : [BaseJSON writeList : self.vYXTCourseId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"sMemberEndDay" value : [BaseJSON writeString : self.sMemberEndDay]];
    return JsonRoot;
}

- (GetUserPointInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sInviteCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sInviteCode"] required:false def:self.sInviteCode];
    self.iAccuPoints = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAccuPoints"] required:false def:self.iAccuPoints];
    self.iGetPointsDaily = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetPointsDaily"] required:false def:self.iGetPointsDaily];
    self.iLeftTaskNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLeftTaskNum"] required:false def:self.iLeftTaskNum];
    self.vPrivi = [BaseJSON readListDef:[RootMap objectForKey:@"vPrivi"] required:false def:self.vPrivi VAR_TYPE: [THOTH_LIST CREATE: [AccuPointPriviInfo class]]];
    self.mPriviPoints = [BaseJSON readMapDef:[RootMap objectForKey:@"mPriviPoints"] required:false def:self.mPriviPoints VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_INT32 class]]];
    self.iInviteUserNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iInviteUserNum"] required:false def:self.iInviteUserNum];
    self.iInviteGetPoints = [BaseJSON readInt32Def:[RootMap objectForKey:@"iInviteGetPoints"] required:false def:self.iInviteGetPoints];
    self.iWebRetCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWebRetCode"] required:false def:self.iWebRetCode];
    self.vYXTCourseId = [BaseJSON readListDef:[RootMap objectForKey:@"vYXTCourseId"] required:false def:self.vYXTCourseId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sMemberEndDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sMemberEndDay"] required:false def:self.sMemberEndDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPointConverCodeReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iGetNum = 10;
        self.bGetNew = false;
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
    [ostream writeInt32: 1 value: self.iGetNum];
    [ostream writeBoolean: 2 value: self.bGetNew];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPointConverCodeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iGetNum = [istream readInt32Def: 1 required: false def: self.iGetNum];
    self.bGetNew = [istream readBooleanDef: 2 required: false def: self.bGetNew];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"iGetNum" value : [BaseJSON writeInt32 : self.iGetNum]];
    [JsonRoot append:@"bGetNew" value : [BaseJSON writeBoolean : self.bGetNew]];
    return JsonRoot;
}

- (GetPointConverCodeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iGetNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetNum"] required:false def:self.iGetNum];
    self.bGetNew = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bGetNew"] required:false def:self.bGetNew];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPointConverCodeRsp
- (id) init
{
    if (self = [super init])
    {
        self.vCode = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vCode != nil)
    {
        [ostream writeList: 0 value: self.vCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPointConverCodeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vCode = [istream readListDef: 0 required: false def: self.vCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vCode" value : [BaseJSON writeList : self.vCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetPointConverCodeRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vCode = [BaseJSON readListDef:[RootMap objectForKey:@"vCode"] required:false def:self.vCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OpenPointPriviItem
- (id) init
{
    if (self = [super init])
    {
        self.iPriviType = 0;
        self.iOpenDays = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iPriviType];
    [ostream writeInt32: 1 value: self.iOpenDays];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OpenPointPriviItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iPriviType = [istream readInt32Def: 0 required: false def: self.iPriviType];
    self.iOpenDays = [istream readInt32Def: 1 required: false def: self.iOpenDays];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iPriviType" value : [BaseJSON writeInt32 : self.iPriviType]];
    [JsonRoot append:@"iOpenDays" value : [BaseJSON writeInt32 : self.iOpenDays]];
    return JsonRoot;
}

- (OpenPointPriviItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iPriviType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPriviType"] required:false def:self.iPriviType];
    self.iOpenDays = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOpenDays"] required:false def:self.iOpenDays];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OpenPointPriviReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.eOpenType = E_ACCU_POINT_OPEN_BY_POINT;
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.vCouponId = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeInt32: 2 value: (int32_t)self.eOpenType];
    if (self.vItem != nil)
    {
        [ostream writeList: 3 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [OpenPointPriviItem class]]];
    }
    if (self.vCouponId != nil)
    {
        [ostream writeList: 4 value: self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OpenPointPriviReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.eOpenType = [istream readInt32Def: 2 required: false def: (int32_t)self.eOpenType];
    self.vItem = [istream readListDef: 3 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [OpenPointPriviItem class]]];
    self.vCouponId = [istream readListDef: 4 required: false def: self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"eOpenType" value : [BaseJSON writeInt32 : (int32_t)self.eOpenType]];
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [OpenPointPriviItem class]]]];
    [JsonRoot append:@"vCouponId" value : [BaseJSON writeList : self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (OpenPointPriviReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.eOpenType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eOpenType"] required:false def:(int32_t)self.eOpenType];
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [OpenPointPriviItem class]]];
    self.vCouponId = [BaseJSON readListDef:[RootMap objectForKey:@"vCouponId"] required:false def:self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OpenPointPriviRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPrivi = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPrivi != nil)
    {
        [ostream writeList: 0 value: self.vPrivi VAR_TYPE: [THOTH_LIST CREATE: [AccuPointPriviInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OpenPointPriviRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPrivi = [istream readListDef: 0 required: false def: self.vPrivi VAR_TYPE: [THOTH_LIST CREATE: [AccuPointPriviInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vPrivi" value : [BaseJSON writeList : self.vPrivi VAR_TYPE: [THOTH_LIST CREATE: [AccuPointPriviInfo class]]]];
    return JsonRoot;
}

- (OpenPointPriviRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vPrivi = [BaseJSON readListDef:[RootMap objectForKey:@"vPrivi"] required:false def:self.vPrivi VAR_TYPE: [THOTH_LIST CREATE: [AccuPointPriviInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OpenMemberReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iOpenDays = 0;
        self.vCouponId = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeInt32: 2 value: self.iOpenDays];
    if (self.vCouponId != nil)
    {
        [ostream writeList: 3 value: self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OpenMemberReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iOpenDays = [istream readInt32Def: 2 required: false def: self.iOpenDays];
    self.vCouponId = [istream readListDef: 3 required: false def: self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iOpenDays" value : [BaseJSON writeInt32 : self.iOpenDays]];
    [JsonRoot append:@"vCouponId" value : [BaseJSON writeList : self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (OpenMemberReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iOpenDays = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOpenDays"] required:false def:self.iOpenDays];
    self.vCouponId = [BaseJSON readListDef:[RootMap objectForKey:@"vCouponId"] required:false def:self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OpenMemberRsp
- (id) init
{
    if (self = [super init])
    {
        self.sMemberEndDay = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sMemberEndDay != nil)
    {
        [ostream writeString: 0 value: self.sMemberEndDay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OpenMemberRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sMemberEndDay = [istream readStringDef: 0 required: false def: self.sMemberEndDay];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sMemberEndDay" value : [BaseJSON writeString : self.sMemberEndDay]];
    return JsonRoot;
}

- (OpenMemberRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sMemberEndDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sMemberEndDay"] required:false def:self.sMemberEndDay];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPointTaskListReq
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

- (GetPointTaskListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    return JsonRoot;
}

- (GetPointTaskListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AccuPointTaskItem
- (id) init
{
    if (self = [super init])
    {
        self.iType = 0;
        self.sName = @"";
        self.sDesc = @"";
        self.sSkipUrl = @"";
        self.iGetPoints = 0;
        self.iTimesLimit = 0;
        self.sIcon = @"";
        self.iMemberPoints = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iType];
    if (self.sName != nil)
    {
        [ostream writeString: 1 value: self.sName];
    }
    if (self.sDesc != nil)
    {
        [ostream writeString: 2 value: self.sDesc];
    }
    if (self.sSkipUrl != nil)
    {
        [ostream writeString: 3 value: self.sSkipUrl];
    }
    [ostream writeInt32: 4 value: self.iGetPoints];
    [ostream writeInt32: 5 value: self.iTimesLimit];
    if (self.sIcon != nil)
    {
        [ostream writeString: 6 value: self.sIcon];
    }
    [ostream writeInt32: 7 value: self.iMemberPoints];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AccuPointTaskItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iType = [istream readInt32Def: 0 required: false def: self.iType];
    self.sName = [istream readStringDef: 1 required: false def: self.sName];
    self.sDesc = [istream readStringDef: 2 required: false def: self.sDesc];
    self.sSkipUrl = [istream readStringDef: 3 required: false def: self.sSkipUrl];
    self.iGetPoints = [istream readInt32Def: 4 required: false def: self.iGetPoints];
    self.iTimesLimit = [istream readInt32Def: 5 required: false def: self.iTimesLimit];
    self.sIcon = [istream readStringDef: 6 required: false def: self.sIcon];
    self.iMemberPoints = [istream readInt32Def: 7 required: false def: self.iMemberPoints];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    [JsonRoot append:@"sSkipUrl" value : [BaseJSON writeString : self.sSkipUrl]];
    [JsonRoot append:@"iGetPoints" value : [BaseJSON writeInt32 : self.iGetPoints]];
    [JsonRoot append:@"iTimesLimit" value : [BaseJSON writeInt32 : self.iTimesLimit]];
    [JsonRoot append:@"sIcon" value : [BaseJSON writeString : self.sIcon]];
    [JsonRoot append:@"iMemberPoints" value : [BaseJSON writeInt32 : self.iMemberPoints]];
    return JsonRoot;
}

- (AccuPointTaskItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.sSkipUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sSkipUrl"] required:false def:self.sSkipUrl];
    self.iGetPoints = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetPoints"] required:false def:self.iGetPoints];
    self.iTimesLimit = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTimesLimit"] required:false def:self.iTimesLimit];
    self.sIcon = [BaseJSON readStringDef:[RootMap objectForKey:@"sIcon"] required:false def:self.sIcon];
    self.iMemberPoints = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMemberPoints"] required:false def:self.iMemberPoints];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPointTaskListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vTask = [NSMutableArray arrayWithCapacity:0];
        self.vFinished = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vTask != nil)
    {
        [ostream writeList: 0 value: self.vTask VAR_TYPE: [THOTH_LIST CREATE: [AccuPointTaskItem class]]];
    }
    if (self.vFinished != nil)
    {
        [ostream writeList: 1 value: self.vFinished VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPointTaskListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vTask = [istream readListDef: 0 required: false def: self.vTask VAR_TYPE: [THOTH_LIST CREATE: [AccuPointTaskItem class]]];
    self.vFinished = [istream readListDef: 1 required: false def: self.vFinished VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vTask" value : [BaseJSON writeList : self.vTask VAR_TYPE: [THOTH_LIST CREATE: [AccuPointTaskItem class]]]];
    [JsonRoot append:@"vFinished" value : [BaseJSON writeList : self.vFinished VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]]];
    return JsonRoot;
}

- (GetPointTaskListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vTask = [BaseJSON readListDef:[RootMap objectForKey:@"vTask"] required:false def:self.vTask VAR_TYPE: [THOTH_LIST CREATE: [AccuPointTaskItem class]]];
    self.vFinished = [BaseJSON readListDef:[RootMap objectForKey:@"vFinished"] required:false def:self.vFinished VAR_TYPE: [THOTH_LIST CREATE: [THOTH_INT32 class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportFinishTaskReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iTaskType = 0;
        self.iTaskPoints = 0;
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
    [ostream writeInt32: 2 value: self.iTaskType];
    [ostream writeInt32: 3 value: self.iTaskPoints];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportFinishTaskReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iTaskType = [istream readInt32Def: 2 required: false def: self.iTaskType];
    self.iTaskPoints = [istream readInt32Def: 3 required: false def: self.iTaskPoints];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iTaskType" value : [BaseJSON writeInt32 : self.iTaskType]];
    [JsonRoot append:@"iTaskPoints" value : [BaseJSON writeInt32 : self.iTaskPoints]];
    return JsonRoot;
}

- (ReportFinishTaskReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iTaskType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTaskType"] required:false def:self.iTaskType];
    self.iTaskPoints = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTaskPoints"] required:false def:self.iTaskPoints];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportFinishTaskRsp
- (id) init
{
    if (self = [super init])
    {
        self.iGetPoints = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iGetPoints];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportFinishTaskRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iGetPoints = [istream readInt32Def: 0 required: false def: self.iGetPoints];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iGetPoints" value : [BaseJSON writeInt32 : self.iGetPoints]];
    return JsonRoot;
}

- (ReportFinishTaskRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iGetPoints = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetPoints"] required:false def:self.iGetPoints];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CommitAccuPointCodeReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sCode = @"";
        self.iCodeType = 0;
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
    if (self.sCode != nil)
    {
        [ostream writeString: 2 value: self.sCode];
    }
    [ostream writeInt32: 3 value: self.iCodeType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommitAccuPointCodeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sCode = [istream readStringDef: 2 required: false def: self.sCode];
    self.iCodeType = [istream readInt32Def: 3 required: false def: self.iCodeType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"sCode" value : [BaseJSON writeString : self.sCode]];
    [JsonRoot append:@"iCodeType" value : [BaseJSON writeInt32 : self.iCodeType]];
    return JsonRoot;
}

- (CommitAccuPointCodeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sCode"] required:false def:self.sCode];
    self.iCodeType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCodeType"] required:false def:self.iCodeType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CommitAccuPointCodeRsp
- (id) init
{
    if (self = [super init])
    {
        self.iGetPoints = 0;
        self.iGetPriviDays = 0;
        self.iRetCode = 0;
        self.sRetMsg = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iGetPoints];
    [ostream writeInt32: 1 value: self.iGetPriviDays];
    [ostream writeInt32: 2 value: self.iRetCode];
    if (self.sRetMsg != nil)
    {
        [ostream writeString: 3 value: self.sRetMsg];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommitAccuPointCodeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iGetPoints = [istream readInt32Def: 0 required: false def: self.iGetPoints];
    self.iGetPriviDays = [istream readInt32Def: 1 required: false def: self.iGetPriviDays];
    self.iRetCode = [istream readInt32Def: 2 required: false def: self.iRetCode];
    self.sRetMsg = [istream readStringDef: 3 required: false def: self.sRetMsg];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iGetPoints" value : [BaseJSON writeInt32 : self.iGetPoints]];
    [JsonRoot append:@"iGetPriviDays" value : [BaseJSON writeInt32 : self.iGetPriviDays]];
    [JsonRoot append:@"iRetCode" value : [BaseJSON writeInt32 : self.iRetCode]];
    [JsonRoot append:@"sRetMsg" value : [BaseJSON writeString : self.sRetMsg]];
    return JsonRoot;
}

- (CommitAccuPointCodeRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iGetPoints = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetPoints"] required:false def:self.iGetPoints];
    self.iGetPriviDays = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetPriviDays"] required:false def:self.iGetPriviDays];
    self.iRetCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRetCode"] required:false def:self.iRetCode];
    self.sRetMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sRetMsg"] required:false def:self.sRetMsg];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserPointDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iDirection = 0;
        self.sStartId = @"";
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
    [ostream writeInt32: 2 value: self.iDirection];
    if (self.sStartId != nil)
    {
        [ostream writeString: 3 value: self.sStartId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserPointDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iDirection = [istream readInt32Def: 2 required: false def: self.iDirection];
    self.sStartId = [istream readStringDef: 3 required: false def: self.sStartId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iDirection" value : [BaseJSON writeInt32 : self.iDirection]];
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    return JsonRoot;
}

- (GetUserPointDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iDirection = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDirection"] required:false def:self.iDirection];
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation UserPointDetailItem
- (id) init
{
    if (self = [super init])
    {
        self.iTaskType = 0;
        self.lTimeStamp = 0;
        self.iGetPoints = 0;
        self.sTaskDesc = @"";
        self.sTaskClassDesc = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTaskType];
    [ostream writeInt64: 1 value: self.lTimeStamp];
    [ostream writeInt32: 2 value: self.iGetPoints];
    if (self.sTaskDesc != nil)
    {
        [ostream writeString: 3 value: self.sTaskDesc];
    }
    if (self.sTaskClassDesc != nil)
    {
        [ostream writeString: 4 value: self.sTaskClassDesc];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UserPointDetailItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTaskType = [istream readInt32Def: 0 required: false def: self.iTaskType];
    self.lTimeStamp = [istream readInt64Def: 1 required: false def: self.lTimeStamp];
    self.iGetPoints = [istream readInt32Def: 2 required: false def: self.iGetPoints];
    self.sTaskDesc = [istream readStringDef: 3 required: false def: self.sTaskDesc];
    self.sTaskClassDesc = [istream readStringDef: 4 required: false def: self.sTaskClassDesc];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iTaskType" value : [BaseJSON writeInt32 : self.iTaskType]];
    [JsonRoot append:@"lTimeStamp" value : [BaseJSON writeInt64 : self.lTimeStamp]];
    [JsonRoot append:@"iGetPoints" value : [BaseJSON writeInt32 : self.iGetPoints]];
    [JsonRoot append:@"sTaskDesc" value : [BaseJSON writeString : self.sTaskDesc]];
    [JsonRoot append:@"sTaskClassDesc" value : [BaseJSON writeString : self.sTaskClassDesc]];
    return JsonRoot;
}

- (UserPointDetailItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iTaskType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTaskType"] required:false def:self.iTaskType];
    self.lTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTimeStamp"] required:false def:self.lTimeStamp];
    self.iGetPoints = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetPoints"] required:false def:self.iGetPoints];
    self.sTaskDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sTaskDesc"] required:false def:self.sTaskDesc];
    self.sTaskClassDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sTaskClassDesc"] required:false def:self.sTaskClassDesc];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserPointDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.iTotalNum = 0;
        self.iStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vItem != nil)
    {
        [ostream writeList: 0 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [UserPointDetailItem class]]];
    }
    [ostream writeInt32: 1 value: self.iTotalNum];
    [ostream writeInt32: 2 value: self.iStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserPointDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vItem = [istream readListDef: 0 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [UserPointDetailItem class]]];
    self.iTotalNum = [istream readInt32Def: 1 required: false def: self.iTotalNum];
    self.iStatus = [istream readInt32Def: 2 required: false def: self.iStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [UserPointDetailItem class]]]];
    [JsonRoot append:@"iTotalNum" value : [BaseJSON writeInt32 : self.iTotalNum]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    return JsonRoot;
}

- (GetUserPointDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [UserPointDetailItem class]]];
    self.iTotalNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalNum"] required:false def:self.iTotalNum];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetOpenPriviDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iDirection = 0;
        self.sStartId = @"";
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
    [ostream writeInt32: 2 value: self.iDirection];
    if (self.sStartId != nil)
    {
        [ostream writeString: 3 value: self.sStartId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetOpenPriviDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iDirection = [istream readInt32Def: 2 required: false def: self.iDirection];
    self.sStartId = [istream readStringDef: 3 required: false def: self.sStartId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iDirection" value : [BaseJSON writeInt32 : self.iDirection]];
    [JsonRoot append:@"sStartId" value : [BaseJSON writeString : self.sStartId]];
    return JsonRoot;
}

- (GetOpenPriviDetailReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iDirection = [BaseJSON readInt32Def:[RootMap objectForKey:@"iDirection"] required:false def:self.iDirection];
    self.sStartId = [BaseJSON readStringDef:[RootMap objectForKey:@"sStartId"] required:false def:self.sStartId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OpenPriviDetailItem
- (id) init
{
    if (self = [super init])
    {
        self.iOpenType = 0;
        self.iPriviType = 0;
        self.iOpenDays = 0;
        self.sPriviEndDay = @"";
        self.lTimeStamp = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iOpenType];
    [ostream writeInt32: 1 value: self.iPriviType];
    [ostream writeInt32: 2 value: self.iOpenDays];
    if (self.sPriviEndDay != nil)
    {
        [ostream writeString: 3 value: self.sPriviEndDay];
    }
    [ostream writeInt64: 4 value: self.lTimeStamp];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OpenPriviDetailItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iOpenType = [istream readInt32Def: 0 required: false def: self.iOpenType];
    self.iPriviType = [istream readInt32Def: 1 required: false def: self.iPriviType];
    self.iOpenDays = [istream readInt32Def: 2 required: false def: self.iOpenDays];
    self.sPriviEndDay = [istream readStringDef: 3 required: false def: self.sPriviEndDay];
    self.lTimeStamp = [istream readInt64Def: 4 required: false def: self.lTimeStamp];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iOpenType" value : [BaseJSON writeInt32 : self.iOpenType]];
    [JsonRoot append:@"iPriviType" value : [BaseJSON writeInt32 : self.iPriviType]];
    [JsonRoot append:@"iOpenDays" value : [BaseJSON writeInt32 : self.iOpenDays]];
    [JsonRoot append:@"sPriviEndDay" value : [BaseJSON writeString : self.sPriviEndDay]];
    [JsonRoot append:@"lTimeStamp" value : [BaseJSON writeInt64 : self.lTimeStamp]];
    return JsonRoot;
}

- (OpenPriviDetailItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iOpenType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOpenType"] required:false def:self.iOpenType];
    self.iPriviType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPriviType"] required:false def:self.iPriviType];
    self.iOpenDays = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOpenDays"] required:false def:self.iOpenDays];
    self.sPriviEndDay = [BaseJSON readStringDef:[RootMap objectForKey:@"sPriviEndDay"] required:false def:self.sPriviEndDay];
    self.lTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTimeStamp"] required:false def:self.lTimeStamp];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetOpenPriviDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPriviItem = [NSMutableArray arrayWithCapacity:0];
        self.iTotalNum = 0;
        self.iStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPriviItem != nil)
    {
        [ostream writeList: 0 value: self.vPriviItem VAR_TYPE: [THOTH_LIST CREATE: [OpenPriviDetailItem class]]];
    }
    [ostream writeInt32: 1 value: self.iTotalNum];
    [ostream writeInt32: 2 value: self.iStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetOpenPriviDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPriviItem = [istream readListDef: 0 required: false def: self.vPriviItem VAR_TYPE: [THOTH_LIST CREATE: [OpenPriviDetailItem class]]];
    self.iTotalNum = [istream readInt32Def: 1 required: false def: self.iTotalNum];
    self.iStatus = [istream readInt32Def: 2 required: false def: self.iStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vPriviItem" value : [BaseJSON writeList : self.vPriviItem VAR_TYPE: [THOTH_LIST CREATE: [OpenPriviDetailItem class]]]];
    [JsonRoot append:@"iTotalNum" value : [BaseJSON writeInt32 : self.iTotalNum]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    return JsonRoot;
}

- (GetOpenPriviDetailRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vPriviItem = [BaseJSON readListDef:[RootMap objectForKey:@"vPriviItem"] required:false def:self.vPriviItem VAR_TYPE: [THOTH_LIST CREATE: [OpenPriviDetailItem class]]];
    self.iTotalNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalNum"] required:false def:self.iTotalNum];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetAccuPointConverCodeReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iOpenNumber = 0;
        self.sDesc = @"";
        self.iSize = 20;
        self.lInvalidTimeStamp = 0;
        self.iCodeType = 0;
        self.iSubjectType = 0;
        self.iOpenUnit = 0;
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
    [ostream writeInt32: 1 value: self.iOpenNumber];
    if (self.sDesc != nil)
    {
        [ostream writeString: 2 value: self.sDesc];
    }
    [ostream writeInt32: 3 value: self.iSize];
    [ostream writeInt64: 4 value: self.lInvalidTimeStamp];
    [ostream writeInt32: 5 value: self.iCodeType];
    [ostream writeInt32: 6 value: self.iSubjectType];
    [ostream writeInt32: 7 value: self.iOpenUnit];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetAccuPointConverCodeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iOpenNumber = [istream readInt32Def: 1 required: false def: self.iOpenNumber];
    self.sDesc = [istream readStringDef: 2 required: false def: self.sDesc];
    self.iSize = [istream readInt32Def: 3 required: false def: self.iSize];
    self.lInvalidTimeStamp = [istream readInt64Def: 4 required: false def: self.lInvalidTimeStamp];
    self.iCodeType = [istream readInt32Def: 5 required: false def: self.iCodeType];
    self.iSubjectType = [istream readInt32Def: 6 required: false def: self.iSubjectType];
    self.iOpenUnit = [istream readInt32Def: 7 required: false def: self.iOpenUnit];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"iOpenNumber" value : [BaseJSON writeInt32 : self.iOpenNumber]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    [JsonRoot append:@"iSize" value : [BaseJSON writeInt32 : self.iSize]];
    [JsonRoot append:@"lInvalidTimeStamp" value : [BaseJSON writeInt64 : self.lInvalidTimeStamp]];
    [JsonRoot append:@"iCodeType" value : [BaseJSON writeInt32 : self.iCodeType]];
    [JsonRoot append:@"iSubjectType" value : [BaseJSON writeInt32 : self.iSubjectType]];
    [JsonRoot append:@"iOpenUnit" value : [BaseJSON writeInt32 : self.iOpenUnit]];
    return JsonRoot;
}

- (GetAccuPointConverCodeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iOpenNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOpenNumber"] required:false def:self.iOpenNumber];
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.iSize = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSize"] required:false def:self.iSize];
    self.lInvalidTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lInvalidTimeStamp"] required:false def:self.lInvalidTimeStamp];
    self.iCodeType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCodeType"] required:false def:self.iCodeType];
    self.iSubjectType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubjectType"] required:false def:self.iSubjectType];
    self.iOpenUnit = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOpenUnit"] required:false def:self.iOpenUnit];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetAccuPointConverCodeRsp
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

- (GetAccuPointConverCodeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vConversionCode = [istream readListDef: 0 required: false def: self.vConversionCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vConversionCode" value : [BaseJSON writeList : self.vConversionCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetAccuPointConverCodeRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vConversionCode = [BaseJSON readListDef:[RootMap objectForKey:@"vConversionCode"] required:false def:self.vConversionCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation UseAccuPointReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iUseType = 0;
        self.iUsePointNum = 0;
        self.iGetPointNum = 0;
        self.lTimeStamp = 0;
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
    [ostream writeInt32: 2 value: self.iUseType];
    [ostream writeInt32: 3 value: self.iUsePointNum];
    [ostream writeInt32: 4 value: self.iGetPointNum];
    [ostream writeInt64: 5 value: self.lTimeStamp];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UseAccuPointReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iUseType = [istream readInt32Def: 2 required: false def: self.iUseType];
    self.iUsePointNum = [istream readInt32Def: 3 required: false def: self.iUsePointNum];
    self.iGetPointNum = [istream readInt32Def: 4 required: false def: self.iGetPointNum];
    self.lTimeStamp = [istream readInt64Def: 5 required: false def: self.lTimeStamp];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iUseType" value : [BaseJSON writeInt32 : self.iUseType]];
    [JsonRoot append:@"iUsePointNum" value : [BaseJSON writeInt32 : self.iUsePointNum]];
    [JsonRoot append:@"iGetPointNum" value : [BaseJSON writeInt32 : self.iGetPointNum]];
    [JsonRoot append:@"lTimeStamp" value : [BaseJSON writeInt64 : self.lTimeStamp]];
    return JsonRoot;
}

- (UseAccuPointReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iUseType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUseType"] required:false def:self.iUseType];
    self.iUsePointNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUsePointNum"] required:false def:self.iUsePointNum];
    self.iGetPointNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetPointNum"] required:false def:self.iGetPointNum];
    self.lTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTimeStamp"] required:false def:self.lTimeStamp];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation UseAccuPointRsp
- (id) init
{
    if (self = [super init])
    {
        self.iLeftAccuPoint = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iLeftAccuPoint];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UseAccuPointRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iLeftAccuPoint = [istream readInt32Def: 0 required: false def: self.iLeftAccuPoint];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iLeftAccuPoint" value : [BaseJSON writeInt32 : self.iLeftAccuPoint]];
    return JsonRoot;
}

- (UseAccuPointRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iLeftAccuPoint = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLeftAccuPoint"] required:false def:self.iLeftAccuPoint];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ValueAddedPackageDesc
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sName = @"";
        self.sDesc = @"";
        self.iFee = 0;
        self.iNumber = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sId != nil)
    {
        [ostream writeString: 0 value: self.sId];
    }
    if (self.sName != nil)
    {
        [ostream writeString: 1 value: self.sName];
    }
    if (self.sDesc != nil)
    {
        [ostream writeString: 2 value: self.sDesc];
    }
    [ostream writeInt32: 3 value: self.iFee];
    [ostream writeInt32: 4 value: self.iNumber];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ValueAddedPackageDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sName = [istream readStringDef: 1 required: false def: self.sName];
    self.sDesc = [istream readStringDef: 2 required: false def: self.sDesc];
    self.iFee = [istream readInt32Def: 3 required: false def: self.iFee];
    self.iNumber = [istream readInt32Def: 4 required: false def: self.iNumber];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sId" value : [BaseJSON writeString : self.sId]];
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    [JsonRoot append:@"iFee" value : [BaseJSON writeInt32 : self.iFee]];
    [JsonRoot append:@"iNumber" value : [BaseJSON writeInt32 : self.iNumber]];
    return JsonRoot;
}

- (ValueAddedPackageDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.iFee = [BaseJSON readInt32Def:[RootMap objectForKey:@"iFee"] required:false def:self.iFee];
    self.iNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumber"] required:false def:self.iNumber];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ValueAddedDesc
- (id) init
{
    if (self = [super init])
    {
        self.iType = 0;
        self.sName = @"";
        self.sDesc = @"";
        self.sFeeDesc = @"";
        self.sIcon = @"";
        self.fFee = 0;
        self.iNumber = 0;
        self.iOnlineState = 0;
        self.sBeforeSaleIcon = @"";
        self.sPreSalingUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iType];
    if (self.sName != nil)
    {
        [ostream writeString: 1 value: self.sName];
    }
    if (self.sDesc != nil)
    {
        [ostream writeString: 2 value: self.sDesc];
    }
    if (self.sFeeDesc != nil)
    {
        [ostream writeString: 3 value: self.sFeeDesc];
    }
    if (self.sIcon != nil)
    {
        [ostream writeString: 4 value: self.sIcon];
    }
    [ostream writeFloat: 5 value: self.fFee];
    [ostream writeInt32: 6 value: self.iNumber];
    [ostream writeInt32: 7 value: self.iOnlineState];
    if (self.sBeforeSaleIcon != nil)
    {
        [ostream writeString: 8 value: self.sBeforeSaleIcon];
    }
    if (self.sPreSalingUrl != nil)
    {
        [ostream writeString: 9 value: self.sPreSalingUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ValueAddedDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iType = [istream readInt32Def: 0 required: false def: self.iType];
    self.sName = [istream readStringDef: 1 required: false def: self.sName];
    self.sDesc = [istream readStringDef: 2 required: false def: self.sDesc];
    self.sFeeDesc = [istream readStringDef: 3 required: false def: self.sFeeDesc];
    self.sIcon = [istream readStringDef: 4 required: false def: self.sIcon];
    self.fFee = [istream readFloatDef: 5 required: false def: self.fFee];
    self.iNumber = [istream readInt32Def: 6 required: false def: self.iNumber];
    self.iOnlineState = [istream readInt32Def: 7 required: false def: self.iOnlineState];
    self.sBeforeSaleIcon = [istream readStringDef: 8 required: false def: self.sBeforeSaleIcon];
    self.sPreSalingUrl = [istream readStringDef: 9 required: false def: self.sPreSalingUrl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    [JsonRoot append:@"sName" value : [BaseJSON writeString : self.sName]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    [JsonRoot append:@"sFeeDesc" value : [BaseJSON writeString : self.sFeeDesc]];
    [JsonRoot append:@"sIcon" value : [BaseJSON writeString : self.sIcon]];
    [JsonRoot append:@"fFee" value : [BaseJSON writeFloat : self.fFee]];
    [JsonRoot append:@"iNumber" value : [BaseJSON writeInt32 : self.iNumber]];
    [JsonRoot append:@"iOnlineState" value : [BaseJSON writeInt32 : self.iOnlineState]];
    [JsonRoot append:@"sBeforeSaleIcon" value : [BaseJSON writeString : self.sBeforeSaleIcon]];
    [JsonRoot append:@"sPreSalingUrl" value : [BaseJSON writeString : self.sPreSalingUrl]];
    return JsonRoot;
}

- (ValueAddedDesc *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    self.sName = [BaseJSON readStringDef:[RootMap objectForKey:@"sName"] required:false def:self.sName];
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.sFeeDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sFeeDesc"] required:false def:self.sFeeDesc];
    self.sIcon = [BaseJSON readStringDef:[RootMap objectForKey:@"sIcon"] required:false def:self.sIcon];
    self.fFee = [BaseJSON readFloatDef:[RootMap objectForKey:@"fFee"] required:false def:self.fFee];
    self.iNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumber"] required:false def:self.iNumber];
    self.iOnlineState = [BaseJSON readInt32Def:[RootMap objectForKey:@"iOnlineState"] required:false def:self.iOnlineState];
    self.sBeforeSaleIcon = [BaseJSON readStringDef:[RootMap objectForKey:@"sBeforeSaleIcon"] required:false def:self.sBeforeSaleIcon];
    self.sPreSalingUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sPreSalingUrl"] required:false def:self.sPreSalingUrl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetValueAddedListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetValueAddedListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    return JsonRoot;
}

- (GetValueAddedListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetValueAddedListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [ValueAddedDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetValueAddedListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [ValueAddedDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vList" value : [BaseJSON writeList : self.vList VAR_TYPE: [THOTH_LIST CREATE: [ValueAddedDesc class]]]];
    return JsonRoot;
}

- (GetValueAddedListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vList = [BaseJSON readListDef:[RootMap objectForKey:@"vList"] required:false def:self.vList VAR_TYPE: [THOTH_LIST CREATE: [ValueAddedDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetValueAddedPackageListReq
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

- (GetValueAddedPackageListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    return JsonRoot;
}

- (GetValueAddedPackageListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetValueAddedPackageListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [ValueAddedPackageDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetValueAddedPackageListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [ValueAddedPackageDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vList" value : [BaseJSON writeList : self.vList VAR_TYPE: [THOTH_LIST CREATE: [ValueAddedPackageDesc class]]]];
    return JsonRoot;
}

- (GetValueAddedPackageListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vList = [BaseJSON readListDef:[RootMap objectForKey:@"vList"] required:false def:self.vList VAR_TYPE: [THOTH_LIST CREATE: [ValueAddedPackageDesc class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPreSaleLeftNumReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iSubjectType = 1;
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
    [ostream writeInt32: 1 value: self.iSubjectType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPreSaleLeftNumReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iSubjectType = [istream readInt32Def: 1 required: false def: self.iSubjectType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"iSubjectType" value : [BaseJSON writeInt32 : self.iSubjectType]];
    return JsonRoot;
}

- (GetPreSaleLeftNumReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iSubjectType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubjectType"] required:false def:self.iSubjectType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPreSaleLeftNumRsp
- (id) init
{
    if (self = [super init])
    {
        self.iLeftNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iLeftNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPreSaleLeftNumRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iLeftNum = [istream readInt32Def: 0 required: false def: self.iLeftNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iLeftNum" value : [BaseJSON writeInt32 : self.iLeftNum]];
    return JsonRoot;
}

- (GetPreSaleLeftNumRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iLeftNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iLeftNum"] required:false def:self.iLeftNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OpenDtPrivi4YXTReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sClassId = @"";
        self.sOpenPhoneNum = @"";
        self.vCouponId = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sClassId != nil)
    {
        [ostream writeString: 2 value: self.sClassId];
    }
    if (self.sOpenPhoneNum != nil)
    {
        [ostream writeString: 3 value: self.sOpenPhoneNum];
    }
    if (self.vCouponId != nil)
    {
        [ostream writeList: 4 value: self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OpenDtPrivi4YXTReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sClassId = [istream readStringDef: 2 required: false def: self.sClassId];
    self.sOpenPhoneNum = [istream readStringDef: 3 required: false def: self.sOpenPhoneNum];
    self.vCouponId = [istream readListDef: 4 required: false def: self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"sClassId" value : [BaseJSON writeString : self.sClassId]];
    [JsonRoot append:@"sOpenPhoneNum" value : [BaseJSON writeString : self.sOpenPhoneNum]];
    [JsonRoot append:@"vCouponId" value : [BaseJSON writeList : self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (OpenDtPrivi4YXTReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sClassId = [BaseJSON readStringDef:[RootMap objectForKey:@"sClassId"] required:false def:self.sClassId];
    self.sOpenPhoneNum = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpenPhoneNum"] required:false def:self.sOpenPhoneNum];
    self.vCouponId = [BaseJSON readListDef:[RootMap objectForKey:@"vCouponId"] required:false def:self.vCouponId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation OpenDtPrivi4YXTRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRetCode = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRetCode];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (OpenDtPrivi4YXTRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRetCode = [istream readInt32Def: 0 required: false def: self.iRetCode];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iRetCode" value : [BaseJSON writeInt32 : self.iRetCode]];
    return JsonRoot;
}

- (OpenDtPrivi4YXTRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRetCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRetCode"] required:false def:self.iRetCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserCouponNumReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iCouponStatus = 2;
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
    [ostream writeInt32: 2 value: self.iCouponStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserCouponNumReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iCouponStatus = [istream readInt32Def: 2 required: false def: self.iCouponStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iCouponStatus" value : [BaseJSON writeInt32 : self.iCouponStatus]];
    return JsonRoot;
}

- (GetUserCouponNumReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iCouponStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCouponStatus"] required:false def:self.iCouponStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserCouponNumRsp
- (id) init
{
    if (self = [super init])
    {
        self.iCouponNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iCouponNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserCouponNumRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iCouponNum = [istream readInt32Def: 0 required: false def: self.iCouponNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iCouponNum" value : [BaseJSON writeInt32 : self.iCouponNum]];
    return JsonRoot;
}

- (GetUserCouponNumRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iCouponNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCouponNum"] required:false def:self.iCouponNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserCouponListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iCouponStatus = 0;
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
    [ostream writeInt32: 2 value: self.iCouponStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserCouponListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iCouponStatus = [istream readInt32Def: 2 required: false def: self.iCouponStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iCouponStatus" value : [BaseJSON writeInt32 : self.iCouponStatus]];
    return JsonRoot;
}

- (GetUserCouponListReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iCouponStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCouponStatus"] required:false def:self.iCouponStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AccuPointCoupon
- (id) init
{
    if (self = [super init])
    {
        self.sCouponCode = @"";
        self.iValueMoney = 0;
        self.iUseCondMoney = 0;
        self.iSubjectType = 0;
        self.iStatus = 0;
        self.lGenTimeStamp = 0;
        self.lStartTimeStamp = 0;
        self.lInvalidTimeStamp = 0;
        self.lUseTimeStamp = 0;
        self.iUseCondDesc = @"";
        self.sCouponName = @"";
        self.sAppScope = @"";
        self.sActName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sCouponCode != nil)
    {
        [ostream writeString: 0 value: self.sCouponCode];
    }
    [ostream writeInt32: 1 value: self.iValueMoney];
    [ostream writeInt32: 2 value: self.iUseCondMoney];
    [ostream writeInt32: 3 value: self.iSubjectType];
    [ostream writeInt32: 4 value: self.iStatus];
    [ostream writeInt64: 5 value: self.lGenTimeStamp];
    [ostream writeInt64: 6 value: self.lStartTimeStamp];
    [ostream writeInt64: 7 value: self.lInvalidTimeStamp];
    [ostream writeInt64: 8 value: self.lUseTimeStamp];
    if (self.iUseCondDesc != nil)
    {
        [ostream writeString: 9 value: self.iUseCondDesc];
    }
    if (self.sCouponName != nil)
    {
        [ostream writeString: 10 value: self.sCouponName];
    }
    if (self.sAppScope != nil)
    {
        [ostream writeString: 11 value: self.sAppScope];
    }
    if (self.sActName != nil)
    {
        [ostream writeString: 12 value: self.sActName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AccuPointCoupon *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sCouponCode = [istream readStringDef: 0 required: false def: self.sCouponCode];
    self.iValueMoney = [istream readInt32Def: 1 required: false def: self.iValueMoney];
    self.iUseCondMoney = [istream readInt32Def: 2 required: false def: self.iUseCondMoney];
    self.iSubjectType = [istream readInt32Def: 3 required: false def: self.iSubjectType];
    self.iStatus = [istream readInt32Def: 4 required: false def: self.iStatus];
    self.lGenTimeStamp = [istream readInt64Def: 5 required: false def: self.lGenTimeStamp];
    self.lStartTimeStamp = [istream readInt64Def: 6 required: false def: self.lStartTimeStamp];
    self.lInvalidTimeStamp = [istream readInt64Def: 7 required: false def: self.lInvalidTimeStamp];
    self.lUseTimeStamp = [istream readInt64Def: 8 required: false def: self.lUseTimeStamp];
    self.iUseCondDesc = [istream readStringDef: 9 required: false def: self.iUseCondDesc];
    self.sCouponName = [istream readStringDef: 10 required: false def: self.sCouponName];
    self.sAppScope = [istream readStringDef: 11 required: false def: self.sAppScope];
    self.sActName = [istream readStringDef: 12 required: false def: self.sActName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"sCouponCode" value : [BaseJSON writeString : self.sCouponCode]];
    [JsonRoot append:@"iValueMoney" value : [BaseJSON writeInt32 : self.iValueMoney]];
    [JsonRoot append:@"iUseCondMoney" value : [BaseJSON writeInt32 : self.iUseCondMoney]];
    [JsonRoot append:@"iSubjectType" value : [BaseJSON writeInt32 : self.iSubjectType]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"lGenTimeStamp" value : [BaseJSON writeInt64 : self.lGenTimeStamp]];
    [JsonRoot append:@"lStartTimeStamp" value : [BaseJSON writeInt64 : self.lStartTimeStamp]];
    [JsonRoot append:@"lInvalidTimeStamp" value : [BaseJSON writeInt64 : self.lInvalidTimeStamp]];
    [JsonRoot append:@"lUseTimeStamp" value : [BaseJSON writeInt64 : self.lUseTimeStamp]];
    [JsonRoot append:@"iUseCondDesc" value : [BaseJSON writeString : self.iUseCondDesc]];
    [JsonRoot append:@"sCouponName" value : [BaseJSON writeString : self.sCouponName]];
    [JsonRoot append:@"sAppScope" value : [BaseJSON writeString : self.sAppScope]];
    [JsonRoot append:@"sActName" value : [BaseJSON writeString : self.sActName]];
    return JsonRoot;
}

- (AccuPointCoupon *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sCouponCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sCouponCode"] required:false def:self.sCouponCode];
    self.iValueMoney = [BaseJSON readInt32Def:[RootMap objectForKey:@"iValueMoney"] required:false def:self.iValueMoney];
    self.iUseCondMoney = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUseCondMoney"] required:false def:self.iUseCondMoney];
    self.iSubjectType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubjectType"] required:false def:self.iSubjectType];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.lGenTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lGenTimeStamp"] required:false def:self.lGenTimeStamp];
    self.lStartTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lStartTimeStamp"] required:false def:self.lStartTimeStamp];
    self.lInvalidTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lInvalidTimeStamp"] required:false def:self.lInvalidTimeStamp];
    self.lUseTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lUseTimeStamp"] required:false def:self.lUseTimeStamp];
    self.iUseCondDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"iUseCondDesc"] required:false def:self.iUseCondDesc];
    self.sCouponName = [BaseJSON readStringDef:[RootMap objectForKey:@"sCouponName"] required:false def:self.sCouponName];
    self.sAppScope = [BaseJSON readStringDef:[RootMap objectForKey:@"sAppScope"] required:false def:self.sAppScope];
    self.sActName = [BaseJSON readStringDef:[RootMap objectForKey:@"sActName"] required:false def:self.sActName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserCouponListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [AccuPointCoupon class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserCouponListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [AccuPointCoupon class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"vList" value : [BaseJSON writeList : self.vList VAR_TYPE: [THOTH_LIST CREATE: [AccuPointCoupon class]]]];
    return JsonRoot;
}

- (GetUserCouponListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vList = [BaseJSON readListDef:[RootMap objectForKey:@"vList"] required:false def:self.vList VAR_TYPE: [THOTH_LIST CREATE: [AccuPointCoupon class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReceiveCouponReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iCouponType = 0;
        self.iUseCondMoney = 0;
        self.sActName = @"";
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
    [ostream writeInt32: 2 value: self.iCouponType];
    [ostream writeInt32: 3 value: self.iUseCondMoney];
    if (self.sActName != nil)
    {
        [ostream writeString: 4 value: self.sActName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReceiveCouponReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iCouponType = [istream readInt32Def: 2 required: false def: self.iCouponType];
    self.iUseCondMoney = [istream readInt32Def: 3 required: false def: self.iUseCondMoney];
    self.sActName = [istream readStringDef: 4 required: false def: self.sActName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iCouponType" value : [BaseJSON writeInt32 : self.iCouponType]];
    [JsonRoot append:@"iUseCondMoney" value : [BaseJSON writeInt32 : self.iUseCondMoney]];
    [JsonRoot append:@"sActName" value : [BaseJSON writeString : self.sActName]];
    return JsonRoot;
}

- (ReceiveCouponReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iCouponType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iCouponType"] required:false def:self.iCouponType];
    self.iUseCondMoney = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUseCondMoney"] required:false def:self.iUseCondMoney];
    self.sActName = [BaseJSON readStringDef:[RootMap objectForKey:@"sActName"] required:false def:self.sActName];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReceiveCouponRsp
- (id) init
{
    if (self = [super init])
    {
        self.iReturnCode = 0;
        self.stCoupon = [[AccuPointCoupon alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iReturnCode];
    if (self.stCoupon != nil)
    {
        [ostream writeMessage: 1 value: self.stCoupon];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReceiveCouponRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iReturnCode = [istream readInt32Def: 0 required: false def: self.iReturnCode];
    self.stCoupon = (AccuPointCoupon*)[istream readMessageDef: 1 required: false def: self.stCoupon VAR_TYPE: [AccuPointCoupon class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iReturnCode" value : [BaseJSON writeInt32 : self.iReturnCode]];
    [JsonRoot append:@"stCoupon" value : [BaseJSON writeMessage : self.stCoupon]];
    return JsonRoot;
}

- (ReceiveCouponRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iReturnCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iReturnCode"] required:false def:self.iReturnCode];
    self.stCoupon = [BaseJSON readMessageDef:[RootMap objectForKey:@"stCoupon"] required:false def:self.stCoupon VAR_TYPE: [AccuPointCoupon class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation UserEvalItem
- (id) init
{
    if (self = [super init])
    {
        self.iQuestionId = -1;
        self.iAnswerId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iQuestionId];
    [ostream writeInt32: 1 value: self.iAnswerId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UserEvalItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iQuestionId = [istream readInt32Def: 0 required: false def: self.iQuestionId];
    self.iAnswerId = [istream readInt32Def: 1 required: false def: self.iAnswerId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iQuestionId" value : [BaseJSON writeInt32 : self.iQuestionId]];
    [JsonRoot append:@"iAnswerId" value : [BaseJSON writeInt32 : self.iAnswerId]];
    return JsonRoot;
}

- (UserEvalItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iQuestionId = [BaseJSON readInt32Def:[RootMap objectForKey:@"iQuestionId"] required:false def:self.iQuestionId];
    self.iAnswerId = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAnswerId"] required:false def:self.iAnswerId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CommitUserEvalReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iEvalType = 0;
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.iSubjectType = 1;
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
    [ostream writeInt32: 2 value: self.iEvalType];
    if (self.vItem != nil)
    {
        [ostream writeList: 3 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [UserEvalItem class]]];
    }
    [ostream writeInt32: 4 value: self.iSubjectType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommitUserEvalReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iEvalType = [istream readInt32Def: 2 required: false def: self.iEvalType];
    self.vItem = [istream readListDef: 3 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [UserEvalItem class]]];
    self.iSubjectType = [istream readInt32Def: 4 required: false def: self.iSubjectType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iEvalType" value : [BaseJSON writeInt32 : self.iEvalType]];
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [UserEvalItem class]]]];
    [JsonRoot append:@"iSubjectType" value : [BaseJSON writeInt32 : self.iSubjectType]];
    return JsonRoot;
}

- (CommitUserEvalReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iEvalType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEvalType"] required:false def:self.iEvalType];
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [UserEvalItem class]]];
    self.iSubjectType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubjectType"] required:false def:self.iSubjectType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CommitUserEvalRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRetCode = 0;
        self.iGetScore = 0;
        self.sRiskType = @"";
        self.sRiskDesc = @"";
        self.iRiskType = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRetCode];
    [ostream writeInt32: 1 value: self.iGetScore];
    if (self.sRiskType != nil)
    {
        [ostream writeString: 2 value: self.sRiskType];
    }
    if (self.sRiskDesc != nil)
    {
        [ostream writeString: 3 value: self.sRiskDesc];
    }
    [ostream writeInt32: 4 value: self.iRiskType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommitUserEvalRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRetCode = [istream readInt32Def: 0 required: false def: self.iRetCode];
    self.iGetScore = [istream readInt32Def: 1 required: false def: self.iGetScore];
    self.sRiskType = [istream readStringDef: 2 required: false def: self.sRiskType];
    self.sRiskDesc = [istream readStringDef: 3 required: false def: self.sRiskDesc];
    self.iRiskType = [istream readInt32Def: 4 required: false def: self.iRiskType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iRetCode" value : [BaseJSON writeInt32 : self.iRetCode]];
    [JsonRoot append:@"iGetScore" value : [BaseJSON writeInt32 : self.iGetScore]];
    [JsonRoot append:@"sRiskType" value : [BaseJSON writeString : self.sRiskType]];
    [JsonRoot append:@"sRiskDesc" value : [BaseJSON writeString : self.sRiskDesc]];
    [JsonRoot append:@"iRiskType" value : [BaseJSON writeInt32 : self.iRiskType]];
    return JsonRoot;
}

- (CommitUserEvalRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRetCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRetCode"] required:false def:self.iRetCode];
    self.iGetScore = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGetScore"] required:false def:self.iGetScore];
    self.sRiskType = [BaseJSON readStringDef:[RootMap objectForKey:@"sRiskType"] required:false def:self.sRiskType];
    self.sRiskDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sRiskDesc"] required:false def:self.sRiskDesc];
    self.iRiskType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRiskType"] required:false def:self.iRiskType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserEvalResultReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iEvalType = 0;
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
    [ostream writeInt32: 2 value: self.iEvalType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserEvalResultReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iEvalType = [istream readInt32Def: 2 required: false def: self.iEvalType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"stUserInfo" value : [BaseJSON writeMessage : self.stUserInfo]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"iEvalType" value : [BaseJSON writeInt32 : self.iEvalType]];
    return JsonRoot;
}

- (GetUserEvalResultReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iEvalType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iEvalType"] required:false def:self.iEvalType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserEvalResultRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRiskType = E_USER_RISK_NO_EVAL;
        self.sRiskType = @"";
        self.sRiskDesc = @"";
        self.sRiskTolerance = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRiskType];
    if (self.sRiskType != nil)
    {
        [ostream writeString: 1 value: self.sRiskType];
    }
    if (self.sRiskDesc != nil)
    {
        [ostream writeString: 2 value: self.sRiskDesc];
    }
    if (self.sRiskTolerance != nil)
    {
        [ostream writeString: 3 value: self.sRiskTolerance];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserEvalResultRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRiskType = [istream readInt32Def: 0 required: false def: self.iRiskType];
    self.sRiskType = [istream readStringDef: 1 required: false def: self.sRiskType];
    self.sRiskDesc = [istream readStringDef: 2 required: false def: self.sRiskDesc];
    self.sRiskTolerance = [istream readStringDef: 3 required: false def: self.sRiskTolerance];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}

- (NSString *) writeToJsonString
{
    return [BaseJSON MessageToJson : [self writeJSON]];
}

- (JSONValueMessage *) writeJSON
{
    JSONValueMessage * JsonRoot = [[JSONValueMessage alloc] init];
    [JsonRoot append:@"iRiskType" value : [BaseJSON writeInt32 : self.iRiskType]];
    [JsonRoot append:@"sRiskType" value : [BaseJSON writeString : self.sRiskType]];
    [JsonRoot append:@"sRiskDesc" value : [BaseJSON writeString : self.sRiskDesc]];
    [JsonRoot append:@"sRiskTolerance" value : [BaseJSON writeString : self.sRiskTolerance]];
    return JsonRoot;
}

- (GetUserEvalResultRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRiskType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRiskType"] required:false def:self.iRiskType];
    self.sRiskType = [BaseJSON readStringDef:[RootMap objectForKey:@"sRiskType"] required:false def:self.sRiskType];
    self.sRiskDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sRiskDesc"] required:false def:self.sRiskDesc];
    self.sRiskTolerance = [BaseJSON readStringDef:[RootMap objectForKey:@"sRiskTolerance"] required:false def:self.sRiskTolerance];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

