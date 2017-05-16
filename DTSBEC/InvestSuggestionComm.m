#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "InvestSuggestionComm.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation InputBoxDefaultReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.iWantNum = 0;
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
    [ostream writeInt32: 1 value: self.iWantNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InputBoxDefaultReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iWantNum = [istream readInt32Def: 1 required: false def: self.iWantNum];
    
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
    [JsonRoot append:@"iWantNum" value : [BaseJSON writeInt32 : self.iWantNum]];
    return JsonRoot;
}

- (InputBoxDefaultReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.iWantNum = [BaseJSON readInt32Def:[RootMap objectForKey:@"iWantNum"] required:false def:self.iWantNum];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InputDefaultItem
- (id) init
{
    if (self = [super init])
    {
        self.sSentence = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSentence != nil)
    {
        [ostream writeString: 0 value: self.sSentence];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InputDefaultItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSentence = [istream readStringDef: 0 required: false def: self.sSentence];
    
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
    [JsonRoot append:@"sSentence" value : [BaseJSON writeString : self.sSentence]];
    return JsonRoot;
}

- (InputDefaultItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSentence = [BaseJSON readStringDef:[RootMap objectForKey:@"sSentence"] required:false def:self.sSentence];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InputBoxDefaultRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtInputDefaultItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtInputDefaultItem != nil)
    {
        [ostream writeList: 0 value: self.vtInputDefaultItem VAR_TYPE: [THOTH_LIST CREATE: [InputDefaultItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InputBoxDefaultRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtInputDefaultItem = [istream readListDef: 0 required: false def: self.vtInputDefaultItem VAR_TYPE: [THOTH_LIST CREATE: [InputDefaultItem class]]];
    
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
    [JsonRoot append:@"vtInputDefaultItem" value : [BaseJSON writeList : self.vtInputDefaultItem VAR_TYPE: [THOTH_LIST CREATE: [InputDefaultItem class]]]];
    return JsonRoot;
}

- (InputBoxDefaultRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtInputDefaultItem = [BaseJSON readListDef:[RootMap objectForKey:@"vtInputDefaultItem"] required:false def:self.vtInputDefaultItem VAR_TYPE: [THOTH_LIST CREATE: [InputDefaultItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InputSuggestionReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sQuery = @"";
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
    if (self.sQuery != nil)
    {
        [ostream writeString: 1 value: self.sQuery];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InputSuggestionReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sQuery = [istream readStringDef: 1 required: false def: self.sQuery];
    
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
    [JsonRoot append:@"sQuery" value : [BaseJSON writeString : self.sQuery]];
    return JsonRoot;
}

- (InputSuggestionReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.stUserInfo = [BaseJSON readMessageDef:[RootMap objectForKey:@"stUserInfo"] required:false def:self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sQuery = [BaseJSON readStringDef:[RootMap objectForKey:@"sQuery"] required:false def:self.sQuery];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation SuggestionItem
- (id) init
{
    if (self = [super init])
    {
        self.sSentence = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sSentence != nil)
    {
        [ostream writeString: 0 value: self.sSentence];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SuggestionItem *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sSentence = [istream readStringDef: 0 required: false def: self.sSentence];
    
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
    [JsonRoot append:@"sSentence" value : [BaseJSON writeString : self.sSentence]];
    return JsonRoot;
}

- (SuggestionItem *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sSentence = [BaseJSON readStringDef:[RootMap objectForKey:@"sSentence"] required:false def:self.sSentence];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation InputSuggestionRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtSuggestionItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtSuggestionItem != nil)
    {
        [ostream writeList: 0 value: self.vtSuggestionItem VAR_TYPE: [THOTH_LIST CREATE: [SuggestionItem class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (InputSuggestionRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtSuggestionItem = [istream readListDef: 0 required: false def: self.vtSuggestionItem VAR_TYPE: [THOTH_LIST CREATE: [SuggestionItem class]]];
    
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
    [JsonRoot append:@"vtSuggestionItem" value : [BaseJSON writeList : self.vtSuggestionItem VAR_TYPE: [THOTH_LIST CREATE: [SuggestionItem class]]]];
    return JsonRoot;
}

- (InputSuggestionRsp *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.vtSuggestionItem = [BaseJSON readListDef:[RootMap objectForKey:@"vtSuggestionItem"] required:false def:self.vtSuggestionItem VAR_TYPE: [THOTH_LIST CREATE: [SuggestionItem class]]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

