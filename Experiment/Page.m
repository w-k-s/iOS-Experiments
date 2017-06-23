//
//  Page.m
//  Experiment
//
//  Created by Waqqas Sheikh on 06/12/2016.
//  Copyright © 2016 Asfour. All rights reserved.
//

#import "Page.h"
@interface Page ()
@property (strong,readwrite,nonatomic) NSString * title;
@property (strong,readwrite,nonatomic) NSString * message;
@property (strong,readwrite,nonatomic) NSString * imageName;
@end

@implementation Page

-(instancetype) initWithTitle:(NSString *) title message:(NSString *) message andImageName:(NSString *) imageName
{
    self = [super init];
    if (self) {
        _title = title;
        _message = message;
        _imageName = imageName;
    }
    return self;
}

+(Page *) pageWithTitle:(NSString *) title message:(NSString *) message andImageName:(NSString *) imageName
{
    return [[Page alloc] initWithTitle:title message:message andImageName:imageName];
}

@end
