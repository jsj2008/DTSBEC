#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "BaseJSON.h"
#import "PushStatus.h"
#import "UserPortfolio.h"
#import "Notification.h"

//////////////////////////////////////////////////////////////
@implementation PushStatusReq
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.stPushData = [[PushData alloc] init];
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
    if (self.stPushData != nil)
    {
        [ostream writeMessage: 1 value: self.stPushData];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PushStatusReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.stPushData = (PushData*)[istream readMessageDef: 1 required: false def: self.stPushData VAR_TYPE: [PushData class]];
    
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
    [JsonRoot append:@"stPushData" value : [BaseJSON writeMessage : self.stPushData]];
    return JsonRoot;
}

- (PushStatusReq *) readFromMap : (NSMutableDictionary *) RootMap
{
    self.sId = [BaseJSON readStringDef:[RootMap objectForKey:@"sId"] required:false def:self.sId];
    self.stPushData = [BaseJSON readMessageDef:[RootMap objectForKey:@"stPushData"] required:false def:self.stPushData VAR_TYPE: [PushData class]];
    return self;
}

- (void) readFromJsonString : (NSString *) strJson
{
    JSONValueMessage * JsonRoot = [BaseJSON readJSON: strJson];
    [self readFromMap: JsonRoot.mTemp];
}

@end

//////////////////////////////////////////////////////////////
@implementation PushStatusRsp
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

- (PushStatusRsp *) read: (BaseDecodeStream *)istream
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

- (PushStatusRsp *) readFromMap : (NSMutableDictionary *) RootMap
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

