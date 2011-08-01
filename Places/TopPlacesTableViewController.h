//
//  TopPlacesTableViewController.h
//  Places
//
//  Created by NICHOLAS GEH on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopPlacesTableViewController : UITableViewController {
    
    /**
      Contains an array of the top places. Each member is 
      an NSDictionary in the format
         {
         "_content" = "London, England, United Kingdom";
         latitude = "51.506";
         longitude = "-0.127";
         "photo_count" = 2141;
         "place_id" = "hP_s5s9VVr5Qcg";
         "place_type" = locality;
         "place_type_id" = 7;
         "place_url" = "/United+Kingdom/England/London";
         timezone = "Europe/London";
         woeid = 44418;
         },
     */
    NSArray *topPlaces;
}

@end
