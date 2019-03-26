//
//  SWGCard.h
//  CardDeckObjecC
//
//  Created by shelby gold on 3/26/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SWGCard : NSObject

@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;

- (instancetype)initWithValue:(NSString *)value suit:(NSString *)suit image:(NSString *)image;

@end

@interface SWGCard (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
