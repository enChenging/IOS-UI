//
//  NewsModel.h
//  UI
//
//  Created by release on 2019/11/16.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject

@property(nonatomic,copy)NSString* mTitile;
@property(nonatomic,copy)NSString* mPicUrl;
@property(nonatomic,copy)NSString* mUrl;
@property(nonatomic,copy)NSString* mCtime;

@end

NS_ASSUME_NONNULL_END
