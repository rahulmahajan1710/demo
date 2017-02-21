//
//  ERTReservationCollectionViewCell.m
//  TEST-NewReservation
//
//  Created by rahul mahajan on 21/02/17.
//  Copyright © 2017 rahul mahajan. All rights reserved.
//

#import "ERTReservationCollectionViewCell.h"

#import "ERTConstraintsMacros.h"

@interface ERTReservationCollectionViewCell (){
    BOOL didSetConstraints;
}
@end


@implementation ERTReservationCollectionViewCell


-(void)updateConstraints{
    if (!didSetConstraints) {
        didSetConstraints = YES;
        UILabel *textLbl = [[UILabel alloc]init];
        textLbl.text = self.text;
        PREPCONSTRAINTS(textLbl);
        [self.contentView addSubview:textLbl];

        [self.contentView addConstraint:CONSTRAINT_ALIGNING_TRAILING(textLbl, 0)];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_LEADING(textLbl, 0)];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_TOP(textLbl, 0)];
        [self.contentView addConstraint:CONSTRAINT_ALIGNING_BOTTOM(textLbl, 0)];
    }
    [super updateConstraints];
}



@end
