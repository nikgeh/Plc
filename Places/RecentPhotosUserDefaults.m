//
//  RecentPhotosUserDefaults.m
//  Places
//
//  Created by NICHOLAS GEH on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RecentPhotosUserDefaults.h"

#define RECENT_PHOTOS_KEY @"PlacesRecentPhotos"
#define MAX_PHOTOS 30

@implementation RecentPhotosUserDefaults


/**
 Updates the user defaults and sets the recently viewed photo as the recent photo
 */
+ (void)updateRecentPhotos:(FlickrPhotoReference *) photo 
{
    NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
    NSMutableArray *recentPhotos = [d mutableArrayValueForKey:RECENT_PHOTOS_KEY];
    if (recentPhotos) {
        [recentPhotos insertObject:photo atIndex:0];
        if (recentPhotos.count > MAX_PHOTOS) {
            [recentPhotos removeLastObject];
        }        
    } else {
        // Empty array, so let's initialize it
        recentPhotos = [NSMutableArray arrayWithObject:photo];
    }
    
    [d setValue:recentPhotos forKey:RECENT_PHOTOS_KEY];
    [d synchronize];

}

/**
 Retrieves an NSArray of the recent photos that the user viewed
 */
+ (NSArray *)recentPhotosForUser
{
    return [[NSUserDefaults standardUserDefaults] mutableArrayValueForKey:RECENT_PHOTOS_KEY];
}



@end
