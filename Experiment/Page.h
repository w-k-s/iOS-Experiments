//
//  Page.h
//  Experiment
//
//  Created by Waqqas Sheikh on 06/12/2016.
//  Copyright © 2016 Asfour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Page : NSObject
@property (strong,readonly,nonatomic) NSString * title;
@property (strong,readonly,nonatomic) NSString * message;
@property (strong,readonly,nonatomic) NSString * imageName;
-(instancetype) initWithTitle:(NSString *) title message:(NSString *) message andImageName:(NSString *) imageName;
+(Page *) pageWithTitle:(NSString *) title message:(NSString *) message andImageName:(NSString *) imageName;
@end
