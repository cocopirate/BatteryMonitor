//
//  CGAppDelegate.h
//  CityGuide
//
//  Created by BitterBoy on 14-9-3.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGViewController;

@interface CGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CGViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) NSMutableArray *cities;

@end
