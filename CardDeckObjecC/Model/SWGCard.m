//
//  SWGCard.m
//  CardDeckObjecC
//
//  Created by shelby gold on 3/26/19.
//  Copyright © 2019 shelby gold. All rights reserved.
//

#import "SWGCard.h"

@implementation SWGCard

-(instancetype)initWithValue:(NSString *)value suit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self) {
        _value = value;
        _suit = suit;
        _image = image;
    }
    return self;
}

@end
//json converter

@implementation SWGCard(JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *valueFromDict = dictionary[@"value"];
    NSString *suitFromDict = dictionary[@"suit"];
    NSString *imageFromDict = dictionary[@"image"];
    
}

@end
