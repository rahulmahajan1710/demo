//
//  ERTReservationTableViewCell.h
//  TEST-NewReservation
//
//  Created by rahul mahajan on 20/02/17.
//  Copyright © 2017 rahul mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ERTConstraintsMacros.h"
#import "ERTReservationCollectionViewCell.h"

@class ERTReservationTableViewCell;

@protocol ERTReservationCellDelegate <NSObject>
-(NSUInteger)numberOfRowsInCell:(ERTReservationTableViewCell*)cell;
-(NSString*)titleForCell:(ERTReservationTableViewCell*)cell;
-(NSArray<NSString*>*)dataSourceAtIndex:(NSUInteger)index inCell:(ERTReservationTableViewCell*)cell;

@optional
-(BOOL)headersNeededInCell:(ERTReservationTableViewCell*)cell;
-(NSString*)headerAtIndex:(NSUInteger)index inCell:(ERTReservationTableViewCell*)cell;
-(UIFont*)fontForHeaderAtIndex:(NSUInteger)index inCell:(ERTReservationTableViewCell*)cell;
-(UIFont*)fontForCellItemAtIndex:(NSUInteger)index inCell:(ERTReservationTableViewCell*)cell;
-(UIFont*)fontForCellTitleAtIndex:(NSUInteger)index inCell:(ERTReservationTableViewCell*)cell;

@end


@interface ERTReservationTableViewCell : UITableViewCell
@property(weak,nonatomic) id<ERTReservationCellDelegate> delegate;

@end
