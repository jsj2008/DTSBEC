#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Search.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation CommonSearchReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sUserInputStr = @"";
        self.eSearchMatchType = E_SMT_FUZZY_MATCH;
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
    [ostream writeString: 1 value: self.sUserInputStr];
    [ostream writeInt32: 2 value: (int32_t)self.eSearchMatchType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommonSearchReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sUserInputStr = [istream readString: 1 required: true];
    self.eSearchMatchType = [istream readInt32Def: 2 required: false def: (int32_t)self.eSearchMatchType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecResult
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.vtSecInfoResultItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.vtSecInfoResultItem != nil)
    {
        [ostream writeList: 1 value: self.vtSecInfoResultItem VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecResult *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.vtSecInfoResultItem = [istream readListDef: 1 required: false def: self.vtSecInfoResultItem VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation PlateResult
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.vtPlateResultItem = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.vtPlateResultItem != nil)
    {
        [ostream writeList: 1 value: self.vtPlateResultItem VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PlateResult *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.vtPlateResultItem = [istream readListDef: 1 required: false def: self.vtPlateResultItem VAR_TYPE: [THOTH_LIST CREATE: [PlateInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ConceptResult
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.vtConcInfo = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.vtConcInfo != nil)
    {
        [ostream writeList: 1 value: self.vtConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ConceptResult *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.vtConcInfo = [istream readListDef: 1 required: false def: self.vtConcInfo VAR_TYPE: [THOTH_LIST CREATE: [ConcInfo class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation CommonSearchRsp
- (id) init
{
    if (self = [super init])
    {
        self.sShowOrder = @"2,1,3";
        self.stSecResult = [[SecResult alloc] init];
        self.stPlateResult = [[PlateResult alloc] init];
        self.stConceptResult = [[ConceptResult alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sShowOrder != nil)
    {
        [ostream writeString: 0 value: self.sShowOrder];
    }
    if (self.stSecResult != nil)
    {
        [ostream writeMessage: 1 value: self.stSecResult];
    }
    if (self.stPlateResult != nil)
    {
        [ostream writeMessage: 2 value: self.stPlateResult];
    }
    if (self.stConceptResult != nil)
    {
        [ostream writeMessage: 3 value: self.stConceptResult];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (CommonSearchRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sShowOrder = [istream readStringDef: 0 required: false def: self.sShowOrder];
    self.stSecResult = (SecResult*)[istream readMessageDef: 1 required: false def: self.stSecResult VAR_TYPE: [SecResult class]];
    self.stPlateResult = (PlateResult*)[istream readMessageDef: 2 required: false def: self.stPlateResult VAR_TYPE: [PlateResult class]];
    self.stConceptResult = (ConceptResult*)[istream readMessageDef: 3 required: false def: self.stConceptResult VAR_TYPE: [ConceptResult class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

