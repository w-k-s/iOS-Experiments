//
//  UIView+Anchor.m
//  Experiment
//
//  Created by Waqqas Sheikh on 06/12/2016.
//  Copyright © 2016 Asfour. All rights reserved.
//

#import "UIView+Anchor.h"

@implementation UIView (Anchor)

-(void) anchorToTop:(NSLayoutYAxisAnchor *) top left:(NSLayoutXAxisAnchor *) left bottom:(NSLayoutYAxisAnchor *) bottom andRight:(NSLayoutXAxisAnchor *) right
{
    [self anchorToTop:top left:left bottom:bottom andRight:right topConstant:0 leftConstant:0 bottomConstant:0 rightConstant:0];
}

-(void) anchorToTop:(NSLayoutYAxisAnchor *) top left:(NSLayoutXAxisAnchor *) left bottom:(NSLayoutYAxisAnchor *) bottom andRight:(NSLayoutXAxisAnchor *) right topConstant:(CGFloat) topConstant leftConstant:(CGFloat) leftConstant bottomConstant:(CGFloat) bottomConstant rightConstant:(CGFloat) rightConstant
{
    [self anchor:top left:left bottom:bottom andRight:right topConstant:topConstant leftConstant:leftConstant bottomConstant:bottomConstant rightConstant:rightConstant widthConstant:0 heightConstant:0];
}

-(NSArray *) anchor:(NSLayoutYAxisAnchor *) top left:(NSLayoutXAxisAnchor *) left bottom:(NSLayoutYAxisAnchor *) bottom andRight:(NSLayoutXAxisAnchor *) right topConstant:(CGFloat) topConstant leftConstant:(CGFloat) leftConstant bottomConstant:(CGFloat) bottomConstant rightConstant:(CGFloat) rightConstant widthConstant:(CGFloat) widthConstant heightConstant:(CGFloat) heightConstant
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray * anchors = [[NSMutableArray alloc] init];
    
    if(top){
        [anchors addObject:[self.topAnchor constraintEqualToAnchor:top constant:topConstant]];
    }
    if(left){
        [anchors addObject:[self.leadingAnchor constraintEqualToAnchor:left constant:leftConstant]];
    }
    if (bottom) {
        [anchors addObject:[self.bottomAnchor constraintEqualToAnchor:bottom constant:-bottomConstant]];
    }
    if (right) {
        [anchors addObject:[self.trailingAnchor constraintEqualToAnchor:right constant:-rightConstant]];
    }
    
    if (widthConstant) {
        [anchors addObject:[self.widthAnchor constraintEqualToConstant:widthConstant]];
    }
    
    if (heightConstant) {
        [anchors addObject:[self.heightAnchor constraintEqualToConstant:heightConstant]];
    }
    
    for (NSLayoutConstraint * constraint in anchors) {
        constraint.active = YES;
    }
    
    return anchors;
}

- (void)removeAllConstraints
{
    UIView *superview = self.superview;
    while (superview != nil) {
        for (NSLayoutConstraint *c in superview.constraints) {
            if (c.firstItem == self || c.secondItem == self) {
                [superview removeConstraint:c];
            }
        }
        superview = superview.superview;
    }
    
    [self removeConstraints:self.constraints];
}

@end
