#ifndef MarketAlert_h
#define MarketAlert_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

/////////////////////////////////////////////////////////////////
@interface DtMarketAlert : Message

@property (nonatomic, copy) NSString* sDate;
@property (nonatomic, assign) int32_t iMakertAlert;
@property (nonatomic, assign) float fAIndex;
@property (nonatomic, assign) float fMarginTrade;
@property (nonatomic, assign) float fAHExtend;
@property (nonatomic, assign) float fNewInvestor;
@property (nonatomic, assign) float fTradeAInvestorPer;


- (void)write: (BaseEncodeStream *)eos;

- (DtMarketAlert *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MaxDateValue : Message

@property (nonatomic, copy) NSString* sMaxDate;
@property (nonatomic, assign) float fMaxValue;


- (void)write: (BaseEncodeStream *)eos;

- (MaxDateValue *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketAlertReq : Message

@property (nonatomic, strong) UserInfo* stUserInfo;
@property (nonatomic, assign) uint32_t iStart;
@property (nonatomic, assign) uint32_t iSize;


- (void)write: (BaseEncodeStream *)eos;

- (MarketAlertReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface MarketAlertRsp : Message

@property (nonatomic, assign) int32_t iDtAIndex;
@property (nonatomic, assign) int32_t iMarketMoney;
@property (nonatomic, assign) int32_t iMarketHot;
@property (nonatomic, strong) MaxDateValue* stMaxMarketAlert;
@property (nonatomic, strong) MaxDateValue* stMaxDtAIndex;
@property (nonatomic, strong) MaxDateValue* stMaxMarginTrade;
@property (nonatomic, strong) MaxDateValue* stMaxAHExtend;
@property (nonatomic, strong) MaxDateValue* stMaxNewInvestor;
@property (nonatomic, strong) MaxDateValue* stMaxTradeAInvestorPer;
@property (nonatomic, strong) NSArray* vDtMarketAlert;


- (void)write: (BaseEncodeStream *)eos;

- (MarketAlertRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
