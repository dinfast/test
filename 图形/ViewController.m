//
//  ViewController.m
//  图形
//
//  Created by yhj on 16/1/25.
//  Copyright © 2016年 QQ:1787354782 QQ群:524884683. All rights reserved.
//

#import "ViewController.h"
#import "PNChart.h"
#import "CONST.h"

@interface ViewController ()
//<UITableViewDataSource,UITableViewDelegate>
//
//@property(nonatomic,strong)UITableView *tableView;
//
@property (nonatomic,strong) PNPieChart *pieChart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor yellowColor];
    [self createTableView];
}

-(void)createTableView
{
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:20 color:[UIColor purpleColor]],
                       [PNPieChartDataItem dataItemWithValue:20 color:[UIColor redColor] description:@"WWDC"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNDeepGreen description:@"GOOG I/O"], [PNPieChartDataItem dataItemWithValue:20 color:[UIColor greenColor] description:@"gren"],
                       [PNPieChartDataItem dataItemWithValue:10 color:PNDeepGreen description:@"GOO"],
                       ];
    
    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(APPW/2.0 - 100, 135, 200.0, 200.0) items:items];
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:12.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    [self.pieChart strokeChart];
    self.pieChart.legendStyle = PNLegendItemStyleStacked;
    self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];
    
    [self.view addSubview:self.pieChart];
}

@end
