//
//  FlickrTableCellData.m
//  Places
//
//  Created by NICHOLAS GEH on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlickrTableCellData.h"

@interface FlickrTableCellData()

@property (retain) NSDictionary *data;

@end

@implementation FlickrTableCellData

@synthesize data;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self) {
        self.data = dictionary;
    }
    return self;
}

//- (UITableViewCell *)tableView

@end
