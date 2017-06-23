//
//  AnotherTableViewCell.h
//  Experiment
//
//  Created by W.K.S on 21/01/2017.
//  Copyright © 2017 W.K.S. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnotherTableViewCell;

@protocol AnotherTableViewCellDelegate <NSObject>
-(void) cellRequiresUpdates:(AnotherTableViewCell*) cell;
@end

@interface AnotherTableViewCell : UITableViewCell
@property (weak,nonatomic) id<AnotherTableViewCellDelegate> delegate;
@end
