//
//  VCPassByValue2.h
//  UI
//
//  Created by release on 2019/11/14.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ReceiveValueBlock)(NSString* value);

typedef void(^VCPassByValueBlock)(NSString* str);

@protocol VCPassByValue2Delegate <NSObject>

-(void)sendMessage:(NSString*)message;

@end

@interface VCPassByValue2 : UIViewController

@property(nonatomic,strong)NSString* propertyValue;

@property(nonatomic,strong)NSString* methodValue;

@property(nonatomic,strong)id<VCPassByValue2Delegate>pbv2delegate;

@property(nonatomic,copy)ReceiveValueBlock receiveValue;

-(void)sendBlockMessage:(NSString*)msg andBlock:(VCPassByValueBlock)block;

@property(nonatomic,strong)UILabel* mlabel04;

@property(nonatomic,strong)NSString* data;

@property(nonatomic,strong)NSString* mKvcText;

@end

NS_ASSUME_NONNULL_END
