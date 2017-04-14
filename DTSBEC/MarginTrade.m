#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "MarginTrade.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation MarginTradeDt
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.fBuyValue = 0;
        self.fBuyPercent = 0;
        self.sBuyValue = @"";
        self.sBuyPercent = @"";
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
    [ostream writeFloat: 1 value: self.fBuyValue];
    [ostream writeFloat: 2 value: self.fBuyPercent];
    if (self.sBuyValue != nil)
    {
        [ostream writeString: 3 value: self.sBuyValue];
    }
    if (self.sBuyPercent != nil)
    {
        [ostream writeString: 4 value: self.sBuyPercent];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarginTradeDt *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.fBuyValue = [istream readFloatDef: 1 required: false def: self.fBuyValue];
    self.fBuyPercent = [istream readFloatDef: 2 required: false def: self.fBuyPercent];
    self.sBuyValue = [istream readStringDef: 3 required: false def: self.sBuyValue];
    self.sBuyPercent = [istream readStringDef: 4 required: false def: self.sBuyPercent];
    
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
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"fBuyValue" value : [BaseJSON writeFloat : self.fBuyValue]];
    [JsonRoot append:@"fBuyPercent" value : [BaseJSON writeFloat : self.fBuyPercent]];
    [JsonRoot append:@"sBuyValue" value : [BaseJSON writeString : self.sBuyValue]];
    [JsonRoot append:@"sBuyPercent" value : [BaseJSON writeString : self.sBuyPercent]];
    return JsonRoot;
}

