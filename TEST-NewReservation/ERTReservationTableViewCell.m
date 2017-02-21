//
//  ERTReservationTableViewCell.m
//  TEST-NewReservation
//
//  Created by rahul mahajan on 20/02/17.
//  Copyright © 2017 rahul mahajan. All rights reserved.
//

#import "ERTReservationTableViewCell.h"

@interface ERTReservationTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    BOOL didSetConstraints;
}
@end

@implementation ERTReservationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)updateConstraints{
    if (!didSetConstraints) {
        didSetConstraints = YES;
        
        UIView *contView = [[UIView alloc]init];
        PREPCONSTRAINTS(contView);
        contView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:contView];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_TOP(contView, 4)];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_LEADING(contView, 8)];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_TRAILING(contView, 8)];
        [self.contentView addConstraint:CONSTRAINT_SETTING_HEIGHT(contView, 100)];
        NSLayoutConstraint *botConst =  CONSTRAINT_ALIGNING_BOTTOM(contView, 4) ;
        botConst.priority = 900;
        [self.contentView addConstraint:botConst];
        
        
        //Title Label---//
        UILabel *titleLbl = [[UILabel alloc]init];
        PREPCONSTRAINTS(titleLbl);
        titleLbl.text = [self.delegate titleForCell:self];
        titleLbl.backgroundColor = [UIColor lightGrayColor];
        [contView addSubview:titleLbl];
        [self.contentView addConstraint:CONSTRAINT_SETTING_HEIGHT(titleLbl, 30)];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_TOP(titleLbl, 0)];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_TRAILING(titleLbl, 0)];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_LEADING(titleLbl, 0)];
        
        //Collection View Container----//
        NSInteger noOfCollectionViews = [self.delegate numberOfRowsInCell:self];
        BOOL headersNeeded = NO;
        if ([self.delegate respondsToSelector:@selector(headersNeededInCell:)]) {
            headersNeeded = [self.delegate headersNeededInCell:self];
        }
        UICollectionView *prevCV = nil;
        for (int i=0; i<noOfCollectionViews; i++) {
            
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
            [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
            [layout setMinimumInteritemSpacing:4.0f];
            [layout setMinimumLineSpacing:4.0f];
            
            UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
            collectionView.tag = i;
            collectionView.dataSource = self;
            collectionView.delegate = self;
            collectionView.backgroundColor = [UIColor grayColor];
            collectionView.showsHorizontalScrollIndicator = NO;
            [collectionView registerClass:[ERTReservationCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
            PREPCONSTRAINTS(collectionView);
            [contView addSubview:collectionView];
            
            if (prevCV==nil) {
                [contView addConstraint:[NSLayoutConstraint constraintWithItem:titleLbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:collectionView attribute:NSLayoutAttributeTop multiplier:1.0f constant:4.0f]];
            }
            else{
                 [contView addConstraint:[NSLayoutConstraint constraintWithItem:prevCV attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:collectionView attribute:NSLayoutAttributeTop multiplier:1.0f constant:2.0f]];
            }
            [contView addConstraint:CONSTRAINT_ALIGNING_LEADING(collectionView, 0)];
            [contView addConstraint:CONSTRAINT_ALIGNING_TRAILING(collectionView, 0)];
            [contView addConstraint:CONSTRAINT_SETTING_HEIGHT(collectionView, 40)];
            prevCV = collectionView;
        }
        botConst = CONSTRAINT_ALIGNING_BOTTOM(prevCV, 0);
        botConst.priority = 900;
        [contView addConstraint:botConst];

    }
    [super updateConstraints];
}

#pragma mark- UICollectionViewDataSource,UICollectionViewDelegate Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  10;//[[self.delegate dataSourceAtIndex:section inCell:self]count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(50, 40);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ERTReservationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.text = @"23rd Feb";
    cell.backgroundColor = [UIColor purpleColor];
    [cell setNeedsLayout];
    [cell updateConstraintsIfNeeded];
    return cell;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
