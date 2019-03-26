//
//  SWGCardController.h
//  CardDeckObjecC
//
//  Created by shelby gold on 3/26/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWGCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface SWGCardController : NSObject

//static func to fetch card
+(void)fetchCardWhenClicked:(NSInteger)numberOfCards completion:(void (^)(SWGCard *_Nullable)) completion;

@end

NS_ASSUME_NONNULL_END
