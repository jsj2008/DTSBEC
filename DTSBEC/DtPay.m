#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "DtPay.h"
#import "Beacon.h"
#import "Account.h"

//////////////////////////////////////////////////////////////
@implementation DtPayItem
- (id) init
{
    if (self = [super init])
    {
        self.sDtPayOrderId = @"";
        self.iType = 0;
        self.lTimeStamp = 0;
        self.sTitle = @"";
        self.iTotalAmount = 0;
        self.iNumber = 0;
        self.sDesc = @"";
        self.iStatus = 0;
        self.iNumberUnit = E_DT_PAY_TIME_MONTH;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDtPayOrderId != nil)
    {
        [ostream writeString: 0 value: self.sDtPayOrderId];
    }
    [ostream writeInt32: 1 value: self.iType];
    [ostream writeInt64: 2 value: self.lTimeStamp];
    if (self.sTitle != nil)
    {
        [ostream writeString: 3 value: self.sTitle];
    }
    [ostream writeInt32: 4 value: self.iTotalAmount];
    [ostream writeInt32: 5 value: self.iNumber];
    if (self.sDesc != nil)
    {
        [ostream writeString: 6 value: self.sDesc];
    }
    [ostream writeInt32: 7 value: self.iStatus];
    [ostream writeInt32: 8 value: self.iNumberUnit];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtPayItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtPayOrderId = [istream readStringDef: 0 required: false def: self.sDtPayOrderId];
    self.iType = [istream readInt32Def: 1 required: false def: self.iType];
    self.lTimeStamp = [istream readInt64Def: 2 required: false def: self.lTimeStamp];
    self.sTitle = [istream readStringDef: 3 required: false def: self.sTitle];
    self.iTotalAmount = [istream readInt32Def: 4 required: false def: self.iTotalAmount];
    self.iNumber = [istream readInt32Def: 5 required: false def: self.iNumber];
    self.sDesc = [istream readStringDef: 6 required: false def: self.sDesc];
    self.iStatus = [istream readInt32Def: 7 required: false def: self.iStatus];
    self.iNumberUnit = [istream readInt32Def: 8 required: false def: self.iNumberUnit];
    
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
    [JsonRoot append:@"sDtPayOrderId" value : [BaseJSON writeString : self.sDtPayOrderId]];
    [JsonRoot append:@"iType" value : [BaseJSON writeInt32 : self.iType]];
    [JsonRoot append:@"lTimeStamp" value : [BaseJSON writeInt64 : self.lTimeStamp]];
    [JsonRoot append:@"sTitle" value : [BaseJSON writeString : self.sTitle]];
    [JsonRoot append:@"iTotalAmount" value : [BaseJSON writeInt32 : self.iTotalAmount]];
    [JsonRoot append:@"iNumber" value : [BaseJSON writeInt32 : self.iNumber]];
    [JsonRoot append:@"sDesc" value : [BaseJSON writeString : self.sDesc]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    [JsonRoot append:@"iNumberUnit" value : [BaseJSON writeInt32 : self.iNumberUnit]];
    return JsonRoot;
}

- (DtPayItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtPayOrderId = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtPayOrderId"] required:false def:self.sDtPayOrderId];
    self.iType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iType"] required:false def:self.iType];
    self.lTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTimeStamp"] required:false def:self.lTimeStamp];
    self.sTitle = [BaseJSON readStringDef:[RootMap objectForKey:@"sTitle"] required:false def:self.sTitle];
    self.iTotalAmount = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalAmount"] required:false def:self.iTotalAmount];
    self.iNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumber"] required:false def:self.iNumber];
    self.sDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sDesc"] required:false def:self.sDesc];
    self.iStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iStatus"] required:false def:self.iStatus];
    self.iNumberUnit = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumberUnit"] required:false def:self.iNumberUnit];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PayOrderExtra
- (id) init
{
    if (self = [super init])
    {
        self.sClassId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sClassId != nil)
    {
        [ostream writeString: 0 value: self.sClassId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PayOrderExtra *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sClassId = [istream readStringDef: 0 required: false def: self.sClassId];
    
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
    [JsonRoot append:@"sClassId" value : [BaseJSON writeString : self.sClassId]];
    return JsonRoot;
}

- (PayOrderExtra *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sClassId = [BaseJSON readStringDef:[RootMap objectForKey:@"sClassId"] required:false def:self.sClassId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPayOrderIdReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iSubjectType = 0;
        self.iNumber = 0;
        self.stExtra = [[PayOrderExtra alloc] init];
        self.iNumberUnit = E_DT_PAY_TIME_MONTH;
        self.iPayChannel = E_DT_PAY_CHANNEL_APP;
        self.vCouponCode = [NSMutableArray arrayWithCapacity:0];
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
    [ostream writeInt32: 2 value: self.iSubjectType];
    [ostream writeInt32: 3 value: self.iNumber];
    if (self.stExtra != nil)
    {
        [ostream writeMessage: 4 value: self.stExtra];
    }
    [ostream writeInt32: 5 value: self.iNumberUnit];
    [ostream writeInt32: 6 value: self.iPayChannel];
    if (self.vCouponCode != nil)
    {
        [ostream writeList: 7 value: self.vCouponCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPayOrderIdReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iSubjectType = [istream readInt32: 2 required: true];
    self.iNumber = [istream readInt32: 3 required: true];
    self.stExtra = (PayOrderExtra*)[istream readMessageDef: 4 required: false def: self.stExtra VAR_TYPE: [PayOrderExtra class]];
    self.iNumberUnit = [istream readInt32Def: 5 required: false def: self.iNumberUnit];
    self.iPayChannel = [istream readInt32Def: 6 required: false def: self.iPayChannel];
    self.vCouponCode = [istream readListDef: 7 required: false def: self.vCouponCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
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
    [JsonRoot append:@"iSubjectType" value : [BaseJSON writeInt32 : self.iSubjectType]];
    [JsonRoot append:@"iNumber" value : [BaseJSON writeInt32 : self.iNumber]];
    [JsonRoot append:@"stExtra" value : [BaseJSON writeMessage : self.stExtra]];
    [JsonRoot append:@"iNumberUnit" value : [BaseJSON writeInt32 : self.iNumberUnit]];
    [JsonRoot append:@"iPayChannel" value : [BaseJSON writeInt32 : self.iPayChannel]];
    [JsonRoot append:@"vCouponCode" value : [BaseJSON writeList : self.vCouponCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]]];
    return JsonRoot;
}

- (GetPayOrderIdReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iSubjectType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubjectType"] required:true def:self.iSubjectType];
    self.iNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumber"] required:true def:self.iNumber];
    self.stExtra = [BaseJSON readMessageDef:[RootMap objectForKey:@"stExtra"] required:false def:self.stExtra VAR_TYPE: [PayOrderExtra class]];
    self.iNumberUnit = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumberUnit"] required:false def:self.iNumberUnit];
    self.iPayChannel = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPayChannel"] required:false def:self.iPayChannel];
    self.vCouponCode = [BaseJSON readListDef:[RootMap objectForKey:@"vCouponCode"] required:false def:self.vCouponCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetPayOrderIdRsp
- (id) init
{
    if (self = [super init])
    {
        self.stDtPayItem = [[DtPayItem alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stDtPayItem != nil)
    {
        [ostream writeMessage: 0 value: self.stDtPayItem];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetPayOrderIdRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stDtPayItem = (DtPayItem*)[istream readMessageDef: 0 required: false def: self.stDtPayItem VAR_TYPE: [DtPayItem class]];
    
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
    [JsonRoot append:@"stDtPayItem" value : [BaseJSON writeMessage : self.stDtPayItem]];
    return JsonRoot;
}

- (GetPayOrderIdRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stDtPayItem = [BaseJSON readMessageDef:[RootMap objectForKey:@"stDtPayItem"] required:false def:self.stDtPayItem VAR_TYPE: [DtPayItem class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetAliPaySignReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sDtPayOrderId = @"";
        self.sPassback = @"";
        self.sAppId = @"";
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
    [ostream writeString: 2 value: self.sDtPayOrderId];
    if (self.sPassback != nil)
    {
        [ostream writeString: 3 value: self.sPassback];
    }
    [ostream writeString: 4 value: self.sAppId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetAliPaySignReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sDtPayOrderId = [istream readString: 2 required: true];
    self.sPassback = [istream readStringDef: 3 required: false def: self.sPassback];
    self.sAppId = [istream readString: 4 required: true];
    
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
    [JsonRoot append:@"sDtPayOrderId" value : [BaseJSON writeString : self.sDtPayOrderId]];
    [JsonRoot append:@"sPassback" value : [BaseJSON writeString : self.sPassback]];
    [JsonRoot append:@"sAppId" value : [BaseJSON writeString : self.sAppId]];
    return JsonRoot;
}

- (GetAliPaySignReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sDtPayOrderId = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtPayOrderId"] required:true def:self.sDtPayOrderId];
    self.sPassback = [BaseJSON readStringDef:[RootMap objectForKey:@"sPassback"] required:false def:self.sPassback];
    self.sAppId = [BaseJSON readStringDef:[RootMap objectForKey:@"sAppId"] required:true def:self.sAppId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetAliPaySignRsp
- (id) init
{
    if (self = [super init])
    {
        self.iReturnCode = 0;
        self.sSign = @"";
        self.iStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iReturnCode];
    if (self.sSign != nil)
    {
        [ostream writeString: 1 value: self.sSign];
    }
    [ostream writeInt32: 2 value: self.iStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetAliPaySignRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iReturnCode = [istream readInt32Def: 0 required: false def: self.iReturnCode];
    self.sSign = [istream readStringDef: 1 required: false def: self.sSign];
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
    [JsonRoot append:@"iReturnCode" value : [BaseJSON writeInt32 : self.iReturnCode]];
    [JsonRoot append:@"sSign" value : [BaseJSON writeString : self.sSign]];
    [JsonRoot append:@"iStatus" value : [BaseJSON writeInt32 : self.iStatus]];
    return JsonRoot;
}

- (GetAliPaySignRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iReturnCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iReturnCode"] required:false def:self.iReturnCode];
    self.sSign = [BaseJSON readStringDef:[RootMap objectForKey:@"sSign"] required:false def:self.sSign];
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
@implementation GetWxPayPrepayIdReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.sDtPayOrderId = @"";
        self.sPassback = @"";
        self.sAppId = @"";
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
    [ostream writeString: 2 value: self.sDtPayOrderId];
    if (self.sPassback != nil)
    {
        [ostream writeString: 3 value: self.sPassback];
    }
    [ostream writeString: 4 value: self.sAppId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetWxPayPrepayIdReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sDtPayOrderId = [istream readString: 2 required: true];
    self.sPassback = [istream readStringDef: 3 required: false def: self.sPassback];
    self.sAppId = [istream readString: 4 required: true];
    
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
    [JsonRoot append:@"sDtPayOrderId" value : [BaseJSON writeString : self.sDtPayOrderId]];
    [JsonRoot append:@"sPassback" value : [BaseJSON writeString : self.sPassback]];
    [JsonRoot append:@"sAppId" value : [BaseJSON writeString : self.sAppId]];
    return JsonRoot;
}

- (GetWxPayPrepayIdReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.sDtPayOrderId = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtPayOrderId"] required:true def:self.sDtPayOrderId];
    self.sPassback = [BaseJSON readStringDef:[RootMap objectForKey:@"sPassback"] required:false def:self.sPassback];
    self.sAppId = [BaseJSON readStringDef:[RootMap objectForKey:@"sAppId"] required:true def:self.sAppId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation WxPayPrepayInfo
- (id) init
{
    if (self = [super init])
    {
        self.sAppId = @"";
        self.sPartnerId = @"";
        self.sPrepayId = @"";
        self.sPackage = @"";
        self.sNonceStr = @"";
        self.lTimeStamp = 0;
        self.sSign = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sAppId != nil)
    {
        [ostream writeString: 0 value: self.sAppId];
    }
    if (self.sPartnerId != nil)
    {
        [ostream writeString: 1 value: self.sPartnerId];
    }
    if (self.sPrepayId != nil)
    {
        [ostream writeString: 2 value: self.sPrepayId];
    }
    if (self.sPackage != nil)
    {
        [ostream writeString: 3 value: self.sPackage];
    }
    if (self.sNonceStr != nil)
    {
        [ostream writeString: 4 value: self.sNonceStr];
    }
    [ostream writeInt64: 5 value: self.lTimeStamp];
    if (self.sSign != nil)
    {
        [ostream writeString: 6 value: self.sSign];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (WxPayPrepayInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sAppId = [istream readStringDef: 0 required: false def: self.sAppId];
    self.sPartnerId = [istream readStringDef: 1 required: false def: self.sPartnerId];
    self.sPrepayId = [istream readStringDef: 2 required: false def: self.sPrepayId];
    self.sPackage = [istream readStringDef: 3 required: false def: self.sPackage];
    self.sNonceStr = [istream readStringDef: 4 required: false def: self.sNonceStr];
    self.lTimeStamp = [istream readInt64Def: 5 required: false def: self.lTimeStamp];
    self.sSign = [istream readStringDef: 6 required: false def: self.sSign];
    
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
    [JsonRoot append:@"sAppId" value : [BaseJSON writeString : self.sAppId]];
    [JsonRoot append:@"sPartnerId" value : [BaseJSON writeString : self.sPartnerId]];
    [JsonRoot append:@"sPrepayId" value : [BaseJSON writeString : self.sPrepayId]];
    [JsonRoot append:@"sPackage" value : [BaseJSON writeString : self.sPackage]];
    [JsonRoot append:@"sNonceStr" value : [BaseJSON writeString : self.sNonceStr]];
    [JsonRoot append:@"lTimeStamp" value : [BaseJSON writeInt64 : self.lTimeStamp]];
    [JsonRoot append:@"sSign" value : [BaseJSON writeString : self.sSign]];
    return JsonRoot;
}

- (WxPayPrepayInfo *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sAppId = [BaseJSON readStringDef:[RootMap objectForKey:@"sAppId"] required:false def:self.sAppId];
    self.sPartnerId = [BaseJSON readStringDef:[RootMap objectForKey:@"sPartnerId"] required:false def:self.sPartnerId];
    self.sPrepayId = [BaseJSON readStringDef:[RootMap objectForKey:@"sPrepayId"] required:false def:self.sPrepayId];
    self.sPackage = [BaseJSON readStringDef:[RootMap objectForKey:@"sPackage"] required:false def:self.sPackage];
    self.sNonceStr = [BaseJSON readStringDef:[RootMap objectForKey:@"sNonceStr"] required:false def:self.sNonceStr];
    self.lTimeStamp = [BaseJSON readInt64Def:[RootMap objectForKey:@"lTimeStamp"] required:false def:self.lTimeStamp];
    self.sSign = [BaseJSON readStringDef:[RootMap objectForKey:@"sSign"] required:false def:self.sSign];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetWxPayPrepayIdRsp
- (id) init
{
    if (self = [super init])
    {
        self.iReturnCode = 0;
        self.sResultDesc = @"";
        self.stPrepay = [[WxPayPrepayInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iReturnCode];
    if (self.sResultDesc != nil)
    {
        [ostream writeString: 1 value: self.sResultDesc];
    }
    if (self.stPrepay != nil)
    {
        [ostream writeMessage: 2 value: self.stPrepay];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetWxPayPrepayIdRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iReturnCode = [istream readInt32Def: 0 required: false def: self.iReturnCode];
    self.sResultDesc = [istream readStringDef: 1 required: false def: self.sResultDesc];
    self.stPrepay = (WxPayPrepayInfo*)[istream readMessageDef: 2 required: false def: self.stPrepay VAR_TYPE: [WxPayPrepayInfo class]];
    
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
    [JsonRoot append:@"sResultDesc" value : [BaseJSON writeString : self.sResultDesc]];
    [JsonRoot append:@"stPrepay" value : [BaseJSON writeMessage : self.stPrepay]];
    return JsonRoot;
}

- (GetWxPayPrepayIdRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iReturnCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iReturnCode"] required:false def:self.iReturnCode];
    self.sResultDesc = [BaseJSON readStringDef:[RootMap objectForKey:@"sResultDesc"] required:false def:self.sResultDesc];
    self.stPrepay = [BaseJSON readMessageDef:[RootMap objectForKey:@"stPrepay"] required:false def:self.stPrepay VAR_TYPE: [WxPayPrepayInfo class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetMemberFeeListReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iSubjectType = E_DT_SUBJECT_MEMBER;
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

- (GetMemberFeeListReq *) read: (BaseDecodeStream *)istream
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

- (GetMemberFeeListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation DtMemberFeeItem
- (id) init
{
    if (self = [super init])
    {
        self.iMonthNum = 0;
        self.iAvgMoney = 0;
        self.iTotalMoney = 0;
        self.iUnit = E_DT_PAY_TIME_MONTH;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iMonthNum];
    [ostream writeInt32: 1 value: self.iAvgMoney];
    [ostream writeInt32: 2 value: self.iTotalMoney];
    [ostream writeInt32: 3 value: self.iUnit];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtMemberFeeItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iMonthNum = [istream readInt32Def: 0 required: false def: self.iMonthNum];
    self.iAvgMoney = [istream readInt32Def: 1 required: false def: self.iAvgMoney];
    self.iTotalMoney = [istream readInt32Def: 2 required: false def: self.iTotalMoney];
    self.iUnit = [istream readInt32Def: 3 required: false def: self.iUnit];
    
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
    [JsonRoot append:@"iMonthNum" value : [BaseJSON writeInt32 : self.iMonthNum]];
    [JsonRoot append:@"iAvgMoney" value : [BaseJSON writeInt32 : self.iAvgMoney]];
    [JsonRoot append:@"iTotalMoney" value : [BaseJSON writeInt32 : self.iTotalMoney]];
    [JsonRoot append:@"iUnit" value : [BaseJSON writeInt32 : self.iUnit]];
    return JsonRoot;
}

- (DtMemberFeeItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iMonthNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonthNum"] required:false def:self.iMonthNum];
    self.iAvgMoney = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAvgMoney"] required:false def:self.iAvgMoney];
    self.iTotalMoney = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalMoney"] required:false def:self.iTotalMoney];
    self.iUnit = [BaseJSON readInt32Def:[RootMap objectForKey:@"iUnit"] required:false def:self.iUnit];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetMemberFeeListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vItem != nil)
    {
        [ostream writeList: 0 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtMemberFeeItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetMemberFeeListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vItem = [istream readListDef: 0 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtMemberFeeItem class]]];
    
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
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtMemberFeeItem class]]]];
    return JsonRoot;
}

- (GetMemberFeeListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtMemberFeeItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetYxtCourseFeeListReq
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

- (GetYxtCourseFeeListReq *) read: (BaseDecodeStream *)istream
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

- (GetYxtCourseFeeListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation YxtCourseFeeItem
- (id) init
{
    if (self = [super init])
    {
        self.sClassId = @"";
        self.sClassName = @"";
        self.iTotalMoney = 0;
        self.iClassHour = 0;
        self.sTeacher = @"";
        self.sOpenTime = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sClassId != nil)
    {
        [ostream writeString: 0 value: self.sClassId];
    }
    if (self.sClassName != nil)
    {
        [ostream writeString: 1 value: self.sClassName];
    }
    [ostream writeInt32: 2 value: self.iTotalMoney];
    [ostream writeInt32: 3 value: self.iClassHour];
    if (self.sTeacher != nil)
    {
        [ostream writeString: 4 value: self.sTeacher];
    }
    if (self.sOpenTime != nil)
    {
        [ostream writeString: 5 value: self.sOpenTime];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (YxtCourseFeeItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sClassId = [istream readStringDef: 0 required: false def: self.sClassId];
    self.sClassName = [istream readStringDef: 1 required: false def: self.sClassName];
    self.iTotalMoney = [istream readInt32Def: 2 required: false def: self.iTotalMoney];
    self.iClassHour = [istream readInt32Def: 3 required: false def: self.iClassHour];
    self.sTeacher = [istream readStringDef: 4 required: false def: self.sTeacher];
    self.sOpenTime = [istream readStringDef: 5 required: false def: self.sOpenTime];
    
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
    [JsonRoot append:@"sClassId" value : [BaseJSON writeString : self.sClassId]];
    [JsonRoot append:@"sClassName" value : [BaseJSON writeString : self.sClassName]];
    [JsonRoot append:@"iTotalMoney" value : [BaseJSON writeInt32 : self.iTotalMoney]];
    [JsonRoot append:@"iClassHour" value : [BaseJSON writeInt32 : self.iClassHour]];
    [JsonRoot append:@"sTeacher" value : [BaseJSON writeString : self.sTeacher]];
    [JsonRoot append:@"sOpenTime" value : [BaseJSON writeString : self.sOpenTime]];
    return JsonRoot;
}

- (YxtCourseFeeItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sClassId = [BaseJSON readStringDef:[RootMap objectForKey:@"sClassId"] required:false def:self.sClassId];
    self.sClassName = [BaseJSON readStringDef:[RootMap objectForKey:@"sClassName"] required:false def:self.sClassName];
    self.iTotalMoney = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalMoney"] required:false def:self.iTotalMoney];
    self.iClassHour = [BaseJSON readInt32Def:[RootMap objectForKey:@"iClassHour"] required:false def:self.iClassHour];
    self.sTeacher = [BaseJSON readStringDef:[RootMap objectForKey:@"sTeacher"] required:false def:self.sTeacher];
    self.sOpenTime = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpenTime"] required:false def:self.sOpenTime];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetYxtCourseFeeListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vItem != nil)
    {
        [ostream writeList: 0 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [YxtCourseFeeItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetYxtCourseFeeListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vItem = [istream readListDef: 0 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [YxtCourseFeeItem class]]];
    
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
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [YxtCourseFeeItem class]]]];
    return JsonRoot;
}

- (GetYxtCourseFeeListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [YxtCourseFeeItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetUserPayListReq
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

- (GetUserPayListReq *) read: (BaseDecodeStream *)istream
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

- (GetUserPayListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GetUserPayListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vItem = [NSMutableArray arrayWithCapacity:0];
        self.iTotalNum = 0;
        self.sNextId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vItem != nil)
    {
        [ostream writeList: 0 value: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtPayItem class]]];
    }
    [ostream writeInt32: 1 value: self.iTotalNum];
    if (self.sNextId != nil)
    {
        [ostream writeString: 2 value: self.sNextId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUserPayListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vItem = [istream readListDef: 0 required: false def: self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtPayItem class]]];
    self.iTotalNum = [istream readInt32Def: 1 required: false def: self.iTotalNum];
    self.sNextId = [istream readStringDef: 2 required: false def: self.sNextId];
    
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
    [JsonRoot append:@"vItem" value : [BaseJSON writeList : self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtPayItem class]]]];
    [JsonRoot append:@"iTotalNum" value : [BaseJSON writeInt32 : self.iTotalNum]];
    [JsonRoot append:@"sNextId" value : [BaseJSON writeString : self.sNextId]];
    return JsonRoot;
}

- (GetUserPayListRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vItem = [BaseJSON readListDef:[RootMap objectForKey:@"vItem"] required:false def:self.vItem VAR_TYPE: [THOTH_LIST CREATE: [DtPayItem class]]];
    self.iTotalNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalNum"] required:false def:self.iTotalNum];
    self.sNextId = [BaseJSON readStringDef:[RootMap objectForKey:@"sNextId"] required:false def:self.sNextId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportPayResultReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.mPayResult = [NSMutableDictionary dictionaryWithCapacity: 0];
        self.iPayType = 0;
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
    if (self.mPayResult != nil)
    {
        [ostream writeMap: 2 value: self.mPayResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    }
    [ostream writeInt32: 3 value: self.iPayType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportPayResultReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.mPayResult = [istream readMapDef: 2 required: false def: self.mPayResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    self.iPayType = [istream readInt32Def: 3 required: false def: self.iPayType];
    
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
    [JsonRoot append:@"mPayResult" value : [BaseJSON writeMap : self.mPayResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]]];
    [JsonRoot append:@"iPayType" value : [BaseJSON writeInt32 : self.iPayType]];
    return JsonRoot;
}

- (ReportPayResultReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.mPayResult = [BaseJSON readMapDef:[RootMap objectForKey:@"mPayResult"] required:false def:self.mPayResult VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    self.iPayType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPayType"] required:false def:self.iPayType];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportPayResultRsp
- (id) init
{
    if (self = [super init])
    {
        self.iPayStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iPayStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportPayResultRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iPayStatus = [istream readInt32Def: 0 required: false def: self.iPayStatus];
    
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
    [JsonRoot append:@"iPayStatus" value : [BaseJSON writeInt32 : self.iPayStatus]];
    return JsonRoot;
}

- (ReportPayResultRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iPayStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPayStatus"] required:false def:self.iPayStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetOrderPayResultReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iPayType = 0;
        self.sInnerOrderId = @"";
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
    [ostream writeInt32: 2 value: self.iPayType];
    if (self.sInnerOrderId != nil)
    {
        [ostream writeString: 3 value: self.sInnerOrderId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetOrderPayResultReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iPayType = [istream readInt32Def: 2 required: false def: self.iPayType];
    self.sInnerOrderId = [istream readStringDef: 3 required: false def: self.sInnerOrderId];
    
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
    [JsonRoot append:@"iPayType" value : [BaseJSON writeInt32 : self.iPayType]];
    [JsonRoot append:@"sInnerOrderId" value : [BaseJSON writeString : self.sInnerOrderId]];
    return JsonRoot;
}

- (GetOrderPayResultReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iPayType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPayType"] required:false def:self.iPayType];
    self.sInnerOrderId = [BaseJSON readStringDef:[RootMap objectForKey:@"sInnerOrderId"] required:false def:self.sInnerOrderId];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation GetOrderPayResultRsp
- (id) init
{
    if (self = [super init])
    {
        self.iReturnCode = 0;
        self.iPayStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iReturnCode];
    [ostream writeInt32: 1 value: self.iPayStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetOrderPayResultRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iReturnCode = [istream readInt32Def: 0 required: false def: self.iReturnCode];
    self.iPayStatus = [istream readInt32Def: 1 required: false def: self.iPayStatus];
    
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
    [JsonRoot append:@"iPayStatus" value : [BaseJSON writeInt32 : self.iPayStatus]];
    return JsonRoot;
}

- (GetOrderPayResultRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iReturnCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iReturnCode"] required:false def:self.iReturnCode];
    self.iPayStatus = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPayStatus"] required:false def:self.iPayStatus];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CheckUserCouponReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.stAccountTicket = [[AccountTicket alloc] init];
        self.iSubjectType = 0;
        self.iNumber = 0;
        self.iNumberUnit = E_DT_PAY_TIME_MONTH;
        self.stExtra = [[PayOrderExtra alloc] init];
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
    [ostream writeInt32: 2 value: self.iSubjectType];
    [ostream writeInt32: 3 value: self.iNumber];
    [ostream writeInt32: 4 value: self.iNumberUnit];
    if (self.stExtra != nil)
    {
        [ostream writeMessage: 5 value: self.stExtra];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CheckUserCouponReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = (AccountTicket*)[istream readMessageDef: 1 required: false def: self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iSubjectType = [istream readInt32: 2 required: true];
    self.iNumber = [istream readInt32: 3 required: true];
    self.iNumberUnit = [istream readInt32Def: 4 required: false def: self.iNumberUnit];
    self.stExtra = (PayOrderExtra*)[istream readMessageDef: 5 required: false def: self.stExtra VAR_TYPE: [PayOrderExtra class]];
    
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
    [JsonRoot append:@"iSubjectType" value : [BaseJSON writeInt32 : self.iSubjectType]];
    [JsonRoot append:@"iNumber" value : [BaseJSON writeInt32 : self.iNumber]];
    [JsonRoot append:@"iNumberUnit" value : [BaseJSON writeInt32 : self.iNumberUnit]];
    [JsonRoot append:@"stExtra" value : [BaseJSON writeMessage : self.stExtra]];
    return JsonRoot;
}

- (CheckUserCouponReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iSubjectType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubjectType"] required:true def:self.iSubjectType];
    self.iNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumber"] required:true def:self.iNumber];
    self.iNumberUnit = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumberUnit"] required:false def:self.iNumberUnit];
    self.stExtra = [BaseJSON readMessageDef:[RootMap objectForKey:@"stExtra"] required:false def:self.stExtra VAR_TYPE: [PayOrderExtra class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation CheckUserCouponRsp
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

- (CheckUserCouponRsp *) read: (BaseDecodeStream *)istream
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

- (CheckUserCouponRsp *) readFromMap : (NSMutableDictionary *) RootMap
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

