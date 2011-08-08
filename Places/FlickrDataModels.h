//
//  FlickrDataModels.h
//  Places
//
//  Created by NICHOLAS GEH on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#ifndef Places_FlickrDataModels_h
#define Places_FlickrDataModels_h

/**
 Describes a Flickr Place
 An NSDictionary in the format
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
typedef NSDictionary FlickrPlace;

/**
 Describes a reference to a Flickr Photo
 */
typedef NSDictionary FlickrPhotoReference;

/**
 Contains information that can be used to retrieve the contents of a photo, 
 Specifically an NSDictionary with the keys (id, server, farm, secret)
 */
typedef NSDictionary FlickrInfo;



#endif
