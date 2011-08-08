//
//  RecentPhotosUserDefaults.h
//  Places
//
//  Created by NICHOLAS GEH on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrDataModels.h"

@interface RecentPhotosUserDefaults : NSObject

/**
 Updates the user defaults and sets the recently viewed photo as the recent photo
 */
+ (void)updateRecentPhotos:(FlickrPhotoReference *) photo;

/**
 Retrieves an NSArray of the recent photos that the user viewed
 Each element is of type FlickrPhotoReference
 */
+ (NSArray *)recentPhotosForUser;

@end
