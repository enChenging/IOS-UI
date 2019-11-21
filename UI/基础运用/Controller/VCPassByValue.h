//
//  VCPassByValue.h
//  UI
//
//  Created by release on 2019/11/14.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//定义代理协议
@protocol VCPassByValueDelegate <NSObject>

//定义一个协议函数
-(void)sendTextContent:(NSString*)content;

@end

@interface VCPassByValue : UIViewController

//定义一个代理对象 来实现协议函数，达到代理对象改变本身属性的目的
//代理对象一定要实现代理协议
@property(nonatomic,strong)id<VCPassByValueDelegate>pbv1delegate;

@property(nonatomic,strong)UILabel* mlabel02;

@property(nonatomic,strong)UILabel* mlabel03;

@property(nonatomic,copy)NSString* mName;

+(instancetype)initInstance;//共享单例方法

@end

NS_ASSUME_NONNULL_END
