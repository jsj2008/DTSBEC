#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "LogReport.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation ReportLogReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sBussName = @"default";
        self.iErrCode = 0;
        self.sErrMsg = @"";
        self.vData = [NSData data];
        self.sFileSuffix = @"";
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
    if (self.sBussName != nil)
    {
        [ostream writeString: 1 value: self.sBussName];
    }
    [ostream writeInt32: 2 value: self.iErrCode];
    if (self.sErrMsg != nil)
    {
        [ostream writeString: 3 value: self.sErrMsg];
    }
    if (self.vData != nil)
    {
        [ostream writeBytes: 4 value: self.vData];
    }
    if (self.sFileSuffix != nil)
    {
        [ostream writeString: 5 value: self.sFileSuffix];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ReportLogReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sBussName = [istream readStringDef: 1 required: false def: self.sBussName];
    self.iErrCode = [istream readInt32Def: 2 required: false def: self.iErrCode];
    self.sErrMsg = [istream readStringDef: 3 required: false def: self.sErrMsg];
    self.vData = [istream readBytesDef: 4 required: false def: self.vData];
    self.sFileSuffix = [istream readStringDef: 5 required: false def: self.sFileSuffix];
    
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
    [JsonRoot append:@"sBussName" value : [BaseJSON writeString : self.sBussName]];
    [JsonRoot append:@"iErrCode" value : [BaseJSON writeInt32 : self.iErrCode]];
    [JsonRoot append:@"sErrMsg" value : [BaseJSON writeString : self.sErrMsg]];
    [JsonRoot append:@"vData" value : [BaseJSON writeBytes : self.vData]];
    [JsonRoot append:@"sFileSuffix" value : [BaseJSON writeString : self.sFileSuffix]];
    return JsonRoot;
}

- (ReportLogReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sBussName = [BaseJSON readStringDef:[RootMap objectForKey:@"sBussName"] required:false def:self.sBussName];
    self.iErrCode = [BaseJSON readInt32Def:[RootMap objectForKey:@"iErrCode"] required:false def:self.iErrCode];
    self.sErrMsg = [BaseJSON readStringDef:[RootMap objectForKey:@"sErrMsg"] required:false def:self.sErrMsg];
    self.vData = [BaseJSON readBytesDef:[RootMap objectForKey:@"vData"] required:false def:self.vData];
    self.sFileSuffix = [BaseJSON readStringDef:[RootMap objectForKey:@"sFileSuffix"] required:false def:self.sFileSuffix];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation ReportLogRsp
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

- (ReportLogRsp *) read: (BaseDecodeStream *)istream
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

- (ReportLogRsp *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GetTicketReq
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

- (GetTicketReq *) read: (BaseDecodeStream *)istream
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

- (GetTicketReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation GetTicketRsp
- (id) init
{
    if (self = [super init])
    {
        self.sTicket = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTicket != nil)
    {
        [ostream writeString: 0 value: self.sTicket];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetTicketRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTicket = [istream readStringDef: 0 required: false def: self.sTicket];
    
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
    [JsonRoot append:@"sTicket" value : [BaseJSON writeString : self.sTicket]];
    return JsonRoot;
}

- (GetTicketRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sTicket = [BaseJSON readStringDef:[RootMap objectForKey:@"sTicket"] required:false def:self.sTicket];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

