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
    NSURL *baseUrl = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/"];
//
    NSURLComponents *urlcomponents = [NSURLComponents componentsWithURL:baseUrl resolvingAgainstBaseURL:true];
    NSString *cardNumString = [NSString stringWithFormat:@"%ld",(long)numberOfCards];
    NSURLQueryItem *cardNumbers = [[NSURLQueryItem alloc] initWithName:@"count" value: cardNumString];
    urlcomponents.queryItems = @[cardNumbers];
    NSURL *finalUrl = urlcomponents.URL;

    NSLog(@"%@", finalUrl);
    //call DataTask
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"there was an errror");
            completion(nil);
            return;
        }
        if (data) {
            NSDictionary *outerJsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (!outerJsonDictionary || error)
            {
                NSLog(@"error parsing json");
                completion(nil);
                return;
            }
            NSArray<NSDictionary *> *dictionariesArray = outerJsonDictionary[@"cards"];
            NSDictionary *firstCardDictionary = dictionariesArray[0];
            SWGCard *card = [[SWGCard alloc] initWithDictionary:firstCardDictionary];
            completion(card);
        }
    }] resume];
}

+ (void)image:(NSString *)urlString completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"there was an errror");
            completion(nil);
            return;
        }
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        }
    }] resume];
}
@end
