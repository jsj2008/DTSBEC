#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "LogQuery.h"

//////////////////////////////////////////////////////////////
@implementation GetLogListReq
- (id) init
{
    if (self = [super init])
    {
        self.sUserId = @"";
        self.sBussName = @"";
        self.sStartDay = @"";
        self.sEndDay = @"";
        self.sStartVN = @"";
        self.sEndVN = @"";
        self.sStartBN = @"";
        self.sEndBN = @"";
        self.sGuid = @"";
        self.sPackage = @"";
        self.sIMEI = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sUserId != nil)
    {
        [ostream writeString: 0 value: self.sUserId];
    }
    if (self.sBussName != nil)
    {
        [ostream writeString: 1 value: self.sBussName];
    }
    if (self.sStartDay != nil)
    {
        [ostream writeString: 2 value: self.sStartDay];
    }
    if (self.sEndDay != nil)
    {
        [ostream writeString: 3 value: self.sEndDay];
    }
    if (self.sStartVN != nil)
    {
        [ostream writeString: 4 value: self.sStartVN];
    }
    if (self.sEndVN != nil)
    {
        [ostream writeString: 5 value: self.sEndVN];
    }
    if (self.sStartBN != nil)
    {
        [ostream writeString: 6 value: self.sStartBN];
    }
    if (self.sEndBN != nil)
    {
        [ostream writeString: 7 value: self.sEndBN];
    }
    if (self.sGuid != nil)
    {
        [ostream writeString: 8 value: self.sGuid];
    }
    if (self.sPackage != nil)
    {
        [ostream writeString: 9 value: self.sPackage];
    }
    if (self.sIMEI != nil)
    {
        [ostream writeString: 10 value: self.sIMEI];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLogListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sUserId = [istream readStringDef: 0 required: false def: self.sUserId];
    self.sBussName = [istream readStringDef: 1 required: false def: self.sBussName];
    self.sStartDay = [istream readStringDef: 2 required: false def: self.sStartDay];
    self.sEndDay = [istream readStringDef: 3 required: false def: self.sEndDay];
    self.sStartVN = [istream readStringDef: 4 required: false def: self.sStartVN];
    self.sEndVN = [istream readStringDef: 5 required: false def: self.sEndVN];
    self.sStartBN = [istream readStringDef: 6 required: false def: self.sStartBN];
    self.sEndBN = [istream readStringDef: 7 required: false def: self.sEndBN];
    self.sGuid = [istream readStringDef: 8 required: false def: self.sGuid];
    self.sPackage = [istream readStringDef: 9 required: false def: self.sPackage];
    self.sIMEI = [istream readStringDef: 10 required: false def: self.sIMEI];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation LogDetailInfo
- (id) init
{
    if (self = [super init])
    {
        self.sDay = @"";
        self.sUserId = @"";
        self.sGuid = @"";
        self.iErrCode = 0;
        self.sErrMsg = @"";
        self.sReportTime = @"";
        self.sFileName = @"";
        self.sBussName = @"";
        self.sVN = @"";
        self.sMo = @"";
        self.sBN = @"";
        self.sUrl = @"";
        self.uFileSize = 0;
        self.sQua = @"";
        self.sOrigBussName = @"";
        self.sIMEI = @"";
        self.sPackName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sDay != nil)
    {
        [ostream writeString: 0 value: self.sDay];
    }
    if (self.sUserId != nil)
    {
        [ostream writeString: 1 value: self.sUserId];
    }
    if (self.sGuid != nil)
    {
        [ostream writeString: 2 value: self.sGuid];
    }
    [ostream writeInt32: 3 value: self.iErrCode];
    if (self.sErrMsg != nil)
    {
        [ostream writeString: 4 value: self.sErrMsg];
    }
    if (self.sReportTime != nil)
    {
        [ostream writeString: 5 value: self.sReportTime];
    }
    if (self.sFileName != nil)
    {
        [ostream writeString: 6 value: self.sFileName];
    }
    if (self.sBussName != nil)
    {
        [ostream writeString: 7 value: self.sBussName];
    }
    if (self.sVN != nil)
    {
        [ostream writeString: 8 value: self.sVN];
    }
    if (self.sMo != nil)
    {
        [ostream writeString: 9 value: self.sMo];
    }
    if (self.sBN != nil)
    {
        [ostream writeString: 10 value: self.sBN];
    }
    if (self.sUrl != nil)
    {
        [ostream writeString: 11 value: self.sUrl];
    }
    [ostream writeInt32: 12 value: self.uFileSize];
    if (self.sQua != nil)
    {
        [ostream writeString: 13 value: self.sQua];
    }
    if (self.sOrigBussName != nil)
    {
        [ostream writeString: 14 value: self.sOrigBussName];
    }
    if (self.sIMEI != nil)
    {
        [ostream writeString: 15 value: self.sIMEI];
    }
    if (self.sPackName != nil)
    {
        [ostream writeString: 16 value: self.sPackName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (LogDetailInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDay = [istream readStringDef: 0 required: false def: self.sDay];
    self.sUserId = [istream readStringDef: 1 required: false def: self.sUserId];
    self.sGuid = [istream readStringDef: 2 required: false def: self.sGuid];
    self.iErrCode = [istream readInt32Def: 3 required: false def: self.iErrCode];
    self.sErrMsg = [istream readStringDef: 4 required: false def: self.sErrMsg];
    self.sReportTime = [istream readStringDef: 5 required: false def: self.sReportTime];
    self.sFileName = [istream readStringDef: 6 required: false def: self.sFileName];
    self.sBussName = [istream readStringDef: 7 required: false def: self.sBussName];
    self.sVN = [istream readStringDef: 8 required: false def: self.sVN];
    self.sMo = [istream readStringDef: 9 required: false def: self.sMo];
    self.sBN = [istream readStringDef: 10 required: false def: self.sBN];
    self.sUrl = [istream readStringDef: 11 required: false def: self.sUrl];
    self.uFileSize = [istream readInt32Def: 12 required: false def: self.uFileSize];
    self.sQua = [istream readStringDef: 13 required: false def: self.sQua];
    self.sOrigBussName = [istream readStringDef: 14 required: false def: self.sOrigBussName];
    self.sIMEI = [istream readStringDef: 15 required: false def: self.sIMEI];
    self.sPackName = [istream readStringDef: 16 required: false def: self.sPackName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetLogListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
        self.iTotal = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [LogDetailInfo class]]];
    }
    [ostream writeInt32: 1 value: self.iTotal];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetLogListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [LogDetailInfo class]]];
    self.iTotal = [istream readInt32Def: 1 required: false def: self.iTotal];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation BussInfo
- (id) init
{
    if (self = [super init])
    {
        self.sBussId = @"";
        self.sBussEngName = @"";
        self.sBussChiName = @"";
        self.sBussDesc = @"";
        self.vAlarm = [NSMutableArray arrayWithCapacity:0];
        self.sLastUser = @"";
        self.sLastTime = @"";
        self.iStatus = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sBussId != nil)
    {
        [ostream writeString: 0 value: self.sBussId];
    }
    if (self.sBussEngName != nil)
    {
        [ostream writeString: 1 value: self.sBussEngName];
    }
    if (self.sBussChiName != nil)
    {
        [ostream writeString: 2 value: self.sBussChiName];
    }
    if (self.sBussDesc != nil)
    {
        [ostream writeString: 3 value: self.sBussDesc];
    }
    if (self.vAlarm != nil)
    {
        [ostream writeList: 4 value: self.vAlarm VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    if (self.sLastUser != nil)
    {
        [ostream writeString: 5 value: self.sLastUser];
    }
    if (self.sLastTime != nil)
    {
        [ostream writeString: 6 value: self.sLastTime];
    }
    [ostream writeInt32: 7 value: self.iStatus];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BussInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sBussId = [istream readStringDef: 0 required: false def: self.sBussId];
    self.sBussEngName = [istream readStringDef: 1 required: false def: self.sBussEngName];
    self.sBussChiName = [istream readStringDef: 2 required: false def: self.sBussChiName];
    self.sBussDesc = [istream readStringDef: 3 required: false def: self.sBussDesc];
    self.vAlarm = [istream readListDef: 4 required: false def: self.vAlarm VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.sLastUser = [istream readStringDef: 5 required: false def: self.sLastUser];
    self.sLastTime = [istream readStringDef: 6 required: false def: self.sLastTime];
    self.iStatus = [istream readInt32Def: 7 required: false def: self.iStatus];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation BussInfoList
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
        self.iTotal = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [BussInfo class]]];
    }
    [ostream writeInt32: 1 value: self.iTotal];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BussInfoList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [BussInfo class]]];
    self.iTotal = [istream readInt32Def: 1 required: false def: self.iTotal];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation PackInfo
- (id) init
{
    if (self = [super init])
    {
        self.sPackName = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sPackName != nil)
    {
        [ostream writeString: 0 value: self.sPackName];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PackInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sPackName = [istream readStringDef: 0 required: false def: self.sPackName];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation PackInfoList
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
        self.iTotal = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [PackInfo class]]];
    }
    [ostream writeInt32: 1 value: self.iTotal];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (PackInfoList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [PackInfo class]]];
    self.iTotal = [istream readInt32Def: 1 required: false def: self.iTotal];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation BussLogUrl
