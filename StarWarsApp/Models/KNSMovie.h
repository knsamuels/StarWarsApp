//
//  KNSMovie.h
//  StarWarsApp
//
//  Created by Kristin Samuels  on 6/25/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface KNSMovie : NSObject

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, copy, readonly) NSString * director;
@property (nonatomic, copy, readonly) NSString * dateReleased;

-(instancetype)initWithTitle:(NSString *)title
                  director:(NSString *)director
                dateReleased:(NSString *)dateReleased;

@end

@interface KNSMovie (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id>*)dictionary;


@end

NS_ASSUME_NONNULL_END
