//
//  SWGCardController.m
//  CardDeckObjecC
//
//  Created by shelby gold on 3/26/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

#import "SWGCardController.h"

@implementation SWGCardController

+ (void)fetchCardWhenClicked:(NSInteger)numberOfCards completion:(void (^)(SWGCard * _Nullable))completion
{
    //contructURL
    NSURL *baseUrl = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
//
//    NSURL *urlcomponents = [[NSURLComponents alloc] initWithURL:baseUrl resolvingAgainstBaseURL:true];
//
//    NSURL *cardNumbers = [[NSURLQueryItem alloc] initWithName:@"count" value:[NSNumber numberWithInt:numberOfCards]];
//    urlcomponents.query = cardNumbers
//
//    NSLog(@"%@", cardNumberUrl);
    //call DataTask
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"there was an errror");
            completion(nil);
            return;
        }
        if (data) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (!dictionary || error)
            {
                NSLog(@"error parsing json");
                completion(nil);
                return;
            }
            SWGCard *card = [[SWGCard alloc] initWithDictionary:dictionary];
            completion(card);
        }
    }] resume];
}


@end
