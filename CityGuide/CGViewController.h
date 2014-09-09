//
//  CGViewController.h
//  CityGuide
//
//  Created by BitterBoy on 14-9-3.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *cities;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
