//
//  ViewController.m
//  TEST-NewReservation
//
//  Created by rahul mahajan on 20/02/17.
//  Copyright © 2017 rahul mahajan. All rights reserved.
//

#import "ViewController.h"
#import "ERTReservationTableViewCell.h"


typedef enum {
    SELECT_DATE = 0,
    NUMBER_OF_GUESTS,
    SELECT_TIME,
    SELECT_SECTION
}ERTReservationCellTitle;


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,ERTReservationCellDelegate>
@property (assign,nonatomic) NSInteger numberOfRows;
@property (strong,nonatomic) NSArray *titleArray;
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (weak, nonatomic) IBOutlet UIButton *proceedBtn;

- (IBAction)proceedAction:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableVIew.rowHeight = UITableViewAutomaticDimension;
    _tableVIew.estimatedRowHeight = 500.0;
    _tableVIew.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    _tableVIew.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableVIew registerClass:[ERTReservationTableViewCell class] forCellReuseIdentifier:@"ERTReservationTableViewCell"];
    _numberOfRows = 1;
    [_proceedBtn setHidden:YES];
    _titleArray = @[@"Select Date",@"Number Of Guests",@"Select Time",@"Select Section"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- UITableViewDataSource Methods



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _numberOfRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ERTReservationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ERTReservationTableViewCell"];
    if (!cell) {
        cell = [[ERTReservationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ERTReservationTableViewCell"];
    }
    cell.delegate = self;
    cell.tag = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setNeedsLayout];
    [cell updateConstraintsIfNeeded];
    return cell;
}

#pragma mark - ERTReservationCellDelegate Methods

-(NSUInteger)numberOfRowsInCell:(ERTReservationTableViewCell *)cell{
    NSUInteger rows = 0;
    switch (cell.tag) {
        case SELECT_DATE:{
            rows = 1;
        }
            break;
        case NUMBER_OF_GUESTS:{
            rows = 2;
        }
            break;
        case SELECT_TIME:{
            rows = 2;
        }
            break;
        case SELECT_SECTION:{
            rows = 1;
        }
            break;
        default:
            break;
    }
    return rows;
}

-(NSString*)titleForCell:(ERTReservationTableViewCell *)cell{
    return [_titleArray objectAtIndex:cell.tag];
}

-(NSArray<NSString *> *)dataSourceAtIndex:(NSUInteger)index inCell:(ERTReservationTableViewCell *)cell{
    NSArray *array= [NSArray array];
    switch (cell.tag) {
        case SELECT_DATE:{
            array = @[@"17th Feb",@"18th Feb",@"18th Feb",@"18th Feb",@"18th Feb",@"18th Feb"];
        }
            break;
            
        default:
            break;
    }
    return array;
}



- (IBAction)proceedAction:(UIButton *)sender {
}
@end
