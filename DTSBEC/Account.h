#ifndef Account_h
#define Account_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, E_ACCOUNT_RET) {
    E_AR_SUCC = 0,
    E_AR_USERNAME_USED = 1001,
    E_AR_PHONE_EMAIL_USED = 1002,
    E_AR_PHONE_CODE_EXPIRED = 1003,
    E_AR_PHONE_CODE_ERROR = 1004,
    E_AR_EMAIL_CODE_EXPIRED = 1005,
    E_AR_EMAIL_CODE_ERROR = 1006,
    E_AR_MACHE_CODE_EXPIRED = 1007,
    E_AR_MACHE_CODE_ERROR = 1008,
    E_AR_PHONE_NO_EXIST = 1010,
    E_AR_EMAIL_NO_EXIST = 1011,
    E_AR_FAILED_SEND_SMS = 1012,
    E_AR_PASSWORD_EMPTY = 1013,
    E_AR_PASSWORD_DIFF = 1014,
    E_AR_PASSWORD_ERROR = 1015,
    E_AR_PASSWORD_WEAK = 1016,
    E_AR_FAILED_REGISTER = 1017,
    E_AR_PHONE_FORMAT_ERROR = 1018,
    E_AR_ACCOUNT_NO_EXIST = 1019,
    E_AR_LOGIN_TYPE_ERROR = 1020,
    E_AR_PASSWORD_TOO_LONG = 1021,
    E_AR_TICKET_LENGTH_ERROR = 1022,
    E_AR_TICKET_EXPIRED = 1023,
    E_AR_TICKET_SIGN_ERROR = 1024,
    E_AR_THIRD_TOKEN_ERROR = 1025,
    E_AR_THIRD_TYPE_ERROR = 1026,
    E_AR_TICKET_ACCOUNTID_ERROR = 1027,
    E_AR_MODIFY_TYPE_NO_SUPPORT = 1028,
    E_AR_CANNOT_UNBIND = 1029,
    E_AR_THIRD_HAS_BIND = 1030,
    E_AR_MODIFY_FACE_ERROR = 1031,
    E_AR_USERNAME_LENGTH_ERROR = 1032,
    E_AR_THIRD_ACCOUNT_NO_EXIST = 1033,
    E_AR_PASSWORD_FORMAT_ERROR = 1034,
    E_AR_OPERA_TOO_FREQUENT = 1035,
    E_AR_REQUEST_PARAM_ERROR = 1036,
    E_AR_THIRD_VERFIY_ERROR = 1037,
    E_AR_USERNAME_FORMAT_ERROR = 1038,
    E_AR_VERIFY_TYPE_ERROR = 1039,
    E_AR_USERNAME_SENSTIVE = 1040,
    E_AR_INNER_MODIFY_ACCOUNT = 5000,
    E_AR_INNER_GET_ACCCOUNT_ERROR = 5001,
    E_AR_INNER_EXCEPTION = 5002,
    E_AR_INNER_GEN_TICKE_ERROR = 5003,
    E_AR_INNER_SEND_HTTP_ERROR = 5004,
    E_AR_INNER_JSON_PARSE_ERROR = 5005,
    E_AR_INNER_HTTPS_ERROR = 5006,
    E_AR_INNER_GEN_ACCCOUNTID_ERROR = 5007
};

typedef NS_ENUM(NSUInteger, E_VERIYFY_WAY) {
    E_SMS_VERITY = 1,
    E_EMAIL_VERITY = 2
};

typedef NS_ENUM(NSUInteger, E_VERIFY_TYPE) {
    E_VERIFYT_USERNAME = 1,
    E_VERIFY_WAY = 2,
    E_VERIFY_PHONE_CODE = 3,
    E_VERIFY_PASSWORD = 4
};

typedef NS_ENUM(NSUInteger, E_GENDER_TYPE) {
    E_GENDER_UNKOWN = 0,
    E_GENDER_MALE = 1,
    E_GENDER_FEMAIL = 2
};

typedef NS_ENUM(NSUInteger, E_FEED_USER_TYPE) {
    E_FEED_USER_NORMAL = 0,
    E_FEED_USER_INVEST = 1,
    E_FEED_USER_INVEST_V = 2
};

typedef NS_ENUM(NSUInteger, E_DT_MEMBER_TYPE) {
    E_DT_NO_MEMBER = 0,
    E_DT_MEMBER = 1,
    E_DT_MEMBER_EXPIRED = -1
};

typedef NS_ENUM(NSUInteger, E_PHONE_REGISTER_COME_FROM) {
    E_PHONE_REGISTER_APP = 0,
    E_PHONE_REGISTER_WEB = 1
};

typedef NS_ENUM(NSUInteger, E_LOGIN_TYPE) {
    E_DENGTA_LOGIN = 1,
    E_PHONE_LOGIN = 2,
    E_WEIXIN_LOGIN = 3,
    E_QQ_LOGIN = 4,
    E_WEIBO_LOGIN = 5
};

