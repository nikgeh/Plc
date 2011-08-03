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

#define CONTENT @"_content"

#define PLACE_ID @"place_id"


+ (NSString *)placeId:(FlickrPlace *)place
{
    return [place objectForKey:PLACE_ID];
}

#pragma mark FlickrPhotoReference utils

#define PHOTO_TITLE @"title"
#define PHOTO_DESCRIPTION @"description"

#define UNKNOWN_TITLE @"Unknown"

+ (NSString *)titleOfPhoto:(FlickrPhotoReference *)photo
{
    return [photo objectForKey:PHOTO_TITLE];
}

+ (NSString *)descriptionOfPhoto:(FlickrPhotoReference *)photo
{
    NSDictionary *descPhoto = [photo objectForKey:PHOTO_DESCRIPTION];
    return [descPhoto objectForKey:CONTENT];
}

+ (void)populateCell:(UITableViewCell *)cell forPhotoReference:(FlickrPhotoReference *)photo
{
    NSString *title = [FlickrTableCellData titleOfPhoto:photo];
    NSString *description = [FlickrTableCellData descriptionOfPhoto:photo];

    if (title.length > 0) {
        cell.textLabel.text = title;
        cell.detailTextLabel.text = description;
    } else {
        cell.textLabel.text = description.length > 0 ? description : UNKNOWN_TITLE;
    }
}

@end
