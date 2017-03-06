#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "Account.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation DtMemberInfo
- (id) init
{
    if (self = [super init])
    {
        self.iMemberType = E_DT_NO_MEMBER;
        self.lMemberStartTime = 0;
        self.lMemberEndTime = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iMemberType];
    [ostream writeInt64: 1 value: self.lMemberStartTime];
    [ostream writeInt64: 2 value: self.lMemberEndTime];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtMemberInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iMemberType = [istream readInt32Def: 0 required: false def: self.iMemberType];
    self.lMemberStartTime = [istream readInt64Def: 1 required: false def: self.lMemberStartTime];
    self.lMemberEndTime = [istream readInt64Def: 2 required: false def: self.lMemberEndTime];
    
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
    [JsonRoot append:@"iMemberType" value : [BaseJSON writeInt32 : self.iMemberType]];
    [JsonRoot append:@"lMemberStartTime" value : [BaseJSON writeInt64 : self.lMemberStartTime]];
    [JsonRoot append:@"lMemberEndTime" value : [BaseJSON writeInt64 : self.lMemberEndTime]];
    return JsonRoot;
}

- (DtMemberInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iMemberType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMemberType"] required:false def:self.iMemberType];
    self.lMemberStartTime = [BaseJSON readInt64Def:[RootMap objectForKey:@"lMemberStartTime"] required:false def:self.lMemberStartTime];
    self.lMemberEndTime = [BaseJSON readInt64Def:[RootMap objectForKey:@"lMemberEndTime"] required:false def:self.lMemberEndTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AccountInfo
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
        self.sUserName = @"";
        self.vtPassword = [NSData data];
        self.vtDupliPassword = [NSData data];
        self.vtOldPassword = [NSData data];
        self.sPhoneNum = @"";
        self.sFaceUrl = @"";
        self.iGender = 0;
        self.sProvince = @"";
        self.sCity = @"";
        self.sProfile = @"";
        self.sVerifyDesc = @"";
        self.eUserType = E_FEED_USER_NORMAL;
        self.stMember = [[DtMemberInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    if (self.sUserName != nil)
    {
        [ostream writeString: 1 value: self.sUserName];
    }
    if (self.vtPassword != nil)
    {
        [ostream writeBytes: 2 value: self.vtPassword];
    }
    if (self.vtDupliPassword != nil)
    {
        [ostream writeBytes: 3 value: self.vtDupliPassword];
    }
    if (self.vtOldPassword != nil)
    {
        [ostream writeBytes: 4 value: self.vtOldPassword];
    }
    if (self.sPhoneNum != nil)
    {
        [ostream writeString: 5 value: self.sPhoneNum];
    }
    if (self.sFaceUrl != nil)
    {
        [ostream writeString: 6 value: self.sFaceUrl];
    }
    [ostream writeInt32: 7 value: self.iGender];
    if (self.sProvince != nil)
    {
        [ostream writeString: 8 value: self.sProvince];
    }
    if (self.sCity != nil)
    {
        [ostream writeString: 9 value: self.sCity];
    }
    if (self.sProfile != nil)
    {
        [ostream writeString: 10 value: self.sProfile];
    }
    if (self.sVerifyDesc != nil)
    {
        [ostream writeString: 11 value: self.sVerifyDesc];
    }
    [ostream writeInt32: 12 value: (int32_t)self.eUserType];
    if (self.stMember != nil)
    {
        [ostream writeMessage: 13 value: self.stMember];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AccountInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    self.sUserName = [istream readStringDef: 1 required: false def: self.sUserName];
    self.vtPassword = [istream readBytesDef: 2 required: false def: self.vtPassword];
    self.vtDupliPassword = [istream readBytesDef: 3 required: false def: self.vtDupliPassword];
    self.vtOldPassword = [istream readBytesDef: 4 required: false def: self.vtOldPassword];
    self.sPhoneNum = [istream readStringDef: 5 required: false def: self.sPhoneNum];
    self.sFaceUrl = [istream readStringDef: 6 required: false def: self.sFaceUrl];
    self.iGender = [istream readInt32Def: 7 required: false def: self.iGender];
    self.sProvince = [istream readStringDef: 8 required: false def: self.sProvince];
    self.sCity = [istream readStringDef: 9 required: false def: self.sCity];
    self.sProfile = [istream readStringDef: 10 required: false def: self.sProfile];
    self.sVerifyDesc = [istream readStringDef: 11 required: false def: self.sVerifyDesc];
    self.eUserType = [istream readInt32Def: 12 required: false def: (int32_t)self.eUserType];
    self.stMember = (DtMemberInfo*)[istream readMessageDef: 13 required: false def: self.stMember VAR_TYPE: [DtMemberInfo class]];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"sUserName" value : [BaseJSON writeString : self.sUserName]];
    [JsonRoot append:@"vtPassword" value : [BaseJSON writeBytes : self.vtPassword]];
    [JsonRoot append:@"vtDupliPassword" value : [BaseJSON writeBytes : self.vtDupliPassword]];
    [JsonRoot append:@"vtOldPassword" value : [BaseJSON writeBytes : self.vtOldPassword]];
    [JsonRoot append:@"sPhoneNum" value : [BaseJSON writeString : self.sPhoneNum]];
    [JsonRoot append:@"sFaceUrl" value : [BaseJSON writeString : self.sFaceUrl]];
    [JsonRoot append:@"iGender" value : [BaseJSON writeInt32 : self.iGender]];
    [JsonRoot append:@"sProvince" value : [BaseJSON writeString : self.sProvince]];
    [JsonRoot append:@"sCity" value : [BaseJSON writeString : self.sCity]];
    [JsonRoot append:@"sProfile" value : [BaseJSON writeString : self.sProfile]];
    [JsonRoot append:@"sVerifyDesc" value : [BaseJSON writeString : self.sVerifyDesc]];
    [JsonRoot append:@"eUserType" value : [BaseJSON writeInt32 : (int32_t)self.eUserType]];
    [JsonRoot append:@"stMember" value : [BaseJSON writeMessage : self.stMember]];
    return JsonRoot;
}

- (AccountInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.sUserName = [BaseJSON readStringDef:[RootMap objectForKey:@"sUserName"] required:false def:self.sUserName];
    self.vtPassword = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtPassword"] required:false def:self.vtPassword];
    self.vtDupliPassword = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtDupliPassword"] required:false def:self.vtDupliPassword];
    self.vtOldPassword = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtOldPassword"] required:false def:self.vtOldPassword];
    self.sPhoneNum = [BaseJSON readStringDef:[RootMap objectForKey:@"sPhoneNum"] required:false def:self.sPhoneNum];
    self.sFaceUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sFaceUrl"] required:false def:self.sFaceUrl];
    self.iGender = [BaseJSON readInt32Def:[RootMap objectForKey:@"iGender"] required:false def:self.iGender];
    self.sProvince = [BaseJSON readStringDef:[RootMap objectForKey:@"sProvince"] required:false def:self.sProvince];
    self.sCity = [BaseJSON readStringDef:[RootMap objectForKey:@"sCity"] required:false def:self.sCity];
    self.sProfile = [BaseJSON readStringDef:[RootMap objectForKey:@"sProfile"] required:false def:self.sProfile];
    self.sVerifyDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sVerifyDesc"] required:false def:self.sVerifyDesc];
    self.eUserType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eUserType"] required:false def:(int32_t)self.eUserType];
    self.stMember = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMember"] required:false def:self.stMember VAR_TYPE: [DtMemberInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VerifyCode
- (id) init
{
    if (self = [super init])
    {
        self.iType = 0;
        self.sPhoneVerifyCode = @"";
        self.sMachineVerifyCode = @"";
        self.sMachineCodeUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt16: 0 value: self.iType];
    if (self.sPhoneVerifyCode != nil)
    {
        [ostream writeString: 1 value: self.sPhoneVerifyCode];
    }
    if (self.sMachineVerifyCode != nil)
    {
        [ostream writeString: 2 value: self.sMachineVerifyCode];
    }
    if (self.sMachineCodeUrl != nil)
    {
        [ostream writeString: 3 value: self.sMachineCodeUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VerifyCode *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iType = [istream readInt16: 0 required: true];
    self.sPhoneVerifyCode = [istream readStringDef: 1 required: false def: self.sPhoneVerifyCode];
    self.sMachineVerifyCode = [istream readStringDef: 2 required: false def: self.sMachineVerifyCode];
    self.sMachineCodeUrl = [istream readStringDef: 3 required: false def: self.sMachineCodeUrl];
    
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
    [JsonRoot append:@"iType" value : [BaseJSON writeInt16 : self.iType]];
    [JsonRoot append:@"sPhoneVerifyCode" value : [BaseJSON writeString : self.sPhoneVerifyCode]];
    [JsonRoot append:@"sMachineVerifyCode" value : [BaseJSON writeString : self.sMachineVerifyCode]];
    [JsonRoot append:@"sMachineCodeUrl" value : [BaseJSON writeString : self.sMachineCodeUrl]];
    return JsonRoot;
}

- (VerifyCode *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iType = [BaseJSON readInt16Def:[RootMap objectForKey:@"iType"] required:true def:self.iType];
    self.sPhoneVerifyCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sPhoneVerifyCode"] required:false def:self.sPhoneVerifyCode];
    self.sMachineVerifyCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sMachineVerifyCode"] required:false def:self.sMachineVerifyCode];
    self.sMachineCodeUrl = [BaseJSON readStringDef:[RootMap objectForKey:@"sMachineCodeUrl"] required:false def:self.sMachineCodeUrl];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation AccountTicket
- (id) init
{
    if (self = [super init])
    {
        self.vtTicket = [NSData data];
        self.sTicket = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtTicket != nil)
    {
        [ostream writeBytes: 0 value: self.vtTicket];
    }
    if (self.sTicket != nil)
    {
        [ostream writeString: 1 value: self.sTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AccountTicket *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtTicket = [istream readBytesDef: 0 required: false def: self.vtTicket];
    self.sTicket = [istream readStringDef: 1 required: false def: self.sTicket];
    
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
    [JsonRoot append:@"vtTicket" value : [BaseJSON writeBytes : self.vtTicket]];
    [JsonRoot append:@"sTicket" value : [BaseJSON writeString : self.sTicket]];
    return JsonRoot;
}

- (AccountTicket *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtTicket = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtTicket"] required:false def:self.vtTicket];
    self.sTicket = [BaseJSON readStringDef:[RootMap objectForKey:@"sTicket"] required:false def:self.sTicket];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VerifyAccountInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stVerifyCode = [[VerifyCode alloc] init];
        self.eVerifyWay = E_SMS_VERITY;
        self.eVerifyType = E_VERIFYT_USERNAME;
        self.sMachineVerfiyCode = @"";
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
    [ostream writeMessage: 1 value: self.stAccountInfo];
    if (self.stVerifyCode != nil)
    {
        [ostream writeMessage: 2 value: self.stVerifyCode];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eVerifyWay];
    [ostream writeInt32: 4 value: (int32_t)self.eVerifyType];
    if (self.sMachineVerfiyCode != nil)
    {
        [ostream writeString: 5 value: self.sMachineVerfiyCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VerifyAccountInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessage: 1 required: true VAR_TYPE: [AccountInfo class]];
    self.stVerifyCode = (VerifyCode*)[istream readMessageDef: 2 required: false def: self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    self.eVerifyWay = [istream readInt32Def: 3 required: false def: (int32_t)self.eVerifyWay];
    self.eVerifyType = [istream readInt32Def: 4 required: false def: (int32_t)self.eVerifyType];
    self.sMachineVerfiyCode = [istream readStringDef: 5 required: false def: self.sMachineVerfiyCode];
    
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
    [JsonRoot append:@"stVerifyCode" value : [BaseJSON writeMessage : self.stVerifyCode]];
    [JsonRoot append:@"eVerifyWay" value : [BaseJSON writeInt32 : (int32_t)self.eVerifyWay]];
    [JsonRoot append:@"eVerifyType" value : [BaseJSON writeInt32 : (int32_t)self.eVerifyType]];
    [JsonRoot append:@"sMachineVerfiyCode" value : [BaseJSON writeString : self.sMachineVerfiyCode]];
    return JsonRoot;
}

- (VerifyAccountInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stVerifyCode = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVerifyCode"] required:false def:self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    self.eVerifyWay = [BaseJSON readInt32Def:[RootMap objectForKey:@"eVerifyWay"] required:false def:(int32_t)self.eVerifyWay];
    self.eVerifyType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eVerifyType"] required:false def:(int32_t)self.eVerifyType];
    self.sMachineVerfiyCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sMachineVerfiyCode"] required:false def:self.sMachineVerfiyCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VerifyAccountInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.stVerifyCode = [[VerifyCode alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stVerifyCode != nil)
    {
        [ostream writeMessage: 0 value: self.stVerifyCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VerifyAccountInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stVerifyCode = (VerifyCode*)[istream readMessageDef: 0 required: false def: self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    
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
    [JsonRoot append:@"stVerifyCode" value : [BaseJSON writeMessage : self.stVerifyCode]];
    return JsonRoot;
}

- (VerifyAccountInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stVerifyCode = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVerifyCode"] required:false def:self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FinishRegisterAccountReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iComeFrom = E_PHONE_REGISTER_APP;
        self.stVerifyCode = [[VerifyCode alloc] init];
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
    [ostream writeMessage: 1 value: self.stAccountInfo];
    [ostream writeInt32: 2 value: self.iComeFrom];
    if (self.stVerifyCode != nil)
    {
        [ostream writeMessage: 3 value: self.stVerifyCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinishRegisterAccountReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessage: 1 required: true VAR_TYPE: [AccountInfo class]];
    self.iComeFrom = [istream readInt32Def: 2 required: false def: self.iComeFrom];
    self.stVerifyCode = (VerifyCode*)[istream readMessageDef: 3 required: false def: self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    
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
    [JsonRoot append:@"iComeFrom" value : [BaseJSON writeInt32 : self.iComeFrom]];
    [JsonRoot append:@"stVerifyCode" value : [BaseJSON writeMessage : self.stVerifyCode]];
    return JsonRoot;
}

- (FinishRegisterAccountReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iComeFrom = [BaseJSON readInt32Def:[RootMap objectForKey:@"iComeFrom"] required:false def:self.iComeFrom];
    self.stVerifyCode = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVerifyCode"] required:false def:self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation FinishRegisterAccountRsp
- (id) init
{
    if (self = [super init])
    {
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.stAccountInfo = [[AccountInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 0 value: self.stAccountTicket];
    }
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FinishRegisterAccountRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 0 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 1 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    return JsonRoot;
}

- (FinishRegisterAccountRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ThirdLoginInfo
- (id) init
{
    if (self = [super init])
    {
        self.sOpenId = @"";
        self.sAccessToken = @"";
        self.eType = E_DENGTA_LOGIN;
        self.mpParam = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sOpenId != nil)
    {
        [ostream writeString: 0 value: self.sOpenId];
    }
    if (self.sAccessToken != nil)
    {
        [ostream writeString: 1 value: self.sAccessToken];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eType];
    if (self.mpParam != nil)
    {
        [ostream writeMap: 3 value: self.mpParam VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ThirdLoginInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sOpenId = [istream readStringDef: 0 required: false def: self.sOpenId];
    self.sAccessToken = [istream readStringDef: 1 required: false def: self.sAccessToken];
    self.eType = [istream readInt32Def: 2 required: false def: (int32_t)self.eType];
    self.mpParam = [istream readMapDef: 3 required: false def: self.mpParam VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"sOpenId" value : [BaseJSON writeString : self.sOpenId]];
    [JsonRoot append:@"sAccessToken" value : [BaseJSON writeString : self.sAccessToken]];
    [JsonRoot append:@"eType" value : [BaseJSON writeInt32 : (int32_t)self.eType]];
    [JsonRoot append:@"mpParam" value : [BaseJSON writeMap : self.mpParam VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (ThirdLoginInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sOpenId = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpenId"] required:false def:self.sOpenId];
    self.sAccessToken = [BaseJSON readStringDef:[RootMap objectForKey:@"sAccessToken"] required:false def:self.sAccessToken];
    self.eType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eType"] required:false def:(int32_t)self.eType];
    self.mpParam = [BaseJSON readMapDef:[RootMap objectForKey:@"mpParam"] required:false def:self.mpParam VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LoginReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountInfo = [[AccountInfo alloc] init];
        self.stVerifyCode = [[VerifyCode alloc] init];
        self.eLoginType = E_DENGTA_LOGIN;
        self.stThirdLoginInfo = [[ThirdLoginInfo alloc] init];
        self.vtFaceData = [NSData data];
        self.sFaceImageFileType = @"";
        self.iComeFrom = E_PHONE_REGISTER_APP;
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
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountInfo];
    }
    if (self.stVerifyCode != nil)
    {
        [ostream writeMessage: 2 value: self.stVerifyCode];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eLoginType];
    if (self.stThirdLoginInfo != nil)
    {
        [ostream writeMessage: 4 value: self.stThirdLoginInfo];
    }
    if (self.vtFaceData != nil)
    {
        [ostream writeBytes: 5 value: self.vtFaceData];
    }
    if (self.sFaceImageFileType != nil)
    {
        [ostream writeString: 6 value: self.sFaceImageFileType];
    }
    [ostream writeInt32: 7 value: self.iComeFrom];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LoginReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 1 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.stVerifyCode = (VerifyCode*)[istream readMessageDef: 2 required: false def: self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    self.eLoginType = [istream readInt32Def: 3 required: false def: (int32_t)self.eLoginType];
    self.stThirdLoginInfo = (ThirdLoginInfo*)[istream readMessageDef: 4 required: false def: self.stThirdLoginInfo VAR_TYPE: [ThirdLoginInfo class]];
    self.vtFaceData = [istream readBytesDef: 5 required: false def: self.vtFaceData];
    self.sFaceImageFileType = [istream readStringDef: 6 required: false def: self.sFaceImageFileType];
    self.iComeFrom = [istream readInt32Def: 7 required: false def: self.iComeFrom];
    
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
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    [JsonRoot append:@"stVerifyCode" value : [BaseJSON writeMessage : self.stVerifyCode]];
    [JsonRoot append:@"eLoginType" value : [BaseJSON writeInt32 : (int32_t)self.eLoginType]];
    [JsonRoot append:@"stThirdLoginInfo" value : [BaseJSON writeMessage : self.stThirdLoginInfo]];
    [JsonRoot append:@"vtFaceData" value : [BaseJSON writeBytes : self.vtFaceData]];
    [JsonRoot append:@"sFaceImageFileType" value : [BaseJSON writeString : self.sFaceImageFileType]];
    [JsonRoot append:@"iComeFrom" value : [BaseJSON writeInt32 : self.iComeFrom]];
    return JsonRoot;
}

- (LoginReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.stVerifyCode = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVerifyCode"] required:false def:self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    self.eLoginType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eLoginType"] required:false def:(int32_t)self.eLoginType];
    self.stThirdLoginInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stThirdLoginInfo"] required:false def:self.stThirdLoginInfo VAR_TYPE: [ThirdLoginInfo class]];
    self.vtFaceData = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtFaceData"] required:false def:self.vtFaceData];
    self.sFaceImageFileType = [BaseJSON readStringDef:[RootMap objectForKey:@"sFaceImageFileType"] required:false def:self.sFaceImageFileType];
    self.iComeFrom = [BaseJSON readInt32Def:[RootMap objectForKey:@"iComeFrom"] required:false def:self.iComeFrom];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LoginRsp
- (id) init
{
    if (self = [super init])
    {
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.stMachineVerfiyCode = [[VerifyCode alloc] init];
        self.stAccountInfo = [[AccountInfo alloc] init];
        self.vtThirdLoginInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 0 value: self.stAccountTicket];
    }
    if (self.stMachineVerfiyCode != nil)
    {
        [ostream writeMessage: 1 value: self.stMachineVerfiyCode];
    }
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountInfo];
    }
    if (self.vtThirdLoginInfo != nil)
    {
        [ostream writeList: 3 value: self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LoginRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 0 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stMachineVerfiyCode = (VerifyCode*)[istream readMessageDef: 1 required: false def: self.stMachineVerfiyCode VAR_TYPE: [VerifyCode class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 2 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.vtThirdLoginInfo = [istream readListDef: 3 required: false def: self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"stMachineVerfiyCode" value : [BaseJSON writeMessage : self.stMachineVerfiyCode]];
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    [JsonRoot append:@"vtThirdLoginInfo" value : [BaseJSON writeList : self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]]];
    return JsonRoot;
}

- (LoginRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stMachineVerfiyCode = [BaseJSON readMessageDef:[RootMap objectForKey:@"stMachineVerfiyCode"] required:false def:self.stMachineVerfiyCode VAR_TYPE: [VerifyCode class]];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.vtThirdLoginInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtThirdLoginInfo"] required:false def:self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VerfiyThirdAccountReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stThirdLoginInfo = [[ThirdLoginInfo alloc] init];
        self.eLoginType = E_DENGTA_LOGIN;
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
    if (self.stThirdLoginInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stThirdLoginInfo];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eLoginType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VerfiyThirdAccountReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stThirdLoginInfo = (ThirdLoginInfo*)[istream readMessageDef: 1 required: false def: self.stThirdLoginInfo VAR_TYPE: [ThirdLoginInfo class]];
    self.eLoginType = [istream readInt32Def: 2 required: false def: (int32_t)self.eLoginType];
    
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
    [JsonRoot append:@"stThirdLoginInfo" value : [BaseJSON writeMessage : self.stThirdLoginInfo]];
    [JsonRoot append:@"eLoginType" value : [BaseJSON writeInt32 : (int32_t)self.eLoginType]];
    return JsonRoot;
}

- (VerfiyThirdAccountReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stThirdLoginInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stThirdLoginInfo"] required:false def:self.stThirdLoginInfo VAR_TYPE: [ThirdLoginInfo class]];
    self.eLoginType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eLoginType"] required:false def:(int32_t)self.eLoginType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VerfiyThirdAccountRsp
- (id) init
{
    if (self = [super init])
    {
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.stAccountInfo = [[AccountInfo alloc] init];
        self.vtThirdLoginInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 0 value: self.stAccountTicket];
    }
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountInfo];
    }
    if (self.vtThirdLoginInfo != nil)
    {
        [ostream writeList: 2 value: self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VerfiyThirdAccountRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 0 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 1 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.vtThirdLoginInfo = [istream readListDef: 2 required: false def: self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    [JsonRoot append:@"vtThirdLoginInfo" value : [BaseJSON writeList : self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]]];
    return JsonRoot;
}

- (VerfiyThirdAccountRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.vtThirdLoginInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtThirdLoginInfo"] required:false def:self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ModifyAccountInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eModifyType = E_MODIFY_USER_NAME;
        self.stAccountInfo = [[AccountInfo alloc] init];
        self.stVerifyCode = [[VerifyCode alloc] init];
        self.stThirdLoginInfo = [[ThirdLoginInfo alloc] init];
        self.sFaceImageFileType = @"";
        self.vtFaceData = [NSData data];
        self.iComeFrom = E_PHONE_REGISTER_APP;
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
    [ostream writeInt32: 1 value: (int32_t)self.eModifyType];
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountInfo];
    }
    [ostream writeMessage: 3 value: self.stAccountTicket];
    if (self.stVerifyCode != nil)
    {
        [ostream writeMessage: 4 value: self.stVerifyCode];
    }
    if (self.stThirdLoginInfo != nil)
    {
        [ostream writeMessage: 5 value: self.stThirdLoginInfo];
    }
    if (self.sFaceImageFileType != nil)
    {
        [ostream writeString: 6 value: self.sFaceImageFileType];
    }
    if (self.vtFaceData != nil)
    {
        [ostream writeBytes: 7 value: self.vtFaceData];
    }
    [ostream writeInt32: 8 value: self.iComeFrom];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ModifyAccountInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eModifyType = [istream readInt32Def: 1 required: false def: (int32_t)self.eModifyType];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 2 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessage: 3 required: true VAR_TYPE: [AccountTicket class]];
    self.stVerifyCode = (VerifyCode*)[istream readMessageDef: 4 required: false def: self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    self.stThirdLoginInfo = (ThirdLoginInfo*)[istream readMessageDef: 5 required: false def: self.stThirdLoginInfo VAR_TYPE: [ThirdLoginInfo class]];
    self.sFaceImageFileType = [istream readStringDef: 6 required: false def: self.sFaceImageFileType];
    self.vtFaceData = [istream readBytesDef: 7 required: false def: self.vtFaceData];
    self.iComeFrom = [istream readInt32Def: 8 required: false def: self.iComeFrom];
    
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
    [JsonRoot append:@"eModifyType" value : [BaseJSON writeInt32 : (int32_t)self.eModifyType]];
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    [JsonRoot append:@"stVerifyCode" value : [BaseJSON writeMessage : self.stVerifyCode]];
    [JsonRoot append:@"stThirdLoginInfo" value : [BaseJSON writeMessage : self.stThirdLoginInfo]];
    [JsonRoot append:@"sFaceImageFileType" value : [BaseJSON writeString : self.sFaceImageFileType]];
    [JsonRoot append:@"vtFaceData" value : [BaseJSON writeBytes : self.vtFaceData]];
    [JsonRoot append:@"iComeFrom" value : [BaseJSON writeInt32 : self.iComeFrom]];
    return JsonRoot;
}

- (ModifyAccountInfoReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eModifyType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eModifyType"] required:false def:(int32_t)self.eModifyType];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.stVerifyCode = [BaseJSON readMessageDef:[RootMap objectForKey:@"stVerifyCode"] required:false def:self.stVerifyCode VAR_TYPE: [VerifyCode class]];
    self.stThirdLoginInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stThirdLoginInfo"] required:false def:self.stThirdLoginInfo VAR_TYPE: [ThirdLoginInfo class]];
    self.sFaceImageFileType = [BaseJSON readStringDef:[RootMap objectForKey:@"sFaceImageFileType"] required:false def:self.sFaceImageFileType];
    self.vtFaceData = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtFaceData"] required:false def:self.vtFaceData];
    self.iComeFrom = [BaseJSON readInt32Def:[RootMap objectForKey:@"iComeFrom"] required:false def:self.iComeFrom];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ModifyAccountInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.stAccountInfo = [[AccountInfo alloc] init];
        self.vtThirdLoginInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 0 value: self.stAccountTicket];
    }
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountInfo];
    }
    if (self.vtThirdLoginInfo != nil)
    {
        [ostream writeList: 2 value: self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ModifyAccountInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 0 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 1 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.vtThirdLoginInfo = [istream readListDef: 2 required: false def: self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    [JsonRoot append:@"vtThirdLoginInfo" value : [BaseJSON writeList : self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]]];
    return JsonRoot;
}

- (ModifyAccountInfoRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.vtThirdLoginInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtThirdLoginInfo"] required:false def:self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LogoutAccountReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountInfo = [[AccountInfo alloc] init];
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
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LogoutAccountReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 1 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    
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
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    return JsonRoot;
}

- (LogoutAccountReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation LogoutAccountRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LogoutAccountRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    
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
    [JsonRoot append:@"iRet" value : [BaseJSON writeInt32 : self.iRet]];
    return JsonRoot;
}

- (LogoutAccountRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRet = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRet"] required:false def:self.iRet];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation UpdateTicketReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
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
    [ostream writeUInt32: 1 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UpdateTicketReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    return JsonRoot;
}

- (UpdateTicketReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
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
@implementation UpdateTicketRsp
- (id) init
{
    if (self = [super init])
    {
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.stAccountInfo = [[AccountInfo alloc] init];
        self.vtThirdLoginInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 0 value: self.stAccountTicket];
    }
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountInfo];
    }
    if (self.vtThirdLoginInfo != nil)
    {
        [ostream writeList: 2 value: self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UpdateTicketRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 0 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 1 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.vtThirdLoginInfo = [istream readListDef: 2 required: false def: self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    
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
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    [JsonRoot append:@"vtThirdLoginInfo" value : [BaseJSON writeList : self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]]];
    return JsonRoot;
}

- (UpdateTicketRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    self.vtThirdLoginInfo = [BaseJSON readListDef:[RootMap objectForKey:@"vtThirdLoginInfo"] required:false def:self.vtThirdLoginInfo VAR_TYPE: [THOTH_LIST CREATE: [ThirdLoginInfo class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SendPhoneCodeReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sPhoneNum = @"";
        self.iStatus = 0;
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
    if (self.sPhoneNum != nil)
    {
        [ostream writeString: 1 value: self.sPhoneNum];
    }
    [ostream writeInt16: 2 value: self.iStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SendPhoneCodeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sPhoneNum = [istream readStringDef: 1 required: false def: self.sPhoneNum];
    self.iStatus = [istream readInt16Def: 2 required: false def: self.iStatus];
    
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
    [JsonRoot append:@"sPhoneNum" value : [BaseJSON writeString : self.sPhoneNum]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt16 : self.iStatus]];
    return JsonRoot;
}

- (SendPhoneCodeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sPhoneNum = [BaseJSON readStringDef:[RootMap objectForKey:@"sPhoneNum"] required:false def:self.sPhoneNum];
    self.iStatus = [BaseJSON readInt16Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation VerifyAccountTicketReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
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
    [ostream writeUInt32: 1 value: self.iAccountId];
    if (self.stAccountTicket != nil)
    {
        [ostream writeMessage: 2 value: self.stAccountTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VerifyAccountTicketReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 2 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"stAccountTicket" value : [BaseJSON writeMessage : self.stAccountTicket]];
    return JsonRoot;
}

- (VerifyAccountTicketReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
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
@implementation VerifyAccountTicketRsp
- (id) init
{
    if (self = [super init])
    {
        self.iAccountId = 0;
        self.stAccountInfo = [[AccountInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeUInt32: 0 value: self.iAccountId];
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stAccountInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VerifyAccountTicketRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iAccountId = [istream readUInt32Def: 0 required: false def: self.iAccountId];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 1 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    return JsonRoot;
}

- (VerifyAccountTicketRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SendSmsReq
- (id) init
{
    if (self = [super init])
    {
        self.vtPhone = [NSMutableArray arrayWithCapacity:0];
        self.sContent = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtPhone != nil)
    {
        [ostream writeList: 0 value: self.vtPhone VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 1 value: self.sContent];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SendSmsReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtPhone = [istream readListDef: 0 required: false def: self.vtPhone VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sContent = [istream readStringDef: 1 required: false def: self.sContent];
    
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
    [JsonRoot append:@"vtPhone" value : [BaseJSON writeList : self.vtPhone VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    [JsonRoot append:@"sContent" value : [BaseJSON writeString : self.sContent]];
    return JsonRoot;
}

- (SendSmsReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtPhone = [BaseJSON readListDef:[RootMap objectForKey:@"vtPhone"] required:false def:self.vtPhone VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sContent = [BaseJSON readStringDef:[RootMap objectForKey:@"sContent"] required:false def:self.sContent];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SendSmsRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SendSmsRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    
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
    [JsonRoot append:@"iRet" value : [BaseJSON writeInt32 : self.iRet]];
    return JsonRoot;
}

- (SendSmsRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRet = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRet"] required:false def:self.iRet];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetLoginReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.eLoginType = E_DENGTA_LOGIN;
        self.sUnionId = @"";
        self.sOpenId = @"";
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
    [ostream writeInt32: 1 value: (int32_t)self.eLoginType];
    if (self.sUnionId != nil)
    {
        [ostream writeString: 2 value: self.sUnionId];
    }
    if (self.sOpenId != nil)
    {
        [ostream writeString: 3 value: self.sOpenId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLoginReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eLoginType = [istream readInt32Def: 1 required: false def: (int32_t)self.eLoginType];
    self.sUnionId = [istream readStringDef: 2 required: false def: self.sUnionId];
    self.sOpenId = [istream readStringDef: 3 required: false def: self.sOpenId];
    
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
    [JsonRoot append:@"eLoginType" value : [BaseJSON writeInt32 : (int32_t)self.eLoginType]];
    [JsonRoot append:@"sUnionId" value : [BaseJSON writeString : self.sUnionId]];
    [JsonRoot append:@"sOpenId" value : [BaseJSON writeString : self.sOpenId]];
    return JsonRoot;
}

- (GetLoginReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eLoginType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eLoginType"] required:false def:(int32_t)self.eLoginType];
    self.sUnionId = [BaseJSON readStringDef:[RootMap objectForKey:@"sUnionId"] required:false def:self.sUnionId];
    self.sOpenId = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpenId"] required:false def:self.sOpenId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GenAccountIdReqItem
- (id) init
{
    if (self = [super init])
    {
        self.sNickName = @"";
        self.vtFaceData = [NSData data];
        self.sProfile = @"";
        self.eUserType = E_FEED_USER_NORMAL;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sNickName != nil)
    {
        [ostream writeString: 0 value: self.sNickName];
    }
    if (self.vtFaceData != nil)
    {
        [ostream writeBytes: 1 value: self.vtFaceData];
    }
    if (self.sProfile != nil)
    {
        [ostream writeString: 2 value: self.sProfile];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eUserType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GenAccountIdReqItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sNickName = [istream readStringDef: 0 required: false def: self.sNickName];
    self.vtFaceData = [istream readBytesDef: 1 required: false def: self.vtFaceData];
    self.sProfile = [istream readStringDef: 2 required: false def: self.sProfile];
    self.eUserType = [istream readInt32Def: 3 required: false def: (int32_t)self.eUserType];
    
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
    [JsonRoot append:@"sNickName" value : [BaseJSON writeString : self.sNickName]];
    [JsonRoot append:@"vtFaceData" value : [BaseJSON writeBytes : self.vtFaceData]];
    [JsonRoot append:@"sProfile" value : [BaseJSON writeString : self.sProfile]];
    [JsonRoot append:@"eUserType" value : [BaseJSON writeInt32 : (int32_t)self.eUserType]];
    return JsonRoot;
}

- (GenAccountIdReqItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sNickName = [BaseJSON readStringDef:[RootMap objectForKey:@"sNickName"] required:false def:self.sNickName];
    self.vtFaceData = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtFaceData"] required:false def:self.vtFaceData];
    self.sProfile = [BaseJSON readStringDef:[RootMap objectForKey:@"sProfile"] required:false def:self.sProfile];
    self.eUserType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eUserType"] required:false def:(int32_t)self.eUserType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GenAccountIdRspItem
- (id) init
{
    if (self = [super init])
    {
        self.iRetCode = 0;
        self.iAccountId = 0;
        self.bAdopted = false;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRetCode];
    [ostream writeUInt32: 1 value: self.iAccountId];
    [ostream writeBoolean: 2 value: self.bAdopted];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GenAccountIdRspItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRetCode = [istream readInt32Def: 0 required: false def: self.iRetCode];
    self.iAccountId = [istream readUInt32Def: 1 required: false def: self.iAccountId];
    self.bAdopted = [istream readBooleanDef: 2 required: false def: self.bAdopted];
    
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
    [JsonRoot append:@"iAccountId" value : [BaseJSON writeUInt32 : self.iAccountId]];
    [JsonRoot append:@"bAdopted" value : [BaseJSON writeBoolean : self.bAdopted]];
    return JsonRoot;
}

- (GenAccountIdRspItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iRetCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iRetCode"] required:false def:self.iRetCode];
    self.iAccountId = [BaseJSON readUInt32Def:[RootMap objectForKey:@"iAccountId"] required:false def:self.iAccountId];
    self.bAdopted = [BaseJSON readBooleanDef:[RootMap objectForKey:@"bAdopted"] required:false def:self.bAdopted];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GenAccountIdBatchReq
- (id) init
{
    if (self = [super init])
    {
        self.eChannelType = E_GCT_ITG;
        self.vItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: (int32_t)self.eChannelType];
    if (self.vItem != nil)
    {
        [ostream writeList: 1 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [GenAccountIdReqItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GenAccountIdBatchReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.eChannelType = [istream readInt32Def: 0 required: false def: (int32_t)self.eChannelType];
    self.vItem = [istream readListDef: 1 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [GenAccountIdReqItem class]]];
    
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
    [JsonRoot append:@"eChannelType" value : [BaseJSON writeInt32 : (int32_t)self.eChannelType]];
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [GenAccountIdReqItem class]]]];
    return JsonRoot;
}

- (GenAccountIdBatchReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.eChannelType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eChannelType"] required:false def:(int32_t)self.eChannelType];
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [GenAccountIdReqItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GenAccountIdBatchRsp
- (id) init
{
    if (self = [super init])
    {
        self.mItem = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mItem != nil)
    {
        [ostream writeMap: 0 value: self.mItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [GenAccountIdRspItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GenAccountIdBatchRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mItem = [istream readMapDef: 0 required: false def: self.mItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [GenAccountIdRspItem class]]];
    
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
    [JsonRoot append:@"mItem" value : [BaseJSON writeMap : self.mItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [GenAccountIdRspItem class]]]];
    return JsonRoot;
}

- (GenAccountIdBatchRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.mItem = [BaseJSON readMapDef:[RootMap objectForKey:@"mItem"] required:false def:self.mItem VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [GenAccountIdRspItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GenAccountReq
- (id) init
{
    if (self = [super init])
    {
        self.sOpenId = @"";
        self.sUnionId = @"";
        self.eLoginType = E_DENGTA_LOGIN;
        self.vtFaceData = [NSData data];
        self.stAccountInfo = [[AccountInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sOpenId != nil)
    {
        [ostream writeString: 0 value: self.sOpenId];
    }
    if (self.sUnionId != nil)
    {
        [ostream writeString: 1 value: self.sUnionId];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eLoginType];
    if (self.vtFaceData != nil)
    {
        [ostream writeBytes: 3 value: self.vtFaceData];
    }
    if (self.stAccountInfo != nil)
    {
        [ostream writeMessage: 4 value: self.stAccountInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GenAccountReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sOpenId = [istream readStringDef: 0 required: false def: self.sOpenId];
    self.sUnionId = [istream readStringDef: 1 required: false def: self.sUnionId];
    self.eLoginType = [istream readInt32Def: 2 required: false def: (int32_t)self.eLoginType];
    self.vtFaceData = [istream readBytesDef: 3 required: false def: self.vtFaceData];
    self.stAccountInfo = (AccountInfo*)[istream readMessageDef: 4 required: false def: self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    
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
    [JsonRoot append:@"sOpenId" value : [BaseJSON writeString : self.sOpenId]];
    [JsonRoot append:@"sUnionId" value : [BaseJSON writeString : self.sUnionId]];
    [JsonRoot append:@"eLoginType" value : [BaseJSON writeInt32 : (int32_t)self.eLoginType]];
    [JsonRoot append:@"vtFaceData" value : [BaseJSON writeBytes : self.vtFaceData]];
    [JsonRoot append:@"stAccountInfo" value : [BaseJSON writeMessage : self.stAccountInfo]];
    return JsonRoot;
}

- (GenAccountReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sOpenId = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpenId"] required:false def:self.sOpenId];
    self.sUnionId = [BaseJSON readStringDef:[RootMap objectForKey:@"sUnionId"] required:false def:self.sUnionId];
    self.eLoginType = [BaseJSON readInt32Def:[RootMap objectForKey:@"eLoginType"] required:false def:(int32_t)self.eLoginType];
    self.vtFaceData = [BaseJSON readBytesDef:[RootMap objectForKey:@"vtFaceData"] required:false def:self.vtFaceData];
    self.stAccountInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountInfo"] required:false def:self.stAccountInfo VAR_TYPE: [AccountInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