typedef NS_ENUM(NSUInteger, MODIFY_ACCOUNT_TYPE) {
    E_MODIFY_USER_NAME = 1,
    E_MOIDFY_PASSWORD,
    E_BIND_PHONE,
    E_EXCHANGE_PHONE,
    E_BIND_THIRD,
    E_UNBIND_THIRD,
    E_MODIFY_FACE,
    E_MODIFY_USER_DESC,
    E_MODIFY_MEMBER,
    E_MODIFY_ID
};

typedef NS_ENUM(NSUInteger, E_MSG_SEND_TYPE) {
    MST_SMS = 0,
    MST_WX_ALARM = 1
};

typedef NS_ENUM(NSUInteger, E_GRAB_CHANNEL_TYPE) {
    E_GCT_ITG = 1,
    E_GCT_THS = 2
};

/////////////////////////////////////////////////////////////////
@interface DtMemberInfo : Message

@property (nonatomic, assign) int32_t iMemberType;
@property (nonatomic, assign) int64_t lMemberStartTime;
@property (nonatomic, assign) int64_t lMemberEndTime;


- (void) write: (BaseEncodeStream *)eos;

- (DtMemberInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AccountInfo : Message

@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, copy) NSString* sUserName;
@property (nonatomic, strong) NSData* vtPassword;
@property (nonatomic, strong) NSData* vtDupliPassword;
@property (nonatomic, strong) NSData* vtOldPassword;
@property (nonatomic, copy) NSString* sPhoneNum;
@property (nonatomic, copy) NSString* sFaceUrl;
@property (nonatomic, assign) int32_t iGender;
@property (nonatomic, copy) NSString* sProvince;
@property (nonatomic, copy) NSString* sCity;
@property (nonatomic, copy) NSString* sProfile;
@property (nonatomic, copy) NSString* sVerifyDesc;
@property (nonatomic, assign) E_FEED_USER_TYPE eUserType;
@property (nonatomic, strong) DtMemberInfo* stMember;
@property (nonatomic, copy) NSString* sUserRealName;
@property (nonatomic, copy) NSString* sUserIDNumber;


- (void) write: (BaseEncodeStream *)eos;