- (MarginTradeDt *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.fBuyValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuyValue"] required:false def:self.fBuyValue];
    self.fBuyPercent = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuyPercent"] required:false def:self.fBuyPercent];
    self.sBuyValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sBuyValue"] required:false def:self.sBuyValue];
    self.sBuyPercent = [BaseJSON readStringDef:[RootMap objectForKey:@"sBuyPercent"] required:false def:self.sBuyPercent];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarginTradeMkt
- (id) init
{
    if (self = [super init])
    {
        self.sOpDate = @"";
        self.fMarginBalance = 0;
        self.fBuyValue = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sOpDate != nil)
    {
        [ostream writeString: 0 value: self.sOpDate];
    }
    [ostream writeFloat: 1 value: self.fMarginBalance];
    [ostream writeFloat: 2 value: self.fBuyValue];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarginTradeMkt *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sOpDate = [istream readStringDef: 0 required: false def: self.sOpDate];
    self.fMarginBalance = [istream readFloatDef: 1 required: false def: self.fMarginBalance];
    self.fBuyValue = [istream readFloatDef: 2 required: false def: self.fBuyValue];
    
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
    [JsonRoot append:@"sOpDate" value : [BaseJSON writeString : self.sOpDate]];
    [JsonRoot append:@"fMarginBalance" value : [BaseJSON writeFloat : self.fMarginBalance]];
    [JsonRoot append:@"fBuyValue" value : [BaseJSON writeFloat : self.fBuyValue]];
    return JsonRoot;
}

- (MarginTradeMkt *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sOpDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpDate"] required:false def:self.sOpDate];
    self.fMarginBalance = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMarginBalance"] required:false def:self.fMarginBalance];
    self.fBuyValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuyValue"] required:false def:self.fBuyValue];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PlateBuyValue
- (id) init
{
    if (self = [super init])
    {
        self.sPlate = @"";
        self.fBuyValue = 0;
        self.sBuyValue = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPlate != nil)
    {
        [ostream writeString: 0 value: self.sPlate];
    }
    [ostream writeFloat: 1 value: self.fBuyValue];
    if (self.sBuyValue != nil)
    {
        [ostream writeString: 2 value: self.sBuyValue];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateBuyValue *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPlate = [istream readStringDef: 0 required: false def: self.sPlate];
    self.fBuyValue = [istream readFloatDef: 1 required: false def: self.fBuyValue];
    self.sBuyValue = [istream readStringDef: 2 required: false def: self.sBuyValue];
    
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
    [JsonRoot append:@"sPlate" value : [BaseJSON writeString : self.sPlate]];
    [JsonRoot append:@"fBuyValue" value : [BaseJSON writeFloat : self.fBuyValue]];
    [JsonRoot append:@"sBuyValue" value : [BaseJSON writeString : self.sBuyValue]];
    return JsonRoot;
}

- (PlateBuyValue *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sPlate = [BaseJSON readStringDef:[RootMap objectForKey:@"sPlate"] required:false def:self.sPlate];
    self.fBuyValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuyValue"] required:false def:self.fBuyValue];
    self.sBuyValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sBuyValue"] required:false def:self.sBuyValue];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IndustryRank
- (id) init
{
    if (self = [super init])
    {
        self.iPosition = 0;
        self.iTotal = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iPosition];
    [ostream writeInt32: 1 value: self.iTotal];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IndustryRank *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iPosition = [istream readInt32Def: 0 required: false def: self.iPosition];
    self.iTotal = [istream readInt32Def: 1 required: false def: self.iTotal];
    
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
    [JsonRoot append:@"iPosition" value : [BaseJSON writeInt32 : self.iPosition]];
    [JsonRoot append:@"iTotal" value : [BaseJSON writeInt32 : self.iTotal]];
    return JsonRoot;
}

- (IndustryRank *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.iPosition = [BaseJSON readInt32Def:[RootMap objectForKey:@"iPosition"] required:false def:self.iPosition];
    self.iTotal = [BaseJSON readInt32Def:[RootMap objectForKey:@"iTotal"] required:false def:self.iTotal];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StockDateMarginTrade
- (id) init
{
    if (self = [super init])
    {
        self.sOpDate = @"";
        self.fMarginBalance = 0;
        self.fBuyValue = 0;
        self.sMarginBalance = @"";
        self.sBuyValue = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sOpDate != nil)
    {
        [ostream writeString: 0 value: self.sOpDate];
    }
    [ostream writeFloat: 1 value: self.fMarginBalance];
    [ostream writeFloat: 2 value: self.fBuyValue];
    if (self.sMarginBalance != nil)
    {
        [ostream writeString: 3 value: self.sMarginBalance];
    }
    if (self.sBuyValue != nil)
    {
        [ostream writeString: 4 value: self.sBuyValue];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StockDateMarginTrade *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sOpDate = [istream readStringDef: 0 required: false def: self.sOpDate];
    self.fMarginBalance = [istream readFloatDef: 1 required: false def: self.fMarginBalance];
    self.fBuyValue = [istream readFloatDef: 2 required: false def: self.fBuyValue];
    self.sMarginBalance = [istream readStringDef: 3 required: false def: self.sMarginBalance];
    self.sBuyValue = [istream readStringDef: 4 required: false def: self.sBuyValue];
    
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
    [JsonRoot append:@"sOpDate" value : [BaseJSON writeString : self.sOpDate]];
    [JsonRoot append:@"fMarginBalance" value : [BaseJSON writeFloat : self.fMarginBalance]];
    [JsonRoot append:@"fBuyValue" value : [BaseJSON writeFloat : self.fBuyValue]];
    [JsonRoot append:@"sMarginBalance" value : [BaseJSON writeString : self.sMarginBalance]];
    [JsonRoot append:@"sBuyValue" value : [BaseJSON writeString : self.sBuyValue]];
    return JsonRoot;
}

- (StockDateMarginTrade *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sOpDate = [BaseJSON readStringDef:[RootMap objectForKey:@"sOpDate"] required:false def:self.sOpDate];
    self.fMarginBalance = [BaseJSON readFloatDef:[RootMap objectForKey:@"fMarginBalance"] required:false def:self.fMarginBalance];
    self.fBuyValue = [BaseJSON readFloatDef:[RootMap objectForKey:@"fBuyValue"] required:false def:self.fBuyValue];
    self.sMarginBalance = [BaseJSON readStringDef:[RootMap objectForKey:@"sMarginBalance"] required:false def:self.sMarginBalance];
    self.sBuyValue = [BaseJSON readStringDef:[RootMap objectForKey:@"sBuyValue"] required:false def:self.sBuyValue];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation MarginTradeMktReq
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

- (MarginTradeMktReq *) read: (BaseDecodeStream *)istream
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

- (MarginTradeMktReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation MarginTradeMktRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtSZMarginTrade = [NSMutableArray arrayWithCapacity:0];
        self.vtSHMarginTrade = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtSZMarginTrade != nil)
    {
        [ostream writeList: 0 value: self.vtSZMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeMkt class]]];
    }
    if (self.vtSHMarginTrade != nil)
    {
        [ostream writeList: 1 value: self.vtSHMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeMkt class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (MarginTradeMktRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtSZMarginTrade = [istream readListDef: 0 required: false def: self.vtSZMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeMkt class]]];
    self.vtSHMarginTrade = [istream readListDef: 1 required: false def: self.vtSHMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeMkt class]]];
    
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
    [JsonRoot append:@"vtSZMarginTrade" value : [BaseJSON writeList : self.vtSZMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeMkt class]]]];
    [JsonRoot append:@"vtSHMarginTrade" value : [BaseJSON writeList : self.vtSHMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeMkt class]]]];
    return JsonRoot;
}

