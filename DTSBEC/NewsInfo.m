#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "NewsInfo.h"
#import "Beacon.h"

//////////////////////////////////////////////////////////////
@implementation NewsId
- (id) init
{
    if (self = [super init])
    {
        self.sTime = @"";
        self.sId = @"";
        self.eNewsType = NT_UNKNOWN;
        self.eMarketType = E_MT_NO;
        self.eSecType = E_ST_UNKNOWN;
        self.eDataDbSource = NDS_HS_NEWS;
        self.eNewsTable = E_TL_UNKNOWN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sTime != nil)
    {
        [ostream writeString: 0 value: self.sTime];
    }
    if (self.sId != nil)
    {
        [ostream writeString: 1 value: self.sId];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    [ostream writeInt32: 3 value: (int32_t)self.eMarketType];
    [ostream writeInt32: 4 value: (int32_t)self.eSecType];
    [ostream writeInt32: 5 value: (int32_t)self.eDataDbSource];
    [ostream writeInt32: 6 value: (int32_t)self.eNewsTable];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsId *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sTime = [istream readStringDef: 0 required: false def: self.sTime];
    self.sId = [istream readStringDef: 1 required: false def: self.sId];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    self.eMarketType = [istream readInt32Def: 3 required: false def: (int32_t)self.eMarketType];
    self.eSecType = [istream readInt32Def: 4 required: false def: (int32_t)self.eSecType];
    self.eDataDbSource = [istream readInt32Def: 5 required: false def: (int32_t)self.eDataDbSource];
    self.eNewsTable = [istream readInt32Def: 6 required: false def: (int32_t)self.eNewsTable];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation VideoConfig
- (id) init
{
    if (self = [super init])
    {
        self.sVideoName = @"";
        self.mChannelConfig = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sVideoName != nil)
    {
        [ostream writeString: 0 value: self.sVideoName];
    }
    if (self.mChannelConfig != nil)
    {
        [ostream writeMap: 1 value: self.mChannelConfig VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (VideoConfig *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sVideoName = [istream readStringDef: 0 required: false def: self.sVideoName];
    self.mChannelConfig = [istream readMapDef: 1 required: false def: self.mChannelConfig VAR_TYPE: [THOTH_MAP CREATE: [THOTH_INT32 class] VT: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsDesc
- (id) init
{
    if (self = [super init])
    {
        self.sNewsID = @"";
        self.eNewsType = NT_UNKNOWN;
        self.sTitle = @"";
        self.sDescription = @"";
        self.sFrom = @"";
        self.iTime = 0;
        self.sDtSecCode = @"";
        self.vtTagInfo = [NSMutableArray arrayWithCapacity:0];
        self.sContent = @"";
        self.sDtInfoUrl = @"";
        self.iStyleType = 0;
        self.vtRelaStock = [NSMutableArray arrayWithCapacity:0];
        self.iStatus = 0;
        self.sThirdUrl = @"";
        self.iCreateTime = 0;
        self.sSubTypeName = @"";
        self.iPublish = 0;
        self.sImgUrl = @"";
        self.eNewsFlag = E_NF_NORMAL;
        self.iShow = 0;
        self.vVideoConfig = [NSMutableArray arrayWithCapacity:0];
        self.iTopicId = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sNewsID != nil)
    {
        [ostream writeString: 0 value: self.sNewsID];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    if (self.sTitle != nil)
    {
        [ostream writeString: 2 value: self.sTitle];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 3 value: self.sDescription];
    }
    if (self.sFrom != nil)
    {
        [ostream writeString: 4 value: self.sFrom];
    }
    [ostream writeInt32: 5 value: self.iTime];
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 6 value: self.sDtSecCode];
    }
    if (self.vtTagInfo != nil)
    {
        [ostream writeList: 7 value: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    }
    if (self.sContent != nil)
    {
        [ostream writeString: 8 value: self.sContent];
    }
    if (self.sDtInfoUrl != nil)
    {
        [ostream writeString: 9 value: self.sDtInfoUrl];
    }
    [ostream writeInt32: 10 value: self.iStyleType];
    if (self.vtRelaStock != nil)
    {
        [ostream writeList: 11 value: self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    }
    [ostream writeInt32: 12 value: self.iStatus];
    if (self.sThirdUrl != nil)
    {
        [ostream writeString: 13 value: self.sThirdUrl];
    }
    [ostream writeInt32: 14 value: self.iCreateTime];
    if (self.sSubTypeName != nil)
    {
        [ostream writeString: 16 value: self.sSubTypeName];
    }
    [ostream writeInt32: 17 value: self.iPublish];
    if (self.sImgUrl != nil)
    {
        [ostream writeString: 18 value: self.sImgUrl];
    }
    [ostream writeInt32: 19 value: (int32_t)self.eNewsFlag];
    [ostream writeInt32: 20 value: self.iShow];
    if (self.vVideoConfig != nil)
    {
        [ostream writeList: 21 value: self.vVideoConfig VAR_TYPE: [THOTH_LIST CREATE: [VideoConfig class]]];
    }
    [ostream writeInt32: 22 value: self.iTopicId];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sNewsID = [istream readStringDef: 0 required: false def: self.sNewsID];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.sTitle = [istream readStringDef: 2 required: false def: self.sTitle];
    self.sDescription = [istream readStringDef: 3 required: false def: self.sDescription];
    self.sFrom = [istream readStringDef: 4 required: false def: self.sFrom];
    self.iTime = [istream readInt32Def: 5 required: false def: self.iTime];
    self.sDtSecCode = [istream readStringDef: 6 required: false def: self.sDtSecCode];
    self.vtTagInfo = [istream readListDef: 7 required: false def: self.vtTagInfo VAR_TYPE: [THOTH_LIST CREATE: [TagInfo class]]];
    self.sContent = [istream readStringDef: 8 required: false def: self.sContent];
    self.sDtInfoUrl = [istream readStringDef: 9 required: false def: self.sDtInfoUrl];
    self.iStyleType = [istream readInt32Def: 10 required: false def: self.iStyleType];
    self.vtRelaStock = [istream readListDef: 11 required: false def: self.vtRelaStock VAR_TYPE: [THOTH_LIST CREATE: [SecInfo class]]];
    self.iStatus = [istream readInt32Def: 12 required: false def: self.iStatus];
    self.sThirdUrl = [istream readStringDef: 13 required: false def: self.sThirdUrl];
    self.iCreateTime = [istream readInt32Def: 14 required: false def: self.iCreateTime];
    self.sSubTypeName = [istream readStringDef: 16 required: false def: self.sSubTypeName];
    self.iPublish = [istream readInt32Def: 17 required: false def: self.iPublish];
    self.sImgUrl = [istream readStringDef: 18 required: false def: self.sImgUrl];
    self.eNewsFlag = [istream readInt32Def: 19 required: false def: (int32_t)self.eNewsFlag];
    self.iShow = [istream readInt32Def: 20 required: false def: self.iShow];
    self.vVideoConfig = [istream readListDef: 21 required: false def: self.vVideoConfig VAR_TYPE: [THOTH_LIST CREATE: [VideoConfig class]]];
    self.iTopicId = [istream readInt32Def: 22 required: false def: self.iTopicId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsList
- (id) init
{
    if (self = [super init])
    {
        self.vNewsDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vNewsDesc = [istream readListDef: 0 required: false def: self.vNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.sStartId = @"";
        self.sEndId = @"";
        self.eGetSource = E_NGS_MARKET_GET;
        self.eNewsType = NT_UNKNOWN;
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
    if (self.sStartId != nil)
    {
        [ostream writeString: 4 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 5 value: self.sEndId];
    }
    [ostream writeInt32: 6 value: (int32_t)self.eGetSource];
    [ostream writeInt32: 7 value: (int32_t)self.eNewsType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sStartId = [istream readStringDef: 4 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 5 required: false def: self.sEndId];
    self.eGetSource = [istream readInt32Def: 6 required: false def: (int32_t)self.eGetSource];
    self.eNewsType = [istream readInt32Def: 7 required: false def: (int32_t)self.eNewsType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsRsp
- (id) init
{
    if (self = [super init])
    {
        self.stNewsList = [[NewsList alloc] init];
        self.iStatus = 0;
        self.sNextNewsID = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stNewsList != nil)
    {
        [ostream writeMessage: 0 value: self.stNewsList];
    }
    [ostream writeInt32: 1 value: self.iStatus];
    if (self.sNextNewsID != nil)
    {
        [ostream writeString: 2 value: self.sNextNewsID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stNewsList = (NewsList*)[istream readMessageDef: 0 required: false def: self.stNewsList VAR_TYPE: [NewsList class]];
    self.iStatus = [istream readInt32Def: 1 required: false def: self.iStatus];
    self.sNextNewsID = [istream readStringDef: 2 required: false def: self.sNextNewsID];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sNewsID = @"";
        self.eNewsType = NT_UNKNOWN;
        self.eSecType = E_ST_UNKNOWN;
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
    if (self.sNewsID != nil)
    {
        [ostream writeString: 1 value: self.sNewsID];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    [ostream writeInt32: 3 value: (int32_t)self.eSecType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sNewsID = [istream readStringDef: 1 required: false def: self.sNewsID];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    self.eSecType = [istream readInt32Def: 3 required: false def: (int32_t)self.eSecType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsContentRsp
- (id) init
{
    if (self = [super init])
    {
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeMessage: 0 value: self.stNewsDesc];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stNewsDesc = (NewsDesc*)[istream readMessage: 0 required: true VAR_TYPE: [NewsDesc class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsSimple
- (id) init
{
    if (self = [super init])
    {
        self.sNewsID = @"";
        self.eNewsType = NT_UNKNOWN;
        self.eSecType = E_ST_UNKNOWN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sNewsID != nil)
    {
        [ostream writeString: 0 value: self.sNewsID];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    [ostream writeInt32: 2 value: (int32_t)self.eSecType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsSimple *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sNewsID = [istream readStringDef: 0 required: false def: self.sNewsID];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.eSecType = [istream readInt32Def: 2 required: false def: (int32_t)self.eSecType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsListReq
- (id) init
{
    if (self = [super init])
    {
        self.vNewsSimple = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vNewsSimple != nil)
    {
        [ostream writeList: 0 value: self.vNewsSimple VAR_TYPE: [THOTH_LIST CREATE: [NewsSimple class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vNewsSimple = [istream readListDef: 0 required: false def: self.vNewsSimple VAR_TYPE: [THOTH_LIST CREATE: [NewsSimple class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsListRsp
- (id) init
{
    if (self = [super init])
    {
        self.mNewsDesc = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.mNewsDesc != nil)
    {
        [ostream writeMap: 0 value: self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.mNewsDesc = [istream readMapDef: 0 required: false def: self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation FlashNewsListReq
- (id) init
{
    if (self = [super init])
    {
        self.sStartId = @"";
        self.sEndId = @"";
        self.stUserInfo = [[UserInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStartId != nil)
    {
        [ostream writeString: 0 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 1 value: self.sEndId];
    }
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stUserInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FlashNewsListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStartId = [istream readStringDef: 0 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 1 required: false def: self.sEndId];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 2 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation FlashNewsListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.sNextNewsID = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    if (self.sNextNewsID != nil)
    {
        [ostream writeString: 1 value: self.sNextNewsID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FlashNewsListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [istream readStringDef: 1 required: false def: self.sNextNewsID];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation FlashNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FlashNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation FlashNewsContentRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtNewsDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (FlashNewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtNewsDesc = [istream readListDef: 0 required: false def: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation DiscoveryNewsReq
- (id) init
{
    if (self = [super init])
    {
        self.sStartId = @"";
        self.sEndId = @"";
        self.stUserInfo = [[UserInfo alloc] init];
        self.eNewsFlag = E_NF_NORMAL;
        self.iSupportTop = 0;
        self.iSupportTopic = 0;
        self.eChannelType = E_CT_PUBLIC;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStartId != nil)
    {
        [ostream writeString: 0 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 1 value: self.sEndId];
    }
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stUserInfo];
    }
    [ostream writeInt32: 3 value: (int32_t)self.eNewsFlag];
    [ostream writeInt32: 4 value: self.iSupportTop];
    [ostream writeInt32: 5 value: self.iSupportTopic];
    [ostream writeInt32: 6 value: (int32_t)self.eChannelType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DiscoveryNewsReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStartId = [istream readStringDef: 0 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 1 required: false def: self.sEndId];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 2 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eNewsFlag = [istream readInt32Def: 3 required: false def: (int32_t)self.eNewsFlag];
    self.iSupportTop = [istream readInt32Def: 4 required: false def: self.iSupportTop];
    self.iSupportTopic = [istream readInt32Def: 5 required: false def: self.iSupportTopic];
    self.eChannelType = [istream readInt32Def: 6 required: false def: (int32_t)self.eChannelType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation DiscoveryNewsIdListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.sNextNewsID = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    if (self.sNextNewsID != nil)
    {
        [ostream writeString: 1 value: self.sNextNewsID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DiscoveryNewsIdListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [istream readStringDef: 1 required: false def: self.sNextNewsID];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation DiscoveryNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.eChannelType = E_CT_PUBLIC;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eChannelType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DiscoveryNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.eChannelType = [istream readInt32Def: 1 required: false def: (int32_t)self.eChannelType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation DiscoveryNewsContentRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtNewsDesc = [NSMutableArray arrayWithCapacity:0];
        self.sNextNewsID = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    if (self.sNextNewsID != nil)
    {
        [ostream writeString: 1 value: self.sNextNewsID];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (DiscoveryNewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtNewsDesc = [istream readListDef: 0 required: false def: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    self.sNextNewsID = [istream readStringDef: 1 required: false def: self.sNextNewsID];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecNewsIdListReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eNewsType = NT_UNKNOWN;
        self.sCurNewestId = @"";
        self.bForceUpdate = false;
        self.bGetIncrementRsp = false;
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
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    if (self.sCurNewestId != nil)
    {
        [ostream writeString: 2 value: self.sCurNewestId];
    }
    [ostream writeBoolean: 3 value: self.bForceUpdate];
    [ostream writeBoolean: 4 value: self.bGetIncrementRsp];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNewsIdListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.sCurNewestId = [istream readStringDef: 2 required: false def: self.sCurNewestId];
    self.bForceUpdate = [istream readBooleanDef: 3 required: false def: self.bForceUpdate];
    self.bGetIncrementRsp = [istream readBooleanDef: 4 required: false def: self.bGetIncrementRsp];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecNewsIdListRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNewsIdListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.vtId = [NSMutableArray arrayWithCapacity:0];
        self.eSecType = E_ST_UNKNOWN;
        self.eNewsType = NT_UNKNOWN;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtId != nil)
    {
        [ostream writeList: 0 value: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    [ostream writeInt32: 1 value: (int32_t)self.eSecType];
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtId = [istream readListDef: 0 required: false def: self.vtId VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.eSecType = [istream readInt32Def: 1 required: false def: (int32_t)self.eSecType];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SecNewsContentRsp
- (id) init
{
    if (self = [super init])
    {
        self.vtNewsDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.vtNewsDesc != nil)
    {
        [ostream writeList: 0 value: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (SecNewsContentRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vtNewsDesc = [istream readListDef: 0 required: false def: self.vtNewsDesc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation ModifyNewsContentReq
- (id) init
{
    if (self = [super init])
    {
        self.stNewsId = [[NewsId alloc] init];
        self.bDelete = false;
        self.vtDtSecCode = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stNewsId != nil)
    {
        [ostream writeMessage: 0 value: self.stNewsId];
    }
    [ostream writeBoolean: 1 value: self.bDelete];
    if (self.vtDtSecCode != nil)
    {
        [ostream writeList: 2 value: self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (ModifyNewsContentReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stNewsId = (NewsId*)[istream readMessageDef: 0 required: false def: self.stNewsId VAR_TYPE: [NewsId class]];
    self.bDelete = [istream readBooleanDef: 1 required: false def: self.bDelete];
    self.vtDtSecCode = [istream readListDef: 2 required: false def: self.vtDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetUpInfoIdListReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eNewsType = NT_UNKNOWN;
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
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetUpInfoIdListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation UpInfoIdList
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
        self.eNewsType = NT_UNKNOWN;
        self.mNewsDesc = [NSMutableDictionary dictionaryWithCapacity: 0];
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
    [ostream writeInt32: 1 value: (int32_t)self.eNewsType];
    if (self.mNewsDesc != nil)
    {
        [ostream writeMap: 2 value: self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (UpInfoIdList *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    self.eNewsType = [istream readInt32Def: 1 required: false def: (int32_t)self.eNewsType];
    self.mNewsDesc = [istream readMapDef: 2 required: false def: self.mNewsDesc VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [NewsDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation SetUpInfoIdListRsp
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

- (SetUpInfoIdListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsPageReq
- (id) init
{
    if (self = [super init])
    {
        self.stUserInfo = [[UserInfo alloc] init];
        self.sDtSecCode = @"";
        self.eNewsType = NT_UNKNOWN;
        self.sPageNo = @"";
        self.iSupportTop = 0;
        self.iSupportTopic = 0;
        self.eChannelType = E_CT_PUBLIC;
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
    [ostream writeInt32: 2 value: (int32_t)self.eNewsType];
    if (self.sPageNo != nil)
    {
        [ostream writeString: 3 value: self.sPageNo];
    }
    [ostream writeInt32: 4 value: self.iSupportTop];
    [ostream writeInt32: 5 value: self.iSupportTopic];
    [ostream writeInt32: 6 value: (int32_t)self.eChannelType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsPageReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stUserInfo = (UserInfo*)[istream readMessageDef: 0 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.eNewsType = [istream readInt32Def: 2 required: false def: (int32_t)self.eNewsType];
    self.sPageNo = [istream readStringDef: 3 required: false def: self.sPageNo];
    self.iSupportTop = [istream readInt32Def: 4 required: false def: self.iSupportTop];
    self.iSupportTopic = [istream readInt32Def: 5 required: false def: self.iSupportTopic];
    self.eChannelType = [istream readInt32Def: 6 required: false def: (int32_t)self.eChannelType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation NewsPageRsp
- (id) init
{
    if (self = [super init])
    {
        self.stNewsList = [[NewsList alloc] init];
        self.iTotalPageNum = 0;
        self.iTotalDataNum = 0;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stNewsList != nil)
    {
        [ostream writeMessage: 0 value: self.stNewsList];
    }
    [ostream writeInt32: 1 value: self.iTotalPageNum];
    [ostream writeInt32: 2 value: self.iTotalDataNum];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (NewsPageRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stNewsList = (NewsList*)[istream readMessageDef: 0 required: false def: self.stNewsList VAR_TYPE: [NewsList class]];
    self.iTotalPageNum = [istream readInt32Def: 1 required: false def: self.iTotalPageNum];
    self.iTotalDataNum = [istream readInt32Def: 2 required: false def: self.iTotalDataNum];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AdditionProgress
- (id) init
{
    if (self = [super init])
    {
        self.sDay = @"";
        self.sProgress = @"";
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
    if (self.sProgress != nil)
    {
        [ostream writeString: 1 value: self.sProgress];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionProgress *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDay = [istream readStringDef: 0 required: false def: self.sDay];
    self.sProgress = [istream readStringDef: 1 required: false def: self.sProgress];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AdditionDesc
- (id) init
{
    if (self = [super init])
    {
        self.sId = @"";
        self.sDtSecCode = @"";
        self.sSecCode = @"";
        self.sSecName = @"";
        self.sProcess = @"";
        self.sProcessDate = @"";
        self.fFund = 0;
        self.fCount = 0;
        self.fPrice = 0;
        self.sObject = @"";
        self.sProject = @"";
        self.fLatestPrice = 0;
        self.fDiffRate = 0;
        self.sIndustry = @"";
        self.vProgress = [NSMutableArray arrayWithCapacity:0];
        self.vRelAnnc = [NSMutableArray arrayWithCapacity:0];
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
    if (self.sDtSecCode != nil)
    {
        [ostream writeString: 1 value: self.sDtSecCode];
    }
    if (self.sSecCode != nil)
    {
        [ostream writeString: 2 value: self.sSecCode];
    }
    if (self.sSecName != nil)
    {
        [ostream writeString: 3 value: self.sSecName];
    }
    if (self.sProcess != nil)
    {
        [ostream writeString: 4 value: self.sProcess];
    }
    if (self.sProcessDate != nil)
    {
        [ostream writeString: 5 value: self.sProcessDate];
    }
    [ostream writeFloat: 6 value: self.fFund];
    [ostream writeFloat: 7 value: self.fCount];
    [ostream writeFloat: 8 value: self.fPrice];
    if (self.sObject != nil)
    {
        [ostream writeString: 9 value: self.sObject];
    }
    if (self.sProject != nil)
    {
        [ostream writeString: 10 value: self.sProject];
    }
    [ostream writeFloat: 11 value: self.fLatestPrice];
    [ostream writeFloat: 12 value: self.fDiffRate];
    if (self.sIndustry != nil)
    {
        [ostream writeString: 13 value: self.sIndustry];
    }
    if (self.vProgress != nil)
    {
        [ostream writeList: 14 value: self.vProgress VAR_TYPE: [THOTH_LIST CREATE: [AdditionProgress class]]];
    }
    if (self.vRelAnnc != nil)
    {
        [ostream writeList: 15 value: self.vRelAnnc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionDesc *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sId = [istream readStringDef: 0 required: false def: self.sId];
    self.sDtSecCode = [istream readStringDef: 1 required: false def: self.sDtSecCode];
    self.sSecCode = [istream readStringDef: 2 required: false def: self.sSecCode];
    self.sSecName = [istream readStringDef: 3 required: false def: self.sSecName];
    self.sProcess = [istream readStringDef: 4 required: false def: self.sProcess];
    self.sProcessDate = [istream readStringDef: 5 required: false def: self.sProcessDate];
    self.fFund = [istream readFloatDef: 6 required: false def: self.fFund];
    self.fCount = [istream readFloatDef: 7 required: false def: self.fCount];
    self.fPrice = [istream readFloatDef: 8 required: false def: self.fPrice];
    self.sObject = [istream readStringDef: 9 required: false def: self.sObject];
    self.sProject = [istream readStringDef: 10 required: false def: self.sProject];
    self.fLatestPrice = [istream readFloatDef: 11 required: false def: self.fLatestPrice];
    self.fDiffRate = [istream readFloatDef: 12 required: false def: self.fDiffRate];
    self.sIndustry = [istream readStringDef: 13 required: false def: self.sIndustry];
    self.vProgress = [istream readListDef: 14 required: false def: self.vProgress VAR_TYPE: [THOTH_LIST CREATE: [AdditionProgress class]]];
    self.vRelAnnc = [istream readListDef: 15 required: false def: self.vRelAnnc VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AdditionListReq
- (id) init
{
    if (self = [super init])
    {
        self.sStartId = @"";
        self.sEndId = @"";
        self.stUserInfo = [[UserInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sStartId != nil)
    {
        [ostream writeString: 0 value: self.sStartId];
    }
    if (self.sEndId != nil)
    {
        [ostream writeString: 1 value: self.sEndId];
    }
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 2 value: self.stUserInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sStartId = [istream readStringDef: 0 required: false def: self.sStartId];
    self.sEndId = [istream readStringDef: 1 required: false def: self.sEndId];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 2 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AdditionListRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.vAdditionDesc = [NSMutableArray arrayWithCapacity:0];
        self.sNextId = @"";
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.vAdditionDesc != nil)
    {
        [ostream writeList: 1 value: self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    }
    if (self.sNextId != nil)
    {
        [ostream writeString: 2 value: self.sNextId];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.vAdditionDesc = [istream readListDef: 1 required: false def: self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    self.sNextId = [istream readStringDef: 2 required: false def: self.sNextId];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AdditionDetailReq
- (id) init
{
    if (self = [super init])
    {
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
        self.stUserInfo = [[UserInfo alloc] init];
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
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stUserInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionDetailReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDtSecCode = [istream readListDef: 0 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 1 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AdditionDetailRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.vAdditionDesc = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.vAdditionDesc != nil)
    {
        [ostream writeList: 1 value: self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionDetailRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.vAdditionDesc = [istream readListDef: 1 required: false def: self.vAdditionDesc VAR_TYPE: [THOTH_LIST CREATE: [AdditionDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AdditionBreifInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.vDtSecCode = [NSMutableArray arrayWithCapacity:0];
        self.stUserInfo = [[UserInfo alloc] init];
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
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stUserInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionBreifInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.vDtSecCode = [istream readListDef: 0 required: false def: self.vDtSecCode VAR_TYPE: [THOTH_LIST CREATE: [THOTH_STRING class]]];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 1 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation AdditionBreifInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.mAdditionBreifInfo = [NSMutableDictionary dictionaryWithCapacity: 0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.mAdditionBreifInfo != nil)
    {
        [ostream writeMap: 1 value: self.mAdditionBreifInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (AdditionBreifInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.mAdditionBreifInfo = [istream readMapDef: 1 required: false def: self.mAdditionBreifInfo VAR_TYPE: [THOTH_MAP CREATE: [THOTH_STRING class] VT: [THOTH_STRING class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetInvestAdvisorListReq
- (id) init
{
    if (self = [super init])
    {
        self.sDtSecCode = @"";
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
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetInvestAdvisorListReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sDtSecCode = [istream readStringDef: 0 required: false def: self.sDtSecCode];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation GetInvestAdvisorListRsp
- (id) init
{
    if (self = [super init])
    {
        self.stInvestAdviseInfoList = [[InvestAdviseInfoList alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.stInvestAdviseInfoList != nil)
    {
        [ostream writeMessage: 0 value: self.stInvestAdviseInfoList];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (GetInvestAdvisorListRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.stInvestAdviseInfoList = (InvestAdviseInfoList*)[istream readMessageDef: 0 required: false def: self.stInvestAdviseInfoList VAR_TYPE: [InvestAdviseInfoList class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation TopicSubDir
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.vNewsIdList = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sName != nil)
    {
        [ostream writeString: 0 value: self.sName];
    }
    if (self.vNewsIdList != nil)
    {
        [ostream writeList: 1 value: self.vNewsIdList VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicSubDir *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.vNewsIdList = [istream readListDef: 1 required: false def: self.vNewsIdList VAR_TYPE: [THOTH_LIST CREATE: [NewsDesc class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation TopicInfo
- (id) init
{
    if (self = [super init])
    {
        self.sName = @"";
        self.sImg = @"";
        self.sDescription = @"";
        self.iCreatetime = 0;
        self.stFaceNews = [[NewsDesc alloc] init];
        self.vTopicSubDir = [NSMutableArray arrayWithCapacity:0];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    if (self.sName != nil)
    {
        [ostream writeString: 0 value: self.sName];
    }
    if (self.sImg != nil)
    {
        [ostream writeString: 1 value: self.sImg];
    }
    if (self.sDescription != nil)
    {
        [ostream writeString: 2 value: self.sDescription];
    }
    [ostream writeInt32: 3 value: self.iCreatetime];
    if (self.stFaceNews != nil)
    {
        [ostream writeMessage: 4 value: self.stFaceNews];
    }
    if (self.vTopicSubDir != nil)
    {
        [ostream writeList: 5 value: self.vTopicSubDir VAR_TYPE: [THOTH_LIST CREATE: [TopicSubDir class]]];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicInfo *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.sName = [istream readStringDef: 0 required: false def: self.sName];
    self.sImg = [istream readStringDef: 1 required: false def: self.sImg];
    self.sDescription = [istream readStringDef: 2 required: false def: self.sDescription];
    self.iCreatetime = [istream readInt32Def: 3 required: false def: self.iCreatetime];
    self.stFaceNews = (NewsDesc*)[istream readMessageDef: 4 required: false def: self.stFaceNews VAR_TYPE: [NewsDesc class]];
    self.vTopicSubDir = [istream readListDef: 5 required: false def: self.vTopicSubDir VAR_TYPE: [THOTH_LIST CREATE: [TopicSubDir class]]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation TopicInfoReq
- (id) init
{
    if (self = [super init])
    {
        self.iTopicId = 0;
        self.stUserInfo = [[UserInfo alloc] init];
        self.eChannelType = E_CT_PUBLIC;
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iTopicId];
    if (self.stUserInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stUserInfo];
    }
    [ostream writeInt32: 2 value: (int32_t)self.eChannelType];
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicInfoReq *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iTopicId = [istream readInt32Def: 0 required: false def: self.iTopicId];
    self.stUserInfo = (UserInfo*)[istream readMessageDef: 1 required: false def: self.stUserInfo VAR_TYPE: [UserInfo class]];
    self.eChannelType = [istream readInt32Def: 2 required: false def: (int32_t)self.eChannelType];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

//////////////////////////////////////////////////////////////
@implementation TopicInfoRsp
- (id) init
{
    if (self = [super init])
    {
        self.iRet = 0;
        self.stTopicInfo = [[TopicInfo alloc] init];
    }

    return self;
}

- (void) write: (BaseEncodeStream *)ostream
{
    int _THOTH_BASESTREAM_LASTID_ = ostream.lastid;
    ostream.lastid = 0;

    [ostream writeInt32: 0 value: self.iRet];
    if (self.stTopicInfo != nil)
    {
        [ostream writeMessage: 1 value: self.stTopicInfo];
    }
    
    ostream.lastid = _THOTH_BASESTREAM_LASTID_;
}

- (TopicInfoRsp *) read: (BaseDecodeStream *)istream
{
    int _THOTH_BASESTREAM_LASTID_ = istream.lastid;
    istream.lastid = 0;

    self.iRet = [istream readInt32Def: 0 required: false def: self.iRet];
    self.stTopicInfo = (TopicInfo*)[istream readMessageDef: 1 required: false def: self.stTopicInfo VAR_TYPE: [TopicInfo class]];
    
    istream.lastid = _THOTH_BASESTREAM_LASTID_;
    return self;
}
@end

