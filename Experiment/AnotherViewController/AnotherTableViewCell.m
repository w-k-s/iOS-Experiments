//
//  AnotherTableViewCell.m
//  Experiment
//
//  Created by Waqqas Sheikh on 21/01/2017.
//  Copyright © 2017 Asfour. All rights reserved.
//

#import "AnotherTableViewCell.h"
#import "UIView+Anchor.h"

@interface AnotherTableViewCell()
@property (weak,nonatomic) IBOutlet NSLayoutConstraint * bottomViewHeightConstraint;
@property (weak,nonatomic) IBOutlet NSLayoutConstraint * constraint;
@end

@implementation AnotherTableViewCell

-(void) awakeFromNib
{
    [super awakeFromNib];
    [self setupView];
}

-(void) setupView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(IBAction) show
{
    
    self.bottomViewHeightConstraint.active = !self.bottomViewHeightConstraint.active;

     [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
        [self.delegate cellRequiresUpdates:self];
    } completion:^(BOOL finished) {
        
    }];
    
}

@end
