#ifndef YunWeb_h
#define YunWeb_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"
#import "Account.h"

typedef NS_ENUM(NSUInteger, E_YUN_RET_CODE) {
    E_YUN_RET_SUCC = 0,
    E_YUN_RET_MATCH_NEW = 1,
    E_YUN_RET_MATCH_CHECK_ERROR = 2,
    E_YUN_RET_MATCH_GUID_EMPTY = 3,
    E_YUN_RET_MATCH_GUID_NOT_EQUAL = 4,
    E_YUN_RET_MUST_UPDATE = 5,
    E_YUN_RET_NOT_LOGIN = 6,
    E_YUN_RET_NOT_DT_APP = 7,
    E_YUN_RET_NO_SESSIONID = 8,
    E_YUN_RET_CANCEL_CONNECT = 9,
    E_YUN_RET_CTRL_WEB_QUIT_SUCC = 10,
    E_YUN_RET_CTRL_WEB_QUIT_ERROR = 11,
    E_YUN_RET_CTRL_CLIENT_QUIT_SUCC = 12,
    E_YUN_RET_CTRL_CLIENT_QUIT_ERROR = 13,
    E_YUN_RET_MATCH_QRCODE_VISIT = 14,
    E_YUN_RET_TIMEOUT_CTRL = 15,
    E_YUN_RET_SESSION_TIMEOUT = 16,
    E_YUN_RET_SESSION_INVALID = 17,
    E_YUN_RET_SVR_ERR = 100
};

typedef NS_ENUM(NSUInteger, E_SCAN_TARGET_TYPE) {
    E_SCAN_TARGET_TV = 0,
    E_SCAN_TARGET_PC = 1
};

/////////////////////////////////////////////////////////////////
@interface CtrlKey : Message

@property (nonatomic, copy) NSString* sKey;
@property (nonatomic, copy) NSString* sUUID;


- (void)write: (BaseEncodeStream *)eos;

- (CtrlKey *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ReportScanReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sSessionId;
@property (nonatomic, assign) int32_t iTargetType;


- (void)write: (BaseEncodeStream *)eos;

- (ReportScanReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ReportScanRsp : Message

@property (nonatomic, copy) NSString* sTicket;
@property (nonatomic, copy) NSString* sTipMsg;
@property (nonatomic, copy) NSString* sTargetMsg;


- (void)write: (BaseEncodeStream *)eos;

- (ReportScanRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ReportAckLoginReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, copy) NSString* sTicket;
@property (nonatomic, assign) int32_t iTargetType;
@property (nonatomic, assign) BOOL bAckLogin;


- (void)write: (BaseEncodeStream *)eos;

- (ReportAckLoginReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ReportAckLoginRsp : Message

@property (nonatomic, copy) NSString* sTipMsg;


- (void)write: (BaseEncodeStream *)eos;

- (ReportAckLoginRsp *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface getScanSessionReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void)write: (BaseEncodeStream *)eos;

- (getScanSessionReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface getScanSessionRsp : Message

@property (nonatomic, copy) NSString* sSessionId;


- (void)write: (BaseEncodeStream *)eos;

- (getScanSessionRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
