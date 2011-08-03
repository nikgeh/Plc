//
//  PlacePhotosTableViewController.h
//  Places
//
//  Created by NICHOLAS GEH on 8/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FlickrTableCellData.h"

@interface PlacePhotosTableViewController : UITableViewController {
    FlickrPlace *place;
    
    @private 
    NSArray *photos;
}

@property (retain) FlickrPlace *place;

@end
