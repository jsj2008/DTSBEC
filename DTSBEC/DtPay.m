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
    return JsonRoot;
}

- (GetPayOrderIdReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.stAccountTicket = [BaseJSON readMessageDef:[RootMap objectForKey:@"stAccountTicket"] required:false def:self.stAccountTicket VAR_TYPE: [AccountTicket class]];
    self.iSubjectType = [BaseJSON readInt32Def:[RootMap objectForKey:@"iSubjectType"] required:true def:self.iSubjectType];
    self.iNumber = [BaseJSON readInt32Def:[RootMap objectForKey:@"iNumber"] required:true def:self.iNumber];
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

- (GetMemberFeeListReq *) read: (BaseDecodeStream *)istream
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

- (GetMemberFeeListReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation DtMemberFeeItem
- (id) init
{
    if (self = [super init])
    {
        self.iMonthNum = 0;
        self.iAvgMoney = 0;
        self.iTotalMoney = 0;
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DtMemberFeeItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iMonthNum = [istream readInt32Def: 0 required: false def: self.iMonthNum];
    self.iAvgMoney = [istream readInt32Def: 1 required: false def: self.iAvgMoney];
    self.iTotalMoney = [istream readInt32Def: 2 required: false def: self.iTotalMoney];
    
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
    return JsonRoot;
}

- (DtMemberFeeItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iMonthNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iMonthNum"] required:false def:self.iMonthNum];
    self.iAvgMoney = [BaseJSON readInt32Def:[RootMap objectForKey:@"iAvgMoney"] required:false def:self.iAvgMoney];
    self.iTotalMoney = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotalMoney"] required:false def:self.iTotalMoney];
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

