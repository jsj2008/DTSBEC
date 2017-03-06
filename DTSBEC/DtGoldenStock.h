#ifndef DtGoldenStock_h
#define DtGoldenStock_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Account.h"

typedef NS_ENUM(NSUInteger, DtGoldenStockErrCode) {
    E_DT_GS_SUCC = 0,
    E_DT_GS_INVALID_PASS = -1,
    E_DT_GS_INVALID_CODE = -2,
    E_DT_GS_NOT_LOGIN = -3,
    E_DT_GS_SAME_GUID = -4,
    E_DT_GS_PASS_EMPTY = -5,
    E_DT_GS_REPEATED_COMMIT = -6,
    E_DT_GS_CODE_USED_ALREADY = -7,
    E_DT_GS_TICKET_EXPIRED = -8,
    E_DT_GS_SVR_ERR = -99
};

typedef NS_ENUM(NSUInteger, DtPrivilegeType) {
    E_DT_PRIVI_GOLDEN_STOCK = 0,
    E_DT_PRIVI_FUNC_LIST = 1
};

typedef NS_ENUM(NSUInteger, DtPriviCodeType) {
    E_DT_PRIVI_CODE_INVITE = 0,
    E_DT_PRIVI_CODE_CONVERT = 1
};

typedef NS_ENUM(NSUInteger, DtGoldenStockStatus) {
    E_DT_GS_NOT_UNLOCK = 0,
    E_DT_GS_PARTIAL_UNLOCK = 1,
    E_DT_GS_FULL_UNLOCK = 3,
    E_DT_GS_GRACE_PERIOD = 4,
    E_DT_GS_TRY_PERIOD = 5
};

typedef NS_ENUM(NSUInteger, DtPriviSwtich) {
    E_DT_PRIVI_CLOSED = 0,
    E_DT_PRIVI_OPEN = 1
};

typedef NS_ENUM(NSUInteger, DtPriviStatus) {
    E_DT_PRIVI_STATUS_NO = 0,
    E_DT_PRIVI_STATUS_TRY = 1,
    E_DT_PRIVI_STATUS_OPEN = 2
};

/////////////////////////////////////////////////////////////////
@interface SetLoginDayReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iType;


- (void)write: (BaseEncodeStream *)eos;

- (SetLoginDayReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SetLoginDayRsp : Message

@property (nonatomic, assign) int32_t iLeftDays;


- (void)write: (BaseEncodeStream *)eos;

- (SetLoginDayRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CheckInvitePassReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sReqPass;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void)write: (BaseEncodeStream *)eos;

- (CheckInvitePassReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CheckInvitePassRsp : Message

@property (nonatomic, assign) BOOL bIsDtInvitePass;
@property (nonatomic, assign) BOOL bIsInvitedBefore;
@property (nonatomic, assign) int32_t iCodeType;


- (void)write: (BaseEncodeStream *)eos;

- (CheckInvitePassRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetShareUrlReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, assign) int32_t iType;


- (void)write: (BaseEncodeStream *)eos;

- (GetShareUrlReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetShareUrlRsp : Message

@property (nonatomic, copy) NSString* sUrl;
@property (nonatomic, copy) NSString* sPass;
@property (nonatomic, assign) int32_t iFullUnlockNeedInvite;
@property (nonatomic, assign) int32_t iPartUnlockNeedInvite;
@property (nonatomic, assign) int32_t iInviteAlready;


- (void)write: (BaseEncodeStream *)eos;

- (GetShareUrlRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CommitInvitePassReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sInvitePass;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void)write: (BaseEncodeStream *)eos;

- (CommitInvitePassReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface CommitInvitePassRsp : Message

@property (nonatomic, assign) int32_t iNeedInvite;
@property (nonatomic, assign) int32_t iCodeType;
@property (nonatomic, copy) NSString* sPriviEndDay;


- (void)write: (BaseEncodeStream *)eos;

- (CommitInvitePassRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserInviteInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void)write: (BaseEncodeStream *)eos;

- (GetUserInviteInfoReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetUserInviteInfoRsp : Message

@property (nonatomic, assign) int32_t iFullUnlockNeedInvite;
@property (nonatomic, assign) int32_t iPartUnlockNeedInvite;
@property (nonatomic, assign) int32_t iInviteAlready;
@property (nonatomic, assign) int32_t iUnlockStatus;
@property (nonatomic, copy) NSString* sInvitePass;
@property (nonatomic, assign) int32_t iLeftDays;
@property (nonatomic, assign) int32_t iFirstLoginTime;


- (void)write: (BaseEncodeStream *)eos;

- (GetUserInviteInfoRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetPriviUserInviteInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void)write: (BaseEncodeStream *)eos;

- (GetPriviUserInviteInfoReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetPriviUserInviteInfoRsp : Message

@property (nonatomic, assign) int32_t iRetCode;
@property (nonatomic, assign) int32_t iPriviSwitch;
@property (nonatomic, assign) int32_t iInviteFriendNum;
@property (nonatomic, assign) int32_t iInviteOpenDays;
@property (nonatomic, assign) int32_t iAccuUseDays;
@property (nonatomic, assign) int32_t iAccuOpenDays;
@property (nonatomic, assign) int32_t iLoginOpenDays;
@property (nonatomic, assign) int32_t iFriendOpenDays;
@property (nonatomic, assign) int32_t iSuccInviteFriendNum;
@property (nonatomic, assign) int32_t iMonthAccuUseDays;
@property (nonatomic, assign) int32_t iFirstLoginTime;
@property (nonatomic, copy) NSString* sPriviEndDay;
@property (nonatomic, copy) NSString* sInvitePass;
@property (nonatomic, assign) int32_t iPriviStatus;
@property (nonatomic, assign) int32_t iTotalOpenUserNum;
@property (nonatomic, assign) int32_t iAlarmDaysOfExpire;
@property (nonatomic, assign) int32_t iPriviLeftDays;


- (void)write: (BaseEncodeStream *)eos;

- (GetPriviUserInviteInfoRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetConverCodeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iType;


- (void)write: (BaseEncodeStream *)eos;

- (GetConverCodeReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetConverCodeRsp : Message

@property (nonatomic, strong) NSArray* vConversionCode;


- (void)write: (BaseEncodeStream *)eos;

- (GetConverCodeRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetGoldenStockSwitchReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) int32_t iType;


- (void)write: (BaseEncodeStream *)eos;

- (GetGoldenStockSwitchReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface GetGoldenStockSwitchRsp : Message

@property (nonatomic, assign) BOOL bOpen;


- (void)write: (BaseEncodeStream *)eos;

- (GetGoldenStockSwitchRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
