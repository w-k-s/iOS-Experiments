//
//  PageCollectionViewCell.m
//  Experiment
//
//  Created by Waqqas Sheikh on 06/12/2016.
//  Copyright © 2016 Asfour. All rights reserved.
//

#import "PageCollectionViewCell.h"
#import "UIView+Anchor.h"
#import "Page.h"

@interface PageCollectionViewCell()
@property (strong,nonatomic) UIImageView * imageView;
@property (strong,nonatomic) UITextView * textView;

@end

@implementation PageCollectionViewCell

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setupView];
    return self;
}

-(void) setPage:(Page *)page
{
    _page = page;
    [_imageView setImage:[UIImage imageNamed:[page imageName]]];
    
    UIColor * color = [UIColor colorWithWhite:0.2 alpha:1];
    NSMutableAttributedString * body = [[NSMutableAttributedString alloc] initWithString:page.title
                                                                              attributes:@{
                                                                                           NSFontAttributeName : [UIFont systemFontOfSize:20 weight:UIFontWeightMedium],
                                                                                           NSForegroundColorAttributeName: color,                                                                    }
                                        ];
    [body appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n\n"]];
    [body appendAttributedString:[[NSMutableAttributedString alloc] initWithString:page.message attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14 weight:UIFontWeightMedium],
                                                                                                             NSForegroundColorAttributeName:color
                                                                                                             }]];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    const NSUInteger length = body.string.length;
    [body addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, length)];
    
    [_textView setAttributedText:body];
}

-(void) setupView
{
    _imageView = [[UIImageView alloc] init];
    
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.backgroundColor = [UIColor yellowColor];
    _imageView.clipsToBounds = YES;//prevents image from extending beyond its set boudns
    [self addSubview:_imageView];
    
    _textView = [[UITextView alloc] init];
    _textView.editable = NO;
    
    [self addSubview:_textView];
    [_textView anchorToTop:nil left:self.leftAnchor bottom:self.bottomAnchor andRight:self.rightAnchor topConstant:0 leftConstant:16 bottomConstant:0 rightConstant:16];
    [_textView.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.3].active = YES;
    
    [_imageView anchorToTop:self.topAnchor left:self.leftAnchor bottom:_textView.topAnchor andRight:self.rightAnchor];
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    return self;
}

@end
