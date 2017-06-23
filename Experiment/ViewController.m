//
//  ViewController.m
//  Experiment
//
//  Created by Waqqas Sheikh on 06/12/2016.
//  Copyright © 2016 Asfour. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Anchor.h"
#import "Page.h"
#import "PageCollectionViewCell.h"

@interface ViewController ()
@property (strong,nonatomic) UICollectionView * collectionView;
@property (strong,nonatomic) NSArray * pages;
@property (strong,nonatomic) UIPageControl * pageControl;
@property (strong,nonatomic) UIButton * skipButton;
@property (strong,nonatomic) UIButton * nextButton;
@property (strong,nonatomic) NSLayoutConstraint * pageControlBottomAnchor;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pages = @[
                   [Page pageWithTitle:@"Share a great lesson" message:@"It's free and you're a cheap son a b***ch so you've got nothing to lose" andImageName:@"page1"],
                   [Page pageWithTitle:@"Send from your library" message:@"LEt everyone know about your shit ass taste in music" andImageName:@"page2"],
                   [Page pageWithTitle:@"Send from player" message:@"I ain't got time for this shit" andImageName:@"page3"]
                   ];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0; //no lines between collection view cells
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.pagingEnabled = YES;//snaps to next page.
    
    [self.collectionView registerClass:[PageCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"loginCell"];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView anchorToTop:self.view.topAnchor left:self.view.leftAnchor bottom:self.view.bottomAnchor andRight:self.view.rightAnchor];

    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.numberOfPages = self.pages.count + 1;
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [self.view addSubview:self.pageControl];
    NSArray * pageControlAnchors = [self.pageControl anchor:nil
                        left:self.view.leftAnchor
                      bottom:self.view.bottomAnchor
                    andRight:self.view.rightAnchor
                 topConstant:0
                leftConstant:0
              bottomConstant:0
               rightConstant:0
               widthConstant:0
              heightConstant:40
     ];
    self.pageControlBottomAnchor = pageControlAnchors[2];
    
    self.skipButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.skipButton setTitle:@"Skip" forState:UIControlStateNormal];
    [self.skipButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:self.skipButton];
    [self.skipButton anchor:self.view.topAnchor
                       left:self.view.leftAnchor
                     bottom:nil
                   andRight:nil
                topConstant:16
               leftConstant:0
             bottomConstant:0
              rightConstant:0
              widthConstant:60
             heightConstant:50
     ];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:self.nextButton];
    [self.nextButton anchor:self.view.topAnchor
                       left:nil
                     bottom:nil
                   andRight:self.view.rightAnchor
                topConstant:16
               leftConstant:0
             bottomConstant:0
              rightConstant:0
              widthConstant:60
             heightConstant:50
     ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UICollectionViewDataSource

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.pages count] + 1;//increment to add login page
}

-(UICollectionViewCell *) collectionView:(UICollectionView *) collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.row == self.pages.count) {
        UICollectionViewCell * loginCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"loginCell" forIndexPath:indexPath];
        return loginCell;
    }
    
    PageCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    Page * page = self.pages[indexPath.row];
    cell.page = page;
    
    return cell;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}

-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    int pageNumber = (int)(targetContentOffset->x / self.view.frame.size.width);
    self.pageControl.currentPage = [[NSNumber numberWithInt:pageNumber] integerValue];
   
    if(pageNumber == self.pages.count){
        NSLog(@"animate now");
        self.pageControlBottomAnchor.constant = 40;
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.view layoutIfNeeded];
        } completion:nil];
    }
}

@end
