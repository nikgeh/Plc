//
//  PlacesTests.m
//  PlacesTests
//
//  Created by NICHOLAS GEH on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlacesTests.h"
#import "FlickrFetcher.h"

@implementation PlacesTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testFlickrApi
{
    NSArray *topPlaces = [FlickrFetcher topPlaces];
    NSLog(@"%@", topPlaces);
}

@end