- (AccountInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VerifyCode : Message

@property (nonatomic, assign) int16_t iType;
@property (nonatomic, copy) NSString* sPhoneVerifyCode;
@property (nonatomic, copy) NSString* sMachineVerifyCode;
@property (nonatomic, copy) NSString* sMachineCodeUrl;


- (void) write: (BaseEncodeStream *)eos;

- (VerifyCode *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface AccountTicket : Message

@property (nonatomic, strong) NSData* vtTicket;
@property (nonatomic, copy) NSString* sTicket;


- (void) write: (BaseEncodeStream *)eos;

- (AccountTicket *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VerifyAccountInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountInfo* stAccountInfo;
@property (nonatomic, strong) VerifyCode* stVerifyCode;
@property (nonatomic, assign) E_VERIYFY_WAY eVerifyWay;
@property (nonatomic, assign) E_VERIFY_TYPE eVerifyType;
@property (nonatomic, copy) NSString* sMachineVerfiyCode;


- (void) write: (BaseEncodeStream *)eos;

- (VerifyAccountInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VerifyAccountInfoRsp : Message

@property (nonatomic, strong) VerifyCode* stVerifyCode;


- (void) write: (BaseEncodeStream *)eos;

- (VerifyAccountInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinishRegisterAccountReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountInfo* stAccountInfo;
@property (nonatomic, assign) int32_t iComeFrom;
@property (nonatomic, strong) VerifyCode* stVerifyCode;


- (void) write: (BaseEncodeStream *)eos;

- (FinishRegisterAccountReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface FinishRegisterAccountRsp : Message

@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) AccountInfo* stAccountInfo;


- (void) write: (BaseEncodeStream *)eos;

- (FinishRegisterAccountRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ThirdLoginInfo : Message

@property (nonatomic, copy) NSString* sOpenId;
@property (nonatomic, copy) NSString* sAccessToken;
@property (nonatomic, assign) E_LOGIN_TYPE eType;
@property (nonatomic, strong) NSMutableDictionary* mpParam;


- (void) write: (BaseEncodeStream *)eos;

- (ThirdLoginInfo *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LoginReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountInfo* stAccountInfo;
@property (nonatomic, strong) VerifyCode* stVerifyCode;
@property (nonatomic, assign) E_LOGIN_TYPE eLoginType;
@property (nonatomic, strong) ThirdLoginInfo* stThirdLoginInfo;
@property (nonatomic, strong) NSData* vtFaceData;
@property (nonatomic, copy) NSString* sFaceImageFileType;
@property (nonatomic, assign) int32_t iComeFrom;


- (void) write: (BaseEncodeStream *)eos;

- (LoginReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LoginRsp : Message

@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) VerifyCode* stMachineVerfiyCode;
@property (nonatomic, strong) AccountInfo* stAccountInfo;
@property (nonatomic, strong) NSMutableArray* vtThirdLoginInfo;


- (void) write: (BaseEncodeStream *)eos;

- (LoginRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VerfiyThirdAccountReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) ThirdLoginInfo* stThirdLoginInfo;
@property (nonatomic, assign) E_LOGIN_TYPE eLoginType;


- (void) write: (BaseEncodeStream *)eos;

- (VerfiyThirdAccountReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VerfiyThirdAccountRsp : Message

@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) AccountInfo* stAccountInfo;
@property (nonatomic, strong) NSMutableArray* vtThirdLoginInfo;


- (void) write: (BaseEncodeStream *)eos;

- (VerfiyThirdAccountRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ModifyAccountInfoReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) MODIFY_ACCOUNT_TYPE eModifyType;
@property (nonatomic, strong) AccountInfo* stAccountInfo;
@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) VerifyCode* stVerifyCode;
@property (nonatomic, strong) ThirdLoginInfo* stThirdLoginInfo;
@property (nonatomic, copy) NSString* sFaceImageFileType;
@property (nonatomic, strong) NSData* vtFaceData;
@property (nonatomic, assign) int32_t iComeFrom;


- (void) write: (BaseEncodeStream *)eos;

- (ModifyAccountInfoReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ModifyAccountInfoRsp : Message

@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) AccountInfo* stAccountInfo;
@property (nonatomic, strong) NSMutableArray* vtThirdLoginInfo;


- (void) write: (BaseEncodeStream *)eos;

- (ModifyAccountInfoRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LogoutAccountReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, strong) AccountInfo* stAccountInfo;


- (void) write: (BaseEncodeStream *)eos;

- (LogoutAccountReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface LogoutAccountRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (LogoutAccountRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface UpdateTicketReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void) write: (BaseEncodeStream *)eos;

- (UpdateTicketReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface UpdateTicketRsp : Message

@property (nonatomic, strong) AccountTicket* stAccountTicket;
@property (nonatomic, strong) AccountInfo* stAccountInfo;
@property (nonatomic, strong) NSMutableArray* vtThirdLoginInfo;


- (void) write: (BaseEncodeStream *)eos;

- (UpdateTicketRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SendPhoneCodeReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sPhoneNum;
@property (nonatomic, assign) int16_t iStatus;


- (void) write: (BaseEncodeStream *)eos;

- (SendPhoneCodeReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VerifyAccountTicketReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountTicket* stAccountTicket;


- (void) write: (BaseEncodeStream *)eos;

- (VerifyAccountTicketReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface VerifyAccountTicketRsp : Message

@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, strong) AccountInfo* stAccountInfo;


- (void) write: (BaseEncodeStream *)eos;

- (VerifyAccountTicketRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SendSmsReq : Message

@property (nonatomic, strong) NSMutableArray* vtPhone;
@property (nonatomic, copy) NSString* sContent;
@property (nonatomic, assign) E_MSG_SEND_TYPE eMsgSendType;


- (void) write: (BaseEncodeStream *)eos;

- (SendSmsReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface SendSmsRsp : Message

@property (nonatomic, assign) int32_t iRet;


- (void) write: (BaseEncodeStream *)eos;

- (SendSmsRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetLoginReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) E_LOGIN_TYPE eLoginType;
@property (nonatomic, copy) NSString* sUnionId;
@property (nonatomic, copy) NSString* sOpenId;


- (void) write: (BaseEncodeStream *)eos;

- (GetLoginReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GenAccountIdReqItem : Message

@property (nonatomic, copy) NSString* sNickName;
@property (nonatomic, strong) NSData* vtFaceData;
@property (nonatomic, copy) NSString* sProfile;
@property (nonatomic, assign) E_FEED_USER_TYPE eUserType;


- (void) write: (BaseEncodeStream *)eos;

- (GenAccountIdReqItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GenAccountIdRspItem : Message

@property (nonatomic, assign) int32_t iRetCode;
@property (nonatomic, assign) uint32_t iAccountId;
@property (nonatomic, assign) BOOL bAdopted;


- (void) write: (BaseEncodeStream *)eos;

- (GenAccountIdRspItem *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GenAccountIdBatchReq : Message

@property (nonatomic, assign) E_GRAB_CHANNEL_TYPE eChannelType;
@property (nonatomic, strong) NSMutableArray* vItem;


- (void) write: (BaseEncodeStream *)eos;

- (GenAccountIdBatchReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GenAccountIdBatchRsp : Message

@property (nonatomic, strong) NSMutableDictionary* mItem;


- (void) write: (BaseEncodeStream *)eos;

- (GenAccountIdBatchRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GenAccountReq : Message

@property (nonatomic, copy) NSString* sOpenId;
@property (nonatomic, copy) NSString* sUnionId;
@property (nonatomic, assign) E_LOGIN_TYPE eLoginType;
@property (nonatomic, strong) NSData* vtFaceData;
@property (nonatomic, strong) AccountInfo* stAccountInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GenAccountReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
