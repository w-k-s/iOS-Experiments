//
//  AnotherTableViewCell.m
//  Experiment
//
//  Created by W.K.S on 21/01/2017.
//  Copyright © 2017 W.K.S. All rights reserved.
//

#import "AnotherTableViewCell.h"

@interface AnotherTableViewCell()
@property (weak,nonatomic) IBOutlet NSLayoutConstraint * bottomViewHeightConstraint;
@end

@implementation AnotherTableViewCell

-(void) awakeFromNib
{
    [super awakeFromNib];
    [self setupView];
    self.bottomViewHeightConstraint.active = NO;
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
