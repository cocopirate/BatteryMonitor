//
//  CGCityController.h
//  CityGuide
//
//  Created by BitterBoy on 14-9-3.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGCityController : UIViewController
{
    NSIndexPath *index;
    IBOutlet UIImageView *pictureView;
    IBOutlet UITextView *decriptionView;
}

- (id) initWithIndexPath:(NSIndexPath*) indexPath;

@end
