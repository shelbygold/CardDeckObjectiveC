//
//  SWGCardController.h
//  CardDeckObjecC
//
//  Created by shelby gold on 3/26/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWGCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface SWGCardController : NSObject

+(SWGCardController *)sharedController;

//static func to fetch card
+(void)fetchCardWhenClicked:(NSInteger)numberOfCards completion:(void (^)(SWGCard *_Nullable)) completion;

+(void)image:(NSString *)urlString completion:(void (^) (UIImage *_Nullable)) completion;

@end

NS_ASSUME_NONNULL_END
