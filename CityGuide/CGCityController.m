//
//  CGCityController.m
//  CityGuide
//
//  Created by BitterBoy on 14-9-3.
//  Copyright (c) 2014年 coco. All rights reserved.
//http://www.cocoachina.com/appstore/20140901/9500.html

#import "CGCityController.h"
#import "CGAppDelegate.h"
#import "CGCity.h"

@interface CGCityController ()

@end

@implementation CGCityController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGAppDelegate *delegate = (CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    CGCity *thisCity = [delegate.cities objectAtIndex:index.row];
    self.title =  thisCity.cityName;
    
    decriptionView.text = thisCity.cityDecription;
    decriptionView.editable = NO;
    UIImage *image = thisCity.cityPicture;
    if (image == nil) {
        image = [UIImage imageNamed:@"Default.jpg"];
    }
    pictureView.image = image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id) initWithIndexPath:(NSIndexPath*) indexPath
{
    if( (self = [super init]) )
    {
        index = indexPath;
    }
    return self;
}

@end
