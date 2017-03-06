#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "PePb.h"

//////////////////////////////////////////////////////////////
@implementation PePbReq
- (id) init
{
    if (self = [super init])
    {
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vDtSecCode != nil)
    {
        [ostream writeList: 0 value: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PePbReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDtSecCode = [istream readListDef: 0 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation PePbSingle
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.sPlate = @"";
        self.fAvgPe = 0;
        self.fAvgPb = 0;
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
    if (self.sPlate != nil)
    {
        [ostream writeString: 1 value: self.sPlate];
    }
    [ostream writeFloat: 2 value: self.fAvgPe];
    [ostream writeFloat: 3 value: self.fAvgPb];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PePbSingle *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.sPlate = [istream readStringDef: 1 required: false def: self.sPlate];
    self.fAvgPe = [istream readFloatDef: 2 required: false def: self.fAvgPe];
    self.fAvgPb = [istream readFloatDef: 3 required: false def: self.fAvgPb];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation PePbRsp
- (id) init
{
    if (self = [super init])
    {
        self.vPePbRst = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vPePbRst != nil)
    {
        [ostream writeList: 0 value: self.vPePbRst VAR_TYPE: [THOTH_LIST CREATE: [PePbSingle class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PePbRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vPePbRst = [istream readListDef: 0 required: false def: self.vPePbRst VAR_TYPE: [THOTH_LIST CREATE: [PePbSingle class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

