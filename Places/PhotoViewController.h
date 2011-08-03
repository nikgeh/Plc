//
//  PhotoViewController.h
//  Places
//
//  Created by NICHOLAS GEH on 8/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlickrInfo;

@interface PhotoViewController : UIViewController <UIScrollViewDelegate> {
    FlickrInfo *flickrInfo;
    
    @private 
    NSData *photoData;
    UIImageView *imageView;
}

@property (retain) FlickrInfo *flickrInfo;

@end
