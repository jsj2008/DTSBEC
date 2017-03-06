#ifndef JsonResult_h
#define JsonResult_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"
#import "Beacon.h"

/////////////////////////////////////////////////////////////////
@interface SecPortraitUpdowns : Message

@property (nonatomic, assign) int32_t iTradeDate;
@property (nonatomic, copy) NSString* sUpDowns;


- (void)write: (BaseEncodeStream *)eos;

- (SecPortraitUpdowns *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecPortraitIndustry : Message

@property (nonatomic, copy) NSString* sName;
@property (nonatomic, strong) NSArray* vtUpdowns;


- (void)write: (BaseEncodeStream *)eos;

- (SecPortraitIndustry *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecPortraitMarket : Message

@property (nonatomic, strong) SecPortraitIndustry* stStockUpdowns;
@property (nonatomic, strong) SecPortraitIndustry* stIndexUpdowns;
@property (nonatomic, strong) SecPortraitIndustry* stPlateUpdowns;
@property (nonatomic, copy) NSString* sDesc;


- (void)write: (BaseEncodeStream *)eos;

- (SecPortraitMarket *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecRelaLastUpDowns : Message

@property (nonatomic, strong) NSArray* vtSecUpdowns;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, assign) int32_t iUpdateTime;


- (void)write: (BaseEncodeStream *)eos;

- (SecRelaLastUpDowns *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SecPerformance : Message

@property (nonatomic, strong) NSArray* vOperatingRevenue;
@property (nonatomic, copy) NSString* sOperatingDesc;
@property (nonatomic, strong) NSArray* vProfit;
@property (nonatomic, copy) NSString* sProfitDesc;
@property (nonatomic, assign) E_FR_UNIT eOPUnit;
@property (nonatomic, assign) E_FR_UNIT eProfitUnit;


- (void)write: (BaseEncodeStream *)eos;

- (SecPerformance *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface RelaSecPerformance : Message

@property (nonatomic, strong) NSArray* vtPerformance;
@property (nonatomic, copy) NSString* sDesc;
@property (nonatomic, assign) int32_t iUpdateTime;


- (void)write: (BaseEncodeStream *)eos;

- (RelaSecPerformance *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConcDetailRelaStock : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sStockName;
@property (nonatomic, assign) float fRelaDegree;


- (void)write: (BaseEncodeStream *)eos;

- (ConcDetailRelaStock *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface ConcDetailQuote : Message

@property (nonatomic, assign) float fConcUpdownsRange;
@property (nonatomic, copy) NSString* sUpdownsCount;
@property (nonatomic, copy) NSString* sConcDesc;
@property (nonatomic, copy) NSString* sConcName;
@property (nonatomic, assign) float fHot;
@property (nonatomic, strong) NSArray* vtConcDetailRelaStock;


- (void)write: (BaseEncodeStream *)eos;

- (ConcDetailQuote *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface SearchStockResult : Message

@property (nonatomic, strong) NSArray* vStockItem;


- (void)write: (BaseEncodeStream *)eos;

- (SearchStockResult *) read: (BaseDecodeStream *)dos;

@end

#endif
