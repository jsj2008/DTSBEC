#ifndef Stat_h
#define Stat_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, BEACON_STAT_TYPE) {
    E_BST_PUSH,
    E_BST_SEC_ACCESS,
    E_BST_APP_INSTALL
};

/////////////////////////////////////////////////////////////////
@interface BeaconStatData : Message

@property (nonatomic, assign) uint32_t iTime;
@property (nonatomic, assign) BEACON_STAT_TYPE eStat;
@property (nonatomic, copy) NSString* sData;


- (void)write: (BaseEncodeStream *)eos;

- (BeaconStatData *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface BeaconStat : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) NSArray* vBeaconStatData;


- (void)write: (BaseEncodeStream *)eos;

- (BeaconStat *) read: (BaseDecodeStream *)dos;

@end

#endif
