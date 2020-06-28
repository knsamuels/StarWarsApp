//
//  KNSMovie.m
//  StarWarsApp
//
//  Created by Kristin Samuels  on 6/25/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

#import "KNSMovie.h"

@implementation KNSMovie

- (instancetype)initWithTitle:(NSString *)title director:(NSString *)director dateReleased:(NSString *)dateReleased
{
    self = [super init];
    if (self != nil)
    {
        _title = title;
        _director = director;
        _dateReleased = dateReleased;
    }
    return self;
}
@end

@implementation KNSMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *director = dictionary[@"director"];
    NSString *dateReleased = dictionary[@"release_date"];
    
    return [self initWithTitle:title director:director dateReleased:dateReleased];
}

@end
