//
//  PhotoViewController.m
//  Places
//
//  Created by NICHOLAS GEH on 8/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"

#import "FlickrFetcher.h"
#import "FlickrTableCellData.h"

@interface PhotoViewController() 
@property (nonatomic, retain, readonly) NSData *photoData;
@property (retain) UIImageView *imageView;
@end

@implementation PhotoViewController

@synthesize flickrInfo;
@synthesize imageView;
@synthesize photoData;

- (NSData *)photoData
{
    if (!photoData) {
        NSData *data = [FlickrFetcher imageDataForPhotoWithFlickrInfo:(NSDictionary *)self.flickrInfo
                                                               format:FlickrFetcherPhotoFormatLarge];
        photoData = [data retain];
    }
    return photoData;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    [photoData release];
    photoData = nil;
}

- (void)dealloc
{
    [photoData release];
    self.imageView = nil;
    [super dealloc];
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    UIImage *image = [UIImage imageWithData:self.photoData];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:applicationFrame];
    scrollView.contentSize = image.size;
    [scrollView addSubview:self.imageView];
    //scrollView.bounces = NO; // If we want to turn off bouncing.
    scrollView.minimumZoomScale = 0.3;
    scrollView.maximumZoomScale = 3.0;
    scrollView.delegate = self;
    self.view = scrollView;
    [scrollView release];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark ScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


@end
