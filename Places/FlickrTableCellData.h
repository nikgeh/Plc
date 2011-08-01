//
//  FlickrTableCellData.h
//  Places
//
//  Created by NICHOLAS GEH on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrTableCellData : NSObject {
@private 
    NSDictionary *data;
}

- (id) initWithDictionary:(NSDictionary *)dictionary;

@end
