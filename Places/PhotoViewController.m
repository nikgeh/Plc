//
//  PhotoViewController.m
//  Places
//
//  Created by NICHOLAS GEH on 8/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"
#import "FlickrTableCellData.h"
#import "FlickrFetcher.h"

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
        NSDictionary *info = [FlickrTableCellData flickrInfo:self.flickrInfo];
        NSData *data = [FlickrFetcher imageDataForPhotoWithFlickrInfo:info
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
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.hidesBottomBarWhenPushed = YES;
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
    // Create an Image    
    UIImage *image = [UIImage imageWithData:self.photoData];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    
    // Put it in Scroll View and set the initial zoom and positioning
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:applicationFrame];
    scrollView.contentSize = image.size;
    [scrollView addSubview:self.imageView];
    //scrollView.bounces = NO; // If we want to turn off bouncing.
    scrollView.minimumZoomScale = 0.3;
    scrollView.maximumZoomScale = 3.0;
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor blackColor];
    self.view = scrollView;
    [scrollView release];
}

// Taken from http://neocaine.blogspot.com/2011/06/uiscrollview-zoom-subviews-to-center.html
- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
    CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
        
    }
    else {
        frameToCenter.origin.x = 0;
    }
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
    return frameToCenter;
}

- (void)zoomToPictureSize
{
    UIScrollView *scrollView = (UIScrollView *)self.view;
    [scrollView zoomToRect:self.imageView.bounds animated:NO];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // Resize photo to fit in the scroll view
    [self zoomToPictureSize];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.imageView = nil;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    // When we rotate the device, we want to ensure that the image stays centered, if there is
    // any white space around the sides.
    self.imageView.frame = [self centeredFrameForScrollView:(UIScrollView *)self.view 
                                                  andUIView:self.imageView];    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark ScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView { 
    self.imageView.frame = [self centeredFrameForScrollView:scrollView andUIView:self.imageView];
}

@end
