//
//  MKActionTableViewCell.m
//  MKSlidingTableViewCell
//
//  Created by Andrzej Michnia on 14/09/15.
//  Copyright (c) 2015 Michael Kirk. All rights reserved.
//

#import "MKActionTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface MKActionTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *actionContainer;
@property (weak, nonatomic) IBOutlet UIView *transformableContainer;
@property (strong, nonatomic) UIView *shadowView;


@end

@implementation MKActionTableViewCell

- (CGRect)actionBounds {
    return self.actionContainer.bounds;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.shadowView = [[UIView alloc] initWithFrame:self.bounds];
    self.shadowView.frame = CGRectOffset(CGRectInset(self.actionContainer.bounds, -20, -2), -20, 0);
    self.shadowView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.shadowView];
    
    CAShapeLayer* shadowLayer = [CAShapeLayer layer];
    [shadowLayer setFrame:self.shadowView.bounds];
    
    // Standard shadow stuff
    [shadowLayer setShadowColor:[[UIColor colorWithWhite:0 alpha:1] CGColor]];
    [shadowLayer setShadowOffset:CGSizeMake(-1.0f, 0.0f)];
    [shadowLayer setShadowOpacity:0.7f];
    [shadowLayer setShadowRadius:7];

    // Causes the inner region in this example to NOT be filled.
    [shadowLayer setFillRule:kCAFillRuleEvenOdd];
    
    // Create the larger rectangle path.
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectInset(self.shadowView.bounds, -42, -42));
    
    // Add the inner path so it's subtracted from the outer path.
    // someInnerPath could be a simple bounds rect, or maybe
    // a rounded one for some extra fanciness.
    CGPathAddRect(path, NULL, self.shadowView.bounds);
    CGPathCloseSubpath(path);
    
    [shadowLayer setPath:path];
    CGPathRelease(path);
    
    [self.shadowView.layer addSublayer:shadowLayer];
}

- (void)setRevealProgress:(CGFloat)revealProgress
{
    _revealProgress = revealProgress;
    
    CGFloat progress = MAX(0, MIN(1, 1.0f - revealProgress));
    CGFloat width = self.actionContainer.bounds.size.width;
    
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    rotationAndPerspectiveTransform = CATransform3DTranslate(rotationAndPerspectiveTransform, -self.transformableContainer.bounds.size.width / 2.0f, 0, 0);
    rotationAndPerspectiveTransform.m34 = 1.0 / -500;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, M_PI_2 * progress, 0.0f, 1.0f, 0.0f);
    rotationAndPerspectiveTransform = CATransform3DTranslate(rotationAndPerspectiveTransform, self.transformableContainer.bounds.size.width / 2.0f, 0, 0);
    self.transformableContainer.layer.transform = rotationAndPerspectiveTransform;
    self.actionContainer.layer.transform = CATransform3DTranslate(CATransform3DIdentity, width * progress, 0, 0);
    
    self.shadowView.alpha = progress;
}

@end