- (id) init
{
    if (self = [super init])
    {
        self.sUrl = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sUrl != nil)
    {
        [ostream writeString: 0 value: self.sUrl];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BussLogUrl *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sUrl = [istream readStringDef: 0 required: false def: self.sUrl];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation BussErrInfo
- (id) init
{
    if (self = [super init])
    {
        self.iErrCode = 0;
        self.sErrMsg = @"";
        self.sBussName = @"";
        self.sLastUser = @"";
        self.sLastTime = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iErrCode];
    if (self.sErrMsg != nil)
    {
        [ostream writeString: 1 value: self.sErrMsg];
    }
    if (self.sBussName != nil)
    {
        [ostream writeString: 2 value: self.sBussName];
    }
    if (self.sLastUser != nil)
    {
        [ostream writeString: 3 value: self.sLastUser];
    }
    if (self.sLastTime != nil)
    {
        [ostream writeString: 4 value: self.sLastTime];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BussErrInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iErrCode = [istream readInt32Def: 0 required: false def: self.iErrCode];
    self.sErrMsg = [istream readStringDef: 1 required: false def: self.sErrMsg];
    self.sBussName = [istream readStringDef: 2 required: false def: self.sBussName];
    self.sLastUser = [istream readStringDef: 3 required: false def: self.sLastUser];
    self.sLastTime = [istream readStringDef: 4 required: false def: self.sLastTime];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation BussErrList
- (id) init
{
    if (self = [super init])
    {
        self.vList = [NSMutableArray arrayWithCapacity:0];
        self.iTotal = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vList != nil)
    {
        [ostream writeList: 0 value: self.vList VAR_TYPE: [THOTH_LIST CREATE: [BussErrInfo class]]];
    }
    [ostream writeInt32: 1 value: self.iTotal];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (BussErrList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vList = [istream readListDef: 0 required: false def: self.vList VAR_TYPE: [THOTH_LIST CREATE: [BussErrInfo class]]];
    self.iTotal = [istream readInt32Def: 1 required: false def: self.iTotal];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

