//
//  PhotoViewController.h
//  Places
//
//  Created by NICHOLAS GEH on 8/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrDataModels.h"

@interface PhotoViewController : UIViewController <UIScrollViewDelegate> {
    FlickrPhotoReference *flickrInfo;
    
    @private 
    NSData *photoData;
    UIImageView *imageView;
}

@property (retain) FlickrPhotoReference *flickrInfo;

@end
