#ifndef PePb_h
#define PePb_h
#import "BaseMessage.h"
#import "BaseEncodeStream.h"
#import "BaseDecodeStream.h"

/////////////////////////////////////////////////////////////////
@interface PePbReq : Message

@property (nonatomic, strong) NSArray* vDtSecCode;


- (void)write: (BaseEncodeStream *)eos;

- (PePbReq *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PePbSingle : Message

@property (nonatomic, copy) NSString* sDtSecCode;
@property (nonatomic, copy) NSString* sPlate;
@property (nonatomic, assign) float fAvgPe;
@property (nonatomic, assign) float fAvgPb;


- (void)write: (BaseEncodeStream *)eos;

- (PePbSingle *) read: (BaseDecodeStream *)dos;

@end

/////////////////////////////////////////////////////////////////
@interface PePbRsp : Message

@property (nonatomic, strong) NSArray* vPePbRst;


- (void)write: (BaseEncodeStream *)eos;

- (PePbRsp *) read: (BaseDecodeStream *)dos;

@end

#endif
