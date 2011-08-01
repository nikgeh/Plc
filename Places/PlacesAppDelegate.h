//
//  PlacesAppDelegate.h
//  Places
//
//  Created by NICHOLAS GEH on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesAppDelegate : NSObject <UIApplicationDelegate> {
@private 
    UINavigationController *nav;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
