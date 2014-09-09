//
//  CGAddCityController.m
//  CityGuide
//
//  Created by BitterBoy on 14-9-4.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import "CGAppDelegate.h"
#import "CGAddCityController.h"
#import "CGViewController.h"
#import "CGCity.h"

@interface CGAddCityController ()

@end

@implementation CGAddCityController

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
    self.title = @"New City";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveCity:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 列表数据源方法

-(UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if(indexPath.row == 0)
    {
        cell = nameCell;
    }
    else
    {
        cell = descriptionCell;
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

#pragma mark 列表委托方法

-(CGFloat) tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    if (indexPath.row == 0)
    {
        height = 44;
    }
    else
    {
        height = 440;
    }
    return height;
}

#pragma mark 列表保存方法（自定义）
-(void) saveCity:(id)sender
{
    CGAppDelegate *delegate = (CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableArray *cities = delegate.cities;
    UITextField *nameEntry = (UITextField *)[nameCell viewWithTag:777];
    UITextView *descriptionEntry = (UITextView *)[descriptionCell viewWithTag:777];
    
    if (nameEntry.text.length>0)
    {
        CGCity *newCity = [[CGCity alloc] init];
        newCity.cityName = nameEntry.text;
        newCity.cityDecription = descriptionEntry.text;
        newCity.cityPicture = nil;
        [cities addObject:newCity];
        CGViewController *viewController = delegate.viewController;
        [viewController.tableView reloadData];
    }
    [delegate.navController popViewControllerAnimated:YES];
}

@end
