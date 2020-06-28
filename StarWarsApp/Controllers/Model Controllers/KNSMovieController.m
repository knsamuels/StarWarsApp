//
//  KNSMovieController.m
//  StarWarsApp
//
//  Created by Kristin Samuels  on 6/25/20.
//  Copyright © 2020 Kristin Samuels . All rights reserved.
//

#import "KNSMovieController.h"

static NSString *const baseURLString = @"https://swapi.dev/api";
static NSString *const filmsComponent = @"films";
//static NSString *const peopleComponent = @"people";

@implementation KNSMovieController
 
+(void)fetchMovies:(void (^)(NSArray<KNSMovie *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:filmsComponent];
    
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error fetching the movie: %@, %@", error, [error localizedDescription]);
            return completion(nil);
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSDictionary *topLevel = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (!topLevel)
            {
                NSLog(@"We had an error parsing the JSON %@", error.localizedDescription);
                return completion(nil);
            }
            
            NSDictionary *filmsDictionary = topLevel[@"results"];
            NSMutableArray *filmsArray =[NSMutableArray new];
            
            for (NSDictionary *dictionary in filmsDictionary){
                KNSMovie *movie = [[KNSMovie alloc]
                                   initWithDictionary:dictionary];
                [filmsArray addObject:movie];
            }
            completion(filmsArray);
        }
    }] resume];
}

//+(void)fetchPeopleInMovie:(NSString *)movie completion:(void (^)(NSArray<NSString *> * _Nullable))completion
//{
//    NSURL *baseURL = [NSURL URLWithString:baseURLString];
//    NSURL *finalURL = [baseURL URLByAppendingPathComponent:peopleComponent];
//    
//    NSLog(@"%@", finalURL);
//    
//    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error)
//        {
//            NSLog(@"There was an error fetching the movie: %@, %@", error, [error localizedDescription]);
//            return completion(nil);
//        }
//        if (response)
//        {
//            NSLog(@"%@", response);
//        }
//        if (data)
//        {
//            NSDictionary *topLevel = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//            NSDictionary *peopleDictionary = topLevel[@"results"];
//            NSMutableArray *characters = [NSMutableArray new];
//            for (NSDictionary *peopleDict in peopleDictionary)
//            {
//                NSString *character = peopleDict[@"characters"];
//                [characters addObject:character];
//        }
//    }
//        }]resume];
//}

@end
