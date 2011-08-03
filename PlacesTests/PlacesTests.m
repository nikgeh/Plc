//
//  PlacesTests.m
//  PlacesTests
//
//  Created by NICHOLAS GEH on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlacesTests.h"
#import "FlickrFetcher.h"
#import "FlickrTableCellData.h"

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
    //NSLog(@"%@", topPlaces);
    FlickrPlace *place = [topPlaces objectAtIndex:0];
    NSString *placeId = [FlickrTableCellData placeId:place];
    NSLog(@"****Place ID: %@", placeId);
    NSArray *photos = [FlickrFetcher photosAtPlace:placeId];
    NSLog(@"%@", photos);
}

@end