- (MarginTradeMktRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtSZMarginTrade = [BaseJSON readListDef:[RootMap objectForKey:@"vtSZMarginTrade"] required:false def:self.vtSZMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeMkt class]]];
    self.vtSHMarginTrade = [BaseJSON readListDef:[RootMap objectForKey:@"vtSHMarginTrade"] required:false def:self.vtSHMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeMkt class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IndustryPlateBuyValueReq
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

- (IndustryPlateBuyValueReq *) read: (BaseDecodeStream *)istream
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

- (IndustryPlateBuyValueReq *) readFromMap : (NSMutableDictionary *) RootMap
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
@implementation IndustryPlateBuyValueRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtIndustryBuyValue = [NSMutableArray arrayWithCapacity:0];
        self.vtPlateBuyValue = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtIndustryBuyValue != nil)
    {
        [ostream writeList: 0 value: self.vtIndustryBuyValue VAR_TYPE: [THOTH_LIST CREATE: [PlateBuyValue class]]];
    }
    if (self.vtPlateBuyValue != nil)
    {
        [ostream writeList: 1 value: self.vtPlateBuyValue VAR_TYPE: [THOTH_LIST CREATE: [PlateBuyValue class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IndustryPlateBuyValueRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtIndustryBuyValue = [istream readListDef: 0 required: false def: self.vtIndustryBuyValue VAR_TYPE: [THOTH_LIST CREATE: [PlateBuyValue class]]];
    self.vtPlateBuyValue = [istream readListDef: 1 required: false def: self.vtPlateBuyValue VAR_TYPE: [THOTH_LIST CREATE: [PlateBuyValue class]]];
    
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
    [JsonRoot append:@"vtIndustryBuyValue" value : [BaseJSON writeList : self.vtIndustryBuyValue VAR_TYPE: [THOTH_LIST CREATE: [PlateBuyValue class]]]];
    [JsonRoot append:@"vtPlateBuyValue" value : [BaseJSON writeList : self.vtPlateBuyValue VAR_TYPE: [THOTH_LIST CREATE: [PlateBuyValue class]]]];
    return JsonRoot;
}

- (IndustryPlateBuyValueRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtIndustryBuyValue = [BaseJSON readListDef:[RootMap objectForKey:@"vtIndustryBuyValue"] required:false def:self.vtIndustryBuyValue VAR_TYPE: [THOTH_LIST CREATE: [PlateBuyValue class]]];
    self.vtPlateBuyValue = [BaseJSON readListDef:[RootMap objectForKey:@"vtPlateBuyValue"] required:false def:self.vtPlateBuyValue VAR_TYPE: [THOTH_LIST CREATE: [PlateBuyValue class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IndustryPlateDtMarginReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sIndustryPlate = @"";
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
    if (self.sIndustryPlate != nil)
    {
        [ostream writeString: 1 value: self.sIndustryPlate];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IndustryPlateDtMarginReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sIndustryPlate = [istream readStringDef: 1 required: false def: self.sIndustryPlate];
    
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
    [JsonRoot append:@"sIndustryPlate" value : [BaseJSON writeString : self.sIndustryPlate]];
    return JsonRoot;
}

- (IndustryPlateDtMarginReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sIndustryPlate = [BaseJSON readStringDef:[RootMap objectForKey:@"sIndustryPlate"] required:false def:self.sIndustryPlate];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation IndustryPlateDtMarginRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtIndustryBuyValue = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtIndustryBuyValue != nil)
    {
        [ostream writeList: 0 value: self.vtIndustryBuyValue VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeDt class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (IndustryPlateDtMarginRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtIndustryBuyValue = [istream readListDef: 0 required: false def: self.vtIndustryBuyValue VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeDt class]]];
    
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
    [JsonRoot append:@"vtIndustryBuyValue" value : [BaseJSON writeList : self.vtIndustryBuyValue VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeDt class]]]];
    return JsonRoot;
}

- (IndustryPlateDtMarginRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtIndustryBuyValue = [BaseJSON readListDef:[RootMap objectForKey:@"vtIndustryBuyValue"] required:false def:self.vtIndustryBuyValue VAR_TYPE: [THOTH_LIST CREATE: [MarginTradeDt class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StockMarginTradeReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
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
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StockMarginTradeReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    
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
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    return JsonRoot;
}

- (StockMarginTradeReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation StockMarginTradeRsp
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sIndustry = @"";
        self.vtStockDateMarginTrade = [NSMutableArray arrayWithCapacity:0];
        self.stBalanceRank = [[IndustryRank alloc] init];
        self.stBuyValueRank = [[IndustryRank alloc] init];
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
    if (self.sIndustry != nil)
    {
        [ostream writeString: 1 value: self.sIndustry];
    }
    if (self.vtStockDateMarginTrade != nil)
    {
        [ostream writeList: 2 value: self.vtStockDateMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [StockDateMarginTrade class]]];
    }
    if (self.stBalanceRank != nil)
    {
        [ostream writeMessage: 3 value: self.stBalanceRank];
    }
    if (self.stBuyValueRank != nil)
    {
        [ostream writeMessage: 4 value: self.stBuyValueRank];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (StockMarginTradeRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sIndustry = [istream readStringDef: 1 required: false def: self.sIndustry];
    self.vtStockDateMarginTrade = [istream readListDef: 2 required: false def: self.vtStockDateMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [StockDateMarginTrade class]]];
    self.stBalanceRank = (IndustryRank*)[istream readMessageDef: 3 required: false def: self.stBalanceRank VAR_TYPE: [IndustryRank class]];
    self.stBuyValueRank = (IndustryRank*)[istream readMessageDef: 4 required: false def: self.stBuyValueRank VAR_TYPE: [IndustryRank class]];
    
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
    [JsonRoot append:@"sDtSecCode" value : [BaseJSON writeString : self.sDtSecCode]];
    [JsonRoot append:@"sIndustry" value : [BaseJSON writeString : self.sIndustry]];
    [JsonRoot append:@"vtStockDateMarginTrade" value : [BaseJSON writeList : self.vtStockDateMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [StockDateMarginTrade class]]]];
    [JsonRoot append:@"stBalanceRank" value : [BaseJSON writeMessage : self.stBalanceRank]];
    [JsonRoot append:@"stBuyValueRank" value : [BaseJSON writeMessage : self.stBuyValueRank]];
    return JsonRoot;
}

- (StockMarginTradeRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sDtSecCode = [BaseJSON readStringDef:[RootMap objectForKey:@"sDtSecCode"] required:false def:self.sDtSecCode];
    self.sIndustry = [BaseJSON readStringDef:[RootMap objectForKey:@"sIndustry"] required:false def:self.sIndustry];
    self.vtStockDateMarginTrade = [BaseJSON readListDef:[RootMap objectForKey:@"vtStockDateMarginTrade"] required:false def:self.vtStockDateMarginTrade VAR_TYPE: [THOTH_LIST CREATE: [StockDateMarginTrade class]]];
    self.stBalanceRank = [BaseJSON readMessageDef:[RootMap objectForKey:@"stBalanceRank"] required:false def:self.stBalanceRank VAR_TYPE: [IndustryRank class]];
    self.stBuyValueRank = [BaseJSON readMessageDef:[RootMap objectForKey:@"stBuyValueRank"] required:false def:self.stBuyValueRank VAR_TYPE: [IndustryRank class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

