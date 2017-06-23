//
//  UIView+Anchor.h
//  Experiment
//
//  Created by Waqqas Sheikh on 06/12/2016.
//  Copyright © 2016 Asfour. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Anchor)
-(void) anchorToTop:(NSLayoutYAxisAnchor *) top left:(NSLayoutXAxisAnchor *) left bottom:(NSLayoutYAxisAnchor *) bottom andRight:(NSLayoutXAxisAnchor *) right;
-(void) anchorToTop:(NSLayoutYAxisAnchor *) top left:(NSLayoutXAxisAnchor *) left bottom:(NSLayoutYAxisAnchor *) bottom andRight:(NSLayoutXAxisAnchor *) right topConstant:(CGFloat) topConstant leftConstant:(CGFloat) leftConstant bottomConstant:(CGFloat) bottomConstant rightConstant:(CGFloat) rightConstant;
-(NSArray *) anchor:(NSLayoutYAxisAnchor *) top left:(NSLayoutXAxisAnchor *) left bottom:(NSLayoutYAxisAnchor *) bottom andRight:(NSLayoutXAxisAnchor *) right topConstant:(CGFloat) topConstant leftConstant:(CGFloat) leftConstant bottomConstant:(CGFloat) bottomConstant rightConstant:(CGFloat) rightConstant widthConstant:(CGFloat) widthConstant heightConstant:(CGFloat) heightConstant;
-(void) removeAllConstraints;
@end
