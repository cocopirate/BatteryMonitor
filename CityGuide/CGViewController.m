//
//  CGViewController.m
//  CityGuide
//
//  Created by BitterBoy on 14-9-3.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import "CGViewController.h"
#import "CGAppDelegate.h"
#import "CGCity.h"
#import "CGCityController.h"
#import "CGAddCityController.h"

@interface CGViewController ()

@end

@implementation CGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGAppDelegate *delegate=(CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    cities = delegate.cities;
    
	self.title = @"City Guide";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 列表数据源和项数设置
//列表项数据设置
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if(nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if(indexPath.row<cities.count)
    {
        CGCity *thisCity = [cities objectAtIndex:indexPath.row];
        cell.textLabel.text = thisCity.cityName;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.editingAccessoryType = UITableViewCellAccessoryNone;
        if (self.editing) {
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
    }
    else
    {
        cell.textLabel.text = @"Add New City...";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}
//列表项数设置
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section{
    NSInteger count = cities.count;
    if(self.editing)
    {
        count = count+1;
    }
    return  count;
}
#pragma mark 列表进入编辑状态(重写setEditing)
-(void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    if(editing != self.editing)
    {
        [super setEditing:editing animated:animated];
        [self.tableView setEditing:editing animated:animated];
        
        NSMutableArray *indices = [[NSMutableArray alloc] init];
        for (int i=0; i<cities.count; i++) {
            [indices addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        NSArray *lasterIndex = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:cities.count inSection:0]];
        if(editing == YES)
        {
            for (int i=0; i<cities.count; i++)
            {
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [self.tableView insertRowsAtIndexPaths:lasterIndex withRowAnimation:UITableViewRowAnimationLeft];
        }
        else
        {
            for (int i=0; i<cities.count; i++)
            {
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
            }
            [self.tableView deleteRowsAtIndexPaths:lasterIndex withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
    
}
#pragma mark 列表删除事件

-(void) tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editing forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editing == UITableViewCellEditingStyleDelete)
    {
        [cities removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark 列表项选中事件

-(void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGAppDelegate *delegate=(CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    //列表项点击进入列表详情
    if(indexPath.row < cities.count && !self.editing)
    {
        CGCityController *cityController = [[CGCityController alloc] initWithIndexPath:indexPath];
        [delegate.navController pushViewController:cityController animated:YES];
    }
    //列表项点击进入增加列表项界面
    if(indexPath.row == cities.count && self.editing)
    {
        CGAddCityController *addCity = [[CGAddCityController alloc] init];
        [delegate.navController pushViewController:addCity animated:YES];
    }
    
    //列表项点击选中动画；
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark 列表编辑状态修改新增行样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tv editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row < cities.count)
    {
        return UITableViewCellEditingStyleDelete;
    }
    else
    {
        return UITableViewCellEditingStyleInsert;
    }
}
@end
