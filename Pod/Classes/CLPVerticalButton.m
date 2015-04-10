//
//  CLPVeticalButton.m
//  Colparter
//
//  Created by Oleg Alekseenko on 13/03/15.
//  Copyright (c) 2015 Alekoleg. All rights reserved.
//

#import "CLPVerticalButton.h"

@implementation CLPVerticalButton

- (instancetype)init {
    if (self = [super init]) {
        self.verticalMargin = 20.0;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.verticalMargin = 20.0;
}


- (void)setVerticalMargin:(CGFloat)verticalMargin {
    _verticalMargin = verticalMargin;
    [self setNeedsLayout];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.verticalMode) {
        NSString *string = [self titleForState:self.state];
        if (!string) {
            string = [self titleForState:UIControlStateNormal];
        }
        UIImage *image = [self imageForState:self.state];
        if (image) {
            image = [self imageForState:UIControlStateNormal];
        }
       
        CGSize textSize = [string boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:@{ NSFontAttributeName : self.titleLabel.font} context:NULL].size;
        CGFloat offset = (self.frame.size.height - image.size.height - self.verticalMargin - textSize.height) / 2;
        
        self.imageView.frame = ({
            CGRect frame = self.imageView.frame;
            frame.origin.y = offset;
            frame.size = image.size;
            frame.origin.x = (self.frame.size.width - frame.size.width) / 2;
            frame;
        });
        
        self.titleLabel.frame = ({
            CGRect frame = self.titleLabel.frame;
            frame.size = textSize;
            frame.origin.x = (self.frame.size.width - frame.size.width) / 2;
            frame.origin.y = (self.imageView.frame.origin.y + self.imageView.frame.size.height) + self.verticalMargin;
            frame;
        });
    }
}

@end
