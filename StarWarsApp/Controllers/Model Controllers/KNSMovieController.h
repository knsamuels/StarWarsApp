//
//  KNSMovieController.h
//  StarWarsApp
//
//  Created by Kristin Samuels  on 6/25/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KNSMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface KNSMovieController : NSObject

+(void)fetchMovies:(void (^) (NSArray<KNSMovie *> * movie))completion;

//+(void)fetchPeopleInMovie:(NSString *)movie completion:(void (^) (NSArray<NSString *>*_Nullable))completion;

//+(void)fetchPersonData:(NSString *)person
//                 movie:(NSString *)movie completion:(void (^) (KNSCharacters *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
