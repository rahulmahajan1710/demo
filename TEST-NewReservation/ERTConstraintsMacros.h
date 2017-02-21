//
//  ERTConstraintsMacros.h


#pragma mark - Setting Translates to NO

#define PREPCONSTRAINTS(VIEW) [VIEW setTranslatesAutoresizingMaskIntoConstraints:NO]


#pragma mark - Centering

#define CONSTRAINT_POSITIONING_X(VIEW, X) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeLeft relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeLeft multiplier: 1.0f constant: X]
#define CONSTRAINT_CENTERING_H(VIEW) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeCenterX relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeCenterX multiplier: 1.0f constant: 0.0f]
#define CONSTRAINT_CENTERING_V(VIEW) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeCenterY relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeCenterY multiplier: 1.0f constant: 0.0f]
#define CONSTRAINTS_CENTERING(VIEW) \
@[CONSTRAINT_CENTERING_H(VIEW), CONSTRAINT_CENTERING_V(VIEW)]


#pragma mark - Setting Width and Height related to Superview

#define CONSTRAINT_SETTING_RELATED_WIDTH(VIEW, PERCENT) [NSLayoutConstraint constraintWithItem:VIEW attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:[VIEW superview] attribute:NSLayoutAttributeWidth multiplier:(PERCENT) constant:0]

#define CONSTRAINT_SETTING_RELATED_HEIGHT(VIEW, PERCENT) [NSLayoutConstraint constraintWithItem:VIEW attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:[VIEW superview] attribute:NSLayoutAttributeHeight multiplier:(PERCENT) constant:0]


#pragma mark -  Width and Height

#define CONSTRAINT_SETTING_WIDTH(VIEW, WIDTH) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem:nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0f constant: WIDTH]
#define CONSTRAINT_SETTING_HEIGHT(VIEW, HEIGHT) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem:nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0f constant: HEIGHT]

#pragma mark - Alignment (Left and Top, Leading)

#define CONSTRAINT_ALIGNING_LEFT(VIEW, INDENT) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeLeft relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeLeft multiplier: 1.0f constant: INDENT]
#define CONSTRAINT_ALIGNING_TOP(VIEW, INDENT) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeTop multiplier: 1.0f constant: INDENT]
#define CONSTRAINT_ALIGNING_LEADING(VIEW, INDENT) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeLeading relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeLeading multiplier: 1.0f constant: INDENT]

#pragma mark - Alignment ( Right, Bottom, Trailing)


#define CONSTRAINT_ALIGNING_RIGHT(VIEW, INDENT) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeRight multiplier: 1.0f constant: (-INDENT)]
#define CONSTRAINT_ALIGNING_BOTTOM(VIEW, INDENT) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeBottom multiplier: 1.0f constant: (-INDENT)]
#define CONSTRAINT_ALIGNING_TRAILING(VIEW, INDENT) [NSLayoutConstraint constraintWithItem: VIEW attribute: NSLayoutAttributeTrailing relatedBy: NSLayoutRelationEqual toItem: [VIEW superview] attribute: NSLayoutAttributeTrailing multiplier: 1.0f constant: (-INDENT)]
