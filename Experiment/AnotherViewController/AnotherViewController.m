//
//  AnotherViewController.m
//  Experiment
//
//  Created by W.K.S on 21/01/2017.
//  Copyright © 2017 W.K.S. All rights reserved.
//

#import "AnotherViewController.h"
#import "AnotherTableViewCell.h"

@interface AnotherViewController ()
<UITableViewDelegate,
UITableViewDataSource,
AnotherTableViewCellDelegate>
@property (strong,nonatomic) UITableView * tableView;
@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void) setupView
{
    self.view.backgroundColor = [UIColor greenColor];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AnotherTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([AnotherTableViewCell class])];
    
    [self.view addSubview:self.tableView];
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnotherTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnotherTableViewCell class])];
    cell.delegate = self;
    //[cell setSomething:@(indexPath.row % 2 == 0)];
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void) cellRequiresUpdates:(AnotherTableViewCell *)cell
{
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end
