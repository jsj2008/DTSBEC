#ifndef Upgrade_h
#define Upgrade_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

/////////////////////////////////////////////////////////////////
@interface UpgradeInfo : Message

@property (nonatomic, assign) int32_t iStatus;
@property (nonatomic, copy) NSString* sURL;
@property (nonatomic, copy) NSString* sText;
@property (nonatomic, copy) NSString* sHeader;
@property (nonatomic, copy) NSString* sFileSize;
@property (nonatomic, copy) NSString* sReleaseTime;
@property (nonatomic, copy) NSString* sTitle;
@property (nonatomic, assign) int32_t iMaxVersion;
@property (nonatomic, assign) int32_t iMinVersion;
@property (nonatomic, copy) NSString* sMd5;
@property (nonatomic, assign) int32_t iVersion;
@property (nonatomic, copy) NSString* sVersionName;
@property (nonatomic, assign) int32_t isFreqControl;


- (void)write: (BaseEncodeStream *)eos;

- (UpgradeInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface UpgradeCacheInfo : Message

@property (nonatomic, assign) int32_t iLastUpgradeTime;
@property (nonatomic, assign) int32_t iCount;


- (void)write: (BaseEncodeStream *)eos;

- (UpgradeCacheInfo *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface UpgradeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sClientMd5;
@property (nonatomic, assign) int32_t iCheckFreq;


- (void)write: (BaseEncodeStream *)eos;

- (UpgradeReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface UpgradeRsp : Message

@property (nonatomic, strong) UpgradeInfo* stUpgradeInfo;


- (void)write: (BaseEncodeStream *)eos;

- (UpgradeRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
