//
//  CGAddCityController.h
//  CityGuide
//
//  Created by BitterBoy on 14-9-4.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGAddCityController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *tableView;
    IBOutlet UITableViewCell *nameCell;
    IBOutlet UITableViewCell *descriptionCell;
}

@end
