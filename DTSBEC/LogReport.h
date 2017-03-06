#ifndef LogReport_h
#define LogReport_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

typedef NS_ENUM(NSUInteger, ELogReportRetCode) {
    E_REPORT_SUCC = 0,
    E_REPORT_INVALID_BUSS = -1,
    E_REPORT_INVALID_MODULE = -2,
    E_REPORT_INVALID_PARAM = -3,
    E_REPORT_INVALID_CALL = -4,
    E_REPORT_INVALID_TICKET = -5,
    E_REPORT_SVR_ERR = -99
};

typedef NS_ENUM(NSUInteger, ECheckTicketRetCode) {
    E_TICKET_SUCC = 0,
    E_TICKET_EMPTY = -1,
    E_TICKET_DECRYPT_ERR = -2,
    E_TICKET_FORMAT_ERR = -3,
    E_TICKET_GUID_ERR = -4,
    E_TICKET_EXPIRE = -5,
    E_TICKET_FREQ_LIMITED = -6
};

/////////////////////////////////////////////////////////////////
@interface ReportLogReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, copy) NSString* sBussName;
@property (nonatomic, assign) int32_t iErrCode;
@property (nonatomic, copy) NSString* sErrMsg;
@property (nonatomic, strong) NSData* vData;
@property (nonatomic, copy) NSString* sFileSuffix;


- (void) write: (BaseEncodeStream *)eos;

- (ReportLogReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface ReportLogRsp : Message

@property (nonatomic, assign) int32_t iRetCode;


- (void) write: (BaseEncodeStream *)eos;

- (ReportLogRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetTicketReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;


- (void) write: (BaseEncodeStream *)eos;

- (GetTicketReq *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

/////////////////////////////////////////////////////////////////
@interface GetTicketRsp : Message

@property (nonatomic, copy) NSString* sTicket;


- (void) write: (BaseEncodeStream *)eos;

- (GetTicketRsp *) read: (BaseDecodeStream *)dos;

- (NSString *) writeToJsonString;

- (JSONValueMessage *) writeJSON;

- (void) readFromJsonString : (NSString *) strJson;

@end

#endif
