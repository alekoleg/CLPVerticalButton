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
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.verticalMode = YES;
    self.verticalMargin = 20.0;
}

#pragma mark - Actions -

- (void)setVerticalMargin:(CGFloat)verticalMargin {
    _verticalMargin = verticalMargin;
    [self setNeedsLayout];
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    [super setContentMode:contentMode];
    [self setNeedsLayout];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.verticalMode) {
        
        if (self.multiLines) {
            self.titleLabel.numberOfLines = 0;
            self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        }
        
        NSString *string = [self titleForState:self.state];
        if (!string) {
            string = [self titleForState:UIControlStateNormal];
        }
        UIImage *image = [self imageForState:self.state];
        if (image) {
            image = [self imageForState:UIControlStateNormal];
        }
       
        NSStringDrawingOptions options = (self.multiLines) ? NSStringDrawingUsesLineFragmentOrigin : NSStringDrawingTruncatesLastVisibleLine;
        CGSize textSize = [string boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:options attributes:@{ NSFontAttributeName : self.titleLabel.font} context:NULL].size;
        CGFloat offset = (self.frame.size.height - image.size.height - self.verticalMargin - textSize.height) / 2;
        
        self.imageView.frame = ({
            CGRect frame = self.imageView.frame;
            frame.origin.y = offset;
            frame.size = image.size;
            if (self.contentMode == UIViewContentModeLeft) {
                frame.origin.x = 0;
            } else if (self.contentMode == UIViewContentModeRight){
                frame.origin.x = self.frame.size.width - frame.size.width;
            } else {
                frame.origin.x = (self.frame.size.width - frame.size.width) / 2;
            }
            frame;
        });
        
        self.titleLabel.frame = ({
            CGRect frame = self.titleLabel.frame;
            frame.size = textSize;
            if (self.contentMode == UIViewContentModeLeft) {
                frame.origin.x = 0;
            } else if (self.contentMode == UIViewContentModeRight){
                frame.origin.x = self.frame.size.width - frame.size.width;
            } else {
                frame.origin.x = (self.frame.size.width - frame.size.width) / 2;
            }
            frame.origin.y = (self.imageView.frame.origin.y + self.imageView.frame.size.height) + self.verticalMargin;
            frame;
        });
    }
}

@end
