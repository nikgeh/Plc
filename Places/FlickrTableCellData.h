//
//  FlickrTableCellData.h
//  Places
//
//  Created by NICHOLAS GEH on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSDictionary FlickrPlace;
typedef NSDictionary FlickrPhotoReference;

@interface FlickrTableCellData : NSObject {
@private 
    NSDictionary *data;
}

- (id) initWithDictionary:(NSDictionary *)dictionary;

+ (NSString *)placeId:(FlickrPlace *)place;
+ (void)populateCell:(UITableViewCell *)cell forPhotoReference:(FlickrPhotoReference *)photo;

@end
